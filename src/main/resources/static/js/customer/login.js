app.value('locale', 'ko');
app.value('is_login', 'false');
	
let isApp = false;
window.onload = async function(){
	var result = await isNativeApp();
	var LoginID = getCookie("LoginID");
	const locale = document.documentElement.lang;
	if(result){
		console.log("isNativeApp() : true");
		$("#checkedID").prop("checked", true);
		if (locale === "ko") {
			$("#checkedIDLabel").text("자동 로그인");
		} else  {
			$("#checkedIDLabel").text("Log in automatically");
		}
		$("#remember-me").prop("checked", true);
		isApp = true;
	}else{
		console.log("isNativeApp() : false");
		if (locale === "ko") {
			$("#checkedIDLabel").text("아이디 저장");
		} else {
			$("#checkedIDLabel").text("Save ID");
		}
		if(LoginID != '') {
			$("#checkedID").prop("checked", true);
		}else{
			$("#checkedID").prop("checked", false);
		}
		$("#remember-me").remove();
	}
}

app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('loginCtl', function($scope, consts, common, ngDialog) {
	$scope.form_data = {};
	$scope.form_data.loginId = "";
	$scope.form_data.password = "";
	$scope.form_data.captchaImg = "";
	$scope.validCheck = true;
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue); 
	}  
	
	$scope.login = function(){				
		var lang = document.documentElement.lang;
		$scope.validCheck = false;
		$scope.validMsg = "";
		$scope.captchaShow = "";
		if(loginFailCntYn == 'Y'){
			$scope.captchaShow = true;
		}else{
			$scope.captchaShow = false;
		}
		
		var loginId = $("#loginId").val();
		var regExp = /^[A-Za-z0-9!@#$%^&*.;\-_+]*$/g;
		if(loginId == ""){
			if(lang === 'en'){
				$scope.validMsg = "Please enter your ID.";
			}else{
				$scope.validMsg = "아이디를 입력해주세요.";
			}
		}else if(!regExp.test(loginId)){
			if(lang === 'en'){
				$scope.validMsg = "ID must be contain one lowercase letter, number, and a special character.";
			}else{
				$scope.validMsg = "아이디는 영문자, 숫자 또는 특수문자이어야 합니다.";
			}
		}else if($scope.loginForm.password.$viewValue == ""){
			if(lang === 'en'){
				$scope.validMsg = "Please enter a password.";
			}else{
				$scope.validMsg = "비밀번호를 입력해주세요.";
			}
		}else{
			$scope.validMsg = "";
			$scope.validCheck = true;
		}
		
		if(!$scope.validCheck){
			return;
		}
				
		if(loginFailCntYn == 'Y'){
			console.log(document.querySelector('#answer').value)
			if(document.querySelector('#answer').value == ''){
				$scope.validMsg = "보안문자를 입력해주세요.";
				$scope.validCheck = false;
				$scope.captchaShow = true;
				
				if(!$scope.validCheck){
					return;
				}
			}else{
				$scope.chkAnswer();
			}			
		}else{
			if(!$scope.validCheck){
				return;
			}
			
			//로그인 시도 전 아이디저장 체크 Y시 쿠키저장
			if($("#checkedID").is(":checked")){
				var LoginID = $("input[name='loginId']").val();     
				setCookie("LoginID", LoginID, 30);
			}else{
				deleteCookie("LoginID");   
			}  
			var rememberMeCookie = getCookie('remember-me');
			if(isApp && $("#checkedID").is(":checked")){
				setWebviewData('remember-me', rememberMeCookie);
				setWebviewData('remember-me-date', new Date().getTime().toString());
			}
			document.getElementById('loginForm').submit();
		}
		
	}
	
	$scope.enterKeylogin = function(){
		if (window.event.keyCode == 13) {
			$scope.login();
		}
	}
	
	$scope.init = function(){
		if(loginFailCntYn == 'Y'){
			$scope.captchaShow = true;
			$scope.getImage(); // 이미지 가져오기
		}else{
			$scope.captchaShow = false;
		}
		
		var recentSocialType = '';
		var cookie = document.cookie.split(';');
	    cookie.some(function (item) {
	        item = item.replace(' ', '');
	        var dic = item.split('=');
	        dic[0] = dic[0].replace(' ', '');
	        if (dic[0].indexOf('recentSocialType') > -1) {
	            recentSocialType = dic[1];
	            return true;    // break;
	        }
	    });
	
		if(recentSocialType != ''){
			console.log("recentSocialType : " + recentSocialType)
			$('#recentSocialType' + recentSocialType).css('display', 'block');
		}
		
		var LoginID = getCookie("LoginID");  
		$scope.form_data.loginId = LoginID;
		if(LoginID != ''){
			$("#loginId").val(LoginID);
			$("#password").focus();
			$("#checkedID").prop("checked", true);   
		}else{
			$("#loginId").focus();
		}
	}

	$scope.getImage = function (){ 
		var rand = Math.random(); 
		var url = '/api/login/captchaImg?rand='+rand; 
		$scope.form_data.captchaImg = url;
		$scope.captchaShow = true;
	} 
	
	$scope.chkAnswer = function(){
		let data = {};
	    data['answer'] = $scope.form_data.answer;
		axios.post('/api/login/chkAnswer' , data)
	        .then(function(response) {
				console.log(response)
				if(response.data.data == 200){ 
					document.getElementById('loginForm').submit();
				}else if(response.data.data == 300){
					$scope.getImage(); 
					document.querySelector('#answer').setAttribute('value', '');
					loginFailCntYn = 'Y';
					$scope.captchaShow = true;
					$scope.validMsg = "보안문자 입력값이 일치하지 않습니다.";
					$scope.validCheck = false;
					$scope.$apply();
					return;
				}
	        })
	        .catch(function(error){
	            console.log(error);
	        });
	        
	}
//	/*매번 랜덤값을 파라미터로 전달하는 이유 : IE의 경우 매번 다른 임의 값을 전달하지 않으면 '새로고침' 클릭해도 정상 호출되지 않아 이미지가 변경되지 않는 문제가 발생된다*/ 
//	$scope.getAudio = function (){ 
//		var rand = Math.random(); 
//		var uAgent = navigator.userAgent; 
//		var soundUrl = '/api/login/captchaAudio?rand='+rand; 
//		if(uAgent.indexOf('Trident')>-1 || uAgent.indexOf('MISE')>-1){ /*IE 경우 */ 
//			audioPlayer(soundUrl); 
//		}else if(!!document.createElement('audio').canPlayType){ /*Chrome 경우 */ 
//			try { 
//				new Audio(soundUrl).play(); 
//			} catch (e) { 
//				audioPlayer(soundUrl); 
//			}
//		}else{ 
//			window.open(soundUrl,'','width=1,height=1'); 
//		} 
//	} 
//	function audioPlayer(objUrl){ 
//		document.querySelector('#ccaudio').innerHTML = '<bgsoun src="' +objUrl +'">'; 
//	}


	/*********** 소셜 로그인 ************/

//	// 구글초기화
//	var googleInit = function() {
//		gapi.load('auth2', function() {
//			auth2 = gapi.auth2.init({
//				client_id: '5285017753-1tkl3r19jc3e7hesflsm0jj9uhgm7f4j.apps.googleusercontent.com',
//				cookiepolicy: 'single_host_origin',
//				plugin_name: 'SA-Renewal'
//			});
//			$scope.loginWithGoogle(document.getElementById('googleIdLogin'));
//		});
//	};
//	// 구글 init
//	googleInit();
//
//	// 애플 init
//	AppleID.auth.init({
//		clientId: 'com.seoulauction.renewal-web',
//		scope: 'name email',
//		redirectURI: socialServiceDomain + '/api/login/auth/apple',
//		state: 'SARenewal',
//		usePopup: true
//	});
//
//	// SNS공통로그인
//	function submitLogin(socialType, socialEmail, name, email, sub) {
//		document.getElementById('social_type').value = socialType;
//		document.getElementById('social_email').value = socialEmail;
//
//		var form = document.querySelector('#loginForm');
//		var formData = new FormData(form);
//		var data = {};
//		formData.forEach((value, key) => (data[key] = value));
//		console.log(data)
//		axios.post('/api/login/social', data)
//			.then(function(response) {
//				console.log(response)
//				if(response.data.success == true){
//					var expire = new Date();
//					expire.setDate(expire.getDate() + 30);
//					document.cookie = 'recentSocialType=' + socialType + '; path=/; expires=' + expire.toGMTString() + ';';
//					location.href = "/";
//				}else{
//					if(response.data.data.msg == "Not Certify User"){
//						alert("This ID has not been verified by e-mail after registering as a member. \n Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication. \n If you do not receive a verification email, please contact the customer center (02-395-0330 / info@seoulauction.com).");
//					}else if(response.data.data.msg == "User not found."){
//						//미가입 = 회원가입페이지이동
//						document.getElementById('name').value = name;
//						document.getElementById('email').value = email;
//						document.getElementById('sub').value = sub;
//				
//						var form = document.getElementById('joinForm');
//						form.action = '/joinForm?socialType=' + socialType;
//						form.submit();
//					}
//				}
//			})
//			.catch(function(error) {
//				console.log(error);
//			});
//	}
//
//	// 구글로그인
//	$scope.loginWithGoogle = function(element) {
//		auth2.attachClickHandler(element, {},
//			function(googleUser) {
//				googleProfile = googleUser.getBasicProfile();
//				submitLogin("GL", googleProfile.getEmail(), googleProfile.getName(), googleProfile.getEmail(), null);
//			}, function(error) {
//				console.log(JSON.stringify(error, undefined, 2));
//			});
//	}
//
//	// 애플 로그인
//	$scope.loginWithApple = function() {
//		$("#appleid-signin").trigger("click");
//	}
//
//	//애플로 로그인 성공 시.
//	document.addEventListener('AppleIDSignInOnSuccess', (data) => {
//		var name = '';
//		if (data.detail.user != undefined) {
//			var user = data.detail.user;
//			name = user.name.lastName + user.name.firstName;
//			console.log(name);
//		}
//		var token = data.detail.authorization.id_token;
//		var payload = JSON.parse(atob(token.split(".")[1]))
//		console.log(payload)
//		var email = payload.email;
//		var sub = payload.sub;
//
//		console.log("email : " + email + "sub : " + sub);
//		submitLogin("AP", payload.sub, name, payload.email, payload.sub);
//	});
//
//	//애플로 로그인 실패 시.
//	document.addEventListener('AppleIDSignInOnFailure', (error) => {
//		console.log("AppleIDSignInOnFailure")
//		console.log(error)
//	});
});
