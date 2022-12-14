<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<title>서울옥션</title>
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
<style>
#text{
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 40px;
    color: white;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
}
#closebtn{
    position: absolute;
    top: 0;
    right: 10px;
    font-size: 60px;
    color: white;

}

#textbg{
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 38px;
    color: white;
    background-color:#1e3054;
    padding:30px;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
}

</style>


</head>
<body>

<c:if test="${locale == 'ko'}">
    <div>
        <div id="textbg">ONLINE AUCTION<br/>
           <span style="font-size:16px; line-height:20px;">
           1. 서울옥션 홈페이지(www.seoulauction.com)에서 온라인 경매에 참여하실 수 있습니다.<br/>
           2. 기존 서울옥션 블루만 가입하신 고객께서는 서울옥션에 신규 가입하셔야만 합니다.<br/>
           3. 마일리지는 제공하지 않습니다.<br/>
               <font style="font-size:12px;">&nbsp;&nbsp;&nbsp;옥션블루의 마일리지 사용은 블루몰(https://www.auctionblue.com)에서 기한내 사용가능합니다.<br/>&nbsp;&nbsp;&nbsp;고객님께서 원하실 경우 8월까지의 마일리지는 현금으로 교환하실 수 있습니다.</font><br/>
           4. 구매수수료는 18%(부가세 별도) 입니다.<br/>
           5. 낙찰작품 배송은 유료입니다.<br/><a href="https://www.seoulauction.com/auctionGuide/page?view=deliveryGuide" style="width:120px;margin-top:6px; padding:10px; background-color:#09F; color:#FFF;" target="new">배송안내 바로가기</a></span>
           <br/>
           <input type="checkbox" name="close" value="OK" onclick="javascript:closeWin('overlay', 1);"/><font style="font-size:12px;">&nbsp;&nbsp;하루동안 이 창을 열지 않음</font>
         <!-- < a href="#" class="btn_main_more sky" style="width:120px;margin-top:10px;" target="new">내 정보 확인</a>
           <a href="#" class="btn_main_more sky" style="width:120px;margin-top:10px;" target="new">회원 가입</a>-->
           <span id="closebtn" onclick="self.close();" value="닫 기">&times;</span>

         </div>
    </div>
</c:if>
<c:if test="${locale != 'ko'}">
  <!--  <div>
        <div id="textbg"">ONLINE AUCTION<br/>
           <span style="font-size:16px; line-height:20px;">
           1. 서울옥션 홈페이지(www.seoulauction.com)에서 온라인 경매에 참여하실 수 있습니다.<br/>
           2. 기존 서울옥션 블루만 가입하신 고객께서는 서울옥션에 신규 가입하셔야만 합니다.<br/>
           3. 마일리지는 제공하지 않습니다.<br/>
               <font style="font-size:12px;">&nbsp;&nbsp;&nbsp;옥션블루의 마일리지 사용은 블루몰(https://www.auctionblue.com)에서 기한내 사용가능합니다.<br/>&nbsp;&nbsp;&nbsp;고객님께서 원하실 경우 8월까지의 마일리지는 현금으로 교환하실 수 있습니다.</font><br/>
           4. 구매수수료는 18%(부가세 별도) 입니다.<br/>
           5. 낙찰작품 배송은 유료입니다.<br/><a href="https://www.seoulauction.com/auctionGuide/page?view=deliveryGuide" class="btn_main_more sky" style="width:120px;margin-top:10px;" target="new">배송안내 바로가기</a></span>
           <br/>
           <input type="checkbox" name="close" value="OK" onclick="javascript:closeWin('overlay', 1);"/><font style="font-size:12px;">&nbsp;&nbsp;하루동안 이 창을 열지 않음</font>
           <a href="#" class="btn_main_more sky" style="width:120px;margin-top:10px;" target="new">내 정보 확인</a>
           <a href="#" class="btn_main_more sky" style="width:120px;margin-top:10px;" target="new">회원 가입</a>
           <span id="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
         </div>
    </div>-->
</c:if>


<script>
//창닫기  
function closeWin(winName, expiredays) {   
   setCookie( winName, "done" , expiredays);   
   var obj = eval( "window." + winName );  
   obj.style.display = "none";  
}  
 
  
// 쿠키 가져오기  
function getCookie( name ) {  
   var nameOfCookie = name + "=";  
   var x = 0;  
   while ( x <= document.cookie.length )  
   {  
       var y = (x+nameOfCookie.length);  
       if ( document.cookie.substring( x, y ) == nameOfCookie ) {  
           if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )  
               endOfCookie = document.cookie.length;  
           return unescape( document.cookie.substring( y, endOfCookie ) );  
       }  
       x = document.cookie.indexOf( " ", x ) + 1;  
       if ( x == 0 )  
           break;  
   }  
   return "";  
}  
</script>
</body>
</html>

