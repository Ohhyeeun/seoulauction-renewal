function Request(){
	this.getParameter = function(param){
    	var requestParam ="";
        var url = unescape(location.href); 
        var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
        
        for(var i = 0 ; i < paramArr.length ; i++){
           var temp = paramArr[i].split("=");
           if(temp[0].toUpperCase() == param.toUpperCase()){
             requestParam = paramArr[i].split("=")[1]; 
             break;
           }
        }
        return requestParam;
    }
}

var request = new Request();
var maxSession = request.getParameter("maxSession");
var modPassword = request.getParameter("modPassword");
var resetPassword = request.getParameter("resetPassword");

if(maxSession == 'true'){
	//alert('회원님과 동일한 아이디로 다른 PC에서 동시 접속하여 자동으로 로그아웃 되었습니다. \n 본인이 아닌 경우 다시 로그인을 하시거나, 고객센터에 문의해 주세요.');
	//TODO 이중접속차단 팝업 show
}
if(modPassword == 'true'){
	//alert('소중한 개인정보 보호를 위해 비밀번호를 변경해 주세요!');
	//TODO 180일 경과 비밀번호 변경 팝업 show
}
if(resetPassword == 'true'){
	//alert('관리자에 의해 비밀번호가 초기화 되었습니다. \n 안전한 개인정보 보호를 위해 비밀번호를 변경해 주세요.');
	//TODO 관리자 비밀번호 변경 팝업 show
}

function logout(loginId){
	console.log(loginId)
	//TODO 소셜타입에 따른 SNS로그아웃처리
	sessionLogout();
}
	
// 세션로그아웃
function sessionLogout() {
	window.location.href = "/processLogout";
}
