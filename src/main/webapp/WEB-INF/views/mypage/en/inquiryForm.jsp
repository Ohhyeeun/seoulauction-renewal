<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
			<script type="text/javascript" src="/js/mypage/inquiry.js"></script>
			<!-- container -->
			<div id="container" class="inquiry" ng-controller="inquiryWriteCtl"
				data-ng-init="init()" style="opacity: 0" opacity=1>
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
														<span class="tt2">1:1 Inquiry</span>
													</div>
													<div class="btn-wrap js-history_back m-ver">
														<i class="icon-page_back"></i>
													</div>
												</div>
											</div>
											<div class="contents-wrap">
												<article class="tit-textbox">
													<p class="tb1">
                                                        Please contact us if you have any questions about using Seoul Auction. You can check the answer in My Page > 1:1 Inquiry. Inquiries about Korean modern and ancient art and overseas art will be answered within 7 days after reviewing whether the auction can be held.
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
																	<label for="" class="">Type</label> <i>*</i>
																</div>
																<div class="td">
																	<div class="col_select">
																		<div class="select-box half">
																			<select class="select2Basic" name="category1" id="category1"
																				class="" ng-model="form_data.cate1"
																				onchange="angular.element(this).scope().changeCate1()">
																				<option value="">Choose</option>
																				<option
																					ng-repeat="code in inqCate | filter:{LEVEL:1}:true"
																					value="{{code.CD_ID}}">{{code.CD_NM_EN}}</option>
																			</select>
																		</div>
																		<div class="select-box half" id="inqCate2">
																			<select class="select2Basic" name="category2" id="category2" ng-model="form_data.cate2"
																				onchange="angular.element(this).scope().changeCate2()">
																				<option value="">Choose</option>
																				<option ng-repeat="code in inqCate2"
																					value="{{code.CD_ID}}">{{code.CD_NM_EN}}</option>
																			</select>
																		</div>
																	</div>
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">Email</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" name="email1" id="emailAccount" 
																		class="form-control half" value="{{custInfo.EMAIL}}"
																		placeholder="">
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">Mobile Number</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" name="hp" id="hp" 
																		class="form-control half" maxlength="11"
																		onkeypress="inquiryPhoneNumber(this);" onkeyup="onlyNumber(this);" onblur="inquiryPhoneNumberBlur(this);"
																		value="{{custInfo.HP}}" placeholder="">
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">Title</label> <i>*</i>
																</div>
																<div class="td">
																	<div class="only-pc">
																		<div class="input-byte">
																			<input type="text" name="inquiry_subject"
																				id="inquirySubject" ng-model="form_data.title"
																				class="form-control" value="" placeholder="" data-id="inquirySubject" data-size=100>
																			<div class="byte_check" id="inquirySubject_length">
																				<em>0</em> <span>/ 100</span>
																			</div>
																		</div>
																	</div>
																	<div class="only-mb">
																		<div class="textarea-box byte">
																			<textarea name="inquiry_subject" id="inquirySubject"
																				ng-model="form_data.title" cols="30" rows="10"
																				style="height: 86px" data-id="inquirySubjectMb" data-size=100></textarea>
																			<div class="byte_check" id="inquirySubjectMb_length">
																				<em>0</em> <span>/ 100</span>
																			</div>
																		</div>
																	</div>
																</div>
															</li>
															<li>
																<div class="th">
																	<label for="" class="">Contents</label> <i>*</i>
																</div>
																<div class="td">
																	<div class="textarea-box byte">
																		<textarea id="inquiryContent"
																			ng-model="form_data.content" cols="30" rows="10" data-id="inquiryContent"  data-size=1000></textarea>
																		<div class="byte_check" id="inquiryContent_length">
																			<em>0</em> <span>/ 1000</span>
																		</div>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Artwork</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_name"
																		name="work_name" id="workName">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Author</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.artist_name"
																		name="artist_name" id="artistName">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Material</label>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_material"
																		name="work_material" id="workMaterial">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Age</label>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_estate"
																		name="work_estate" id="assuptionTime">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Size</label> <i>*</i>
																</div>
																<div class="td">
																	<input type="text" class="form-control half" value=""
																		placeholder="" ng-model="sell_data.work_size"
																		name="work_size" id="workSize">
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Classification</label>
																</div>
																<div class="td">
																	<div class="col_select">
																		<div class="select-box half dep1">
																			<select class="select2Basic" name="work_category1" id="work_category1" ng-model="sell_data.work_category1"
																				onchange="angular.element(this).scope().changeSellCate1()">
																				<option value="">Choose</option>
																				<option ng-repeat="cate in sell_categories1_en"
																					value="{{cate}}">{{cate}}</option>
																			</select>
																		</div>
																		<div class="select-box half dep2" id="sellCate2">
																			<select ng-model="sell_data.work_category2"
																				name="work_category2"
																				id="work_category2" 
																				onchange="angular.element(this).scope().changeSellCate2()"
																				class="select2Basic">
																				<option value="">Choose</option>
																				<option ng-repeat="cate in sell_categories2"
																					value="{{cate}}">{{cate}}</option>
																			</select>
																		</div>
																		<div class="select-box half dep3" id="sellCate3">  
																			<select ng-model="sell_data.work_category3"
																				name="work_category3"
																				id="work_category3" 
																				onchange="angular.element(this).scope().changeSellCate3()"
																				class="select2Basic">
																				<option value="">Choose</option>
																				<option ng-repeat="cate in sell_categories3"
																					value="{{cate}}">{{cate}}</option>
																			</select>
																		</div>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Hope Price</label>
																</div>
																<div class="td">
																	<div class="input_grid">
																		<input type="text" class="form-control half" value=""
																			placeholder="" ng-model="sell_data.hope_price"
																			name="hope_price" id="hopePrice" class="tar"
																			onKeyUp="moneyFormat(event,this);"> <span
																			class="tb1">KRW</span>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Work Description</label>
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
																	<label for="" class="">Author Description</label>
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
																	<label for="" class="">Inspector</label> <i>*</i>
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
																	<label for="" class="">Attached Files</label> <i>*</i>
																</div>
																<div class="td">
																<div style="display:none" id="fileHtml">
																
																</div>
																<div class="trp file-box">
                                                                    <label for="fileName" class="screen-reader-text">Select Files</label>
                                                                    <input type="text" id="fileName" class="trp-Filetext">
                                                                    <input type="button" class="btn btn_light_gray_line" value="Select Files">
                                                                    <input type="file"  tabindex="7" class="trp-Filehidden" name="file" id="file" title="Insert Attachment">
                                                                </div>
						                                        <div class="file-box-list" ng-repeat="file in fileNameList" >
						                                            <p class="label" >
						                                                <i class="icon_down"></i>
						                                                <span class="tb1">{{file.fileName}}</span>
						                                                <a href="#none" class="btn_del" ng-click="deleteFile(file.fileIndex)"><span class="icon-del"></span></a>
						                                            </p>
						                                        </div>
																	
																	<ul class="dot_list tb2 mt10">
