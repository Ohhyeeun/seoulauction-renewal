app.value('locale', 'ko');
var langType = document.documentElement.lang;

$(document).ready(function(){
    console.log("socialYn : " + socialYn);
	console.log("socialType : " + socialType);
	
	if(socialYn == 'Y'){
		// 네이버초기화
		naverLogin = new naver.LoginWithNaverId({
			clientId: "5qXZytacX_Uy60o0StGT",
			callbackUrl: socialServiceDomain + "/social/naver/callback?action=socialConfirm&userEmail=" + socialEmail,
			isPopup: true,
			loginButton: {
				color: "green",
				type: 3,
				height: 60
			}
		});
		console.log(socialServiceDomain + "/social/naver/callback?action=socialConfirm&userEmail=" + socialEmail);
		// 네이버 init
		naverLogin.init();
		
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
		
		// 구글클릭 동작
		function attachClickGoogle(element) {
			auth2.attachClickHandler(element, {},
				function(googleUser) {
					googleProfile = googleUser.getBasicProfile();
					socialConfirm(googleProfile.getEmail());
				}, function(error) {
					console.log(JSON.stringify(error, undefined, 2));
				});
		}
	}
});

$(window).on("load", function() {
		// 네이버 로그인
	if(socialYn == 'Y'){
		if(socialType === "NV"){
			$("#testNaver").trigger("click");
			
//			setInterval(function() {
//				var loginButton = document.getElementById("naverIdLogin").firstChild;
//				console.log("naverLogin")
//				console.log(naverLogin)
//				console.log("loginButton log")
//				console.log(loginButton)
//				console.log("loginButton dir")
//				console.dir(loginButton)
//				loginButton.click();
//			}, 3000);
//			console.log($("#naverIdLogin_loginButton").length)
//			var loginButton2 = $("#naverIdLogin_loginButton")[0];
//			console.log(loginButton2)
//			$(loginButton2).trigger("click")
		}else if(socialType === "KA"){
			location.href='https://kauth.kakao.com/oauth/authorize?client_id=adbdfe931311a01731a0161175701a42&redirect_uri=' + socialServiceDomain + '/kakaoRedirect/custConfirm&response_type=code'
		}else if(socialType === "GL"){
			$("#googleIdLogin").trigger("click");
		}else if(socialType === "AP"){
			$("#appleid-signin").trigger("click");
		}
	}
});

function naverButtonClick() {
	var loginButton = document.getElementById("naverIdLogin").firstChild;
	console.log("LOGIN naverLogin")
	console.log(naverLogin)
	console.log("***LOGIN loginButton log")
	console.log(loginButton)
	console.log("LOGIN loginButton dir")
	console.dir(loginButton)
	loginButton.click();
}
	
function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/mypage/custModify');
    document.body.appendChild(f);
    f.submit();
}

/* 개인회원 */
// 비밀번호 입력 event
function passwdKeyUp() {
	if($("#passwd").val() != ''){
		$("#modifyButton").removeAttr('disabled');
		$("#modifyButton").removeClass('btn_gray');
		$("#modifyButton").addClass('btn_point');
		enterKey();
	}else{
		$("#modifyButton").attr('disabled', true);
		$("#modifyButton").removeClass('btn_point');
		$("#modifyButton").addClass('btn_gray');
	}	
}

function enterKey(){
    if(window.event.keyCode == 13){
        passwdConfirm();
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
					$("#passwdMsg").html("Passwords do not match. Please check your password again.");
				}
			}else{
				goPost();
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
		&& backPage.indexOf('/mypage/custModify') == -1){
		history.go(-1);
	}else{
		location.href = '/mypage/liveBidReqList';
	}
}

/* 소셜회원 */

// session의 socialEmail가 같으면 회원정보수정페이지로 이동
function socialConfirm(snsEmail) {
	if(snsEmail === socialEmail){
		if(langType == 'ko'){
			alert("연결 되었습니다.");
		}else{
			alert("Connected.");
		}
		goPost();
	}else{
		alert("가입한 계정과 다른 소셜계정으로 로그인하셨습니다.");
		var width = window.innerWidth;
		if(width < 1023){ //mobile
			location.href = "/mypage/main";
        }else{ //pc
        	location.href = "/mypage/liveBidReqList";
        }
	}	
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