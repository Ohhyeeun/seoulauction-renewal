<%--
  Created by IntelliJ IDEA.
  User: csy
  Date: 2022/05/02
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Seoul Auction</title>
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/swiper.css" type="text/css">
</head>

<body>
<section class="upcoming">
    <h1 class="main-sectiontit upcoming-tit">
        Upcoming
    </h1>

    <div class="upcoming-wrap">
        <div  class="swiper-container upcoming-swiper">
            <div id="upcomingContainer" class="swiper-wrapper upcoming-contents">
                <div class="swiper-slide upcomingSlide">
                    <a href="#">
                        <div class="upcoming-caption">
                            <span class="auctionKind-box on">LIVE</span><span class="d-day on">TODAY</span>
                            <h4 class="text-over">제1회 ART SHOPPING 신세계 센텀시티 오픈 기념 경매</h4>
                            <div class="upcoming-datebox">
                                <p class="upcoming-preview">
                                    <span>오픈일</span><span>2/14(금)</span>
                                </p>
                                <p class="upcoming-preview">
                                    <span>프리뷰</span><span>2/14(금) ~ 2/25(화)</span>
                                </p>
                                <p class="upcoming-date">
                                    <span>경매일</span><span>2/15(화) 15:00</span>
                                </p>
                            </div>
                        </div>
                        <figure class="upcoming-img">
                            <!--<span class="upcomingImg"></span>-->
                            <img src="http://publish.seoulauction.xyz/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">
                        </figure>
                    </a>
                </div>
                <div class="swiper-slide upcomingSlide">
                    <a href="#">
                        <div class="upcoming-caption">
                            <span class="auctionKind-box">ONLINE</span><span class="d-day on">D-1</span>
                            <h4 class="text-over">2월 라이브 경매</h4>
                            <div class="upcoming-datebox">
                                <p class="upcoming-preview">
                                    <span>오픈일</span><span>2/14(금)</span>
                                </p>
                                <p class="upcoming-preview">
                                    <span>프리뷰</span><span>2/14(금) ~ 2/25(화)</span>
                                </p>
                                <p class="upcoming-date">
                                    <span>경매일</span><span>2/15(화) 15:00</span>
                                </p>
                            </div>
                        </div>
                        <figure class="upcoming-img">
                            <!--<span class="upcomingImg"></span>-->
                            <%--<img src="http://publish.seoulauction.xyz/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">--%>
                        </figure>
                    </a>
                </div>

                <div class="swiper-slide upcomingSlide">
                    <a href="#">
                        <div class="upcoming-caption">
                            <span class="auctionKind-box">ONLINE</span><span class="d-day"></span>
                            <h4 class="text-over">ZEROBASE X 아트경기</h4>
                            <div class="upcoming-datebox">
                                <p class="upcoming-open">
                                    <span>오픈일</span><span>2/14(금)</span>
                                </p>
                                <p class="upcoming-preview">
                                    <span>프리뷰</span><span>2/14(금) ~ 2/25(화)</span>
                                </p>
                                <p class="upcoming-date">
                                    <span>경매일</span><span>2/15(화) 15:00 <span>순차마감</span></span>
                                </p>
                            </div>
                        </div>
                        <figure class="upcoming-img">
                            <!--<img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet"> -->
                        </figure>
                    </a>
                </div>
            <%--                <div class="swiper-slide upcomingSlide">--%>
