<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	 
	
	<link href="/css/css/angular/rzslider.css" rel="stylesheet">
	<link href="/css/css/angular/ngDialog.css" rel="stylesheet">  
	<link href="/css/css/angular/popup.css" rel="stylesheet">
	<link href="/css/css/jquery.modally.css" rel="stylesheet">
	<script type="text/javascript" src="/js/angular/paging.js"></script>
	<script type="text/javascript" src="/js/jquery.modally.js"></script>
	<script type="text/javascript" src="/js/angular/rzslider.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-duration-format/1.3.0/moment-duration-format.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ng-dialog/0.5.6/js/ngDialog.min.js"></script>
		
	<script type="text/javascript">
	app.value('locale', 'ko');
 	app.value('_csrf', '${_csrf.token}');
	app.value('_csrf_header', '${_csrf.headerName}');  
	
	//dialog
	app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"])

	
	app.controller('testCtl', function($scope, consts, common, saleCert, bid, $interval, locale, $filter) {
		
		console.log(saleCert)
		console.log(bid)
		$scope.sale = {'SALE_NO':'422'};
		$scope.lot = {'LOT_NO':'0002'};
		
		$scope.showBidPopup = function($input) {
			console.log('showBidPopup 1');
			/*			if(!$input.parent.is_login){
							document.location.href='/login';
							return;
						}*/

						//if($input.parent.locale == 'ko' && ($input.parent.sale_cert.CNT || 0) <= 0){
						/*if($input.parent.custInfo.LOCAL_KIND_CD != 'foreigner' && ($input.parent.sale_cert.CNT || 0) <= 0){
							$input.parent.cancelLotRefresh(); */
							$input.callBack = bid.bidPopup;
							saleCert.saleCert($input);
			/*			}else{
								bidPopup($input);
					}*/
					}
		
	});
	</script>
<body>  
<script type="text/javascript" src="/js/test.js?ver=20210804"></script>
<script type="text/javascript" src="/js/saleCert.js?ver=20210804"></script>

<div id="wrap">
	<div class="container_wrap" > <!--  ng-repeat="art in academyList" -->
		
		<div id="container" ng-controller="testCtl">
			<!-- //sub_menu_wrap -->

			<div class="contents_wrap" >
				<div class="contents">
				  <button type="button"
                        ng-click="showBidPopup({'parent':this, 'sale':sale, 'lot':lot});" class="ng-scope" >
                          결제완료
                        </button>
				</div><!--contents-->
			</div><!--contents_wrap-->
		</div>
	</div>
</div>
        <footer class="footer">   
            <div class="innerfooter"> 
                <section class="flex_wrap footer_menubox"> 
                    <ul class="footer-gnbmenu">
                        <li><a href="#">회사소개</a></li>  
                        <li><a href="#">언론보도</a></li>  
                        <li><a href="#">채용공고</a></li>  
                        <li><a href="#">위치안내</a></li>  
                        <li><a href="#">고객센터</a></li>   
                    </ul> 

                    <ul class="snsbox_icon">
                        <li><a href="#" class="sns-icon sns-icon01"></a></li> 
                        <li><a href="#" class="sns-icon sns-icon02"></a></li> 
                        <li><a href="#" class="sns-icon sns-icon03"></a></li> 
                        <li><a href="#" class="sns-icon sns-icon04"></a></li> 
                        <li><a href="#" class="sns-icon sns-icon05"></a></li>  
                    </ul>  
                </section>
                <section class="flex_wrap footer_infobox">  
                    <div class="footer-infomenubox"> 
                        <ul class="flex_wrap footer-infomenu"> 
                            <li><a href="#">경매약관</a></li>   
                            <li><a href="#">개인정보처리방침</a></li>   
                            <li><a href="#">내부관리규정</a></li>  
                        </ul>
                        <form action="">
                            <legend class="Familysite-legned"> 
                                <fieldset class="Familysite-selectbox">  
                                    <select name="Familysite">
                                        <option value="Familysite">Family Site</option>
                                        <option value="Print Bakery">Print Bakery</option>
                                        <option value="Auction Blue">Auction Blue</option>
                                    </select>
                                </fieldset>
                            </legend>
                        </form>
                    </div> 

                    <p class="bottom-p-spacing20">
                        ㈜서울옥션 · 대표이사 : 이옥경   사업자등록번호 : 101-81-46818   통신판매업신고 : 종로 제01-2173호<br>
                        주소 : 서울특별시 종로구 평창31길 11 (평창동 465-10)  고객센터 : 02-395-0330<br>
                        ⓒ Seoul Auction Corp.
                    </p>
                    <p>
                        (주)서울옥션이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 (주)서울옥션은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
                        따라서 (주)서울옥션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
                    </p>
                </section>
            </div>   
        </footer>  
     <!-- //wrap -->
    </section> 
    <!-- 다크모드 darkmode -->
    <span class="darkmodeBg">
        <button class="darkmode" type="button"></button><span>다크모드로 보기</span>
    </span>
    <!--scroll top-->
    <a href="#" class="scroll-top">  
        <span class="topBtn up"></span> 
    </a>  
</body>