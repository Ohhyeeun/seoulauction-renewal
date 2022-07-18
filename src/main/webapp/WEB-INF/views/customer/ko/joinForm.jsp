<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body ng-controller="joinFormCtl" data-ng-init="init()" ng-cloak>
<div class="wrapper">
	<div class="sub-wrap pageclass">
		<jsp:include page="../../include/ko/nav.jsp" flush="false"/>

		<div id="container">
			<div id="contents" class="contents">
				<section class="basis-section last-section back_gray">
					<div class="section-inner">
						<div class="content-panel type_panel-member">
							<div class="panel-header">
								<div class="title txt_input">
									<span class="tt2">회원가입</span>
								</div>
								<div class="required">
									<span class="tb2"><i>*</i> 필수</span>
								</div>
							</div>

							<form id="joinForm" enctype='multipart/form-data'>
							<div class="panel-body">
								<ul class="form_list">
									<li>
										<div class="form_label">
											<label for="login_id" class="mem_txt">아이디</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<input type="hidden" id="social_login_id" name="social_login_id" value="${socialLoginId }" ng-model="form_data.social_login_id" />
											<input type="hidden" id="social_email" name="social_email" value="${socialEmail }" ng-model="form_data.social_email" />
											<input
												autofocus="autofocus"
												tabindex="1"
												ng-hide="isSocial()"
												type="text"
												id="login_id"
												name="login_id"
												ng-model="form_data.login_id"
												ng-blur="idValidCheckBlur()"
												ng-change="idValidCheckChange()"
												class="form-control"
												placeholder="">
											<div class="id_name_box" ng-show="isSocial()">
												<span class="tb1">${socialLoginId }</span>
												<span class="sns-icon"><img ng-src="/images/common/icon-sns_{{getSocialName()}}.png" alt=""></span>
											</div>
											<p class="error_text tb2">{{login_id_msg}}</p>
										</div>
									</li>
									<li ng-hide="isSocial()">
										<div class="form_label">
											<label for="passwd" class="mem_txt">비밀번호</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<div class="pw_mask_box">
												<input type="password" tabindex="2" ng-change="passwdValidChange()" class="" id="passwd" name="passwd" ng-model="form_data.passwd"  placeholder="비밀번호 입력">
												<span class="input-side">
													<button type="button" ng-click="togglePasswd()" class="btn_pw_mask js-pw_mask">비밀번호 마스킹 해제하기</button>
												</span>
											</div>
											<p class="error_text tb2">{{passwd_msg}}</p>
										</div>
									</li>
									<li>
										<div class="form_label">
											<label ng-show="isPerson() || isSocial()" for="cust_name" class="mem_txt">이름</label>
											<label ng-show="!isPerson() && !isSocial()" for="cust_name" class="mem_txt">업체명</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<input type="text" tabindex="3" ng-change="nameValidCheck()" ng-model="form_data.cust_name" name="cust_name" id="cust_name" class="form-control" placeholder="">
										</div>
									</li>

									<li ng-show="!isPerson() && !isSocial()">
										<div class="form_label">
											<label for="comp_no" class="mem_txt">사업자등록번호</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<div class="input-group">
												<input type="text" tabindex="4" ng-model="form_data.comp_no" name="comp_no" id="comp_no" class="form-control" placeholder=""
												 onkeyup="onlyNumber(this, 'number');" ng-change="compNoValidCheck()">
												<button class="btn btn_light_gray_line" type="button" ng-click="compNoExistCheck()"><span>중복확인</span></button>
											</div>
											<p class="error_text tb2">{{comp_no_msg}}</p>
										</div>
									</li>
									<li ng-show="!isPerson() && !isSocial()">
										<div class="form_label">
											<label for="comp_owner" class="mem_txt">대표자명</label>
										</div>
										<div class="form_body">
											<input type="text" tabindex="5" ng-model="form_data.comp_owner" name="comp_owner" id="comp_owner" class="form-control" placeholder="">
										</div>
									</li>
									<li ng-show="!isPerson() && !isSocial()">
										<div class="form_label">
											<label for="comp_man_name" class="mem_txt">업무담당자</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<input type="text" tabindex="6" ng-change="compManNameValidCheck()" ng-model="form_data.comp_man_name" name="comp_man_name" id="comp_man_name" class="form-control" placeholder="">
										</div>
									</li>
									<li ng-show="!isPerson() && !isSocial()">
										<div class="form_label">
											<label for="comp_file" class="mem_txt">사업자등록증첨부</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<div class="trp file-box">
												<label for="fileName" class="screen-reader-text">파일첨부</label>
												<input type="text" id="fileName" class="trp-Filetext">
												<input type="button" class="btn btn_light_gray_line" value="파일첨부">
												<input type="file" tabindex="7" class="trp-Filehidden" ng-model="form_data.comp_file" name="comp_file" id="comp_file" onchange="angular.element(this).scope().fileValidCheck('comp_file')" title="Insert Attachment">
											</div>
											<p class="error_text tb2">{{comp_file_msg}}</p>
											<div class="file-box-list" ng-hide="comp_file_filename == '' || comp_file_filename == undefined">
												<p class="label">
													<i class="icon_down"></i>
													<span class="tb1">{{comp_file_filename}}</span>
													<a href="#none" class="btn_del" ng-click="fileDelete('comp_file')"><span class="icon-del"></span></a>
												</p>
											</div>

											<ul class="dot_list tb2 mt5">
												<li>5 MB 이하의 파일 첨부가 가능합니다. </li>
												<li>jpg, jpeg, png, gif 만 업로드</li>
											</ul>
										</div>
									</li>


									<li>
										<div class="form_label">
											<label for="hp" class="mem_txt">휴대폰 번호</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<div class="input-group">
												<input type="text" tabindex="8" maxLength=13 onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this);" onblur="phoneNumberBlur(this);" ng-model="form_data.hp" name="hp" id="hp" class="form-control" placeholder="">
												<button class="btn btn_light_gray_line" type="button" ng-click="authNumRequest()"><span>{{authNumMsg}}</span></button>
											</div>

											<div class="re-check" id="hpAuthArea" style="display:none">
												<div class="form_body">
													<div class="input-group">
														<input type="text" ng-model="form_data.hp_auth" maxlength=6
														onkeyup="onlyNumber(this, 'number');" name="hp_auth" id="hp_auth" class="form-control authNum" placeholder="">
														<button class="btn btn_light_gray_line authNum" type="button" ng-click="authNumConfirm()"><span>인증번호 확인</span></button>
													</div>
												</div>
											</div>
											<p class="error_text tb2" id="hpMsg">{{hp_msg}}</p>
											<p class="error_text tb2" id="checkHpAuthMsg">{{checkHpAuth.message}}</p>
										</div>
									</li>

									<li ng-show="!isPerson() && !isSocial()">
										<div class="form_label">
											<label for="tel" class="mem_txt">전화번호</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<div class="form_body">
												<input type="text" tabindex="9" ng-model="form_data.tel" name="tel" id="tel" class="form-control" value="" placeholder=""
												onblur="telNumber(this);" onkeyup="onlyNumber(this, 'number');" ng-change="telValidCheck()">
											</div>
										</div>
									</li>

									<li>
										<div class="form_label ">
											<label for="email" class="mem_txt">이메일</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<input type="text" tabindex="10" ng-change="emailValidCheck()" ng-model="form_data.email" name="email" id="email" class="form-control" placeholder="">
											<p class="error_text tb2">{{email_msg}}</p>
										</div>
									</li>

									<li>
										<div class="form_label ">
											<label for="zipno" class="mem_txt">주소</label>
											<i>*</i>
										</div>
										<div class="form_body">
											<div class="input-group">
												<input type="text" tabindex="11" ng-click="addressSearch()" ng-model="form_data.zipno" name="zipno" id="zipno" class="form-control" placeholder="" readonly>
												<button class="btn btn_light_gray_line" type="button" ng-click="addressSearch()"><span>주소검색</span></button>
											</div>

											<div>
												<p ng-show="form_data.addr != '' && form_data.addr != undefined" class="search-add" class="add_txt tb1" name="addr" id="addr">{{form_data.addr}}</p>
												<!-- 0718 주소미입력시 사이여백을 위해 mt10추가 -->
												<input type="text" tabindex="12" ng-model="form_data.addr_dtl" name="addr_dtl" id="addr_dtl" ng-change="addrDtlValidCheck()" class="form-control mt10" placeholder="">
											</div>
											<p class="error_text tb2">{{addr_msg}}</p>
										</div>
									</li>
									<li>
										<div class="form_label mem_txt">
											<label for="emp_no" class="mem_txt">담당직원</label>
										</div>
										<div class="form_body">
											<div class="input-group">
												<input type="text" tabindex="13" ng-click="employeeSearch()" name="emp_no" id="emp_no" class="form-control" placeholder="" readonly>
												<button class="btn btn_light_gray_line" ng-click="employeeSearch()" type="button"><span>직원 검색</span></button>
											</div>
											<!-- [0516]UI변경 -->
											<div class="label_list_box" ng-show="emp_name_txt != '' && emp_name_txt != undefined">
												<!-- <p class="label">
													<span class="tb1"><i>소속</i>김상균 </span>
													<a href="#none" class="btn_del"><span class="icon-del"></span></a>
												</p> -->
												<ul class="staff-list js-staff_del-list">
													<li><span>{{dept_name_txt}} {{emp_name_txt}}</span><button><i class="icon-filter_del" ng-click="employeeDelete();"></i></button></li>
												</ul>
											</div>
											<!-- // [0516]UI변경 -->
										</div>
									</li>
								</ul>

								<div class="policy_accordion" ng-show="isPerson() || isSocial()">

									<div class="check_all-wrap js_all-1">
										<div class="all_check">
											<span class="trp checkbox-box">
												<input id="checkbox_all_per" tabindex="14" class="js_all" ng-click="checkAllPerson()" ng-checked="allCheckPerson" type="checkbox" name="">
												<i></i>
												<label for="checkbox_all_per">모두 동의합니다.</label>
											</span>
										</div>

										<ul class="accordion-list policy js-accordion_policy">
											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all1_per" tabindex="15" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personOnlineAgree">
															<i></i>
															<label for="checkbox_all1_per"><span class="required">[필수]</span> 온라인 경매 약관 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														<!--[2022-0503변경]-->
														온라인 경매 약관 동의 내용
													</div>
												</div>
											</li>
											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all2_per" tabindex="16" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personOfflineAgree">
															<i></i>
															<label for="checkbox_all2_per"><span class="required">[필수]</span> 오프라인 경매 약관 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														<!--[2022-0503변경]-->
														오프라인 경매 약관 동의 내용
													</div>
												</div>
											</li>
											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all3_per" tabindex="17" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personAgree1">
															<i></i>
															<label for="checkbox_all3_per"><span class="required">[필수]</span> 개인정보 수집 및 이용 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														<!--[2022-0503변경]-->
														개인정보 수집 및 이용 동의 내용
													</div>
												</div>
											</li>

											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all4_per" tabindex="18" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()" ng-model="form_data.maketingAgree1">
															<i></i>
															<label for="checkbox_all4_per"><span>[선택]</span> 홍보 및 마케팅을 위한 정보 이용 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn" id="marketingPerson">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														수집목적 : 회사의 경매 정보 제공, 경매 일정 안내, 전시 및 신규 사업 소개 등 홍보 및 마케팅 목적<br />
														수집항목 : 휴대전화번호, 이메일 주소<br /><br />

														*귀하께서는 회사의 홍보 및 마케팅 목적 이용에 대한 동의를 거부할 수 있으나,<br />
														이 경우 경매 정보 및 경매 일정 안내 서비스 등이 제한 될 수 있습니다.
													</div>

													<dl class="receive_info">
														<dt class="mem_txt">정보수신방법</dt>
														<dd>
															<span class="trp checkbox-box">
																<input id="checkbox_1_per" tabindex="19" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_email">
																<i></i>
																<label for="checkbox_1_per">이메일</label>
															</span>

															<span class="trp checkbox-box">
																<input id="checkbox_2_per" tabindex="20" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_sms">
																<i></i>
																<label for="checkbox_2_per">SMS</label>
															</span>

															<span class="trp checkbox-box">
																<input id="checkbox_3_per" tabindex="21" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_phone">
																<i></i>
																<label for="checkbox_3_per">전화</label>
															</span>
														</dd>
													</dl>
												</div>
											</li>
										</ul>

									</div>
								</div>

								<!-- 사업자 동의 -->
								<div class="policy_accordion" ng-hide="isPerson() || isSocial()">

									<div class="check_all-wrap js_all-1">
										<div class="all_check">
											<span class="trp checkbox-box">
												<input id="checkbox_all_comp" tabindex="22"  class="js_all" ng-click="checkAllCompany()" ng-checked="allCheckComp" type="checkbox" name="">
												<i></i>
												<label for="checkbox_all_comp">모두 동의합니다.</label>
											</span>
										</div>

										<ul class="accordion-list policy js-accordion_policy">
											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all1_comp" tabindex="23" class="js_item" type="checkbox" name="chk_com" ng-change="onChangeCheckbox_C()" ng-model="form_data.compOnlineAgree">
															<i></i>
															<label for="checkbox_all1_comp"><span class="required">[필수]</span> 개인/법인 사업자 온라인 경매 약관 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														<!--[2022-0503변경]-->
														온라인 경매 약관 동의 내용
													</div>
												</div>
											</li>
											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all2_comp" tabindex="24" class="js_item" type="checkbox" name="chk_com" ng-change="onChangeCheckbox_C()" ng-model="form_data.compOfflineAgree">
															<i></i>
															<label for="checkbox_all2_comp"><span class="required">[필수]</span> 개인/법인 사업자 오프라인 경매 약관 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														<!--[2022-0503변경]-->
														오프라인 경매 약관 동의 내용
													</div>
												</div>
											</li>
											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all3_comp" tabindex="25" class="js_item" type="checkbox" name="chk_com" ng-change="onChangeCheckbox_C()" ng-model="form_data.compAgree1">
															<i></i>
															<label for="checkbox_all3_comp"><span class="required">[필수]</span> 개인/법인 사업자 정보 수집 및 이용 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														<!--[2022-0503변경]-->
														개인정보 수집 및 이용 동의 내용
													</div>
												</div>
											</li>

											<li class="trp_acitem">
												<div class="header-area">
													<div class="accordion_name">
														<div class="trp checkbox-box">
															<input id="checkbox_all4_comp" tabindex="26" class="js_item" type="checkbox" name="chk_com" ng-change="onChangeCheckbox_C()" ng-model="form_data.compMaketingAgree1">
															<i></i>
															<label for="checkbox_all4_comp"><span>[선택]</span> 홍보 및 마케팅을 위한 정보 이용 동의</label>
														</div>
													</div>
													<a href="#" class="acc_btn" id="marketingCompany">
														<i class="icon-accordion_arrow_down"></i>
													</a>
												</div>
												<div class="con-area">
													<div class="policy_cont tb1">
														수집목적 : 회사의 경매 정보 제공, 경매 일정 안내, 전시 및 신규 사업 소개 등 홍보 및 마케팅 목적<br />
														수집항목 : 휴대전화번호, 이메일 주소<br /><br />

														*귀하께서는 회사의 홍보 및 마케팅 목적 이용에 대한 동의를 거부할 수 있으나,<br />
														이 경우 경매 정보 및 경매 일정 안내 서비스 등이 제한 될 수 있습니다.
													</div>

													<dl class="receive_info">
														<dt class="mem_txt">정보수신방법</dt>
														<dd>
															<span class="trp checkbox-box">
																<input id="checkbox_1_comp" tabindex="27" class="" type="checkbox" name="pushway_comp" ng-change="clickPushWay()" ng-model="form_data.push_way_email">
																<i></i>
																<label for="checkbox_1_comp">이메일</label>
															</span>

															<span class="trp checkbox-box">
																<input id="checkbox_2_comp" tabindex="28" class="" type="checkbox" name="pushway_comp" ng-change="clickPushWay()" ng-model="form_data.push_way_sms">
																<i></i>
																<label for="checkbox_2_comp">SMS</label>
															</span>

															<span class="trp checkbox-box">
																<input id="checkbox_3_comp" tabindex="29" class="" type="checkbox" name="pushway_comp" ng-change="clickPushWay()" ng-model="form_data.push_way_phone">
																<i></i>
																<label for="checkbox_3_comp">전화</label>
															</span>
														</dd>
													</dl>
												</div>
											</li>
										</ul>

									</div>
								</div>

							</div>
							</form>
							<div class="panel-footer">
								<article class="button-area">
									<div class="btn_set-float tac" ng-click="join()">
										<a tabindex="30" class="btn btn_point btn_lg disabled" href="#" role="button" id="joinButton" disabled><span>가입하기</span></a>
									</div>
								</article>
							</div>

						</div>

					</div>
				</section>
			</div>


		</div>
		<jsp:include page="../../include/ko/footer.jsp" flush="false"/>


	</div>
