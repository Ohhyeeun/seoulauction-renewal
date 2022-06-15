<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
	<script type="text/javascript">
	var search_kind = "";
	</script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
	<script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>
	<script defer src="/js/common/axios.js" type="text/javascript"></script>
	<body>
<!-- 		callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다. -->
	
		<script>
			var naverLogin = new naver.LoginWithNaverId({
				clientId: "5qXZytacX_Uy60o0StGT",
				isPopup: false,
				callbackHandle: true
			});
	
			naverLogin.init();
			
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
			var action = request.getParameter("action");
			console.log('action : ' + action)
			
			function socialLogin(data){
				axios.post('/api/login/social' , data)
                .then(function(response) {
                	var result = response.data;
                	if(result.success){
                		var expire = new Date();
    					expire.setDate(expire.getDate() + 30);
    					document.cookie = 'recentSocialType=NV; path=/; expires=' + expire.toGMTString() + ';';
	                    opener.location.replace("/");
                	}else{
                		if(response.data.data.msg == "Not Certify User"){
                			opener.alert("This ID has not been verified by e-mail after registering as a member. \n Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication. \n If you do not receive a verification email, please contact the customer center (02-395-0330 / info@seoulauction.com).");
    					}else if(response.data.data.msg == "User not found."){
    						//미가입 = 회원가입페이지이동
							opener.document.getElementById("name").value = naverLogin.user.name;
							opener.document.getElementById("mobile").value = naverLogin.user.mobile;
							opener.document.getElementById("email").value = naverLogin.user.email;
							opener.document.getElementById("joinForm").action = '/joinForm?socialType=NV';
							opener.document.getElementById("joinForm").submit();
    					}
                	}
					window.close();
                })
                .catch(function(error){
                    console.log(error);
                });
			}
			
			window.addEventListener('load', function () {
				naverLogin.getLoginStatus(function (status) {
					if (status) {
	            		console.log(naverLogin);
						var email = naverLogin.user.getEmail();
	                    if(email == undefined || email == null) {
							alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
							naverLogin.reprompt();
							return;
						}
						if(action.startsWith("login")){
							document.getElementById('social_type').value = "NV";
							document.getElementById('social_email').value = naverLogin.user.email;
							
							var form = document.querySelector('#loginForm');
							var formData = new FormData(form);
							var data = {};
							formData.forEach((value, key) => (data[key] = value));
							socialLogin(data);
							
						}else if(action.startsWith("join")){
							let data = {};
						    data['social_type'] = "NV";
						    data['social_email'] = naverLogin.user.email;
							axios.post('/api/login/isCustSocialExist' , data)
							    .then(function(response) {
							        const result = response.data;
							        console.log(result)
							        if(result.data != undefined){
										if(result.data.STAT_CD == "not_certify"){
											//기가입 + 미인증 = 안내메세지
											opener.alert("This ID has not been verified by e-mail after registering as a member. \n Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication. \n If you do not receive a verification email, please contact the customer center (02-395-0330 / info@seoulauction.com).");
											window.close();
										}else{
											//기가입 + 상태normal = 로그인처리
											socialLogin(data);
										}
									}else{
										//미가입 = 회원가입페이지이동
										opener.document.getElementById("name").value = naverLogin.user.name;
										opener.document.getElementById("mobile").value = naverLogin.user.mobile;
										opener.document.getElementById("email").value = naverLogin.user.email;
										opener.document.getElementById("joinForm").action = '/joinForm?socialType=NV';
										opener.document.getElementById("joinForm").submit();
										window.close();
									}
							    })
							    .catch(function(error){
							        console.log(error);
							    });
							
						}else if(action.startsWith("snsLink")){
							var data = {};
							data['social_type'] = "NV";
							data['social_email'] = naverLogin.user.email;
							axios.post('/api/mypage/snsLink', data)
								.then(function(response) {
									opener.location.reload();
									window.close();
								})
								.catch(function(error) {
									console.log(error);
								});
						}else if(action.startsWith("socialConfirm")){
							opener.parent.socialConfirm(naverLogin.user.email)
							window.close();
							
						}
					} else {
						console.log("callback 처리에 실패하였습니다.");
					}
				});
			});
		</script>
	</body>
	<form id="joinForm" action="/joinForm?socialType=NV" method="post">
		<input type="hidden" id="name" name="name" />
		<input type="hidden" id="email" name="email" />
		<input type="hidden" id="mobile" name="mobile" />
	</form>
	
	<form id="loginForm" method="post">
		<input type="hidden" name="social_type" id="social_type"/>
		<input type="hidden" name="social_email" id="social_email"/>
	</form>
</html>
