<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	


<body>  
    
<jsp:include page="../../include/en/header.jsp" flush="false"/>   
<div id="wrap" ng-app="myApp">
    <script type="text/javascript" src="/js/mypage/inquiry.js"></script>
<section class="main-contents footer-bottom">
			<div class="contents_wrap"ng-controller="inquiryWriteCtl" data-ng-init="init()">
				<div class="contents">
					<div class="tit_h2 type03">
						<h2><spring:message code="label.membership.inquery" /></h2>
						<p><span class="txt_green"><strong><spring:message code="label.membership.inquery01" /></strong></p>
                        <p><spring:message code="message.membership.inquery" /></p>
                        <!-- <c:if test="${locale == 'ko'}">    
                        	<p><span class="ps_inquiry_img"></span>PS문의 : 문의종류선택 <i class="material-icons" style="padding-right: 0; font-size: 20px;">forward</i> 강남센터 전시문의</p> 
                        </c:if>  
                        <c:if test="${locale != 'ko'}">  
                        	<p><span class="ps_inquiry_img"></span>PS inquiry : choose the type <i class="material-icons" style="padding-right: 0; font-size: 20px;">forward</i> Gangnam Exhibition</p>      
                        </c:if> -->       
					</div>
					<form id="frmInquiry" action="" method="post" enctype='multipart/form-data'>
					<input type="hidden" name="cate_cd" id="cate_cd"/>
					<input type="hidden" name="emp_no" id="emp_no"/>
					<input type="hidden" name="contents" id="contents"/>
						<fieldset>
							<legend><spring:message code="label.membership.inquery" /></legend>
							<div class="tbl_style01 m_tbl_z060">
								<table>
									<caption><spring:message code="label.membership.inquery" /></caption>
									<colgroup>
										<col style="width:15%;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for=""><spring:message code="label.membership.inquerytype" /></label></th>
											<td>
												<div class="fl_wrap">
													<div class="input_ver">
														<select name="category1" id="category1" class="selectbox" ng-model="form_data.cate1" ng-change="changeCate1()">
															<option value=""><spring:message code="message.Choose" /></option>
															<option ng-repeat="code in inqCate | filter:{LEVEL:1}:true" value="{{code.CD_ID}}">{{code.CD_NM}}/{{code.CD_NM_EN}}</option>
														</select>
														<select name="category2" id="category2"
															ng-model="form_data.cate2" ng-if="inqCate2 != undefined && inqCate2.length > 0">
															<option value=""><spring:message code="message.Choose" /></option>
															<option ng-repeat="code in inqCate2" value="{{code.CD_ID}}">{{code.CD_NM}}/{{code.CD_NM_EN}}</option>
														</select>
													</div>
												</div>
											</td>
										</tr>
										<!-- <tr>
											<th scope="row"><label for="">담당자</label></th>
											<td><input type="hidden" name="" id="managerName" disabled /></td>
										</tr>-->
										<tr>
											<th scope="row"><label for=""><spring:message code="label.mem.email" /></label></th>
											<td>

												<div class="fl_wrap type02">
													<div class="input_email">
														<input type="text" name="email1" id="emailAccount" value="{{custInfo.EMAIL}}"
														/>
													</div>
													<!--<div class="wrap_check">
														<div>
															<input type="checkbox" name="notice_email_yn" id="noticeEmail" ng-model="email_yn"/>
															<label for="noticeEmail">이메일로 답변받기</label>
														</div>
													</div>
													<p class="tbl_txt left">※ 이메일로 답변받기를 선택하시면, 답변 등록 시 이메일로 답변을 발송해드립니다.</p>-->
												</div>

											</td>
										</tr>
										<tr>
											<th scope="row"><label for=""><spring:message code="label.mem.mobile" /></label></th>
											<td>
												<div class="fl_wrap type02">
													<div class="input_phone fl">
														<input type="text" name="hp" id="hp" value="{{custInfo.HP}}" class="tac" maxlength="11" />
													</div>
													<!--<div class="wrap_check">
														<div>
															<input type="checkbox" name="notice_sms_yn" value="N" id="noticeSms" ng-model="sms_yn"/>
															<label for="noticeSms">SMS 알림받기</label>
														</div>
													</div>--> 
												</div>
												<!--<p class="tbl_txt left">※ SMS 알림받기를 선택하시면, 답변 등록 시 알림문자를 발송해드립니다. </p>-->
											</td>
										</tr>
										<tr>
											<th scope="row"><label for=""><spring:message code="label.membership.inquerytitle" /></label></th>
											<td>
												<div class="input_full">
													<input type="text" name="inquiry_subject" name="title" id="inquirySubject" ng-model="form_data.title" />
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for=""><spring:message code="label.membership.inquerycontents" /></label></th>
											<td>
												<div class="input_full">
													<textarea id="inquiryContent" rows="5" ng-model="form_data.content"></textarea>
												</div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for=""><spring:message code="label.membership.inqueryartwork" /></label></th>
											<td>
												<div class="input_full">
													<input type="text" ng-model="sell_data.work_name" name="work_name" id="workName" />
												</div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">작가명</label> <span class="ico_essen"><span class="hidden">필수입력</span></span></th>
											<td><input type="text" ng-model="sell_data.artist_name" name="artist_name" id="artistName" /></td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">작품재질</label></th>
											<td>
												<div class="input_full">
													<input type="text" ng-model="sell_data.work_material" name="work_material" id="workMaterial" />
												</div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">추정시대</label></th>
											<td>
												<div class="input_full"><input type="text" ng-model="sell_data.work_estate" name="work_estate" id="assuptionTime" /></div>
											</td>
										</tr>										
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">작품크기</label></th>
											<td>
												<div class="input_full"><input type="text" ng-model="sell_data.work_size" name="work_size" id="workSize" /></div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">작품구분</label></th>
											<td>
												<div class="fl_wrap type02">
													<div class="input_ver">
														<select ng-model="sell_data.work_category1" 
															name="work_category1" id="work_category1" ng-change="changeSellCate1();">
															<option value="">선택하세요</option>
															<option ng-repeat="cate in sell_categories1" value="{{cate}}">{{cate}}</option>
														</select>
														<select ng-model="sell_data.work_category2" style="display:none;"
															name="work_category2" id="work_category2" ng-change="changeSellCate2();">
															<option value="">선택하세요</option>
															<option ng-repeat="cate in sell_categories2" value="{{cate}}">{{cate}}</option>
														</select>
														<select ng-model="sell_data.work_category3" style="display:none;"
															name="work_category3" id="work_category3">
															<option value="">선택하세요</option>
															<option ng-repeat="cate in sell_categories3" value="{{cate}}">{{cate}}</option>
														</select>
													</div>
												</div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">희망가격</label></th>
											<td>
												<div class="fl_wrap">
													<input type="text" ng-model="sell_data.hope_price" name="hope_price" id="hopePrice" class="tar" onKeyUp="moneyFormat(this);"/>
													<span class="tbl_label">원</span>
												</div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">작가 설명</label></th>
											<td>
												<div class="input_full">
													<textarea ng-model="sell_data.artist_desc" name="artist_desc" id="" rows="3"></textarea>
												</div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">작품 설명</label></th>
											<td>
												<div class="input_full">
													<textarea ng-model="sell_data.work_desc" name="work_desc" id="" rows="3"></textarea>
												</div>
											</td>
										</tr>
										<tr class="hide_row" style="display:none">
											<th scope="row"><label for="">소장 경위</label> <span class="ico_essen"><span class="hidden">필수입력</span></span></th>
											<td>
												<div class="input_full">
													<input type="text" ng-model="sell_data.possession_details" name="possession_details" id="" />
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="">첨부파일 File</label> <span class="ico_essen"><span class="hidden">필수입력</span></span></th>
											<td>
												<span ng-if="locale == 'ko'" style="color:#F30; font-weight:600; display:block; padding-bottom: 10px;">※ 위탁문의시 작품 이미지가 첨부 되어야 정확한 답변이 가능합니다.</span>
												<span ng-if="locale != 'ko'" style="color:#F30; font-weight:600; display:block; padding-bottom: 10px;">※ Please attach the image file to get a prompt accurate answer. Choose the File</span>    
												<input type="file" name="file" class="uploadify" id="file" multiple="multiple"
													ng-model="form_file_data.files" /><br>
													<!-- onchange="angular.element(this).scope().uploadFile(this);"  -->
												<ul class="fileList" id="selectedFileList">
													<li ng-repeat="att in form_file_data.att_files_name track by $index">
														{{att}}<button type="button" class="sp_btn btn_attach_close deleteBtn" 
														ng-click="removeFile($index);">
														<span class="hidden">닫기</span></button>
													</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn_wrap">
								<span class="btn_style01 gray large02"><button type="button" ng-click="cancel();">취소 cancel</button></span>
								<span class="btn_style01 dark large02"><button type="button" ng-click="saveForm();">저장 save</button></span>
							</div>
						</fieldset>
						
						<div style="display:none;" id="sell_form">
							<div class="tbl_style01 form inner">
								<table>
									<caption>위탁신청내용</caption>
									<colgroup>
										<col style="width:12%;">
										<col style="width:38%;">
										<col style="width:12%;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>작가명</th>
											<td id="tmp_artist_name"></td>
											<th>작품명</th>
											<td id="tmp_work_name"></td>
										</tr>
										<tr>
											<th>작품재료</th>
											<td id="tmp_work_material"></td>
											<th>작품구분</th>
											<td id="tmp_work_category"></td>
										</tr>
										<tr>
											<th>추정시대</th>
											<td id="tmp_work_estate"></td>
											<th>희망가격</th>
											<td id="tmp_hope_price"></td>
										</tr>
										<tr>
											<th>작품크기</th>
											<td id="tmp_work_size"></td>
										</tr>
										<tr>
											<th>작가 설명</th>
											<td colspan="3" id="tmp_artist_desc"></td>
										</tr>
										<tr>
											<th>작품 설명</th>
											<td colspan="3" id="tmp_work_desc"></td>
										</tr>
										<tr>
											<th>소장 경위</th>
											<td colspan="3" id="tmp_possession_details"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</form>
				</div>
			</div>

		</section>
</div>
    <jsp:include page="../../include/en/footer.jsp" flush="false"/>
</body>