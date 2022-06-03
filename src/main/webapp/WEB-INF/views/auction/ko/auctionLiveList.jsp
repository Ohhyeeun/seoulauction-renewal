<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- header -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>온프라인 경매중 응찰신정gn | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass type-width_list">

            <!-- header -->
            <jsp:include page="../../include/ko/header.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <!-- page title (ing, view)   -->
                    <section class="page_title-section list_page-section">
                        <div class="section-inner full_size">
                            <div class="padding-inner">
                                <article class="auction_head_info-article">
                                    <div class="center-box view">
                                        <h2 class="page_title"><span class="th1">3월 라이브 경매</span></h2>

                                        <ul class="event_day-list">
                                            <li><span class="colorB2">프리뷰</span><span class=""> : 1/28(금) - 2/8(화)</span></li>
                                            <li><span class="colorB2">경매일</span><span class=""> : 2/9(화) 14:00</span></li>
                                        </ul>

                                        <div class="btn_set">
                                            <a class="btn btn_white " href="#" role="button"><span>안내사항</span></a>
                                            <a class="btn btn_white " href="#" role="button"><span>E-BOOK</span></a>
                                            <a class="btn btn_white " href="#" role="button"><span>VR보기</span></a>
                                        </div>
                                    </div>
                                </article>

                                <article class="proceeding-article">
                                    <a href="#" title="진행중 Lot 10|김선우">
                                        <div class="article-inner">
                                            <div class="column view">
                                                <strong class="note_msg">라이브 경매 보기</strong>
                                            </div>
                                            <div class="column">
                                                <div class="note_etc">
                                                    <span>사전 신청한 회원만 응찰 가능합니다.</span>
                                                </div>
                                            </div>
                                            <i class="icon-link_arrow"></i>
                                        </div>
                                    </a>
                                </article>

                                <%--라이브 응찰 신청기간--%>
                                <article class="proceeding-article">
                                    <a href="#" title="라이브 응찰 신청" class="js-terms_required">
                                        <div class="article-inner">
                                            <div class="column view">
                                                <strong class="note_msg">라이브 응찰 신청</strong>
                                            </div>
                                            <div class="column">
                                                <div class="note_etc">
                                                    <span>정회원만 응찰 신청이 가능합니다.</span>
                                                </div>
                                            </div>
                                            <i class="icon-link_arrow"></i>
                                        </div>
                                    </a>
                                </article>
                            </div>
                        </div>
                    </section>

                    <section class="basis-section tab-auction-section">
                        <div class="section-inner">

                            <!-- 텝메뉴 -->
                            <div class="content-panel type_panel-search_tab ">
                                <div class="panel-header">

                                    <div class="tab-wrap">
                                        <div class="tab-area type-left">
                                            <ul class="tab-list js-list_tab">
                                                <li class="active"><a href="#tab-cont-1"><span>전체</span></a></li>
                                                <li><a href="#tab-cont-2"><span>근현대</span></a></li>
                                                <li><a href="#tab-cont-3"><span>고미술</span></a></li>
                                                <li><a href="#tab-cont-4"><span>시계</span></a></li>
                                                <li><a href="#tab-cont-5"><span>럭셔리</span></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="panel-body">
                                    <article class="search_tab-article">
                                        <div class="article-body">
                                            <div class="col_item mb-col1">

                                                <div class="select-box">
                                                    <div class="trp-dropdown-area h42-line">
                                                        <button class="js-dropdown-btn"><em>200</em><span>LOT</span><i class="form-select_arrow_md"></i>
                                                        </button>
                                                        <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                            <div class="search-box">
                                                                <input type="search" placeholder="LOT 번호 입력" id="" class="">
                                                                <i class="form-search_md"></i>
                                                            </div>
                                                            <div class="list-box scroll-type">
                                                                <ul>
                                                                    <li>
                                                                        <a href="#">
                                                                            <div class="image-area">
                                                                                <figure class="img-ratio">
                                                                                    <div class="img-align">
                                                                                        <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                                                    </div>
                                                                                </figure>
                                                                            </div>
                                                                            <div class="typo-area">
                                                                                <span>LOT</span>
                                                                            </div>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#">
                                                                            <div class="image-area">
                                                                                <figure class="img-ratio">
                                                                                    <div class="img-align">
                                                                                        <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                                                    </div>
                                                                                </figure>
                                                                            </div>
                                                                            <div class="typo-area">
                                                                                <span>LOT1</span>
                                                                            </div>
                                                                        </a>
                                                                    </li>
                                                                    <li><a href="#">
                                                                            <div class="image-area">
                                                                                <figure class="img-ratio">
                                                                                    <div class="img-align">
                                                                                        <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                                                                    </div>
                                                                                </figure>
                                                                            </div>
                                                                            <div class="typo-area">
                                                                                <span>LOT2</span>
                                                                            </div>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="search-box">
                                                    <input type="search" placeholder="작가/작품명" id="" class="h42">
                                                    <i class="form-search_md"></i>
                                                </div>
                                            </div>
                                            <div class="col_item mb-col2">
                                                <div class="select-box">
                                                    <select class="select2Basic42" id="">
                                                        <option value="1">경매 최신순</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                                <div class="select-box">
                                                    <select class="select2Basic42 js-select_page" id="">
                                                        <option value="1">페이지 방식</option>
                                                        <option value="2">더보기 방식</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </div>

                        </div>
                    </section>

                    <section class="basis-section last-section auction_list-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-product_list">
                                <div class="panel-body">

                                    <ul class="product-list">


                                    </ul>
                                </div>

                                <div class="panel-footer">
                                    <div class="set-pc_mb">
                                        <div class="only-pc">
                                            <div class="paging-area">
                                                <div class="paging">
                                                    <a href="#" class="prev_end icon-page_prevprev">FIRST</a><a href="#" class="prev icon-page_prev">PREV</a>
                                                    <strong class="on">1</strong>
                                                    <a href="#"><em>2</em></a>
                                                    <a href="#"><em>3</em></a>
                                                    <a href="#"><em>4</em></a>
                                                    <a href="#"><em>5</em></a>
                                                    <a href="#"><em>6</em></a>
                                                    <a href="#"><em>7</em></a>
                                                    <a href="#"><em>8</em></a>
                                                    <a href="#"><em>9</em></a>
                                                    <a href="#"><em>10</em></a>
                                                    <a href="#" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="only-mb">
                                            <button class="btn btn_gray_line" type="button"><span>더보기</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
            <!-- //footer -->

            <!-- stykey -->

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
            <!-- // stykey -->

        </div>
    </div>

    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/auction/auctionLiveList.js" type="text/javascript"></script>


    <jsp:include page="popup/paddle.jsp" />
</body>

</html>