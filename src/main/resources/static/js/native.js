/**
 * Native 연동 인터페이스
 */
$(function() {
  // 네이티브 웹뷰 초기화
  window.isFlutterInAppWebViewReady = false;
  window.addEventListener('flutterInAppWebViewPlatformReady', function(e) {
    window.isFlutterInAppWebViewReady = true;
  });

  // 버튼 플래그 토글
  if (window.innerWidth >= 576) return;

  // 컨테이너
  const footerContainer = document.querySelector('footer .innerfooter');
  if (!footerContainer) return;

  const buttonStyle = `color: #fff; flex: 0 0 50%; max-width: 50%; margin-bottom: 0.5rem;`;
  const buttonsHtml = `
    <div style="display:flex;flex-wrap:wrap;margin-top:1rem;">
      <button style="${buttonStyle}" id="native-test-is-native">앱 여부</button>
      <button style="${buttonStyle}" id="native-test-save-device">앱 정보 저장</button>
      <button style="${buttonStyle}" id="native-test-get-header">앱헤더정보</button>
      <button style="${buttonStyle}" id="native-test-get-device">앱디바이스정보</button>
      <button style="${buttonStyle}" id="native-test-set-data">앱 데이터 저장</button>
      <button style="${buttonStyle}" id="native-test-get-data">앱 데이터 조회</button>
      <button style="${buttonStyle}" id="native-test-del-data">앱 데이터 삭제</button>
      <button style="${buttonStyle}" id="native-test-open-browser">앱의 브라우저 열기</button>
      <button style="${buttonStyle}" id="native-test-force-update">강제 업데이트 팝업</button>
    </div>
  `.trim();

  footerContainer.insertAdjacentHTML('beforeend', buttonsHtml);

  document.addEventListener('click', async (e) => {
    switch (e.target?.id) {
      case 'native-test-is-native':
        await isNativeApp();
        break;

      case 'native-test-save-device':
        await saveDeviceInfo();
        break;

      case 'native-test-get-header':
        const result1 = await getAppHeader();
        console.log(JSON.stringify(result1));
        break;

      case 'native-test-get-device':
        const result2 = await getDeviceInfo();
        console.log(JSON.stringify(result2));
        break;

      case 'native-test-set-data':
        await setWebviewData('sample-data', new Date() + '');
        break;

      case 'native-test-get-data':
        const result3 = await getWebviewData('sample-data');
        console.log(JSON.stringify(result3));
        break;

      case 'native-test-del-data':
        await deleteWebviewData('sample-data');
        break;

      case 'native-test-open-browser':
        await openWebBrowser('https://seoulauction.com');
        break;

      case 'native-test-force-update':
        const popup = document.querySelector('#app-update-popup');
        if (popup && popup.classList.contains('open')) {
          popup.classList.remove('open');
        } else {
          popup.classList.add('open');
        }
        break;

      default:
        break;
    }
  });

  // 앱 업데이트 하러 가기(OS에 따른 앱 링크 추가)
  document.querySelector('.app-update-popup-link').addEventListener('click', async (e) => {
    e.preventDefault();
    const deviceInfo = await getDeviceInfo();
    if (deviceInfo?.os === 'android') {
      // openWebBrowser('https://play.google.com/store/apps/details?id=seoulauction.seoulauction&hl=ko&gl=US');
      openWebBrowser('market://details?id=seoulauction.seoulauction');
    }

    if (deviceInfo?.os === 'ios') {
      openWebBrowser('https://apps.apple.com/kr/app/%EC%84%9C%EC%9A%B8%EC%98%A5%EC%85%98/id345138823');
    }
  });
});

// ----------------------------------------------------------------------------
// Native 연동 인터페이스
// ----------------------------------------------------------------------------

async function chkIsAuthenticated(){
  let result = await isNativeApp();
  if (result) {
    let v = await getWebviewData('remember-me');
    let d = await getWebviewData('remember-me-date');
    // 데이타 확인
    //alert(d);

    if (d !== undefined) {
      if (d.length > 0) {
        let dd = parseInt(d);
        let expYear = 1
        // 1년 더함
        let cd = new Date(new Date(dd).setFullYear(new Date(dd.getFullYear() + expYear)));
        if (cd > new Date()) {
          let rc = getCookie('remember-me')
          if (rc === undefined || rc === null || rc.length <= 0) {
            setCookie('remember-me', v, 365);
            window.location.reload();
          }
        } else {
          // 쿠키 삭제
          document.cookie = "remember-me=;expires=Thu, 01 Jan 1999 00:00:10 GMT;";
        }
      }
    }
  }
}

/**
 * [Webview -> Native]
 * 접속한 기기가 앱이 맞는지 정보
 * @return {Promise<boolean>}
 */
async function isNativeApp() {
  try {
    console.log(`remember-me cookie value: ${getCookie('remember-me')}`);
    const appHeader = await getAppHeader();
    console.log(JSON.stringify(appHeader));
    return !!appHeader;
  } catch (error) {
    return false;
  }
}

/**
 * [Webview -> Native]
 * 기기 ID 및 버전 정보 저장
 */
