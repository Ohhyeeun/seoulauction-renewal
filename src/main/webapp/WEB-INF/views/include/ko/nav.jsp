<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header class="header main-header header-border"> <!-- class="main-header fixed" --> 

    <div class="header_beltbox"> <!--class="on" block-->
        <div class="swiper-container belt-swiper wrap_padding belttxtbox">
            <div class="swiper-wrapper">
            </div>
            <span class="beltclose-btn closebtn closebtn-w"></span>
        </div>
    </div>

    <div>
        <ul class="header_utilitymenu wrap_padding pc-ver">
            <li class="utility-tab utility-lang"><a href="javascript:void(0);">KO</a>
                <ul class="bubble-box bubble-box01">
                    <li><a onclick="changeLang('${requestScope['javax.servlet.forward.servlet_path']}', '${requestScope['javax.servlet.forward.query_string']}', 'en')">ENG(English)</a></li>
                    <li><a onclick="changeLang('${requestScope['javax.servlet.forward.servlet_path']}', '${requestScope['javax.servlet.forward.query_string']}', 'ko')">KOR(한국어)</a></li>
                </ul>
            </li>
            <sec:authorize access="isAnonymous()"> <!-- !login -->
                <li class="utility-join"><a href="/join">회원가입</a></li>
                <li class="utility-login"><a href="/login">로그인</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()"> <!-- login -->
                <li class="utility-tab utility-account"><a href="/mypage/liveBidReqList">마이페이지</a>
                    <ul class="bubble-box bubble-box02">
                        <li><a href="/mypage/liveBidReqList">라이브 경매 관리</a></li>
                        <li id="MyMenuOnlineBadge"><a href="/mypage/onlineBidList">온라인 경매 관리</a></li>
                        <li><a href="/mypage/inteLotList">관심작품</a></li>
                        <li><a href="/mypage/academyList">아카데미 신청목록</a></li>
                        <li><a href="/mypage/custModify">회원정보 수정</a></li>
                    </ul>
                </li>
                <li class="utility-login"><a onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')">로그아웃</a></li>
            </sec:authorize>
        </ul>
    </div>
    <nav class="header_navbox">
        <div class="header_nav wrap_padding" ng-controller="headCtl">
            <a href="/" class="header_logo"><span class="blind-text">logo</span></a>
            <ul class="header_gnbmenu pc-ver">
                <li><a href="#" class="">AUCTION</a></li>
                <li><a href="#">PRIVATE SALE</a></li>
                <li><a href="#">SELL</a></li>
                <li><a href="#">SERVICE</a></li>
            </ul>
            <section class="topsearch-box">
                <button class="m-top-search m-ver"></button>
                <button class="m-gnbmenu m-ver"></button>
                <form action="" class="scroll_none">
                    <fieldset class="topsearch">
                        <span class="submenuBg-closeBtn top-search-closeBtn closebtn-b m-ver"></span>
                        <input onkeydown="searchFilter()" type="text" class="topsearch-text pc-ver" ng-click="recommandSearch();" id="topsearchText" ng-keypress="$event.keyCode === 13 && goSearch('topsearchText', true, $event);" autocomplete="off"><button type="button" class="topsearch-btn pc-ver" ng-click="goSearch('topsearchText', true, $event);"></button>
                        <section class="search-bubble-box">
                            <div class="recent-search">
                            </div>
                            <div class="recommend-search-part">
                            </div>
                        </section>
                    </fieldset>
                </form>
            </section>
        </div>
        <section class="gnb_submenuBg scroll_none"></section>
        <section class="submenuBg">
            <div class="wrap">
                <span class="submenuBg-closeBtn closebtn closebtn-b m-ver"></span>
                <div class="flex_wrap submenuBg-box">
                    <div class="Ingbanner-box pc-ver1280"> 
                    </div>

                    <ul class="subGnbmenu">
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">AUCTION<span></span></span>
                            <ul class="submenu submenu-part01">
                                <li id="menu_auction"><a href="/auction/progress">진행경매</a></li>
                                <li id="menu_upcoming"><a href="/auction/upcoming">예정경매</a></li>
                                <li><a href="/auction/results">경매결과</a></li>
                                <li><a href="/auction/info ">경매안내</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                            <ul class="submenu submenu-part02">
                                <li id="menu_exhibit"><a href="/privatesale/exhibit">전시</a></li>
                                <li><a href="/privatesale/psList">프라이빗 세일</a></li>
                                <li><a href="/privatesale/psGuide">프라이빗 세일 가이드</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SELL<span></span></span>
                            <ul class="submenu submenu-part03">
                                <li><a href="/sell/consignment">위탁안내</a></li>
                                <li><a href="/mypage/inquiryForm">위탁신청</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SERVICE<span></span></span>
                            <ul class="submenu submenu-part04">
                                <li id="menu_academy"><a href="/service/academy">아카데미</a></li>
                                <li><a href="/service/loan">담보대출</a></li>
                                <li><a href="/service/storage">미술품보관</a></li>
                                <li><a href="/service/showroom">전시장대관</a></li>
                                <li><a href="/service/marketing">아트컨설팅&#38;기업마케팅</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit m-ver" ng-if="${requestScope['javax.servlet.forward.servlet_path'] == '/'}">
                            <span class="gnbmenu_arrow modebox">Light Mode
                                <label for="dark" class="mode-toggle">
                                    <input type="checkbox" id="dark" name="dark">
                                    <span class="mode-switch"></span>
                                </label>
                            </span>
                        </li>
                    </ul>
                    <figure class="blacklotbox">
                        <a href="https://www.blacklot.com/" target="_blank">
                            <img src="/images/pc/thumbnail/gnb_blacklot.jpg" alt="blacklot">
                        </a>
                    </figure>
                </div>
                <ul class="mobile-utility m-ver">
                    <li id="mb_common_lang">
                        <%--                        <c:if test="${empty cookie.lang.value || cookie.lang.value eq 'ko'}">--%>
                        <%--                            <a href="${pageContext.request.contextPath}/?lang=en">ENG</a>--%>
                        <%--                        </c:if>--%>
                        <%--                        <c:if test="${cookie.lang.value eq 'en'}">--%>
                        <%--                            <a href="${pageContext.request.contextPath}/?lang=ko">KO</a>--%>
                        <%--                        </c:if>--%>
                    </li>
                    <li>
                        <sec:authorize access="isAnonymous()"> <!-- !login -->
                            <a href="/join" class="gnb_join">회원가입</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <a href="/mypage/main" class="gnb_member">마이페이지</a>
                        </sec:authorize>
                    </li>
                    <li>
                        <sec:authorize access="isAnonymous()">
                            <a href="/login" class="gnb_login">로그인</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <a class="gnb_logout"
                               onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')"
                            >로그아웃</a>
                        </sec:authorize>
                    </li>
                </ul>
            </div>
        </section>
    </nav>