<%--																		<li>ou can attach files of 10 MB or less.</li>--%>
<%--																		<li>You can upload 10 files</li>--%> 
<%--																		<li>File type : jpg, jpeg, png, gif, pdf, zip, alz</li>--%>
																		<li><u>Please attach the image file to get a prompt accurate answer, Choose the File</u></li>
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
                                                                <label for="" class="">Artwork</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_name">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >Author</label>
                                                           </div>
                                                            <div class="td" id="tmp_artist_name">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">Material</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_material">
                                                               
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >Age</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_estate">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">Size</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_size">
                                                                
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >Classification</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_category">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="" >Hope Price</label>
                                                            </div>
                                                            <div class="td" id="tmp_hope_price">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">Work Description</label>
                                                            </div>
                                                            <div class="td" id="tmp_work_desc">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">Author Description</label>
                                                            </div>
                                                            <div class="td" id="tmp_artist_desc">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="th">
                                                                <label for="" class="">Inspector</label>
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
															<span>Cancel</span>
														</button>
														<button class="btn btn_point btn_lg"
															ng-click="saveForm();">
															<span>Save</span>
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

			<jsp:include page="../../include/en/footer.jsp" flush="false" />
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


    <script>
        $(".js-history_back").click(function() {
        	window.location.href="/mypage/main";
        })
    </script>
    
	<script type="text/javascript" src="/js/pages_common_en.js"
		type="text/javascript"></script>

    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>

</body>

</html>