async function saveDeviceInfo() {
  try {
    const deviceInfo = await getDeviceInfo();
    const appHeader = await getAppHeader();

    if (deviceInfo && appHeader) {
      // TODO: 환경변수에 따른 URL 정의
      const url = 'https://re-dev.seoulauction.com/api/app/insert-app-info';

      /** @type {{ device_id: string; os: string; app_version: string; device_version: string; }} */
      const body = {
        os: deviceInfo.os,
        device_version: deviceInfo.version,
        device_id: deviceInfo.device_id,
        app_version: appHeader['X-Custom-App-Version'],
      };
      await window.axios.post(url, body);
    }
  } catch (error) {
    console.error(error);
  }
}

// ----------------------------------------------------------------------------
// Native -> Webview
// ----------------------------------------------------------------------------

/**
 * [Native -> Webview]
 * 웹뷰 메뉴 토글
 * @param {boolean?} state
 */
function nativeToggleMenu(state) {
  const bgElement = document.querySelector('.gnb_submenuBg');
  const menugElement = document.querySelector('.submenuBg');

  if (bgElement.classList.contains('on') && menugElement.classList.contains('on')) {
    document.querySelector('.submenuBg-closeBtn').click();
  } else {
    document.querySelector('.m-gnbmenu').click();
  }
}

/**
 * [Native -> Webview]
 * 앱의 상태값 수신(복수로 호출될 수 있음)
 * @param {string} state
 * @return {string}
 * 
 * [result]
 * active: 최초 실행
 * resumed: 앱 재진입
 * inactive: 앱 비활성
 * paused: 앱 멈춤
 * detached: 앱 종료(해제)
 * 
 * TODO: 앱에 진입하는 시점에 saveDeviceInfo() 호출
 * TODO: remember-me 프로세스
 */
async function nativeGetAppStatus(status) {
  switch (status) {
    case 'active': // 앱 최초 실행
      console.log('앱 최초 실행');
      // 스토리지 값을 가져온다.
      let d = await getWebviewData('remember-me-date');
      let dd = -1;
      let flg = false;

      alert('d - ' + d);

      if (d !== undefined) {
        dd = parseInt(d);
      }

      let expYear = 1;
      let cd = new Date(new Date(dd).setFullYear(new Date(dd.getFullYear() + expYear)));

      if (cd > new Date()) {
        flg = true;
      }

      if (getCookie("remember-me") !== "" && !flg)  {
        document.cookie = "remember-me=;expires=Thu, 01 Jan 1999 00:00:10 GMT;";
        window.location.reload();
      }

      await saveDeviceInfo();
      break;

    case 'resumed': // 앱 재진입
      console.log('앱 다시 실행');
      await chkIsAuthenticated();
      break;

    case 'inactive': // 비활성
      console.log('앱 비활성');
      break;

    case 'paused':
      console.log('앱 멈춤');
      break;

    case 'detached':
      console.log('앱 해제');
      break;

    default:
      break;
  }
}

// ----------------------------------------------------------------------------
// Webview -> Native
// ----------------------------------------------------------------------------

/**
 * [Webview -> Native]
 * 앱의 헤더 조회
 * @return {Promise<{ "X-Custom-Webview-Name": "sa_app"; "X-Custom-App-Version": string; } | null>}
 */
async function getAppHeader() {
  try {
    if ('flutter_inappwebview' in window) {
      return await window.flutter_inappwebview.callHandler('getAppHeader');
    }

    return null;
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 기기 ID 및 버전 정보 조회
 * @return {Promise<{os: 'ios' | 'android'; version: string; device_id: string; } | null>}
 */
async function getDeviceInfo() {
  try {
    if ('flutter_inappwebview' in window) {
      return await window.flutter_inappwebview.callHandler('getDeviceInfo');
    }

    return null;
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 앱에 데이터를 저장
 * @param {string} key
 * @param {string} value
 */
async function setWebviewData(key, value) {
  try {
    if ('flutter_inappwebview' in window) {
      await window.flutter_inappwebview.callHandler('setWebviewData', key, value);
    }
  } catch (error) {
    console.error(error);
  }
}

/**
 * [Webview -> Native]
 * 앱에 저장된 데이터를 조회
 * @param {string} key
 * @return {Promise<string>}
 */
async function getWebviewData(key) {
  try {
    if ('flutter_inappwebview' in window) {
      return await window.flutter_inappwebview.callHandler('getWebviewData', key);
    }

    return null;
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 앱에서 데이터를 삭제
 * @param {string} key
 */
async function deleteWebviewData(key) {
  try {
    if ('flutter_inappwebview' in window) {
      await window.flutter_inappwebview.callHandler('deleteWebviewData', key);
    }
  } catch (error) {
    console.error(error);
  }
}

/**
 * [Webview -> Native]
 * 앱의 기본 브라우저로 URL 열기
 * @param {string} url
 */
async function openWebBrowser(url) {
  try {
    window.open(url, '_blank');
    // if ('flutter_inappwebview' in window) {
    //   await window.flutter_inappwebview.callHandler('openWebBrowser', url);
    // } else {
    //   window.open(url, '_blank');
    // }
  } catch (error) {
    console.error(error);
  }
}
