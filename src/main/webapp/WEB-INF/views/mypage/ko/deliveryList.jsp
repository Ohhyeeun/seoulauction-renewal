<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<body>  
<jsp:include page="../../include/ko/header.jsp" flush="false"/>   
<div id="wrap" ng-app="myApp">
    <script type="text/javascript" src="/js/mypage/inquiry.js"></script>
	<!-- container -->
    <div id="container">
        <div id="contents" class="contents">
            <section class="basis-section last-section mypage-section">
                <div class="section-inner">
                    <div class="content-panel type_panel-mypage_inquiry">
                        <div class="panel-body">
                            <div class="mypage-container">
								<jsp:include page="include/mypageSide.jsp" flush="false"/>

                                <div class="content-area">
                                    <div class="subtitle-wrap">
                                        <div class="subtitle-inner">
                                            <div class="title">
                                                <span class="tt2">배송지관리</span>
                                            </div>
                                            <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                        </div>
                                    </div>
                                    <span>배송지 5</span><br />
                                    <span>배송지는 최대 5개까지 등록 가능합니다.</span>
                                    <div class="contents-wrap">
                                        <article class="tit-btnbox">
                                            <button class="btn btn_point" type="button"><span>배송지추가</span></button>
                                        </article>
                                        <article class="inquiry-list-wrap">
                                            <ul class="inquiry-list">
                                                <li class="inquiry-list-ea">
                                                    <div class="bbs-division">기본배송지</div>
                                                    <div class="bbs-subbox">
                                                        <div class="statebox">
                                                            <div class="state-icon complete">수정</div>
                                                        </div>
                                                    </div>
                                                    <div class="bbs-subject tt4"><span>주소 : 서울특별시 서대문구 홍은2로 23-45, 102호 (심화아파트)</span></div>
                                                    <div class="bbs-subject tt4"><span>휴대폰번호 : 010-1111-2222</span></div>
                                                </li>
                                                <li class="inquiry-list-ea">
                                                    <div class="bbs-division">회사</div>
                                                    <div class="bbs-subbox">
                                                        <div class="statebox">
                                                            <div class="state-icon complete">수정</div>
                                                        </div>
                                                    </div>
                                                    <div class="bbs-subject tt4"><span>주소 : 서울특별시 서대문구 홍은2로 23-45, 102호 (심화아파트)</span></div>
                                                    <div class="bbs-subject tt4"><span>휴대폰번호 : 010-1111-2222</span></div>
                                                </li>
                                            </ul>
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
</div>
<jsp:include page="../../include/ko/footer.jsp" flush="false"/>
    
</body>