<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
	<link href="/css/angular/ngDialog.min.css" rel="stylesheet">
	<link href="/css/angular/popup.css" rel="stylesheet">
	<script type="text/javascript" src="/js/angular/paging.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ng-dialog/0.5.6/js/ngDialog.min.js"></script>
		
	<script type="text/javascript">
	app.value('locale', 'ko');	
	app.requires.push.apply(app.requires, ["bw.paging", "ngDialog"]);
	
	app.controller('InteListCtl', function($scope, common, ngDialog) {
		$scope.sale_kind = "${param.sale_kind}";
		$scope.pageRows = 10;
		$scope.currentPage = 1;
		
		$scope.inteCheckList = {};
		
	 	$scope.loadInteList = function($page){
	 		$scope.currentPage = $page;
	 		
	 		$d  = {"from": (($scope.currentPage - 1) * $scope.pageRows), "rows" : $scope.pageRows, "sale_kind" : $scope.sale_kind };
	 		
	 	   	common.callAPI("/api/mypage/inteLots",$d, function(data, status){
	 			$scope.inteListCnt = data["data"]["cnt"];
	 			$scope.inteList = data["data"]["list"];
	 		});
		};
		
		/* 관심작품 Start */
		$scope.inteSave = function($input) {		
			var $d = {"sale_no":$input.sale_no, "lot_no":$input.lot_no}
			common.callActionSet('',$d, function(data, status) {
				if(data["data"].success) {
					if($scope.locale == 'ko') {
						alert("관심작품 추가가 완료되었습니다.\n추가된 관심작품은 ACCOUNT페이지에서 확인하실 수 있습니다.");
						window.location.reload(true);
					}else {
						alert("A favorate work has been added.\nYou can find your favorite works on your account page.");
						window.location.reload(true);
					}
					return true;
				}
			})
			
		}
		
		$scope.inteDel = function($input) {	
			var $d = {"sale_no":$input.sale_no, "lot_no":$input.lot_no};
			common.callActionSet('',$d, function(data, status) {
				if(data["data"].success) {
					if($scope.locale == 'ko') {
						alert("관심작품이 삭제되었습니다.");
						$scope.fav_toggle($scope.isFavPage);
//	 					window.location.reload(true);
					}else {
						alert("A favorate work has been deleted.");
						$scope.fav_toggle($scope.isFavPage);
//	 					window.location.reload(true);
					}
					return true;
				}
			})	
		}
		/* 관심작품 End */
		/* 컨디션리포트/관심작품 신청, 삭제 SRC END (2017.08.11 YDH) */
		
		
		/*		$scope.inteCheckDel = function() {						
			$scope.inteCheckList = new Array(); 
			document.querySelectorAll("input[name=inteCheckbox]").forEach(function(item) {
				if(item.checked){$scope.inteCheckList.push({saleno : item.getAttribute("saleno"), lotno : item.value})};
			});

			if($scope.inteCheckList.length > 0){
				var $d = {"inteChkList" : $scope.inteCheckList }
				common.callAPI("/api/mypage/inteCheckDel",$d, function(data, status) {
					if(data['data'].length > 0) {
						if($scope.locale == 'ko') {
							alert("관심작품이 삭제되었습니다.");
							window.location.reload(true);
						}else {
							alert("A favorite work has been deleted.");
							window.location.reload(true);
						}
						return true;
					}
				});	
			}else{
				alert("삭제할 작품을 선택 해주세요");
			}
		};

		
 		document.getElementById("inteCheckAll").addEventListener("change", function (e) {
		    e.preventDefault();
		    var list = document.querySelectorAll("input[name=inteCheckbox]");
		    for (var element of list) {
		    	element.checked = this.checked;
		    }
		});
		
		//탭변경 시, 모든 체크박스 해제
		document.getElementById("tab1").addEventListener("click", function (e) {
			    e.preventDefault();
			    var list = document.querySelectorAll("input[name=inteCheckbox]");
			    for (var element of list) {
			    	element.checked = false;
			    }
		});  */
	});
	
	</script>
