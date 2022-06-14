<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/header.jsp" flush="false" />
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
																			<select name="category1" id="category1"
																				class="select2Basic" ng-model="form_data.cate1"
																				ng-change="changeCate1()">
																				<option value="">Choose</option>
																				<option
																					ng-repeat="code in inqCate | filter:{LEVEL:1}:true"
																					value="{{code.CD_ID}}">{{code.CD_NM}}/{{code.CD_NM_EN}}</option>
																			</select>
																		</div>
																		<div class="select-box half">
																			<select name="category2" id="category2"
																				class="select2Basic" ng-model="form_data.cate2"
																				ng-if="inqCate2 != undefined && inqCate2.length > 0">
																				<option value="">Choose</option>
																				<option ng-repeat="code in inqCate2"
																					value="{{code.CD_ID}}">{{code.CD_NM}}/{{code.CD_NM_EN}}</option>
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
																		class="form-control half" maxlength="13"
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
																				class="form-control" value="" placeholder="">
																			<div class="byte_check">
																				<em>0</em> <span>/ 100</span>
																			</div>
																		</div>
																	</div>
																	<div class="only-mb">
																		<div class="textarea-box byte">
																			<textarea name="inquiry_subject" id="inquirySubject"
																				ng-model="form_data.title" cols="30" rows="10"
																				style="height: 86px"></textarea>
																			<div class="byte_check">
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
																			ng-model="form_data.content" cols="30" rows="10"></textarea>
																		<div class="byte_check">
																			<em>0</em> <span>/ 1000자</span>
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
																	<label for="" class="">Size </label> <i>*</i>
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
																	<div class="select-box half">
																		<select ng-model="sell_data.work_category1"
																			name="work_category1" id="work_category1"
																			ng-change="changeSellCate1();">
																			<option value="">Choose</option>
																			<option ng-repeat="cate in sell_categories1"
																				value="{{cate}}">{{cate}}</option>
																		</select> <select ng-model="sell_data.work_category2"
																			style="display: none;" name="work_category2"
																			id="work_category2" ng-change="changeSellCate2();">
																			<option value="">Choose</option>
																			<option ng-repeat="cate in sell_categories2"
																				value="{{cate}}">{{cate}}</option>
																		</select> <select ng-model="sell_data.work_category3"
																			style="display: none;" name="work_category3"
																			id="work_category3">
																			<option value="">Choose</option>
																			<option ng-repeat="cate in sell_categories3"
																				value="{{cate}}">{{cate}}</option>
																		</select>
																	</div>
																</div>
															</li>
															<li class="hide_row" style="display: none">
																<div class="th">
																	<label for="" class="">Hope price</label>
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
																	<label for="" class="">Work description</label>
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
																	<!-- <div class="trp file-box">
                                                                    <label for="fileName" class="screen-reader-text">파일 선택</label>
                                                                    <input type="text" id="fileName" class="trp-Filetext">
                                                                    <input type="button" class="btn btn_light_gray_line" value="파일첨부">
                                                                    <input type="file" name="file" id="file" class="trp-Filehidden" ng-model="form_file_data.files" onchange="javascript: document.getElementById('fileName').value = this.value" title="Insert Attachment">
																		
                                                                </div> -->

																	<div>
																		<input type="file" name="file" class="uploadify"
																			id="file" multiple="multiple"
																			ng-model="form_file_data.files" /><br>

																		<ul class="fileList" id="selectedFileList">
																			<li
																				ng-repeat="att in form_file_data.att_files_name track by $index">
																				{{att}}</li>
																		</ul>
																	</div>
																	<ul class="dot_list tb2 mt10">
																		<li>You can attach files of 10 MB or less.</li>
																		<li>You can upload 10 files</li>
																		<li>File type : jpg, jpeg, png, gif, pdf, zip, alz</li>
																		<li><u>Please attach the image file to get a prompt accurate answer, Choose the File</u></li>
																	</ul>
																</div>
															</li>
														</ul>
													</article>
													<div style="display: none;" id="sell_form">
														<div class="tbl_style01 form inner">
															<table>
																<caption>위탁신청내용</caption>
																<colgroup>
																	<col style="width: 12%;">
																	<col style="width: 38%;">
																	<col style="width: 12%;">
																	<col>
																</colgroup>
																<tbody>
																	<tr>
																		<th>Artwork </th>
																		<td id="tmp_artist_name"></td>
																		<th>Author </th>
																		<td id="tmp_work_name"></td>
																	</tr>
																	<tr>
																		<th>Material</th>
																		<td id="tmp_work_material"></td>
																		<th>Classificdation</th>
																		<td id="tmp_work_category"></td>
																	</tr>
																	<tr>
																		<th>Age</th>
																		<td id="tmp_work_estate"></td>
																		<th>Hope price</th>
																		<td id="tmp_hope_price"></td>
																	</tr>
																	<tr>
																		<th>Size </th>
																		<td id="tmp_work_size"></td>
																	</tr>
																	<tr>
																		<th>Author Description</th>
																		<td colspan="3" id="tmp_artist_desc"></td>
																	</tr>
																	<tr>
																		<th>Work description</th>
																		<td colspan="3" id="tmp_work_desc"></td>
																	</tr>
																	<tr>
																		<th>Inspector </th>
																		<td colspan="3" id="tmp_possession_details"></td>
																	</tr>
																</tbody>
															</table>
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


	<script type="text/javascript" src="/js/common.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="/js/pages_common_ko.js"
		type="text/javascript"></script>




</body>

</html>