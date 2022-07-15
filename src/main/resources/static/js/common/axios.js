
const baseURL = '/';
const windowAxios = window.axios;
const axiosExtension = window['axios-extensions'];
const axios = windowAxios.create({
    baseURL,
    timeout: 10 * 1000,

    /**
     * 요청 전송 시, 클라이언트 쿠키를 포함해서 전송
     * ! 서버에서 다음과 같이 credentials를 받을 수 있도록 설정이 필요
     *
     * @example
     * server.use(cors({
     *   origin: '*',
     *   credentials: true,
     * });
     */
    withCredentials: true,

    /**
     * custom headers
     */
    headers: {
        'Accept': 'application/json, text/plain, */*',
        'Content-Type': 'application/json',
        'Cache-Control': 'no-cache',
    },

    /**
     * API Cache
     */
    // adapter: windowAxios.defaults.adapter && windowAxios.throttleAdapterEnhancer(
    //     windowAxios.cacheAdapterEnhancer(windowAxios.defaults.adapter, {
    //         enabledByDefault: false, // 기본값은 false로 하고 캐싱하고 싶은 요소에서만 사용 하도록 설정
    //     }),
    //     { threshold: 1000 }, // 1초(1000ms) 동안 여러번 클릭해도 무조건 한번만 요청함
    // ),
});

/**
 * Request intercepter
 * 공통 요청 처리
 */
axios.interceptors.request.use(
    (config) => {
        return config;
    },
    (error) => {
        console.error(`Axios Request Error:`, error);
        throw error;
    },
);

/**
 * Response intercepter
 * 공통 응답 처리
 */
axios.interceptors.response.use((response) => {
        /**
         * POST /signin 의 결과가 전달되는 곳.
         * Response header에 'Authorization' 이 있으면,
         * - axios common header에 토큰값을 추가
         * - window.localStorage 에 추가
         * - document.cookie 에 추가
         */
        // if (response.headers['authorization'] || response.headers['Authorization']) {
        //     const tokenValue = response.headers['authorization'];
        //
        //     // axios common header에 토큰값을 추가
        //     axios.defaults.headers.common['Authorization'] = tokenValue;
        //     console.log(`Axios common header에 토큰값을 추가`);
        //
        //     // 로컬 스토리지 저장
        //     window.localStorage.setItem(tokenStorageName, tokenValue);
        //     console.log(`스토리지 저장: ${tokenStorageName}`);
        //
        //     // 쿠키에 저장
        //     let optionsDefault = {
        //         days: 7,
        //         path: '/',
        //     };
        //
        //     // 1000 * 60 * 60 * 24 || 86400000 || 864e5 = 하루
        //     // ex) 864e5 * 0.5 -> 12시간
        //     // ex) 864e5 * 0.25 -> 6시간
        //     // ex) 864e5 * 0.125 -> 3시간
        //     const expires = new Date(Date.now() + 864e5 * 0.5).toUTCString();
        //     const encodeValue = encodeURIComponent(tokenValue);
        //     document.cookie = `${tokenStorageName}=${encodeValue}; expires=${expires}; path=${optionsDefault.path}`;
        //
        //     console.log(`쿠키에 저장: ${tokenStorageName}`);
        // }

        // Check Rate limit
        if (typeof response.headers['X-RateLimit-Limit'] !== 'undefined') {
            response.config.headers = {
                'X-RateLimit-Limit': response.headers['X-RateLimit-Limit'],
                'X-RateLimit-Remaining': response.headers['X-RateLimit-Remaining'],
            };
        }

    
/* 		console.log(response); 
 	    console.log("requestURL :" + response.config.url);
        console.log("responseURL :" + response.request.responseURL);
        console.log("hostname :" + window.location.hostname);
        console.log("hostname :" + window.location.port);
        console.log("error Msg :" + response.data.data.window.location.hostnamemsg);*/
        
        let responseURL = response.request.responseURL.toString().split('api/')[1];
        let requestURL = response.config.url.toString().split('api/')[1];
 
		if(responseURL != requestURL){
			window.location.href = response.request.responseURL.toString();
		}
		
        return response;
    },
    (error) => {
        if (!error.response) {
            return Promise.reject(error);
        }

        // 만료된 토큰
        // if (error.response.status === 410) {
        //     window.localStorage.removeItem(tokenStorageName);
        //     console.log('세션이 만료되었습니다');
        //     window.location.reload();
        // }

        // 기타 HTTP Response Result
        switch (error.response.status) {
            case 400:
                if (error.response.headers['X-ERROR-CODE'] === 'EMPTY_TOKEN_KEY') {
                    console.log('EMPTY_TOKEN_KEY');
                }

                return Promise.reject(error.response);
            case 401:
                console.log('인증이 필요합니다');
                break;

            case 403:
                console.log('서버에서 요청을 거부했습니다');
                break;

            case 404:
                console.log('요청한 URL을 찾을 수 없습니다');
                break;

            case 405:
                console.log('해당 메서드는 허용되지 않습니다');
                break;

            case 408:
                console.log('요청이 너무 오래 걸립니다');
                break;

            case 429:
                console.log('API 서버 요청 횟수 초과 입니다');
                break;

            case 500:
                console.log('서버에서 알 수 없는 오류가 발생했습니다');
                break;

            default:
                return Promise.reject(error.response.data);
        }
    },
);