</header>

<script>
    app.requires.push.apply(app.requires, ["ngDialog", "checklist-model"]);
    app.controller('headCtl', function($scope, consts, common, locale, $filter) {
        // console.log("recommend-search-part")
        $scope.recommandSearch =  function(){
            //추천 검색어
            axios.get('/api/auction/selectRecommandArtist').then(function (response) {
                const success = response.data.success;

                $('.recommend-search-part').empty();

                if (success) {
                    const data = response.data.data;
                    let html = '<span class="keyword-search-tit">추천검색</span>';

                    $('.recommend-search-part').append(html);
                    data.map(item => {
                        let innerHtml = '<a href="/sale/search?searchContent=' + JSON.parse(item.artist_name)[locale] + '" class="recommend-keyword">' + dotSubString(JSON.parse(item.artist_name)[locale], 10) + '</a>';
                        $('.recommend-search-part').append(innerHtml);
                    });
                }
            }).catch(function (error) {
                console.log(error);
            });
        }
        // 최근 검색어
        let keywords = getCookie("keywordHistory");
        let html = '<span class="keyword-search-tit">최근검색<span class="keyword-all-del">전체삭제</span></span>';

        if(keywords){
            $(".recent-search").empty();
            let keywordsArray = keywords.split(',');
            $.each(keywordsArray , function(idx , el){
                html += '<span class="recent-keyword"><a href="/sale/search?searchContent='+ el +'">'+ el+'</a><span class="keyword-del" searchContent="'+ el +'"></span></span>';
            });

        }else{
            html += '<span class="recent-keyword">표시할내용없음</span>';
        }

        $(".recent-search").append(html);


        $scope.goSearch =  function(elementId, bIsKorean, $event){
            $event.preventDefault();
            if($event.keyCode == 13){
                $('.topsearch-btn').trigger("click");
                $('.search-bubble-box').removeClass('on');
                var sSearchContent = $("#" + elementId).val();
                if(sSearchContent) {
                    location.href = bIsKorean ? "/sale/search?searchContent=" + sSearchContent : "/eng/sale/search?searchContent=" + sSearchContent;
                }
                else {
                    alert(bIsKorean ? "검색어를 입력해주세요." : "Please write search keyword.");
                }
            } else if($('.topsearch-text').val().length == 0) {
                $('.search-bubble-box').removeClass('on');
            } else {
                $('.search-bubble-box').addClass('on');
            }
            return false;
        }
    });
</script>