app.value('locale', 'ko');
var langType = document.documentElement.lang;
var oldValid, newValid, confirmValid = false;

function oldPwCheck() {
	chkPassword('old', $('#oldPassword').val());
}

function chkPassword(oldNew, pwVal){
	let data = {};
	data['passwd'] = pwVal;
	axios.post('/api/login/chkPassword' , data)
	.then(function(response) {
	    const result = response.data;
	    if(result.success){
			if(oldNew === 'old'){
				if (langType == 'ko') {
					$("#oldPasswordMsg").html("현재 비밀번호와 동일합니다.");
				} else {
					$("#oldPasswordMsg").html("Same as current password.");
				}
				oldValid = true;
			}else if(oldNew === 'new'){
				if (langType == 'ko') {
					$("#newPasswordMsg").html("현재 비밀번호와 동일합니다. 새로운 비밀번호를 입력해 주세요.");
				} else {
					$("#newPasswordMsg").html("Same as current password. Please enter a new password.");
				}
				newValid = false;
			}
		}else{
			if(oldNew === 'old'){
				if (langType == 'ko') {
					$("#oldPasswordMsg").html("현재 비밀번호와 일치하지 않습니다.");
				} else {
					$("#newPasswordMsg").html("The current password does not match.");
				}
				oldValid = false;
			}else if(oldNew === 'new'){
				if (langType == 'ko') {
					$("#newPasswordMsg").html("사용가능한 비밀번호 입니다.");
				} else {
					$("#newPasswordMsg").html("This password is available.");
				}
				newValid = true;
			}
		}
	})
	.catch(function(error){
	    console.log(error);
	});
}

function newPwValid() {
	var pw = $('#newPassword').val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(pw.length < 8 || pw.length > 16 || (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){
		if (langType == 'ko') {
			$("#newPasswordMsg").html("입력하신 비밀번호는 사용 불가능 합니다. 영문자, 숫자, 특수문자 조합으로 8~16자로 다시 입력해 주세요.");
		} else {
			$("#newPasswordMsg").html("The password you entered cannot be used. Please re-enter 8 to 16 characters using a combination of English letters, numbers, and special characters.");
		}
		newValid = false;
	}else {
		chkPassword('new', pw);
	}
}

function confirmPwValid() {
	var pw = $('#confirmPassword').val();
	var newPw = $('#newPassword').val();
	console.log(pw + " , " + newPw)
	if(pw === newPw){
		if (langType == 'ko') {
			$("#confirmPasswordMsg").html("비밀번호가 일치합니다.");
		} else {
			$("#confirmPasswordMsg").html("Passwords match.");
		}
		confirmValid = true;
	}else{
		if (langType == 'ko') {
			$("#confirmPasswordMsg").html("비밀번호가 일치하지 않습니다.");
		} else {
			$("#confirmPasswordMsg").html("Passwords do not match.");
		}
		confirmValid = false;
	}
}

function modifyPw(){
	if(oldValid && newValid && confirmValid){
		let data = {};
		data['passwd'] = $('#newPassword').val();
		axios.post('/api/login/modPassword' , data)
		.then(function(response) {
		    const result = response.data;
		    console.log(result);
		    if(result.success){
				alert("비밀번호가 정상적으로 변경되었습니다. 변경된 비밀번호로 다시 로그인 해 주세요.");
				window.location.href = "/login";
			}else{
				alert(result.data.msg)
			}
		})
		.catch(function(error){
		    console.log(error);
		});
	}else{
		if($('#oldPassword').val() === ""){
			alert("현재 비밀번호를 입력해 주세요.");
		}else if($('#newPassword').val() === ""){
			alert("새 비밀번호를 입력해 주세요.");
		}else if($('#confirmPassword').val() === ""){
			alert("새 비밀번호 확인을 입력해 주세요.");
		}else{
			alert("필수값을 확인해주세요.");
		}
	}
}

function cancelPw(){
	if(confirm("비밀번호 변경을 취소하시겠습니까?")){
		location.href = "/mypage/liveBidReqList";
	}
}