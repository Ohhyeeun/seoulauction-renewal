app.value('locale', 'ko');
app.value('is_login', 'false');
	
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('loginCtl', function($scope, consts, common, ngDialog) {
	$scope.form_data = {};
	$scope.form_data.loginId = "";
	$scope.form_data.password = "";

	$scope.login = function(){				
		var lang = document.documentElement.lang;
		var validCheck = false;
		var validMsg = "";
		
		if($scope.loginForm.loginId.$viewValue == ""){
			if(lang === 'en'){
				validMsg = "Please, write your account ID to login.";
			}else{
				validMsg = "아이디를 입력해주세요.";
			}
		}else if(!$scope.loginForm.loginId.$valid){
			if(lang === 'en'){
				validMsg = "ID must be contain one lowercase letter, number, and a special character.";
			}else{
				validMsg = "아이디는 영문자, 숫자 또는 특수문자이어야 합니다.";
			}
		}else if($scope.loginForm.password.$viewValue == ""){
			if(lang === 'en'){
				validMsg = "Please, write your password to login.";
			}else{
				validMsg = "비밀번호를 입력해주세요.";
			}
		}else{
			validMsg = "";
			validCheck = true;
		}
		
		document.getElementById('loginFailMessage').innerHTML = validMsg;
		if(!validCheck){
			return;
		}
		
		document.getElementById('loginForm').submit();
	}
	
	$scope.enterKeylogin = function(){
		if (window.event.keyCode == 13) {
			$scope.login();
		}
	}
});