<body>  
    
<div id="wrap">
	<div class="container_wrap" ng-controller="InteListCtl" data-ng-init="loadInteList(1);">
		<div class="shadow left"><span class="corner"></span></div>
		<div class="shadow right"><span class="sp_txt img_logo_v"><span class="hidden">&copy; SeoulAuction Corp.</span></span></div>
		<div id="container">{{a}}
			
			<!-- //sub_menu_wrap --> 
			<div class="contents_wrap"> 
				<div class="contents">
					<div class="tit_h2">
						<h2><span ng-if="locale=='ko'">관심작품 현황</span><span ng-if="locale!='ko'">FAVORITE WORKS</span></h2>
					</div>
					<div class="tbl_top">
						<div class="left">
							<button type="button" class="delet_btn" ng-click="inteCheckDel('online');">{{locale=='ko' ? '선택작품 삭제' : 'Delete Select'}}</button>   
						<button type="button" class="tab" id="tab1">라이브</button>
						<button type="button" class="tab" id="tab2">온라인</button>
						</div>
						<div class="right">
							<div style="font-weight: 900; padding-top:10px;" ng-if="locale=='ko'">   
								총&nbsp;&nbsp;<span class="txt_green">{{inteListCnt}}</span>개 <%-- <spring:message code="message.mypage.interlist" /> --%>
							</div>   
							<div style="font-weight: 900; padding-top: 10px;" ng-if="locale!='ko'"> 
								ALL&nbsp;&nbsp;<span class="txt_green">{{inteListCnt}}</span>  
							</div>
						</div>
					</div>
					<div class="tbl_style02 table_hovback">
						<table style="table-layout:fixed !important;">
							<caption>관심 작품 목록</caption>
							<colgroup>
								<col style="width:25px" /> 
								<col style="width:5%" />  
								<col style="width:*" /> 
								<col style="width:5%" />  
								<col style="width:*" /> 
								<col style="width:13%" /> 
								<col style="width:12%" />     
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="inteCheckAll" ng-click="checkAll();" class="check_inputbox"/><label for="inteCheckAll" class="check_img"></label></th>
									<th>NO</th>
									<th scope="col"><span ng-if="locale=='ko'">경매명</span><span ng-if="locale!='ko'">Auction</span></th>
									<th scope="col">LOT</th>
									<th scope="col"><span ng-if="locale=='ko'">작품명</span><span ng-if="locale!='ko'">Title</span></th>
									<th scope="col"><span ng-if="locale=='ko'">작가명</span><span ng-if="locale!='ko'">Artist</span></th> 
									<th scope="col"><span ng-if="locale=='ko'">등록일자</span><span ng-if="locale!='ko'">Date</span></th>  
									<th scope="col"><span ng-if="locale=='ko'">test</span><span ng-if="locale!='ko'">test</span></th>  
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="il in inteList">
									<td>
										<input type="checkbox" id="inteCheckbox{{$index}}" name="inteCheckbox" saleNo="{{il.SALE_NO}}"  value="{{il.LOT_NO}}"  class="check_inputbox"/>
										<label for="inteCheckbox{{$index}}" class="check_img"></label> 
									</td>
									<td>{{$index+1}}</td>  
									<td>{{il.SALE_TH_DSP}} <span ng-if="locale=='ko'">{{il.SALE_TITLE_KO}}</span><span ng-if="locale!='ko'">{{il.SALE_TITLE_EN}}</span></td>
									<td>{{il.LOT_NO}}</td>
									<td>
										<a ng-if="il.SALE_OUTSIDE_YN =='N'"  ng-class="il.CLOSE_YN=='N' ? 'wish_hover_active' : 'wish_hover'" ng-href="{{il.CLOSE_YN=='N' ? '/lotDetail?sale_no=' + il.SALE_NO + '&lot_no=' + il.LOT_NO + '&sale_status=ING&view_type=LIST' : ''}}" target="_blank">
											<span ng-if="locale=='ko'">{{il.TITLE_KO}}</span><span ng-if="locale!='ko'">{{il.TITLE_EN}}</span>
										</a>
										<a ng-if="il.SALE_OUTSIDE_YN =='Y'"  ng-class="il.CLOSE_YN=='N' ? 'wish_hover_active' : 'wish_hover'"  ng-href="{{il.CLOSE_YN=='N' ? '/lotOutsideDetail?sale_no=' + il.SALE_NO + '&lot_no=' + il.LOT_NO + '&sale_status=ING&view_type=LIST' : ''}}" target="_blank">
											<span ng-if="locale=='ko'">{{il.TITLE_KO}}</span><span ng-if="locale!='ko'">{{il.TITLE_EN}}</span>
										</a>
									</td>
									<td><span ng-if="locale=='ko'">{{il.ARTIST_NAME_KO}}</span><span ng-if="locale!='ko'">{{il.ARTIST_NAME_EN}}</span></td>
									<td>{{il.REG_DT | date:'yyyy-MM-dd'}}</td>
									<!-- <td>
										<button type="button" class="btn_insert" ng-click="inteDel({'parent':this, 'sale_no':il.SALE_NO, 'lot_no':il.LOT_NO});">FAVORITE Del.</button>
									</td>
									<td ng-if="il.CLOSE_YN=='N' && il.SALE_OUTSIDE_YN =='N'">
										<a ng-href="{{'/lotDetail?sale_no=' + il.SALE_NO + '&lot_no=' + il.LOT_NO + '&sale_status=ING&view_type=LIST'}}" target="_blank">
											<span ng-if="locale=='ko'">바로가기</span><span ng-if="locale!='ko'">Detail</span></a>
									</td>
									<td ng-if="il.CLOSE_YN=='N' && il.SALE_OUTSIDE_YN =='Y'">
										<a ng-href="{{'/lotOutsideDetail?sale_no=' + il.SALE_NO + '&lot_no=' + il.LOT_NO + '&sale_status=ING&view_type=LIST'}}" target="_blank">
											<span ng-if="locale=='ko'">바로가기</span><span ng-if="locale!='ko'">Detail</span></a>
									</td> --> 
									<td>
												<button type="button"> test    
													<span ng-if="il.STAT_CD != 'reentry'"> 
													<!-- <span ng-if="sale_status == 'ING' && lot.STAT_CD != 'reentry'"> -->  
												        <span class="grid_wish_btn grid_wish_btn_sele" ng-click="inteDel({'parent':this, 'sale_no':il.SALE_NO, 'lot_no':il.LOT_NO});" title="관심작품 보기 / WishList"></span>
												        <!-- <span ng-if="il.INTE_LOT_DEL != 'N' && il.STAT_CD != 'reentry'" class="grid_wish_btn" ng-click="inteSave({'parent':this, 'sale_no':il.SALE_NO, 'lot_no':il.LOT_NO});" title="관심작품 보기 / WishList"></span> --> 
										            </span>       
										        </button> 
									</td>
								</tr>
							</tbody>
						</table> 
					</div>  
					 
					<p class="cstm_psnotice">  
						* 모바일에선 table 좌우 스크롤이 가능 합니다. 
					</p> 
						
					<div class="wrap_paging">
						<paging page="currentPage"
							page-size="pageRows"
							total="inteListCnt"
							paging-action="loadInteList(page)"
							scroll-top="true"
							hide-if-empty="true"
							show-prev-next="true"
							show-first-last="true"
							ul-class="page_ul"
							active-class="page_active"
						    disabled-class="page_disable"
						    text-next-class="page_btn sp_btn btn_next02"
						    text-prev-class="page_btn sp_btn btn_prev02"
						    text-first-class="page_btn sp_btn btn_prev"
						    text-last-class="page_btn sp_btn btn_next">
						</paging>
					</div>

				</div>
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