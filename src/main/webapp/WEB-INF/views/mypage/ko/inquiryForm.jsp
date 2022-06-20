<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>마이페이지 | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <!-- //header -->
</head>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/inquiry.js"></script>
			<!-- container -->
			<div id="container" class="inquiry" ng-controller="inquiryWriteCtl"
				data-ng-init="init()">
				<div id="contents" class="contents">

					<section class="basis-section last-section mypage-section">
						<div class="section-inner">

							<div class="content-panel type_panel-mypage_inquiry">
								<div class="panel-body">
									<div class="mypage-container">

										<!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

										<div class="content-area">
											<div class="subtitle-wrap">
												<div class="subtitle-inner">
													<div class="title">
														<span class="tt2">1:1문의</span>
													</div>
													<div class="btn-wrap js-history_back m-ver">
														<i class="icon-page_back"></i>
													</div>
												</div>
											</div>
											<div class="contents-wrap">
												<article class="tit-textbox">
													<p class="tb1">
														서울옥션 이용에 있어 궁금한 점을 문의해주세요. 답변은 마이페이지 > 1:1문의 에서 확인하실 수
														있습니다.<br /> 한국 근현대 및 고미술 그리고 해외미술에 문의하신 작품은 경매 진행 가능 여부를
														검토 후, 7일 이내에 답변을 드리고 있습니다.
													</p>
												</article>
												<form id="frmInquiry" action="" method="post"
													enctype='multipart/form-data'>
													<input type="hidden" name="cate_cd" id="cate_cd" /> <input
														type="hidden" name="emp_no" id="emp_no" /> <input
														type="hidden" name="contents" id="inquiryContents" />
													<article class="inquiry-write-wrap">
														<ul class="form_table-list data_size-185">
															<li>
																<div class="th">
																	<label for="" class="">문의종류</label> <i>*</i>
																</div>
																<div class="td">
																	<div class="col_select">
																		<div class="select-box half">
																			<select name="category1" id="category1"
																				class="" ng-model="form_data.cate1"
																				ng-change="changeCate1()">
																				<option value="">선택하세요</option>
																				<option
																					ng-repeat="code in inqCate | filter:{LEVEL:1}:true"
																					value="{{code.CD_ID}}">{{code.CD_NM}}/{{code.CD_NM_EN}}</option>
																			</select>
																		</div>
																		<div class="select-box half">
																			<select name="category2" id="category2"
																				class="" ng-model="form_data.cate2"
																				ng-if="inqCate2 != undefined && inqCate2.length > 0">
																				<option value="">선택하세요</option>
																				<option ng-repeat="code in inqCate2"
																					value="{{code.CD_ID}}">{{code.CD_NM}}/{{code.CD_NM_EN}}</option>
																			</select>
																		</div>
																	</div>
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">이메일</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" name="email1" id="emailAccount" 
																		class="form-control half" value="{{custInfo.EMAIL}}"
																		placeholder="">
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">휴대폰</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" name="hp" id="hp" 
																		class="form-control half" maxlength="13"
																		value="{{custInfo.HP}}" placeholder="">
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">제목</label> <i>*</i>
																</div>
																<div class="td">
																	<div class="only-pc">
																		<div class="input-byte">
																			<input type="text" name="inquiry_subject"
																				id="inquirySubject" ng-model="form_data.title"
																				class="form-control" value="" placeholder="">
																			<div class="byte_check">
																				<em>0</em> <span>/ 100자</span>
																			</div>
																		</div>
																	</div>
																	<div class="only-mb">
																		<div class="textarea-box byte">
																			<textarea name="inquiry_subject" id="inquirySubject"
																				ng-model="form_data.title" cols="30" rows="10"
																				style="height: 86px"></textarea>
																			<div class="byte_check">
																				<em>0</em> <span>/ 100자</span>
																			</div>
																		</div>
																	</div>
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">내용</label> <i>*</i>
																</div>
																<div class="td">
																	<div class="textarea-box byte">
																		<textarea id="inquiryContent"
																			ng-model="form_data.content" cols="30" rows="10"></textarea>
																		<div class="byte_check">
																			<em>0</em> <span>/ 1000자</span>
																		</div>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">작품명</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_name"
																		name="work_name" id="workName">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">작가명</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.artist_name"
																		name="artist_name" id="artistName">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">작품재질</label>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_material"
																		name="work_material" id="workMaterial">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">추정시대</label>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_estate"
																		name="work_estate" id="assuptionTime">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">작품크기</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_size"
																		name="work_size" id="workSize">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">작품구분</label>
																</div>
																<div class="td">
																	<div class="select-box half">
																		<select ng-model="sell_data.work_category1"
																			name="work_category1" id="work_category1"
																			ng-change="changeSellCate1();">
																			<option value="">선택하세요</option>
																			<option ng-repeat="cate in sell_categories1"
																				value="{{cate}}">{{cate}}</option>
																		</select> <select ng-model="sell_data.work_category2"
																			style="display: none;" name="work_category2"
																			id="work_category2" ng-change="changeSellCate2();">
																			<option value="">선택하세요</option>
																			<option ng-repeat="cate in sell_categories2"
																				value="{{cate}}">{{cate}}</option>
																		</select> <select ng-model="sell_data.work_category3"
																			style="display: none;" name="work_category3"
																			id="work_category3">
																			<option value="">선택하세요</option>
																			<option ng-repeat="cate in sell_categories3"
																				value="{{cate}}">{{cate}}</option>
																		</select>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">희망가격</label>
																</div>
																<div class="td">
																	<div class="input_grid">
																		<input type="text" class="form-control half" value=""
																			placeholder="" ng-model="sell_data.hope_price"
																			name="hope_price" id="hopePrice" class="tar"
																			onKeyUp="moneyFormat(event,this);"> <span
																			class="tb1">원</span>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">작품설명</label>
																</div>
																<div class="td">
																	<div class="textarea-box">
																		<textarea ng-model="sell_data.work_desc"
																			name="work_desc" cols="30" rows="10"></textarea>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">작가설명</label>
																</div>
																<div class="td">
																	<div class="textarea-box">
																		<textarea ng-model="sell_data.artist_desc"
																			name="artist_desc" cols="30" rows="10"></textarea>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">소장경위</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text"
																		ng-model="sell_data.possession_details"
																		name="possession_details" class="form-control"
																		value="" placeholder="">
																</div>
															</li>

															<li class="file_row">
																<div class="th">
																	<label for="" class="">첨부파일</label> <i>*</i>
																</div>
																<div class="td">
																<div class="trp file-box">
                                                                    <label for="fileName" class="screen-reader-text">파일 선택</label>
                                                                    <input type="text" id="fileName" class="trp-Filetext">
                                                                    <input type="button" class="btn btn_light_gray_line" value="파일첨부">
                                                                    <input type="file" multiple="multiple" tabindex="7" class="trp-Filehidden" ng-model="form_data.file" name="file" id="file" onchange="angular.element(this).scope().fileValidCheck()" title="Insert Attachment">
                                                                </div>
						                                        <div class="file-box-list" ng-repeat="file in fileNameList" >
						                                            <p class="label" >
						                                                <i class="icon_down"></i>
						                                                <span class="tb1">{{file.filename}}</span>
						                                            </p>
						                                        </div>
																	
																	<ul class="dot_list tb2 mt10">
																		<li>10 MB 이하의 파일 첨부가 가능합니다.</li>
																		<li>10개의 파일 업로드 가능합니다.</li>
																		<li>첨부파일 유형: jpg, jpeg, png, gif, pdf, zip, alz</li>
																		<li><u>위탁문의 시 작품 이미지가 첨부 되어야 정확한 답변이 가능합니다.</u></li>
																	</ul>
																</div>
															</li>
														</ul>
													</article>
													<div  style="display:none" id="sell_form">
														<div class="tbl_style01 form inner">
															<article class="inquiry-write-wrap">
                                                    <ul class="form_table-list data_size-185">
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">작품명</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td" id="tmp_work_name">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >작가명</label>
                                                                <i>*</i>
                                                           </div>
                                                            <div class="td" id="tmp_artist_name">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">작품재질</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_material">
                                                               
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >추정시대</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_estate">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">작품크기</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td" id="tmp_work_size">
                                                                
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >작품구분</label>
                                                            </div>
                                                            <div class="td">
                                                                <div  id="tmp_work_category">
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >희망가격</label>
                                                            </div>
                                                            <div class="td">
                                                                <div id="tmp_hope_price">
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">작품설명</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_desc">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">작가설명</label>
                                                            </div>
                                                            <div class="td" id="tmp_artist_desc">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">소장경위</label>
                                                                <i>*</i>
                                                            </div>
                                                            <div class="td" id="tmp_possession_details">
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </article>
											</div>
									</div>
												</form>
												<article class="button-area">
													<div class="btn_set-float tac">
														<button class="btn btn_default btn_lg"
															ng-click="cancel();">
															<span>취소</span>
														</button>
														<button class="btn btn_point btn_lg"
															ng-click="saveForm();">
															<span>저장</span>
														</button>
													</div>
												</article>
											</div>
										</div>

									</div>
								</div>
								<div class="panel-footer"></div>
							</div>

						</div>
					</section>

				</div>
			</div>
			<!-- //container -->

			<!-- footer -->

			<jsp:include page="../../include/ko/footer.jsp" flush="false" />
			<!-- //footer -->

			<!-- stykey -->

			<div class="scroll_top-box">
				<div class="box-inner">
					<a href="#" class="btn-scroll_top js-scroll_top"><i
						class="icon-scroll_top"></i></a>
				</div>
			</div>
			<!-- // stykey -->

		</div>
	</div>


	<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
	<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
	<script type="text/javascript" src="/js/plugin/prefixfree.min.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="/js/plugin/jquerylibrary.js"
		type="text/javascript"></script>
	<!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


	<script type="text/javascript" src="/js/pages_common_ko.js"
		type="text/javascript"></script>




</body>

</html>