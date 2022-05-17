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
		
		if($scope.loginForm.loginId.$viewValue == ""){
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
	

});
