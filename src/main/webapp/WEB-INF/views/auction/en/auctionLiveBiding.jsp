<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <jsp:include page="../../include/en/nav.jsp" flush="false"/>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <!-- page title -->
                    <section class="page_title-section">
                        <div class="section-inner full_size">
                            <div class="center-box">
                                <h2 class="page_title"><span class="th1">Bid application</span></h2>
                            </div>
                        </div>
                    </section>




                    <section class="basis-section bidding_application-section last-section">
                        <div class="section-inner">

                            <!-- 작품응찰신청 -->
                            <div class="content-panel type_panel-proceeding_bidding">
                                <div class="panel-header">
                                    <div class="title"><span id="sale_title">166th Live Auction</span></div>
                                </div>
                                <div class="panel-body">

                                    <ul class="form_table_bidding">
                                        <!--  안내및비용 -->
                                        <li>
                                            <div class="product_info-area">
                                                <div class="guide">

                                                    <div class="product-box">
                                                        <p class="img"><img id="bidding_lot_img" src="/images/temp/temp_img2.jpg" alt="" /></p>
                                                        <div class="product_info">
                                                            <div class="num"><span id="lot_id" class="tb1">1</span></div>
                                                            <div class="title">
                                                                <div class="name"><span id="artist_name" class="tt4">Damien Hirst</span></div>
                                                                <div class="desc">
                                                                    <span id="lot_title" class="tb1">The Elements: Air Silver vase with pear flower design; Silver pipe box with pear flower design; Dry ottchil plate with pear flower design</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit ">Estimate</span>
                                                        <span class="won" id="expe_price">KRW 9,900,000,000 <br />
                                                            ~ 9,900,000,000</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- 응찰방법 -->
                                        <li>
                                            <div class="bidding-area">
                                                <p class="list_tit tt4">How to bid</p>
                                                <div class="btn_radios js-bidding_method">
                                                    <div id ="btn_select_paper_offline" class="btn_item active">
                                                        <button id="select_paper_offline" class="btn btn_gray_line btn_lg " type="button">
                                                            <span>Absentee</span>
                                                        </button>
                                                    </div>
                                                    <div id ="btn_select_phone" class="btn_item">
                                                        <button id="select_phone" class="btn btn_gray_line btn_lg" type="button">
                                                            <span>Telephone</span>
                                                        </button>
                                                    </div>
                                                    <div id ="btn_select_floor" class="btn_item">
                                                        <button id="select_floor" class="btn btn_gray_line btn_lg" type="button">
                                                            <span id="span_select_floor" >Absentee <br class="only-mb">+ Telephone</span>
                                                        </button>
                                                    </div>
                                                </div>

                                                <div id="select_field" class="gray-box">
                                                    <div class="price_mark">

                                                        <div class="title">
                                                            <span>Bid price</span>
                                                        </div>

                                                        <div class="select-box">
                                                            <div class="trp-dropdown-area h50-line_center">
                                                                <button class="js-dropdown-btn"><span id="selected_lot"> 1,800,000 KRW</span><i class="icon-select_arrow"></i>
                                                                </button>
                                                                <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                                    <!-- <div class="legend-box">
                                    <span>(호가단위 : 100,000 KRW)</span>
                                  </div> -->
                                                                    <div class="list-box scroll-type">
                                                                        <ul id="select_lot_scroll">
                                                                        </ul>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <!-- <div class="price">
                              <span>구천구백구십구억구천구백구십구만 원</span>
                            </div> -->
                                                        <div class="price">
                                                            <span id="price_to_han"></span>
                                                        </div>