<%--                    <a href="#">--%>
<%--                        <div class="upcoming-caption">--%>
<%--                            <span class="auctionKind-box">ONLINE</span><span class="d-day"></span>--%>
<%--                            <h4>2월 라이브 경매</h4>--%>
<%--                            <div class="upcoming-datebox">--%>
<%--                                <p class="upcoming-preview">--%>
<%--                                    <span>오픈일</span><span>2/14(금)</span>--%>
<%--                                </p>--%>
<%--                                <p class="upcoming-preview">--%>
<%--                                    <span>프리뷰</span><span>2/14(금) ~ 2/25(화)</span>--%>
<%--                                </p>--%>
<%--                                <p class="upcoming-date">--%>
<%--                                    <span>경매일</span><span>2/15(화) 15:00</span>--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <figure class="upcoming-img">--%>
<%--                            <!--<span class="upcomingImg"></span>-->--%>
<%--                            <!--<img src="http://seoulauction.m4one.co.kr/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet"> -->--%>
<%--                        </figure>--%>
<%--                    </a>--%>
<%--                </div>--%>
            </div>
        </div>
        <!--<ul class="upcoming-slidebox">
            <li class="upcomingSlide upcomingSlide01">
                <a href="#">
                    <div class="upcoming-caption">
                        <span class="auctionKind-box on">LIVE</span><span class="d-day">D-1</span>
                        <h4>2월 라이브 경매</h4>
                        <div class="upcoming-datebox">
                            <p class="upcoming-datetit">
                                <span>프리뷰</span>
                                <span>경매일</span>
                            </p>
                            <p class="upcoming-line">
                                <span class="upcomingLine"></span>
                                <span class="upcomingLine"></span>
                            </p>
                            <p class="upcoming-date">
                                <span>2/14(금) ~ 2/25(화)</span>
                                <span>2/15(화) 15:00</span>
                            </p>
                        </div>
                    </div>
                    <figure class="upcoming-img">
                        <span class="upcomingImg"></span>
                        <img src="/images/pc/thumbnail/Upcoming_01_160x160.png" alt="alet">
                    </figure>
                </a>
            </li>
            <li class="upcomingSlide upcomingSlide02">
                <a href="#">
                    <div class="upcoming-caption">
                        <span class="auctionKind-box on">LIVE</span><span class="d-day">D-1</span>
                        <h4>2월 라이브 경매</h4>
                        <div class="upcoming-datebox">
                            <p class="upcoming-datetit">
                                <span>프리뷰</span>
                                <span>경매일</span>
                            </p>
                            <p class="upcoming-line">
                                <span class="upcomingLine"></span>
                                <span class="upcomingLine"></span>
                            </p>
                            <p class="upcoming-date">
                                <span>2/14(금) ~ 2/25(화)</span>
                                <span>2/15(화) 15:00</span>
                            </p>
                        </div>
                    </div>
                    <figure class="upcoming-img"></figure>
                </a>
            </li>
            <li class="upcomingSlide upcomingSlide03">
                <a href="#">
                    <div class="upcoming-caption">
                        <span class="auctionKind-box on">LIVE</span><span class="d-day">D-1</span>
                        <h4>2월 라이브 경매</h4>
                        <div class="upcoming-datebox">
                            <p class="upcoming-datetit">
                                <span>프리뷰</span>
                                <span>경매일</span>
                            </p>
                            <p class="upcoming-line">
                                <span class="upcomingLine"></span>
                                <span class="upcomingLine"></span>
                            </p>
                            <p class="upcoming-date">
                                <span>2/14(금) ~ 2/25(화)</span>
                                <span>2/15(화) 15:00</span>
                            </p>
                        </div>
                    </div>
                    <figure class="upcoming-img"></figure>
                </a>
            </li>
        </ul> -->
    </div>
    <div class="commonbtn-box upcomingBtn">
        <a href="#" class="commonbtn">전체보기</a>
    </div>
</section>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    window.onload = function(){
        console.log("onload");
        loadUpcomingList();
    }

    const loadUpcomingList = async () => {
        let sale_kind;
        let sale_title;
        let date_open;
        let date_preview_from;
        let date_preview_to;
        let datetime_bid;

        await fetch('/api/main/upcomings')
        .then(res => res.json())
        .then(res => {
            if (res.success) {
                console.log(res);
                const data = res.data;

                for(let item of data){
                    let element;
                    element = document.createElement("div");
                    element.classList.add("swiper-slide", "upcomingSlide");
                    element.append(document.createElement("a"));
                    element.textContent = item.SALE_NO + item.TITLE_BLOB;
                    // $(element).append(JSON.stringify(item));
                    $("#upcomingContainer").append(element);
                }

            }
        });
    }

</script>
</body>
</html>
