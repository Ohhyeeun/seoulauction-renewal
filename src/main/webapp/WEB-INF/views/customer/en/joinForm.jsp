<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <title>Seoul Auction</title>
	</head>
	<body>
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/header.jsp" flush="false" />
			<div id="container footer-bottom footer-bottom30" style="margin-top:60px" ng-controller="joinFormCtl" data-ng-init="init()">
				<div id="contents" class="contents">
		            <section class="basis-section last-section back_gray">
		                <div class="section-inner">
		                    <div class="content-panel type_panel-member">
		                        <div class="panel-header">
		                            <div class="title txt_input">
		                                <span class="tt2">Sign up</span>
		                            </div>
		                            <div class="required">
		                                <span class="tb2"><i>*</i> Required</span>
		                            </div>
		                        </div>
		                        
								<form id="joinForm" enctype='multipart/form-data'>
		                        <div class="panel-body">
		
		                            <ul class="form_list">
		                                <li>
		                                    <div class="form_label">
		                                        <label for="login_id" class="mem_txt">Account ID</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                    	<input type="hidden" id="social_login_id" name="social_login_id" ng-model="form_data.social_login_id" />
												<input type="hidden" id="social_email" name="social_email" ng-model="form_data.social_email" />
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
		                                        <label for="passwd" class="mem_txt">Password</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="pw_mask_box">
		                                            <input type="password" tabindex="2" ng-change="passwdValidChange()" class="" id="passwd" name="passwd" ng-model="form_data.passwd" placeholder="Enter password">
		                                            <span class="input-side">
		                                                <button type="button" ng-click="togglePasswd()" class="btn_pw_mask js-pw_mask">비밀번호 마스킹 해제하기</button>
		                                            </span>
		                                        </div>
		                                        <p class="error_text tb2">{{passwd_msg}}</p>
		                                    </div>
		                                </li>
		                                <li>
		                                    <div class="form_label">
		                                        <label for="cust_name" class="mem_txt">Name</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <input type="text" tabindex="3" ng-change="nameValidCheck()" ng-model="form_data.cust_name" name="cust_name" id="cust_name" class="form-control" placeholder="">
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label ">
		                                        <label for="email" class="mem_txt">E-mail</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="input-group">
		                                            <input type="text" tabindex="4" ng-change="emailValidCheck()" ng-model="form_data.email" name="email" id="email" class="form-control" placeholder="">
		                                            <button class="btn btn_light_gray_line" type="button" ng-click="emailDuplCheck()"><span>Check Availability</span></button>
		                                        </div>
		                                        <p class="error_text tb2">{{email_msg}}</p>
		                                        ※ After application. In order to enjoy all of the benefits of your online account, please complete a one-time validation of your email address.
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label">
		                                        <label for="name-3" class="mem_txt">Country</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="form_body">
		                                        	<select id="select_nation" ng-model="select_nation" tabindex="5" name="select_nation" ng-required="langType == 'en'" ng-change="changeNation()">
														<option value="">Select your country</option>
														<option ng-repeat="nation in nationList" value="{{nation.CD_ID}}|{{nation.CD_VAL3}}">{{nation.CD_NM}} +{{nation.CD_VAL3}}</option>
													</select>
		                                        </div>
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label">
		                                        <label for="hp" class="mem_txt">Mobile Number</label>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="form_body">
		                                        	<div ng-show="nationMobile != '' && nationMobile != undefined">+{{nationMobile}}</div>
			                                    	<input type="text" tabindex="6" onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this);" ng-model="form_data.hp" name="hp" id="hp" class="form-control" placeholder="">
		                                        </div>
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label ">
		                                        <label for="postal_code" class="mem_txt">Address</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="input-group">
		                                        	Postal Code
		                                            <input ng-blur="addrValidBlur()" type="text" tabindex="7" ng-model="form_data.zipno" name="zipno" id="zipno" class="form-control" placeholder="">
		                                            Address Line
		                                            <input ng-blur="addrValidBlur()" type="text" tabindex="8" ng-model="form_data.addr" name="addr" id="addr" class="form-control" placeholder="">
		                                            Province / state. City
		                                            <input ng-blur="addrValidBlur()" type="text" tabindex="9" ng-model="form_data.addr_dtl" name="addr_dtl" id="addr_dtl" class="form-control" placeholder="">
		                                        </div>
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label mem_txt">
		                                        <label for="name-7" class="mem_txt">Fill the bidding registration</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                    	<input type="radio" tabindex="10" value="Y" name="bidRadio" id="bid" ng-click="bidValidCheck('Y')">Yes 
		                                    	<input type="radio" tabindex="11" value="N" name="bidRadio" ng-click="bidValidCheck('N')">No
		                                    	* To be able to participate in online auctions, you must check “Yes” under “Bidding Registration” when applying for membership.
												* The bidding button will become available for use one or two business days after selecting “Yes.”
												* If the bidding button does not become available, please send an email inquiry to info@seoulauction.com.
												* If you register for membership near the closing time of an auction and make an email or phone inquiry related to bidding, Seoul Auction will provide all necessary assistance.
		                                    </div>
		                                </li>
		                                
		                                <li ng-show="form_data.fore_bid_req_yn == 'Y'">
		                                    <div class="form_label">
		                                        <label for="name-2" class="mem_txt">ID card attached</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                    	When attaching an ID, be sure to mask personal information other than your name/date of birth/nationality.
		                                        <div class="trp file-box">
		                                            <label for="fileName" class="screen-reader-text">Select File</label>
		                                            <input type="text" id="fileName" class="trp-Filetext">
		                                            <input type="button" class="btn btn_light_gray_line" value="Select File">
