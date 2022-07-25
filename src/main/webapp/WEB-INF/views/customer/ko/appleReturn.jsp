<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../../common/commonJs.jsp"%>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
<%--<script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>--%>
<script defer src="/js/common/axios.js" type="text/javascript"></script>
<body>
<!-- 		callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다. -->

<script>
	var langType = document.documentElement.lang;
	var type = "${type}";
	var custSocialEmail = "${custSocialEmail}";
	console.log(type);
	
	window.onload = function() {
		if(type=="snsLink"){
			snsLink("AP", "${sub}");
		}else if(type=="login"){
			submitJoin("AP", "${email}", "${sub}");
		}else if(type=="custConfirm"){
			if(custSocialEmail === "${sub}"){
				if(langType == 'ko'){
					alert("연결 되었습니다.");
				}else{
					alert("Connected.");
				}
				let f = document.createElement('form');
			    f.setAttribute('method', 'post');
			    f.setAttribute('action', '/mypage/custModify');
			    document.body.appendChild(f);
			    f.submit();
			}else{
				alert("가입한 계정과 다른 소셜계정으로 로그인하셨습니다.");
				var width = window.innerWidth;
				if(width < 1023){ //mobile
					location.href = "/mypage/main";
		        }else{ //pc
		        	location.href = "/mypage/liveBidReqList";
		        }
			}
		}
	};
	
	// 회원가입
	function submitJoin(socialType, email, sub) {
		//기가입체크
		let data = {};
	    data['social_type'] = socialType;
	    data['social_email'] = sub;

	    axios.post('/api/login/isCustSocialExist' , data)
		    .then(function(response) {
		        const result = response.data;
		        console.log(result)
		        if(result.data != undefined){
					if(result.data.STAT_CD == "not_certify"){
						//기가입 + 미인증 = 안내메세지
						$("#alertMsg").html("This ID has not been verified by e-mail after registering as a member. \n Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication. \n If you do not receive a verification email, please contact the customer center (02-395-0330 / info@seoulauction.com).");
						popup_alert.open(this); // or false
//						alert("This ID has not been verified by e-mail after registering as a member. \n Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication. \n If you do not receive a verification email, please contact the customer center (02-395-0330 / info@seoulauction.com).");
					}else{
						//기가입 + 상태normal = 로그인처리
						socialLogin(data);
					}
				}else{
					//미가입 = 회원가입페이지이동
					var form = document.getElementById('joinForm');
					form.submit();
				}
		    })
		    .catch(function(error){
		        console.log(error);
		    });
	}
	
	// 로그인
	async function socialLogin(data) {
		let url = '/api/login/social';
		let isApp = false;
		
		if(await isNativeApp()){
			console.log("is Native");
			data['is_native'] = true;
			url += '?remember-me=on';
			isApp = true;
		}
			
		axios.post(url, data)
			.then(function(response) {
				console.log(response)
				if(response.data.success == true){
					var expire = new Date();
					expire.setDate(expire.getDate() + 30);
					document.cookie = 'recentSocialType=' + "AP" + '; path=/; expires=' + expire.toGMTString() + ';';
					var rememberMeCookie = getCookie('remember-me');
					if(isApp){
						setWebviewData('remember-me', rememberMeCookie);
					}
					location.href = "/";
				}else{
					if(response.data.data.msg == "Not Certify User"){
						alert("This ID has not been verified by e-mail after registering as a member. \n Please check the e-mail sent to the e-mail address entered during registration and proceed with authentication. \n If you do not receive a verification email, please contact the customer center (02-395-0330 / info@seoulauction.com).");
					}
				}
			})
			.catch(function(error) {
				console.log(error);
			});
	}
	
	// SNS연동
	function snsLink(socialType, socialEmail) {
		var data = {};
		data['social_type'] = socialType;
		data['social_email'] = socialEmail;
		axios.post('/api/mypage/snsLink', data)
			.then(function(response) {
				const result = response.data;
				console.log(result);
				if(result.success){
					location.href = "/mypage/snsLink"
				}else{
					alert(result.data.msg)
					location.href = "/mypage/snsLink";
				}
			})
			.catch(function(error) {
				console.log(error);
			});
	}
</script>
</body>
<form id="joinForm" action="/joinForm?socialType=AP" method="post">
	<input type="hidden" id="email" name="email" value="${email }"/>
	<input type="hidden" id="sub" name="sub" value="${sub }"/>
</form>
</html>
