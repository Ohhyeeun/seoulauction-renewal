app.value('locale', 'ko');
app.value('is_login', 'false');
	
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('loginCtl', function($scope, consts, common, ngDialog) {
	$scope.form_data = {};
	$scope.form_data.loginId = "";
	$scope.form_data.password = "";
	$scope.form_data.captchaImg = "";
	$scope.validCheck = true;
	
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

		if($("#loginId").val() == ""){
			if(lang === 'en'){
				$scope.validMsg = "Please enter your ID.";
			}else{
				$scope.validMsg = "아이디를 입력해주세요.";
			}
		}else if(!$scope.loginForm.loginId.$valid){
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
			});
			$scope.LoginWithGoogle(document.getElementById('googleIdLogin'));
		});
	};
	// 구글 init
	googleInit();

	// 네이버초기화
	naverLogin = new naver.LoginWithNaverId({
		clientId: "5qXZytacX_Uy60o0StGT",
		callbackUrl: "https://local.seoulauction.com:9000/social/naver/callback?action=login",
		isPopup: false,
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

	// SNS공통로그인
	function submitLogin(socialType, socialEmail) {
		document.getElementById('social_type').value = socialType;
		document.getElementById('social_email').value = socialEmail;

		var form = document.querySelector('#loginForm');
		var formData = new FormData(form);
		var data = {};
		formData.forEach((value, key) => (data[key] = value));
		console.log(data)
		axios.post('/api/login/social', data)
			.then(function(response) {
				console.log(response)
				if(response.data.success == true){
					location.href = "/";
				}else{
					alert("로그인에 실패하였습니다.")
				}
			})
			.catch(function(error) {
				console.log(error);
			});
	}

	// 카카오 로그인
	$scope.loginWithKakao = function() {
		Kakao.Auth.login({
			success: function(authObj) {
				Kakao.Auth.setAccessToken(authObj.access_token); // access-token 저장
				$scope.getKakaoUser();
			},
			fail: function(err) {
				console.log(err);
			}
		});
	}

	// 카카오사용자정보로 DB조회하여 로그인진행
	$scope.getKakaoUser = function() {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function(res) {
				kakaoUser = res.kakao_account;

				console.log(kakaoUser);
				submitLogin("KA", kakaoUser.email);
			},
			fail: function(error) {
				alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
			}
		});
	}

	// 네이버 로그인
	$scope.naverButtonClick = function() {
		$("#naverIdLogin").trigger("click");
	}
			
	// 구글로그인
	$scope.LoginWithGoogle = function(element) {
		auth2.attachClickHandler(element, {},
			function(googleUser) {
				googleProfile = googleUser.getBasicProfile();
				submitLogin("GL", googleProfile.getEmail());
			}, function(error) {
				alert(JSON.stringify(error, undefined, 2));
			});
	}

	// 애플 로그인
	$scope.loginWithApple = function() {
		$("#appleid-signin").trigger("click");
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
		submitLogin("AP", payload.sub);
	});

	//애플로 로그인 실패 시.
	document.addEventListener('AppleIDSignInOnFailure', (error) => {
		console.log("AppleIDSignInOnFailure")
		console.log(error)
	});
});
