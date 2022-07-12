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
            <li class="utility-tab utility-lang"><a href="javascript:void(0);">ENG</a>
                <ul class="bubble-box bubble-box01">
                    <li><a onclick="changeLang('${requestScope['javax.servlet.forward.servlet_path']}', '${requestScope['javax.servlet.forward.query_string']}', 'ko')">KOR(한국어)</a></li>
                    <li><a onclick="changeLang('${requestScope['javax.servlet.forward.servlet_path']}', '${requestScope['javax.servlet.forward.query_string']}', 'en')">ENG(English)</a></li>
                </ul>
            </li>
            <sec:authorize access="isAnonymous()"> <!-- !login -->
                <li class="utility-join"><a href="/join">JOIN</a></li>
                <li class="utility-login"><a href="/login">LOGIN</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()"> <!-- login -->
                <li class="utility-tab utility-account"><a href="/mypage/liveBidReqList">MY PAGE</a>
                    <ul class="bubble-box bubble-box02">
                        <li><a href="/mypage/liveBidReqList">Live Auction Management</a></li>
                        <li id="MyMenuOnlineBadge"><a href="/mypage/onlineBidList">Online Auction Management</a></li>
                        <li><a href="/mypage/inteLotList">Wish List</a></li>
                        <li><a href="/mypage/custModify">Edit member information</a></li>
                    </ul>
                </li>
                <li class="utility-login"><a onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')">LOGOUT</a></li> <!-- !login -->
            </sec:authorize>
        </ul>
    </div>

    <nav class="header_navbox">
        <div class="header_nav wrap_padding" ng-controller="headCtl" >
            <a href="/" class="header_logo"><span class="blind-text">logo</span></a>
            <ul class="header_gnbmenu pc-ver">
                <li><a href="#" class="">AUCTION</a></li>
                <li><a href="#">PRIVATE SALE</a></li>
                <li><a href="#">SELL</a></li>
                <li><a href="#">SERVICE</a></li>
            </ul>
            <section class="topsearch-box">
                <button class="m-top-search m-ver" ng-click="recommandSearch();"></button>
                <button class="m-gnbmenu m-ver"></button>
                <form action="" class="scroll_none">
                    <fieldset class="topsearch topsearch-en">
                        <span class="submenuBg-closeBtn closebtn-b top-search-closeBtn m-ver"></span>
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

        <section class="gnb_submenuBg scroll_none"></section> <%-- background bim --%>   
        <section class="submenuBg scroll_none">
            <div class="wrap">
                <span class="submenuBg-closeBtn closebtn closebtn-b m-ver"></span>
                <div class="flex_wrap submenuBg-box">
                    <div class="Ingbanner-box">
                    </div>

                    <ul class="subGnbmenu">
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">AUCTION<span></span></span>
                            <ul class="submenu submenu-part01">
                                <li id="menu_auction"><a href="/auction/progress">Current</a></li>
                                <li id="menu_upcoming"><a href="/auction/upcoming">Upcoming</a></li>
                                <li><a href="/auction/results">Result</a></li>
                                <li><a href="/auction/info">Auction Guide</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">PRIVATE SALE<span></span></span>
                            <ul class="submenu submenu-part02">
                                <li id="menu_exhibit"><a href="/privatesale/exhibit">Exhibition</a></li>
                                <li><a href="/privatesale/psList">Private Sale</a></li>
                                <li><a href="/privatesale/psGuide">Private Sale Guide</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SELL<span></span></span>
                            <ul class="submenu submenu-part03">
                                <li><a href="/sell/consignment">Consignment information</a></li>
                                <li><a href="/mypage/inquiryForm">Consignment application</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit"><span class="gnbmenu_arrow">SERVICE<span></span></span>
                            <ul class="submenu submenu-part04">
                                <li><a href="/service/loan">Art Collateral Loans</a></li>
                                <li><a href="/service/storage">Art Storage</a></li>
                                <li><a href="/service/showroom">Rental of Space</a></li>
                                <li><a href="/service/marketing">Art Consulting &#38; <br>Corporate Marketing</a></li>
                            </ul>
                        </li>
                        <li class="subGnbmenu-tit m-ver" ng-if="${requestScope['javax.servlet.forward.servlet_path'] == '/'}"  >
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
                        <%--                            <c:if test="${empty cookie.lang.value || cookie.lang.value eq 'ko'}">--%>
                        <%--                                <a href="${pageContext.request.contextPath}/?lang=en">ENG</a>--%>
                        <%--                            </c:if>--%>
                        <%--                            <c:if test="${cookie.lang.value eq 'en'}">--%>
                        <%--                                <a href="${pageContext.request.contextPath}/?lang=ko">KO</a>--%>
                        <%--                            </c:if>--%>
                    </li>
                    <li>
                        <sec:authorize access="isAnonymous()"> <!-- !login -->
                            <a href="/join" class="gnb_join">JOIN</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <a href="/mypage/main" class="gnb_member">MY PAGE</a>
                        </sec:authorize>
                    </li>
                    <li>
                        <sec:authorize access="isAnonymous()">
                            <a href="/login" class="gnb_login">LOGIN</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <a class="gnb_logout"
                               onclick="logout('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.details.loginId}')"
                            >LOGOUT</a>
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
                    let html = '<span class="keyword-search-tit">Recommend Keyword</span>';

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
        let html = '<span class="keyword-search-tit">Recent Keyword<span class="keyword-all-del">All Delete</span></span>';

        if(keywords){
            $(".recent-search").empty();
            let keywordsArray = keywords.split(',');
            $.each(keywordsArray , function(idx , el){
                html += '<span class="recent-keyword"><a href="/sale/search?searchContent='+ el +'">'+ el+'</a><span class="keyword-del" searchContent="'+ el +'"></span></span>';
            });

        }else{
            html += '<span class="recent-keyword">keyword empty</span>';
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