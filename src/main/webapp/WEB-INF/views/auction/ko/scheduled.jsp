<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>예정경매 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">
                <section class="basis-section tab-auction_other-section">
                    <div class="section-inner">
                        <!-- 텝메뉴 -->
                        <div class="content-panel type_panel-search_tab ">
                            <div class="panel-header">
                                <div class="tab-wrap">
                                    <div class="tab-area type-left">
                                        <ul class="tab-list js-list_tab">
                                            <li><a href="#tab-cont-1"><span>진행경매</span></a></li>
                                            <li class="active"><a href="#tab-cont-2"><span>예정경매</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <section class="basis-section last-section auction_other_list-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-auction_list">
                            <div class="panel-body">
                                <ul class="auction-list">
                                    <li>
                                        <div class="li-inner">
                                            <article class="item-article">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="/images/temp/img_list-0.jpg" alt="">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <!-- type-online, type-live, type-d_day -->
                                                        <div class="state-box"><span class="type-live">LIVE</span> <span class="type-d_day">TODAY</span></div>
                                                        <div class="title-box"><span>제 166회 미술품 경매</span></div>
                                                        <div class="info-box">
                                                            <dl>
                                                                <dt>오픈일</dt>
                                                                <dd>4/6(수)</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>프리뷰</dt>
                                                                <dd>4/7(목) ~ 4/11(월)</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>경매일</dt>
                                                                <dd>4/12(화) 14:00 순차마감</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn btn_default"><span>예정경매보기</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="li-inner">
                                            <article class="item-article">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="/images/temp/img_list-1.jpg" alt="">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="state-box "><span class="type-online">ONLINE</span> <span class="type-d_day">D-7</span></div>
                                                        <div class="title-box"><span>산불 피해 이재민 돕기 온라인 자선 경매</span></div>
                                                        <div class="info-box">
                                                            <dl>
                                                                <dt>오픈일</dt>
                                                                <dd>4/6(수)</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>프리뷰</dt>
                                                                <dd>4/7(목) ~ 4/11(월)</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>경매일</dt>
                                                                <dd>4/12(화) 14:00 순차마감</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn btn_default  "><span>예정경매보기</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="li-inner">
                                            <article class="item-article">
                                                <div class="image-area">
                                                    <figure class="img-ratio">
                                                        <div class="img-align">
                                                            <img src="/images/temp/img_list-3.jpg" alt="">
                                                        </div>
                                                    </figure>
                                                </div>
                                                <div class="typo-area">
                                                    <div class="product_info">
                                                        <div class="state-box "><span class="type-online">ONLINE</span> <span class="type-d_day">D-7</span></div>
                                                        <div class="title-box"><span>4월 e BID 프리미엄 온라인 경매 II</span></div>
                                                        <div class="info-box">
                                                            <dl>
                                                                <dt>오픈일</dt>
                                                                <dd>4/6(수)</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>프리뷰</dt>
                                                                <dd>4/7(목) ~ 4/11(월)</dd>
                                                            </dl>
                                                            <dl>
                                                                <dt>경매일</dt>
                                                                <dd>4/12(화) 14:00 순차마감</dd>
                                                            </dl>
                                                        </div>
                                                        <div class="btn-box">
                                                            <button class="btn btn_default"><span>예정경매보기</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- //container -->

        <!-- footer -->
        <jsp:include page="../../include/ko/footer.jsp" />
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
</body>

</html>