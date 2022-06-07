app.value('locale', 'ko');
var langType = document.documentElement.lang;

$(document).ready(function() {
});

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