<%--                                                        <div class="unit">--%>
<%--                                                            <span>(Bidding : 100,000 KRW)</span>--%>
<%--                                                        </div>--%>

                                                    </div>
                                                </div>

                                                <div class="help-box">
                                                    <i class="icon-inquiry_g"></i>
                                                    <ul>
                                                        <li><span>Nine hundred ninety-nine billion, nine hundred ninety-nine million, nine hundred ninety thousand won
                                                                (Unit of asking price: KRW 100,000)</span></li>
                                                        <li><span>Absentee: proxy bidding via document submitted in advance specifying desired price for artwork</span></li>
                                                        <li><span>Telephone: real-time bidding via phone call with employee while auction is underway</span></li>
                                                        <li><span>Absentee (document) + telephone: real-time bidding via document and phone</span></li>
                                                    </ul>
                                                </div>

                                            </div>
                                        </li>
                                        <!-- 회원 정보 확인 -->
                                        <li>
                                            <div class="contact-area">
                                                <p class="list_tit tt4">Member information</p>
                                                <div class="gray-box">
                                                    <dl class="dtdd-list">
                                                        <dt><span>Name</span></dt>
                                                        <dd><span>${member.userNm}</span></dd>
                                                    </dl>
                                                    <dl class="dtdd-list">
                                                        <dt><span>Address</span></dt>
                                                        <dd><span>${member.addr} ( ${member.zipNo} )</span></dd>
                                                    </dl>
                                                    <dl class="dtdd-list">
                                                        <dt><span>Mobile</span></dt>
                                                        <dd><span>${member.hp}</span></dd>
                                                    </dl>
                                                    <dl class="dtdd-list">
                                                        <dt><span>Email</span></dt>
                                                        <dd><span>${member.email}</span></dd>
                                                    </dl>
                                                </div>
                                                <div class="help-box">
                                                    <i class="icon-inquiry_g"></i>
                                                    <ul>
                                                        <li><span>Please check that your contact information (or that of the bidder (auction participant)) is accurate.<br>
                                                                Contact information can be corrected under “Edit member information” (“My Page” tab).</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- 약관 동의 -->
                                        <li>
                                            <div class="terms-area">
                                                <div class="check_all-wrap js_all-1 active">

                                                    <div class="all_check">
                                                        <span class="trp checkbox-box">
                                                            <input id="checkbox_all" class="js_all" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="checkbox_all">Consent to all</label>
                                                            <em>(required)</em>
                                                        </span>
                                                        <button class="js-accordion_btn"><i class="icon-accordion_arrow_down"></i></button>
                                                    </div>

                                                    <div class="gray-box">
                                                        <ul class="terms-list policy js-accordion_policy">
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all1">I fully understand and am aware of Seoul Auction’s Terms for auctions and consent to their application.</label>
                                                                    <a href="#" class="link_target">[Go to Terms]</a>
                                                                </div>
                                                            </li>
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all2" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all2">Bidding is conducted based on the assumption that the bidder has seen the artwork and its current condition in person.</label>
                                                                </div>
                                                            </li>
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all3" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all3">The winning bidder must make the payment (including buyer’s premium) within seven days (or 21 days, if the hammer price is KRW 300 million or more).</label>
                                                                </div>
                                                            </li>
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all4">If the winning bidder 1) fails to pay the hammer price by the designated deadline or 2) must withdraw his/her bid, he/she must pay 30 percent of the hammer price as a bid withdrawal fine.</label>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span>If you have any inquiries regarding bidding, please do not hesitate to contact the employee who has been assigned to you <br class="only-mb">(<em>Hong Gil-dong: +82(0)2-1234-5678</em>).</span></li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>
                                        </li>
                                    </ul>

                                </div>

                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set ">
                                            <a class="btn btn_default btn_lg" href="#" role="button" id="biding_cancel_btn"><span>Cancel</span></a>
                                            <a class="btn btn_point btn_lg" href="#" role="button" id="biding_req_btn"><span>Bid application</span></a>
                                        </div>
                                    </article>
                                </div>

                            </div>

                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/en/footer.jsp" flush="false"/>
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


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


<%--    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>--%>
<%--    <script type="text/javascript" src="/js/pages_common_en.js" type="text/javascript"></script>--%>






    <!-- 응찰방법 -->
    <script>
        $(".js-bidding_method .btn_item").on("click", function($e) {
            $(".js-bidding_method .btn_item").removeClass("active");
            $(this).addClass("active");
        });
    </script>

    <!-- [0516] 셀렉트 드롭다운 -->
    <script>
        var dropdown = $(".js-dropdown-btn").trpDropdown({
            list: ".trp-dropdown_list-box",
            area: ".trp-dropdown-area"
        });
        $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function($e) {
            $e.preventDefault();
            var _this = $(this);
            _this.closest(".trp-dropdown-area").find(".js-dropdown-btn em").text($("em", _this).text());
            _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());
            dropdown.getClose();
        });
    </script>


    <!-- 약관 -->
    <script>
        var accordion_toggle;
        accordion_toggle = $(".js-accordion_btn").trpToggleBtn(
            function($this) {
                $($this).addClass("on");
                $($this).closest(".check_all-wrap").find(".gray-box").slideDown("fast");
            },
            function($this) {
                $($this).removeClass("on");
                $($this).closest(".check_all-wrap").find(".gray-box").slideUp("fast");
            });
        accordion_toggle.setBtn(0);


        $(".js_all-1").trpCheckBoxAllsImg(".js_all", ".js_item");
    </script>

</body>

</html>