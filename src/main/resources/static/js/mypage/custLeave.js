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
				if(langType == 'ko'){
					alert("회원탈퇴가 완료되었습니다.");
				}else{
					alert("Delete account has been completed.");
				}
				
				location.href = "/login";
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