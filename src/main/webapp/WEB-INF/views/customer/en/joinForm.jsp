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
	<jsp:include page="../../include/en/header.jsp" flush="false">
	    <jsp:param name="main" value="false"/>
	</jsp:include>
	<script>
		app.value('locale', 'en');
	</script>
	
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

                        <div class="panel-body">

                            <ul class="form_list">
                                <li>
                                    <div class="form_label">
                                        <label for="name-1" class="mem_txt">Account ID</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <input type="text" id="name-1" class="form-control" placeholder="">
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="form_label">
                                        <label for="label_placeholder" class="mem_txt">Password</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <div class="pw_mask_box">
                                            <input type="password" class="" id="label_placeholder" placeholder="비밀번호 입력">
                                            <span class="input-side">
                                                <button type="button" class="btn_pw_mask js-pw_mask">비밀번호 마스킹 해제하기</button>
                                            </span>
                                        </div>
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="form_label">
                                        <label for="name-2" class="mem_txt">Name</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <input type="text" id="name-2" class="form-control" placeholder="">
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="form_label ">
                                        <label for="name-5" class="mem_txt">E-mail</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <div class="input-group">
                                            <input type="text" id="name-4" class="form-control" placeholder="">
                                            <button class="btn btn_light_gray_line" type="button"><span>Check Availability</span></button>
                                        </div>
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
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
											<select />
                                        </div>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="form_label">
                                        <label for="name-3" class="mem_txt">Mobile Number</label>
                                    </div>
                                    <div class="form_body">
                                        <div class="form_body">
                                        	<input type="text" id="name-8" class="form-control" value="" placeholder="">
                                        </div>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="form_label ">
                                        <label for="name-6" class="mem_txt">Address</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <div class="input-group">
                                        	Postal Code
                                            <input type="text" id="name-4" class="form-control" placeholder="">
                                            Address Line
                                            <input type="text" id="name-4" class="form-control" placeholder="">
                                            Province / state. City
                                            <input type="text" id="name-4" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="form_label mem_txt">
                                        <label for="name-7" class="mem_txt">Fill the bidding registration</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                    	<input type="radio">Yes <input type="radio">No
                                    	* To be able to participate in online auctions, you must check “Yes” under “Bidding Registration” when applying for membership.
										* The bidding button will become available for use one or two business days after selecting “Yes.”
										* If the bidding button does not become available, please send an email inquiry to info@seoulauction.com.
										* If you register for membership near the closing time of an auction and make an email or phone inquiry related to bidding, Seoul Auction will provide all necessary assistance.
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="form_label">
                                        <label for="name-2" class="mem_txt">ID card attached</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                    	When attaching an ID, be sure to mask personal information other than your name/date of birth/nationality.
                                        <div class="trp file-box">
                                            <label for="fileName" class="screen-reader-text">Select File</label>
                                            <input type="text" id="fileName" class="trp-Filetext">
                                            <input type="button" class="btn btn_light_gray_line" value="파일첨부">
                                            <input type="file" class="trp-Filehidden" onchange="javascript: document.getElementById('fileName').value = this.value" title="Insert Attachment">
                                        </div>
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                                        <div class="file-box-list">
                                            <p class="label">
                                                <i class="icon_down"></i>
                                                <span class="tb1">Attached_filename.jpg </span>
                                                <a href="#none" class="btn_del"><span class="icon-del"></span></a>
                                            </p>
                                        </div>

                                        <ul class="dot_list tb2 mt5">
                                            <li>Files of 5 MB or less can be attached </li>
                                            <li>Upload only jpg, jpeg, png, gif</li>
                                        </ul>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="form_label">
                                        <label for="name-2" class="mem_txt">Supporting Documents</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
										Please attach a copy of your credit card or bankbook
                                        <div class="trp file-box">
                                            <label for="fileName" class="screen-reader-text">Select File</label>
                                            <input type="text" id="fileName" class="trp-Filetext">
                                            <input type="button" class="btn btn_light_gray_line" value="파일첨부">
                                            <input type="file" class="trp-Filehidden" onchange="javascript: document.getElementById('fileName').value = this.value" title="Insert Attachment">
                                        </div>
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                                        <div class="file-box-list">
                                            <p class="label">
                                                <i class="icon_down"></i>
                                                <span class="tb1">Attached_filename.jpg </span>
                                                <a href="#none" class="btn_del"><span class="icon-del"></span></a>
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
                                            <input id="checkbox_all" class="js_all" type="checkbox" name="">
                                            <i></i>
                                            <label for="checkbox_all">All Agree</label>
                                        </span>
                                    </div>

                                    <ul class="accordion-list policy js-accordion_policy">
                                        <li class="trp_acitem">
                                            <div class="header-area">
                                                <div class="accordion_name">
                                                    <div class="trp checkbox-box">
                                                        <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all1"><span class="required">[Required]</span> 온라인 경매 약관 동의</label>
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
                                                        <input id="checkbox_all2" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all2"><span class="required">[Required]</span> 오프라인 경매 약관 동의</label>
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
                                                        <input id="checkbox_all3" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all3"><span class="required">[Required]</span> 개인정보 수집 및 이용 동의</label>
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
                                                        <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all4"><span>[Optional]</span> Consent to use of information for publicity and marketing</label>
                                                    </div>
                                                </div>
                                                <a href="#" class="acc_btn">
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
                                                            <input id="checkbox_1" class="" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_1">Email</label>
                                                        </span>

                                                        <span class="trp checkbox-box">
                                                            <input id="checkbox_2" class="" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_2">SMS</label>
                                                        </span>

                                                        <span class="trp checkbox-box">
                                                            <input id="checkbox_3" class="" type="checkbox" name="">
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

                        <div class="panel-footer">
                            <article class="button-area">
                                <div class="btn_set-float tac">
                                    <a class="btn btn_point btn_lg" href="#" role="button"><span>가입하기</span></a>
                                </div>
                            </article>
                        </div>

                    </div>

                </div>
            </section>

        </div>
    </div>
    <jsp:include page="../../include/en/footer.jsp" flush="false"/>
	</body>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	<script src="https://apis.google.com/js/api:client.js"></script>
	<script type="text/javascript" src="/js/customer/join.js"></script>
</html>