<!-- 		                                            <input type="file" class="trp-Filehidden" name="fore_id_file" id="fore_id_file" onchange="javascript: document.getElementById('fileName').value = this.value" title="Insert Attachment"> -->
													<input type="file" tabindex="13" class="trp-Filehidden" ng-model="form_data.fore_id_file" name="fore_id_file" id="fore_id_file" onchange="angular.element(this).scope().fileValidCheck('fore_id_file')" title="Insert Attachment">
		                                        </div>
		                                        <p class="error_text tb2">{{fore_id_msg}}</p>
		                                        <div class="file-box-list" ng-hide="fore_id_filename == '' || fore_id_filename == undefined">
		                                            <p class="label">
		                                                <i class="icon_down"></i>
		                                                <span class="tb1">{{fore_id_filename}}</span>
		                                                <a href="#none" class="btn_del" ng-click="fileDelete('fore_id_file')"><span class="icon-del"></span></a>
		                                            </p>
		                                        </div>
		
		                                        <ul class="dot_list tb2 mt5">
		                                            <li>Files of 5 MB or less can be attached </li>
		                                            <li>Upload only jpg, jpeg, png, gif</li>
		                                        </ul>
		                                    </div>
		                                </li>
		                                
		                                <li ng-show="form_data.fore_bid_req_yn == 'Y'">
		                                    <div class="form_label">
		                                        <label for="name-2" class="mem_txt">Supporting Documents</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
												Please attach a copy of your credit card or bankbook
		                                        <div class="trp file-box">
		                                            <label for="fileName" class="screen-reader-text">Select File</label>
		                                            <input type="text" id="fileName" class="trp-Filetext">
		                                            <input type="button" class="btn btn_light_gray_line" value="Select File">
