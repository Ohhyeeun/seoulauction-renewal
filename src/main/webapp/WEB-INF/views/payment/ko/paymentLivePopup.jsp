<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>


<body>
    <div class="wrapper footer-bottom footer-bottom30"> 
        <!--<div class="sub-wrap pageclass"> --> 
            <!-- header -->
            <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
            <!-- //header -->

            <!-- container --> 
            <div id="container" class="main-contents">   
                <div id="contents" class="contents pd50" style=""> 
                    <section class="basis-section last-section">
                        <div class="section-inner">
                            <a class="btn btn_default js-popup_offline_payment" href="#" role="button"><span>오프라인결제</span><i class="icon-page_next"></i></a>

                        </div>
                    </section>
                </div>
                <!--footer -->
                <footer class="footer"> 
                    <div class="innerfooter"> 
                        <section class="flex_wrap footer_menubox"> 
                            <ul class="footer-gnbmenu">
                                <li><a href="#">회사소개</a></li>  
                                <li><a href="#">언론보도</a></li>  
                                <li><a href="#">채용공고</a></li>  
                                <li><a href="#">위치안내</a></li>  
                                <li><a href="#">고객센터</a></li>   
                            </ul> 

                            <ul class="snsbox_icon">
                                <li><a href="#" class="sns-icon sns-icon01"></a></li> 
                                <li><a href="#" class="sns-icon sns-icon02"></a></li> 
                                <li><a href="#" class="sns-icon sns-icon03"></a></li> 
                                <li><a href="#" class="sns-icon sns-icon04"></a></li> 
                                <li><a href="#" class="sns-icon sns-icon05"></a></li>  
                            </ul>  
                        </section>
                        <section class="flex_wrap footer_infobox">  
                            <div class="footer-infomenubox"> 
                                <ul class="flex_wrap footer-infomenu"> 
                                    <li><a href="#">경매약관</a></li>   
                                    <li><a href="#">개인정보처리방침</a></li>   
                                    <li><a href="#">내부관리규정</a></li>  
                                </ul>

                                <div class="Familysite-selectbox"> 
                                    <a href="#none" class="Familysite">Family Site</a> 
                                    <ul class="familyselect">  
                                        <li><a href="https://www.auctionblue.com/index" target="_blank">Print Bakery</a></li>  
                                        <li><a href="https://printbakery.com/" target="_blank">Auction Blue</a></li>
                                        <li><a href="https://sotwo.com/" target="_blank">SOTOW</a></li> 
                                    </ul>
                                </div>   
                            </div> 

                            <p class="bottom-p-spacing20">
                                ㈜서울옥션 · 대표이사 : 이옥경   사업자등록번호 : 101-81-46818   통신판매업신고 : 종로 제01-2173호<br>
                                주소 : 서울특별시 종로구 평창31길 11 (평창동 465-10)  고객센터 : <a href="tel:02-395-0330">02-395-0330</a><br>
                                ⓒ Seoul Auction Corp.
                            </p>
                            <p>
                                (주)서울옥션이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 (주)서울옥션은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
                                따라서 (주)서울옥션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
                            </p>
                        </section>
                    </div> 
                </footer> 
            </div>
            <!-- //container -->
            <!-- stykey -->

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
            <!-- // stykey -->

        </div>
    <!--</div>--> 

    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>

    <script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>



    <!-- 오프라인결제 -->
    <div id="popup_offline_payment-wrap" class="trp popupfixed-wrap offline_payment-popup ">
        <div class="popup-dim"></div>
        <div class="popup-align mode-xl mode-mb_full">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title">2022 3월 라이브 경매</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <article class="articles-area">

                                    <div class="only-pc">
                                        <table class="table_base data-table name-payment_price">
                                            <thead>
                                                <tr>
                                                    <th>LOT</th>
                                                    <th>작가/작품명</th>
                                                    <th>낙찰가</th>
                                                    <th>수수료</th>
                                                    <th>구매가</th>
                                                    <th>배송비</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="">
                                                        <span>13</span>
                                                    </td>
                                                    <td class="">
                                                        <span class="tb1">이강소 무제-85031</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>13,000,000</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>2,340,000</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>15,340,000</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>0</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="">
                                                        <span>14</span>
                                                    </td>
                                                    <td class="">
                                                        <span class="tb1">개인 자작품 (KTS Audio, Western Electric Replica 외), Baroque Audio, Creation, Audio Note, Silvaweld / 은제이화문화병,은제이화문담배함,건칠이화문접시,은제이화문신선로,덕수궁마차출입패,유리이화문맥주잔,은제이화문인주함,채색놀이판,주칠가죽베개 일괄
                                                        </span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>13,000,000</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>2,340,000</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>15,340,000</span>
                                                    </td>
                                                    <td class="tar">
                                                        <span>0</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="">
                                                        <strong>합계</strong>
                                                    </td>
                                                    <td class="">
                                                        <strong></strong>
                                                    </td>
                                                    <td class="tar">
                                                        <strong>13,000,000</strong>
                                                    </td>
                                                    <td class="tar">
                                                        <strong>2,340,000</strong>
                                                    </td>
                                                    <td class="tar">
                                                        <strong>15,340,000</strong>
                                                    </td>
                                                    <td class="tar">
                                                        <strong>0</strong>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th colspan="6" class="tar">
                                                        <strong>총 결제금액</strong>
                                                        <em>15,340,000</em>
                                                    </th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="only-mb">

                                        <div class="payment_price-accordion">
                                            <div class="accordion-header">
                                                <a href="#" class="accordion-inner js-accordion-btn">
                                                    <div class="title">
                                                        <strong>낙찰작품</strong>
                                                    </div>
                                                    <div class="count">
                                                        <em>2</em>
                                                        <span>건</span>
                                                    </div>
                                                    <i class="icon-accordion_arrow-2x"></i>
                                                </a>
                                            </div>
                                            <div class="accordion-body">

                                                <ul class="work-list">
                                                    <li>
                                                        <div class="li-inner">

                                                            <div class="item-header">
                                                                <div class="image-area">
                                                                    <figure class="img-ratio">
                                                                        <div class="img-align">
                                                                            <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                                        </div>
                                                                    </figure>
                                                                </div>
                                                                <div class="typo-area">
                                                                    <div class="num"><span>13</span></div>
                                                                    <div class="title"><strong>데미안허스트</strong> <span>(1965)</span></div>
                                                                    <div class="desc"><span>Air</span></div>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <dl class="price-list">
                                                                    <dt>낙찰가</dt>
                                                                    <dd>7,000,000</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>수수료</dt>
                                                                    <dd>1,340,000</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>낙찰가</dt>
                                                                    <dd>8,340,000</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>배송비</dt>
                                                                    <dd>0</dd>
                                                                </dl>
                                                            </div>

                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">

                                                            <div class="item-header">
                                                                <div class="image-area">
                                                                    <figure class="img-ratio">
                                                                        <div class="img-align">
                                                                            <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                                        </div>
                                                                    </figure>
                                                                </div>
                                                                <div class="typo-area">
                                                                    <div class="num"><span>20</span></div>
                                                                    <div class="title"><strong>김건우</strong> <span></span></div>
                                                                    <div class="desc"><span>Air</span></div>
                                                                </div>
                                                            </div>
                                                            <div class="item-body">
                                                                <dl class="price-list">
                                                                    <dt>낙찰가</dt>
                                                                    <dd>6,000,000</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>수수료</dt>
                                                                    <dd>1,000,000</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>낙찰가</dt>
                                                                    <dd>7,00,000</dd>
                                                                </dl>
                                                                <dl class="price-list">
                                                                    <dt>배송비</dt>
                                                                    <dd>0</dd>
                                                                </dl>
                                                            </div>

                                                        </div>
                                                    </li>
                                                </ul>

                                            </div>
                                            <div class="accordion-footer">
                                                <div class="calculation-box">
                                                    <dl class="price-list">
                                                        <dt>합계</dt>
                                                        <dd></dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>낙찰가</dt>
                                                        <dd><strong>13,000,000</strong></dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>수수료</dt>
                                                        <dd>2,340,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>구매가</dt>
                                                        <dd>15,340,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>배송비</dt>
                                                        <dd>0</dd>
                                                    </dl>
                                                </div>
                                                <div class="total-box">
                                                    <dl class="price-list">
                                                        <dt>총결제금액</dt>
                                                        <dd><em>15,340,000</em></dd>
                                                    </dl>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </article>

                                <article class="articles-area">
                                    <div class="area-header">
                                        <div class="title">확인사항</div>
                                    </div>
                                    <div class="area-body">
                                        <ul class="mark_dot-list">
                                            <li class="">낙찰자는 낙찰을 철회할 수 없습니다.</li>
                                            <li class="">부득이 철회를 하는 경우에는 낙찰일로부터 7일 이내에 서면으로 철회의사를 통보하고, 위약별로 낙찰가의 30%에 해당하는 금액을 낙찰일로부터 7일 이내에 납부하여야 합니다.</li>
                                        </ul>
                                    </div>
                                </article>
                                <article class="articles-area">
                                    <div class="area-header">
                                        <div class="title">결제안내</div>
                                    </div>
                                    <div class="area-body">
                                        <div class="payment_info-box">
                                            <div class="text-account">
                                                <strong class="tt5">입금계좌</strong> <br class="only-mb" />
                                                <em class="tt5">우리은행 1005-902-012409</em>
                                                <span class="tt5">(서울옥션)</span>
                                            </div>
                                            <div class="text-notice">
                                                <i class="icon-inquiry"></i>
                                                <span class="tb2">입금 후 전화 확인 바랍니다 &nbsp; (<a href="tel:02-395-0330">02-395-0330</a>)</span>
                                            </div>
                                        </div>
                                        <p class="contact_us">
                                            <span>문의 <a href="tel:02-395-0330">02-395-0330</a> / 메일</span> <a href="mailto:sos@seoulauction.com">sos@seoulauction.com</a>
                                        </p>
                                        <ul class="mark_dot-list">
                                            <li class="">계좌입금 시 입금 메모란에 실제 낙찰자의 이름을 명시해 주십시오. 입금자와 낙찰자의 이름이 일치하지 않을 경우,
                                                입금확인이 어려울 수 있으며, 이에 대한 불이익은 서울옥션에서 책임지지 않습니다.</li>
                                            <li class="">낙찰자는 경매후 7일(낙찰가 3억원 이상인 경우는 21일) 이내에 구매수수료를 포함한 금액을 입금하신 후 작품을 인수하시기
                                                바랍니다.</li>
                                            <li class="">낙찰자는 응찰전 당사와의 합의에 의하여 구매대금을 분할 납부할 수 있습니다.</li>
                                            <li class="">낙찰자는 총 구매대금을 당사 지정의 은행계정송금, 자기앞수표, 현금 등으로 지불할 수 있습니다.</li>
                                        </ul>

                                    </div>
                                </article>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        (function() {
            var popup_offline_payment = $(".js-popup_offline_payment").trpLayerFixedPopup("#popup_offline_payment-wrap");
            $(popup_offline_payment.getBtn).on("click", function($e) {
                $e.preventDefault();
                console.log("open11")
                popup_offline_payment.open(this); // or false 
                popup_fixation("#popup_offline_payment-wrap");
            });

            $("body").on("click", "#popup_offline_payment-wrap .js-closepop, #popup_offline_payment-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_offline_payment.close();
            });

            /* 아코디언 */
            var pop_accordion = $(".js-accordion-btn").trpToggleBtn(
                function($this) {
                    $($this).addClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideDown("fast");
                },
                function($this) {
                    $($this).removeClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideUp("fast");
                });

        })();
    </script>
</body>
</html>