</div>

<!-- 주소검색 address_search1 -->
<div id="address_search1-wrap" class="trp popupfixed-wrap default-popup "> 
	<div class="popup-dim"></div>
	<div class="popup-align mode-ms mode-mb_full">
		<div class="popup-vertical">
			<div class="popup-layer">

				<div class="pop-panel">
					<div class="pop-header">
						<a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
						<div class="title-box">
							<span class="txt_title type-big">주소검색</span>
						</div>
					</div>
					<div class="pop-body scroll-type">
						<section class="section" style="display: block;">

							<div class="search-group sm">
								<input type="text" ng-model="find_word" id="addr_word" class="form-control" ng-keypress="$event.keyCode === 13 && findAddrNewForm();" placeholder="도로명주소 건물번호 검색">
								<button class="btn btn_black" type="button" ng-click="findAddrNewForm()"><span>검색</span></button>
							</div>

							<article class="articles-box">
								<div class="table-panel">
									<div class="table-header">
										<div class="dataTables_length result_txt">
											검색 결과
										</div>
									</div>
									<!--[0613]테이블구조변경-->
									<div class="table-body">
										<div class="table_scroll thead_item" id="addrScroll">
											<table class="table_base list-table add_list">
												<thead>
													<tr>
														<th>우편번호</th>
														<th>주소</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>
									<div class="table-body">
										<div class="table_scroll scroll-type tbody_item add_item">
											<table class="table_base list-table add_list">
												<tbody>
													<tr ng-repeat="addr in addressList" ng-click="setAddr(addr);">
														<td>{{addr.postcd}}</td>
														<td class="tal">{{addr.address}}</td>
													</tr>
													<tr ng-if="addressList == undefined">
														<td colspan="2">
															<div class="data-empty_mem tb1">
																검색결과가 없습니다.
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!--//[0613]테이블구조변경-->
								</div>
							</article>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 직원검색 staff_search -->
