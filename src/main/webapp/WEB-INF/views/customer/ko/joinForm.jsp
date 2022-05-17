<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <title>Seoul Auction</title>
	</head>
	<body>
	<jsp:include page="../../include/ko/header.jsp" flush="false">
	    <jsp:param name="main" value="false"/>
	</jsp:include>
	
	<div id="container footer-bottom footer-bottom30" style="margin-top:60px" ng-controller="joinFormCtl" data-ng-init="init()">
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

                        <div class="panel-body">

                            <ul class="form_list">
                                <li>
                                    <div class="form_label">
                                        <label for="login_id" class="mem_txt">아이디</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
										<input type="hidden" id="social_login_id" name="social_login_id" ng-model="form_data.social_login_id" />
										<input type="hidden" id="social_email" name="social_email" ng-model="form_data.social_email" />
                                        <input ng-hide="isSocial()" type="text" id="login_id" name="login_id" ng-model="form_data.login_id" class="form-control" placeholder="">
                                        <div ng-show="isSocial()" type="text">
                                        	${socialLoginId }
                                        	{{getSocialName()}}
                                        </div>
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                                    </div>
                                </li>
                                <li ng-hide="isSocial()">
                                    <div class="form_label">
                                        <label for="passwd" class="mem_txt">비밀번호</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <div class="pw_mask_box">
                                            <input type="password" class="" id="passwd" name="passwd" ng-model="form_data.passwd"  placeholder="비밀번호 입력">
                                            <span class="input-side">
                                                <button type="button" class="btn_pw_mask js-pw_mask">비밀번호 마스킹 해제하기</button>
                                            </span>
                                        </div>
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="form_label">
                                        <label ng-show="isPerson() || isSocial()" for="cust_name" class="cust_name">이름</label>
                                        <label ng-show="!isPerson() && !isSocial()" for="cust_name" class="cust_name">업체명</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <input type="text" ng-model="form_data.cust_name" name="cust_name" id="cust_name" class="form-control" placeholder="">
                                    </div>
                                </li>
                                
                                <li ng-show="!isPerson() && !isSocial()">
                                    <div class="form_label">
                                        <label for="name-2" class="comp_no">사업자등록번호</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <input type="text" ng-model="form_data.comp_no" name="comp_no" id="comp_no" class="form-control" placeholder="">
                                        <button class="btn btn_light_gray_line" type="button"><span>중복확인</span></button>
                                    </div>
                                </li>
                                <li ng-show="!isPerson() && !isSocial()">
                                    <div class="form_label">
                                        <label for="name-2" class="comp_owner">대표자명</label>
                                    </div>
                                    <div class="form_body">
                                        <input type="text" ng-model="form_data.comp_owner" name="comp_owner" id="comp_owner" class="form-control" placeholder="">
                                    </div>
                                </li>
                                <li ng-show="!isPerson() && !isSocial()">
                                    <div class="form_label">
                                        <label for="name-2" class="comp_man_name">업무담당자</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <input type="text" ng-model="form_data.comp_man_name" name="comp_man_name" id="comp_man_name" class="form-control" placeholder="">
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
                                            <input type="text" ng-model="form_data.comp_file" name="comp_file" id="comp_file" class="trp-Filetext">
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
                                            <input type="text" ng-model="form_data.hp" name="hp" id="hp" class="form-control" placeholder="">
                                            <button class="btn btn_light_gray_line" type="button"><span>인증번호 요청</span></button>
                                        </div>

                                        <div class="re-check">
                                            <div class="form_body">
                                                <div class="input-group">
                                                    <input type="text" id="name-4" class="form-control" placeholder="">
                                                    <button class="btn btn_light_gray_line" type="button"><span>인증번호 확인</span></button>
                                                </div>
                                                <p class="error_text tb2">안내 메시지 출력 영역</p>
                                            </div>
                                        </div>

                                    </div>
                                </li>
                                
                                <li ng-show="!isPerson() && !isSocial()">
                                    <div class="form_label">
                                        <label for="tel" class="mem_txt">전화번호</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <div class="form_body">
                                        	<input type="text" ng-model="form_data.tel" name="tel" id="tel" class="form-control" value="" placeholder="">
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="form_label ">
                                        <label for="email" class="mem_txt">이메일</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <input type="text" ng-model="form_data.email" name="email" id="email" class="form-control" placeholder="">
                                        <p class="error_text tb2">안내 메시지 출력 영역</p>
                                    </div>
                                </li>

                                <li>
                                    <div class="form_label ">
                                        <label for="deli_zipno" class="mem_txt">주소</label>
                                        <i>*</i>
                                    </div>
                                    <div class="form_body">
                                        <div class="input-group">
                                            <input type="text" ng-model="form_data.deli_zipno" name="deli_zipno" id="deli_zipno" class="form-control" placeholder="">
                                            <button class="btn btn_light_gray_line" type="button"><span>주소검색</span></button>
                                        </div>

                                        <div class="search-add">
                                            <p class="add_txt  tb1" ng-model="form_data.deli_addr" name="deli_addr" id="deli_addr"></p>
                                            <input type="text" ng-model="form_data.deli_addr_dtl" name="deli_addr_dtl" id="deli_addr_dtl" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form_label mem_txt">
                                        <label for="emp_no" class="mem_txt">담당직원</label>
                                    </div>
                                    <div class="form_body">
                                        <div class="input-group">
                                            <input type="text" ng-model="form_data.emp_no" name="emp_no" id="emp_no" class="form-control" placeholder="">
                                            <button class="btn btn_light_gray_line" type="button"><span>직원 검색</span></button>
                                        </div>
                                        <div class="label_list_box">
                                            <p class="label ">
<!--                                                 <span class="tb1"><i>소속</i>김상균 </span> -->
<!--                                                 <a href="#none" class="btn_del"><span class="icon-del"></span></a> -->
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <div class="policy_accordion">

                                <div class="check_all-wrap js_all-1">
                                    <div class="all_check">
                                        <span class="trp checkbox-box">
                                            <input id="checkbox_all" class="js_all" type="checkbox" name="">
                                            <i></i>
                                            <label for="checkbox_all">모두 동의합니다.</label>
                                        </span>
                                    </div>

                                    <ul class="accordion-list policy js-accordion_policy">
                                        <li class="trp_acitem">
                                            <div class="header-area">
                                                <div class="accordion_name">
                                                    <div class="trp checkbox-box">
                                                        <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all1"><span class="required">[필수]</span> 온라인 경매 약관 동의</label>
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
                                                        <input id="checkbox_all2" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all2"><span class="required">[필수]</span> 오프라인 경매 약관 동의</label>
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
                                                        <input id="checkbox_all3" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all3"><span class="required">[필수]</span> 개인정보 수집 및 이용 동의</label>
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
                                                        <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                                        <i></i>
                                                        <label for="checkbox_all4"><span>[선택]</span> 홍보 및 마케팅을 위한 정보 이용 동의</label>
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
                                                            <label for="checkbox_1">이메일</label>
                                                        </span>

                                                        <span class="trp checkbox-box">
                                                            <input id="checkbox_2" class="" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_2">SMS</label>
                                                        </span>

                                                        <span class="trp checkbox-box">
                                                            <input id="checkbox_3" class="" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_3">전화</label>
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
    <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
	</body>
	<script>
		app.value('locale', 'ko');
		var loginId = '${socialLoginId }';
		var name = '${name }';
		var mobile = '${mobile }';
		var email = '${email }';
		var socialLoginId = '${socialLoginId }';
		var socialEmail = '${socialEmail }';
	</script>
	<script type="text/javascript" src="/js/customer/join.js"></script>
</html>