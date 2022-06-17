app.value('locale', 'ko');
var langType = document.documentElement.lang;

function agreeCheck(){
	if($("#agreeCheck").is(":checked")){
		$('#leaveButton').removeAttr('disabled');
		$("#leaveButton").removeClass('btn_gray');
		$("#leaveButton").addClass('btn_point');
	}else{
		$('#leaveButton').attr('disabled', 'disabled');
		$("#leaveButton").removeClass('btn_point');
		$("#leaveButton").addClass('btn_gray');
	}
}

function custLeave(){
	axios.post("/api/mypage/custs/leave", {})
		.then(function(response) {
			var result = response.data;
			if(result.success){
				if(socialYn == 'Y'){
					eval(socialType + "UnLink();");
				}else{
					if(langType == 'ko'){
						alert("회원탈퇴가 완료되었습니다.");
					}else{
						alert("Delete account has been completed.");
					}
					
					location.href = "/login";
				}
			}else{
				if(langType == 'ko'){
					alert(result.data.msg)
				}else{
					alert("Delete account is not possible because there is an auction pending bid or payment pending.");
				}
			}
		})	
		.catch(function(error){
		    console.log(error);
		    
		});
}

// 카카오 init
Kakao.init('cf2233f55e74d6d0982ab74909c97835');

// 구글초기화
var googleInit = function() {
	gapi.load('auth2', function() {
		auth2 = gapi.auth2.init({
			client_id: '5285017753-1tkl3r19jc3e7hesflsm0jj9uhgm7f4j.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',
			plugin_name: 'SA-Renewal'
		});
	});
};
// 구글 init
googleInit();


//네이버 연동해제
function NVUnLink(){
	naverLogin = new naver.LoginWithNaverId({
		clientId: "5qXZytacX_Uy60o0StGT"
	});
	naverLogin.getLoginStatus();
	
	var data = { "token": naverLogin.accessToken.accessToken, "client_id": "5qXZytacX_Uy60o0StGT", "client_secret": "N573KogeM1" };
	
	axios.post('/api/mypage/naversignOut', data)
		.then(function(response) {
			const result = response.data;
			if(result.success){
				if(langType == 'ko'){
					alert("회원탈퇴가 완료되었습니다.");
				}else{
					alert("Delete account has been completed.");
				}
				location.href = "/login";
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
			if(langType == 'ko'){
				alert("회원탈퇴가 완료되었습니다.");
			}else{
				alert("Delete account has been completed.");
			}
			location.href = "/login";
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
		alert("회원탈퇴가 완료되었습니다.");
		location.href = "/login";
	});
}

//애플 연동해제
function APUnLink(){
	//애플 연동해제 api 미지원
	alert("회원탈퇴가 완료되었습니다.");
	location.href = "/login";
}