<!-- 		                                            <input type="file" class="trp-Filehidden" name="fore_doc_file" id="fore_doc_file" onchange="javascript: document.getElementById('fileName').value = this.value" title="Insert Attachment"> -->
													<input type="file" tabindex="14" class="trp-Filehidden" ng-model="form_data.fore_doc_file" name="fore_doc_file" id="fore_doc_file" onchange="angular.element(this).scope().fileValidCheck('fore_doc_file')" title="Insert Attachment">
		                                        </div>
		                                        <p class="error_text tb2">{{fore_doc_msg}}</p>
		                                        <div class="file-box-list" ng-hide="fore_doc_filename == '' || fore_doc_filename == undefined">
		                                            <p class="label">
		                                                <i class="icon_down"></i>
		                                                <span class="tb1">{{fore_doc_filename}}</span>
		                                                <a href="#none" class="btn_del" ng-click="fileDelete('fore_doc_file')"><span class="icon-del"></span></a>
		                                            </p>
		                                        </div>
		
		                                        <ul class="dot_list tb2 mt5">
		                                            <li>Files of 5 MB or less can be attached </li>
		                                            <li>Upload only jpg, jpeg, png, gif</li>
		                                        </ul>
		                                    </div>
		                                </li>
		                            </ul>
		
									
		                            <div class="policy_accordion">
		
		                                <div class="check_all-wrap js_all-1">
		                                    <div class="all_check">
		                                        <span class="trp checkbox-box">
		                                            <input id="checkbox_all" tabindex="15" class="js_all" ng-click="checkAllPerson()" ng-checked="allCheckPerson" type="checkbox" name="">
		                                            <i></i>
		                                            <label for="checkbox_all">All Agree</label>
		                                        </span>
		                                    </div>
		
		                                    <ul class="accordion-list policy js-accordion_policy">
		                                        <li class="trp_acitem">
		                                            <div class="header-area">
		                                                <div class="accordion_name">
		                                                    <div class="trp checkbox-box">
		                                                        <input id="checkbox_all1" tabindex="16" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personOnlineAgree">
		                                                        <i></i>
		                                                        <label for="checkbox_all1"><span class="required">[Required]</span> Agree to online auction terms and conditions</label>
		                                                    </div>
		                                                </div>
		                                                <a href="#" class="acc_btn">
		                                                    <i class="icon-accordion_arrow_down"></i>
		                                                </a>
		                                            </div>
		                                            <div class="con-area">
		                                                <div class="policy_cont tb1">
		                                                    <!--[2022-0503변경]-->
		                                                    Agree to online auction terms and conditions
		                                                </div>
		                                            </div>
		                                        </li>
		                                        <li class="trp_acitem">
		                                            <div class="header-area">
		                                                <div class="accordion_name">
		                                                    <div class="trp checkbox-box">
		                                                        <input id="checkbox_all2" tabindex="17" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personOfflineAgree">
		                                                        <i></i>
		                                                        <label for="checkbox_all2"><span class="required">[Required]</span> Agree to the offline auction terms and conditions</label>
		                                                    </div>
		                                                </div>
		                                                <a href="#" class="acc_btn">
		                                                    <i class="icon-accordion_arrow_down"></i>
		                                                </a>
		                                            </div>
		                                            <div class="con-area">
		                                                <div class="policy_cont tb1">
		                                                    <!--[2022-0503변경]-->
		                                                    Agree to the offline auction terms and conditions
		                                                </div>
		                                            </div>
		                                        </li>
		                                        <li class="trp_acitem">
		                                            <div class="header-area">
		                                                <div class="accordion_name">
		                                                    <div class="trp checkbox-box">
		                                                        <input id="checkbox_all3" tabindex="18" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personAgree1">
		                                                        <i></i>
		                                                        <label for="checkbox_all3"><span class="required">[Required]</span> Consent to collection and use of personal information</label>
		                                                    </div>
		                                                </div>
		                                                <a href="#" class="acc_btn">
		                                                    <i class="icon-accordion_arrow_down"></i>
		                                                </a>
		                                            </div>
		                                            <div class="con-area">
		                                                <div class="policy_cont tb1">
		                                                    <!--[2022-0503변경]-->
		                                                    Consent to collection and use of personal information
		                                                </div>
		                                            </div>
		                                        </li>
		
		                                        <li class="trp_acitem">
		                                            <div class="header-area">
		                                                <div class="accordion_name">
		                                                    <div class="trp checkbox-box">
		                                                        <input id="checkbox_all4" tabindex="19" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()" ng-model="form_data.maketingAgree1">
		                                                        <i></i>
		                                                        <label for="checkbox_all4"><span>[Optional]</span> Consent to use of information for publicity and marketing</label>
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
		                                                            <input id="checkbox_1" tabindex="20" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_email">
		                                                            <i></i>
		                                                            <label for="checkbox_1">Email</label>
		                                                        </span>
		
		                                                        <span class="trp checkbox-box">
		                                                            <input id="checkbox_2" tabindex="21" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_sms">
		                                                            <i></i>
		                                                            <label for="checkbox_2">SMS</label>
		                                                        </span>
		
		                                                        <span class="trp checkbox-box">
		                                                            <input id="checkbox_3" tabindex="22" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_phone">
		                                                            <i></i>
		                                                            <label for="checkbox_3">Phone</label>
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
		                                    <a class="btn btn_point btn_lg disabled" tabindex="23" href="#" role="button" id="joinButton"><span>SAVE</span></a>
		                                </div>
		                            </article>
		                        </div>
		
		                    </div>
		
		                </div>
		            </section>
		
		        </div>
		    </div>
    		<jsp:include page="../../include/en/footer.jsp" flush="false"/>
    	</div>
    </div>
	</body>
	<script>
		app.value('locale', 'en');
		var loginId = '${socialLoginId }';
		var name = '${name }';
		var mobile = '${mobile }';
		var email = '${email }';
		var socialLoginId = '${socialLoginId }';
		var socialEmail = '${socialEmail }';
	</script>
	<script src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
	<script src="/js/pages_common_ko.js" type="text/javascript"></script>
	<link rel="stylesheet" href="/css/plugin/csslibrary.css" type="text/css">
	<link rel="stylesheet" href="/css/pages_common_ko.css" type="text/css">
	<script type="text/javascript" src="/js/customer/join.js"></script>
</html>