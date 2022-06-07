app.value('locale', 'ko');
var langType = document.documentElement.lang;

$(window).on("load", function() {
	if(socialYn == 'Y'){
		if(socialType === "NV"){
			var loginButton = document.getElementById("naverIdLogin").firstChild;
			loginButton.click();
		}else if(socialType === "KA"){
			loginWithKakao();
		}else if(socialType === "GL"){
			$("#googleIdLogin").trigger("click");
		}else if(socialType === "AP"){
			$("#appleid-signin").trigger("click");
		}
	}
});

/* 개인회원 */
// 비밀번호 입력 event
function passwdKeyUp() {
	if($("#passwd").val() != ''){
		$("#modifyButton").removeAttr('disabled');
		$("#modifyButton").removeClass('btn_gray');
		$("#modifyButton").addClass('btn_point');
	}else{
		$("#modifyButton").attr('disabled', true);
		$("#modifyButton").removeClass('btn_point');
		$("#modifyButton").addClass('btn_gray');
	}	
}

// 회원번호수정 페이지이동
function passwdConfirm() {
	var pw = $("#passwd").val();

	if(pw != ''){
		let data = {};
		data['passwd'] = pw;
		axios.post('/api/mypage/chkPassword' , data)
		.then(function(response) {
		    const result = response.data;
		    if(!result.success){
				if (langType == 'ko') {
					$("#passwdMsg").html("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
				} else {
					$("#passwdMsg").html("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
				}
			}else{
				location.href = "/mypage/custModify";
			}
		})
		.catch(function(error){
		    console.log(error);
		});
	}	
}

// 취소
function passwdCancel() {
	var backPage = document.referrer;
	if(backPage.indexOf('/mypage/') > -1
		&& backPage.indexOf('/mypage/custModify') == -1
		&& backPage.indexOf('/mypage/custConfirm') == -1){
		history.go(-1);
	}else{
		location.href = '/mypage/liveBidReqList';
	}
}

/* 소셜회원 */

// session의 socialEmail가 같으면 회원정보수정페이지로 이동
function socialConfirm(snsEmail) {
	if(snsEmail === socialEmail){
		alert("연결 되었습니다.");
		location.href = "/mypage/custModify";
	}	
}

if(socialYn == 'Y'){
	// 카카오 init
	Kakao.init('cf2233f55e74d6d0982ab74909c97835');
	
	// 구글초기화
	var googleInit = function() {
		gapi.load('auth2', function() {
			auth2 = gapi.auth2.init({
				client_id: '5285017753-1tkl3r19jc3e7hesflsm0jj9uhgm7f4j.apps.googleusercontent.com',
				cookiepolicy: 'single_host_origin',
			});
			attachClickGoogle(document.getElementById('googleIdLogin'));
		});
	};
	// 구글 init
	googleInit();
	
	// 네이버초기화
	naverLogin = new naver.LoginWithNaverId({
		clientId: "5qXZytacX_Uy60o0StGT",
		callbackUrl: "https://local.seoulauction.com:9000/social/naver/callback?action=socialConfirm",
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
		redirectURI: 'https://local.seoulauction.com:9000/api/login/auth/apple',
		state: 'SARenewal',
		usePopup: true
	});
	
	// 구글클릭 동작
	function attachClickGoogle(element) {
		auth2.attachClickHandler(element, {},
			function(googleUser) {
				googleProfile = googleUser.getBasicProfile();
				socialConfirm(googleProfile.getEmail());
			}, function(error) {
				alert(JSON.stringify(error, undefined, 2));
			});
	}
}

// 카카오 로그인
function loginWithKakao() {
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

// 카카오사용자정보로 DB조회하여 로그인진행
function getKakaoUser() {
	Kakao.API.request({
		url: '/v2/user/me',
		success: function(res) {
			kakaoUser = res.kakao_account;
			socialConfirm(kakaoUser.email);
		},
		fail: function(error) {
			alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
		}
	});
}

//애플로 로그인 성공 시.
document.addEventListener('AppleIDSignInOnSuccess', (data) => {
	var token = data.detail.authorization.id_token;
	var payload = JSON.parse(atob(token.split(".")[1]))
	socialConfirm(payload.sub);
});

//애플로 로그인 실패 시.
document.addEventListener('AppleIDSignInOnFailure', (error) => {
	console.log("AppleIDSignInOnFailure")
	console.log(error)
});