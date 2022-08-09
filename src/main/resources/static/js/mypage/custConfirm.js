app.value('locale', 'ko');
var langType = document.documentElement.lang;

$(document).ready(function(){
    console.log("socialYn : " + socialYn);
	console.log("socialType : " + socialType);
	
//	if(socialYn == 'Y'){
//		// 구글초기화
//		var googleInit = function() {
//			gapi.load('auth2', function() {
//				auth2 = gapi.auth2.init({
//					client_id: '5285017753-1tkl3r19jc3e7hesflsm0jj9uhgm7f4j.apps.googleusercontent.com',
//					cookiepolicy: 'single_host_origin',
//					plugin_name: 'SA-Renewal'
//				});
//				attachClickGoogle(document.getElementById('googleIdLogin'));
//			});
//		};
//		// 구글 init
//		googleInit();
//		
//		// 애플 init
//		AppleID.auth.init({
//			clientId: 'com.seoulauction.renewal-web',
//			scope: 'name email',
//			redirectURI: socialServiceDomain + '/api/login/auth/apple',
//			state: 'SARenewal',
//			usePopup: true
//		});
//		
//		// 구글클릭 동작
//		function attachClickGoogle(element) {
//			auth2.attachClickHandler(element, {},
//				function(googleUser) {
//					googleProfile = googleUser.getBasicProfile();
//					socialConfirm(googleProfile.getEmail());
//				}, function(error) {
//					console.log(JSON.stringify(error, undefined, 2));
//				});
//		}
//	}
});

$(window).on("load", function() {
	
});

function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/mypage/custModify');
 	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "localKindCd");
	hiddenField.setAttribute("value", localKindCd);
    f.appendChild(hiddenField);
    document.body.appendChild(f);
	if(localKindCd === "korean" && langType === "en"){
		if(!confirm("Domestic customers can edit member information in terms of national culture. Do you want to change to KOR mode?")){
			return;
		}else{
			document.cookie = "lang=ko; path=/;";	
		}
	}else if(localKindCd !== "korean" && langType === "ko"){
		if(!confirm("해외고객은 ENG(English) 화면에서 회원정보수정이 가능합니다. ENG 모드로 변경하시겠습니까?")){
			return;
		}else{
			document.cookie = "lang=en; path=/;";
		}
	}
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
	if(socialYn == 'Y'){
		if(socialType === "NV"){
			location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=5qXZytacX_Uy60o0StGT&state=NAVER_LOGIN&redirect_uri=' + socialServiceDomain + '/naverCallback?type=custConfirm'
		}else if(socialType === "KA"){
			location.href='https://kauth.kakao.com/oauth/authorize?client_id=adbdfe931311a01731a0161175701a42&redirect_uri=' + socialServiceDomain + '/kakaoRedirect/custConfirm&response_type=code'
//		}else if(socialType === "GL"){
//			$("#googleIdLogin").trigger("click");
		}else if(socialType === "AP"){
			location.href='https://appleid.apple.com/auth/authorize?client_id=com.seoulauction.renewal-web&redirect_uri=' + socialServiceDomain + '/appleReturn/custConfirm&response_type=code%20id_token&scope=name%20email&response_mode=form_post'
//			$("#appleid-signin").trigger("click");
		}
	}else{
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