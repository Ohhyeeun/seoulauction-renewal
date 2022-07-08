app.value('locale', 'ko');
var langType = document.documentElement.lang;
var NVLinkYn, KALinkYn, GLLinkYn, APLinkYn = false;

$(document).ready(function() {
	axios.get('/api/mypage/snsLinks')
		.then(function(response) {
			const result = response.data;
			if(result.data.length > 0){
				var resultList = result.data;
				for(var r of resultList){
					var type = r.SOCIAL_TYPE;
					if(langType == 'ko'){
						$("#" + type + "RegDt").html(r.REG_DT + " 연동");
						$("#" + type + "Button > span").html('연동해제');
					}else{
						$("#" + type + "RegDt").html(r.REG_DT);
						$("#" + type + "Button > span").html('Activated');
					}
					$("#" + type + "Button").removeClass('btn_point');
					$("#" + type + "Button").addClass('btn_gray_line');
					eval(type + "LinkYn = true");
					console.log(type + "LinkYn : " + eval(type + "LinkYn"));
				}
			}
		})
		.catch(function(error) {
			console.log(error);
		});
	
});

// SNS연동
function snsLink(socialType, socialEmail) {
	var data = {};
	data['social_type'] = socialType;
	data['social_email'] = socialEmail;
	axios.post('/api/mypage/snsLink', data)
		.then(function(response) {
			console.log(response);
			const result = response.data;
			if(result.success == true){
				const data = result.data;
				if(langType == 'ko'){
					$("#" + data.social_type + "RegDt").html(data.reg_dt + " 연동");
					$("#" + data.social_type + "Button > span").html('연동해제');
				}else{
					$("#" + data.social_type + "RegDt").html(data.reg_dt);
					$("#" + data.social_type + "Button > span").html('Activated');
				}
				$("#" + data.social_type + "Button").removeClass('btn_point');
				$("#" + data.social_type + "Button").addClass('btn_gray_line');
				eval(data.social_type + "LinkYn = true");
				console.log(data.social_type + "LinkYn : " + eval(data.social_type + "LinkYn"));
			}else{
				if(langType == 'ko'){
					alert(result.data.msg)
				}else{
					alert("It is a social account that has already been subscribed to or linked to Seoul Auction. Please link it to another account.");
				}
			}
		})
		.catch(function(error) {
			console.log(error);
		});
}

// SNS연동해제
function snsUnLink(socialType) {
	var data = {};
	data['social_type'] = socialType;
	axios.post('/api/mypage/snsUnLink', data)
		.then(function(response) {
			const result = response.data;
			if(result.success == true){
				if(langType == 'ko'){
					$("#" + socialType + "Button > span").html('연동하기');
				}else{
					$("#" + socialType + "Button > span").html('Connect');
				}
				$("#" + socialType + "RegDt").html("");
				$("#" + socialType + "Button").removeClass('btn_gray_line');
				$("#" + socialType + "Button").addClass('btn_point');
				
				eval(socialType + "LinkYn = false");
				console.log(socialType + "LinkYn : " + eval(socialType + "LinkYn"));
				if(langType == 'ko'){
					alert('연결 해제 되었습니다.');
				}else{
					alert('Disconnected.');
				}
			}else{
				alert(result.data.msg)
			}
		})
		.catch(function(error) {
			console.log(error);
		});
}

// 구글초기화
var googleInit = function() {
	gapi.load('auth2', function() {
		auth2 = gapi.auth2.init({
			client_id: '5285017753-1tkl3r19jc3e7hesflsm0jj9uhgm7f4j.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',
			plugin_name: 'SA-Renewal'
		});
		attachClickGoogle(document.getElementById('googleIdLogin'));
	});
};
// 구글 init
googleInit();

// 애플 init
AppleID.auth.init({
	clientId: 'com.seoulauction.renewal-web',
	scope: 'name email',
	redirectURI: socialServiceDomain + '/api/login/auth/apple',
	state: 'SARenewal',
	usePopup: true
});

// 카카오 로그인
function loginWithKakao() {
	if(KALinkYn){
		//연동해제
		snsUnLink("KA");
	}else{
		location.href='https://kauth.kakao.com/oauth/authorize?client_id=adbdfe931311a01731a0161175701a42&redirect_uri=' + socialServiceDomain + '/kakaoRedirect/snsLink&response_type=code'
	}
}

// 네이버 로그인
function naverButtonClick() {
	if(NVLinkYn){
		//연동해제
		snsUnLink("NV");
	} else{
		location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=5qXZytacX_Uy60o0StGT&state=NAVER_LOGIN&redirect_uri=' + socialServiceDomain + '/naverCallback?type=snsLink'
	}
}
		
// 구글클릭 동작
function attachClickGoogle(element) {
	auth2.attachClickHandler(element, {},
		function(googleUser) {
			googleProfile = googleUser.getBasicProfile();
			snsLink("GL", googleProfile.getEmail());
		}, function(error) {
			console.log(JSON.stringify(error, undefined, 2));
		});
}

// 구글로그인
function loginWithGoogle() {
	if(GLLinkYn){
		//연동해제
		snsUnLink("GL");		
	} else{
		//연동
		$("#googleIdLogin").trigger("click");
	}
}

// 애플 로그인
function loginWithApple() {
	if(APLinkYn){
		//연동해제
		snsUnLink("AP");		
	} else{
		//연동
		$("#appleid-signin").trigger("click");
	}
}

//애플로 로그인 성공 시.
document.addEventListener('AppleIDSignInOnSuccess', (data) => {
	var name = '';
	if (data.detail.user != undefined) {
		var user = data.detail.user;
		name = user.name.lastName + user.name.firstName;
		console.log(name);
	}
	var token = data.detail.authorization.id_token;
	var payload = JSON.parse(atob(token.split(".")[1]))
	console.log(payload)
	var email = payload.email;
	var sub = payload.sub;

	console.log("email : " + email + "sub : " + sub);
	snsLink("AP", payload.sub);
});

//애플로 로그인 실패 시.
document.addEventListener('AppleIDSignInOnFailure', (error) => {
	console.log("AppleIDSignInOnFailure")
	console.log(error)
});