<div id="staff_search1-wrap" class="trp popupfixed-wrap default-popup ">
	<div class="popup-dim"></div>
	<div class="popup-align mode-ms mode-mb_full">
		<div class="popup-vertical">
			<div class="popup-layer">
				<div class="pop-panel">
					<div class="pop-header">
						<a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
						<div class="title-box">
							<span class="txt_title type-big">직원검색</span>
						</div>
					</div>
					<div class="pop-body scroll-type">
						<section class="section" style="display: block;">
							<!--[0516]-->
							<div class="search-group">
								<!--[2022-0503변경]-->
								<input type="text" ng-model="emp_name" id="emp_name" class="form-control" ng-keypress="$event.keyCode === 13 && findEmpNewForm()" placeholder="이름 입력">
								<button class="btn btn_black" type="button" ng-click="findEmpNewForm()"><span>검색</span></button>
							</div>
							<article class="articles-box">
								<div class="table-panel">
									<div class="table-header">
										<div class="dataTables_length tb1">
											<span>전체<em>{{empLength}}</em>건</span>
										</div>
									</div>
									<div class="table-body">
										<div class="table_scroll thead_item">
											<table class="table_base list-table txt_tdbig">
												<thead>
													<tr>
														<th>소속명</th>
														<th>이름</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>
									<div class="table-body">
										<div class="table_scroll scroll-type tbody_item">
											<table class="table_base list-table txt_tdbig">
												<tbody>
													<tr ng-repeat="emp in employeeList" ng-click="setEmp(emp);">
														<td>{{emp.DEPT_NAME}}</td>
														<td>{{emp.EMP_NAME}}</td>
													</tr>
													<tr ng-if="empLength == 0">
														<td colspan="2">
															<div class="data-empty_mem tb1">
																검색결과가 없습니다.
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</article>
							<!--//[0516]-->
						</section>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- validation alert -->
