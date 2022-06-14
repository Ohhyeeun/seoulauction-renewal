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
					$("#" + type + "RegDt").html(r.REG_DT + " 연동");
					$("#" + type + "Button").removeClass('btn_point');
					$("#" + type + "Button").addClass('btn_gray_line');
					$("#" + type + "Button > span").html('연동해제');
					eval(type + "LinkYn = true");
					console.log(type + "LinkYn : " + eval(type + "LinkYn"));
				}
				
				if(NVLinkYn){
					naverLogin.getLoginStatus();
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
			const result = response.data;
			if(result.success == true){
				const data = result.data;
				$("#" + data.social_type + "RegDt").html(data.reg_dt + " 연동");
				$("#" + data.social_type + "Button").removeClass('btn_point');
				$("#" + data.social_type + "Button").addClass('btn_gray_line');
				$("#" + data.social_type + "Button > span").html('연동해제');
				eval(data.social_type + "LinkYn = true");
				console.log(data.social_type + "LinkYn : " + eval(data.social_type + "LinkYn"));
			}else{
				alert(result.data.msg)
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
				$("#" + socialType + "RegDt").html("");
				$("#" + socialType + "Button").removeClass('btn_gray_line');
				$("#" + socialType + "Button").addClass('btn_point');
				$("#" + socialType + "Button > span").html('연동하기');
				eval(socialType + "LinkYn = false");
				console.log(socialType + "LinkYn : " + eval(socialType + "LinkYn"));
				
				//소셜 연동해제
				eval(socialType + "UnLink();");
			}else{
				alert(result.data.msg)
			}
		})
		.catch(function(error) {
			console.log(error);
		});
}

// 카카오 init
Kakao.init('cf2233f55e74d6d0982ab74909c97835');
// SDK 초기화 여부 판단
console.log(Kakao.isInitialized() ? "카카오init성공" : "카카오init실패");

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

// 네이버초기화
naverLogin = new naver.LoginWithNaverId({
	clientId: "5qXZytacX_Uy60o0StGT",
	callbackUrl: socialServiceDomain + "/social/naver/callback?action=snsLink",
	isPopup: true,
	loginButton: {
		color: "green",
		type: 3,
		height: 60
	}
});
// 네이버 init
naverLogin.init();

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
		//연동
		Kakao.Auth.login({
			success: function(authObj) {
				Kakao.Auth.setAccessToken(authObj.access_token); // access-token 저장
				getKakaoUser();
			},
			fail: function(err) {
				console.log(err);
			}
		});
	}
}

// 카카오사용자정보로 DB조회하여 로그인진행
function getKakaoUser() {
	Kakao.API.request({
		url: '/v2/user/me',
		success: function(res) {
			kakaoUser = res.kakao_account;

			console.log(kakaoUser);
			snsLink("KA", kakaoUser.email);
		},
		fail: function(error) {
			alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
		}
	});
}

// 네이버 로그인
function naverButtonClick() {
	if(NVLinkYn){
		//연동해제
		snsUnLink("NV");
	} else{
		var loginButton = document.getElementById("naverIdLogin").firstChild;
		loginButton.click();
	}
}
		
// 구글클릭 동작
function attachClickGoogle(element) {
	auth2.attachClickHandler(element, {},
		function(googleUser) {
			googleProfile = googleUser.getBasicProfile();
			snsLink("GL", googleProfile.getEmail());
		}, function(error) {
			alert(JSON.stringify(error, undefined, 2));
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

//네이버 연동해제
function NVUnLink(){
	var data = { "token": naverLogin.accessToken.accessToken, "client_id": "5qXZytacX_Uy60o0StGT", "client_secret": "N573KogeM1" };
	
	axios.post('/api/mypage/naversignOut', data)
		.then(function(response) {
			const result = response.data;
			if(result.success){
				alert('연결 해제 되었습니다.');
			}
		})
		.catch(function(error) {
			console.log(error);
		});
}

//카카오톡 연동해제
function KAUnLink(){
	Kakao.API.request({
		url: '/v1/user/unlink',
		success: function(response) {
			alert('연결 해제 되었습니다.');
		},
		fail: function(error) {
			console.log(error);
		},
	});
}

//구글 연동해제
function GLUnLink(){
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.disconnect().then(function() {
		alert('연결 해제 되었습니다.');
	});
}

//애플 연동해제
function APUnLink(){
	//애플 연동해제 api 미지원
	alert('연결 해제 되었습니다.');
}