<div id="popup_idsearch3-wrap" class="trp popupfixed-wrap login-popup">
	<div class="popup-dim"></div>
	<div class="popup-align mode-ms mode-mb_center">
		<div class="popup-vertical">
			<div class="popup-layer">
				<div class="pop-panel">
					<div class="pop-header">
						<a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
						<div class="ico_box">
							<img class="only_ib-pc" src="/images/mobile/login/search_ico_01_pc.png">
							<img class="only_ib-mb" src="/images/mobile/login/search_ico_01.png">
						</div>
						<div class="title-box_tac title_md">
							<span class="title_tac tt4" id="alertMsg">필수 항목명을 입력해 주세요.</span>
						</div>
					</div>
					<div class="pop-body">
						<!--[0523]-->
						<article class="confirm_btn confirm_btn_md">
							<div class="btn_set-float tac">
								<a class="btn btn_point" href="#" role="button"><span>확인</span></a>
							</div>
						</article>
						<!--//[0523]-->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
<script>
	app.value('locale', 'ko');
	var loginId = '${socialLoginId }';
	var name = '${name }';
	var email = '${email }';
	var socialLoginId = '${socialLoginId }';
	var socialEmail = '${socialEmail }';
</script>
<%--<script src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>--%>
<%--<link rel="stylesheet" href="/css/plugin/csslibrary.css" type="text/css"> --%>
<script type="text/javascript" src="/js/customer/join.js"></script>
</html>