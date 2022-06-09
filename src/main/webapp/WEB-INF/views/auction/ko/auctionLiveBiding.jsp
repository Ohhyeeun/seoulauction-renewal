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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>작품응찰신청 | Seoul Auction</title>
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

                    <!-- page title -->
                    <section class="page_title-section">
                        <div class="section-inner full_size">
                            <div class="center-box">
                                <h2 class="page_title"><span class="th1">작품응찰신청</span></h2>
                            </div>
                        </div>
                    </section>

                    <section class="basis-section bidding_application-section last-section">
                        <div class="section-inner">

                            <!-- 작품응찰신청 -->
                            <div class="content-panel type_panel-proceeding_bidding">
                                <div class="panel-header">
                                    <div class="title"><span id="sale_title"></span></div>
                                </div>
                                <div class="panel-body">

                                    <ul class="form_table_bidding">
                                        <!--  안내및비용 -->
                                        <li>
                                            <div class="product_info-area">
                                                <div class="guide">

                                                    <div class="product-box">
                                                        <p class="img"><img id="bidding_lot_img" alt="" /></p>
                                                        <div class="product_info">
                                                            <div class="num"><span class="tb1" id="lot_id">1</span></div>
                                                            <div class="title">
                                                                <div class="name"><span class="tt4" id="artist_name"></span></div>
                                                                <div class="desc">
                                                                    <span class="tb1" id="lot_title"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="member_pay">
                                                    <p>
                                                        <span class="tit ">추정가</span>
                                                        <span class="won" id="expe_price">/span>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- 응찰방법 -->
                                        <li>
                                            <div class="bidding-area">
                                                <p class="list_tit tt4">응찰방법</p>
                                                <div class="btn_radios js-bidding_method">
                                                    <div class="btn_item active">
                                                        <button class="btn btn_gray_line btn_lg " type="button"><span>서면</span></button>
                                                    </div>
                                                    <div class="btn_item">
                                                        <button class="btn btn_gray_line btn_lg" type="button"><span>전화</span></button>
                                                    </div>
                                                    <div class="btn_item">
                                                        <button class="btn btn_gray_line btn_lg" type="button"><span>서면+전화</span></button>
                                                    </div>
                                                </div>

                                                <div class="gray-box">
                                                    <div class="price_mark">

                                                        <div class="title">
                                                            <span>응찰가</span>
                                                        </div>
                                                        <!-- [0516]삭제 <div class="select-box"> 
                              <select class="select2Basic">
                                <option value="1">KRW 99,999,990,000</option>
                              </select>
                            </div> -->
                                                        <!-- [0516]select 변경 -->
                                                        <div class="select-box">
                                                            <div class="trp-dropdown-area h50-line_center">
                                                                <button class="js-dropdown-btn"><span id="selected_lot"></span><i class="icon-select_arrow"></i>
                                                                </button>
                                                                <div class="trp-dropdown_list-box" data-trp-focusid="js-user_support">
                                                                    <!-- <div class="legend-box">
                                    <span>(호가단위 : 100,000 KRW)</span>
                                  </div> -->
                                                                    <div class="list-box scroll-type">
                                                                        <ul id="select_lot_scroll">
                                                                            <!-- [0523]스크롤 미리보기를 위해 li 갯수 추가 -->
<%--                                                                            <li>--%>
<%--                                                                                <a href="#">--%>
<%--                                                                                    <div class="typo-area">--%>
<%--                                                                                        <span>1,500,000 KRW</span>--%>
<%--                                                                                    </div>--%>
<%--                                                                                </a>--%>
<%--                                                                            </li>--%>
                                                                            <!-- //[0523]스크롤 미리보기를 위해 li 갯수 추가 -->
                                                                        </ul>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <!-- // [0516]select 변경 -->

                                                        <div class="price">
                                                            <span id="price_to_han"></span>
                                                        </div>

                                                        <div class="unit">
                                                            <span id="grow_price"></span>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="help-box">
                                                    <i class="icon-inquiry_g"></i>
                                                    <ul>
                                                        <li><span>서면 : 접수된 서면(작품 희망가)은 보조경매서를 통해 대리 응찰</span></li>
                                                        <li><span>전화 : 경매가 진행될 때 담당직원과 전화 통화로 실시간 응찰</span></li>
                                                        <li><span>서면+전화 : 서면 입찰 및 전화 통화로 실시간 응찰</span></li>
                                                    </ul>
                                                </div>

                                            </div>
                                        </li>
                                        <!-- 회원 정보 확인 -->
                                        <li>
                                            <div class="contact-area">
                                                <p class="list_tit tt4">회원 정보 확인</p>
                                                <div class="gray-box">
                                                    <dl class="dtdd-list">
                                                        <dt><span>이름</span></dt>
                                                        <dd><span>${member.userNm}</span></dd>
                                                    </dl>
                                                    <dl class="dtdd-list">
                                                        <dt><span>주소</span></dt>
                                                        <dd><span>${member.addr} ( ${member.zipNo} )</span></dd>
                                                    </dl>
                                                    <dl class="dtdd-list">
                                                        <dt><span>휴대폰</span></dt>
                                                        <dd><span>010-1111-2222</span></dd>
                                                    </dl>
                                                    <dl class="dtdd-list">
                                                        <dt><span>이메일</span></dt>
                                                        <dd><span>gildong92@gmailssen.com</span></dd>
                                                    </dl>
                                                </div>
                                                <div class="help-box">
                                                    <i class="icon-inquiry_g"></i>
                                                    <ul>
                                                        <!-- [0523]오타수정 -->
                                                        <li><span>본인 또는 응찰자(경매참가자) 연락처가 맞는지 확인하시고, 수정이 필요할 경우 <마이페이지> 회원정보수정에서 할 수 있습니다.</span></li>
                                                        <!-- //[0523]오타수정 -->
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
                                                            <label for="checkbox_all">전체 동의</label>
                                                            <em>(필수)</em>
                                                        </span>
                                                        <button class="js-accordion_btn"><i class="icon-accordion_arrow_down"></i></button>
                                                    </div>

                                                    <div class="gray-box">
                                                        <ul class="terms-list policy js-accordion_policy">
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all1" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all1">본인은 서울옥션 경매 약관을 모두 알고 이해하였으며, 그 적용에 동의합니다. </label>
                                                                    <a href="#" class="link_target">약관 바로보기</a>
                                                                </div>
                                                            </li>
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all2" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all2">응찰은 작품 실물 및 컨디션을 확인하셨음을 전제로 합니다.</label>
                                                                </div>
                                                            </li>
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all3" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all3">낙찰자는 후 7일 이내(낙찰가 3억원 이상인 경우 21일 이내)에 구매수수료를 포함한 금액을 입금하여야 합니다.</label>
                                                                </div>
                                                            </li>
                                                            <li class="trp_acitem">
                                                                <div class="trp checkbox-box">
                                                                    <input id="checkbox_all4" class="js_item" type="checkbox" name="">
                                                                    <i></i>
                                                                    <label for="checkbox_all4">낙찰자가 ①지정된 기일에 낙찰대금을 납부하지 않거나, ②부득이 낙찰을 철회하는 경우, 낙찰가의 30%에 해당하는 금액을 낙찰철회비(위약금)로 납부하여야 합니다.</label>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="help-box">
                                                        <i class="icon-inquiry_g"></i>
                                                        <ul>
                                                            <li><span>응찰 관련 문의가 있으신 경우, 귀하의 담당자(
                                                                    <em>홍길동 02-1234-5678</em>
                                                                    )에게 연락주시기 바랍니다.</span></li>
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
                                            <a class="btn btn_default btn_lg"  role="button"><span>취소</span></a>
                                            <a class="btn btn_point btn_lg" role="button" id="biding_req_btn"><span>응찰신청</span></a>
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
    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>

    <script>
        $(function() {

            init();
            let currentPrice;
            let currentBidKind;

            <!-- 데이터 세팅 -->
            function init(){

                axios.get('api/auction/lot_info/${saleNo}/${lotNo}')
                    .then(function(response) {

                    let data = response.data.data;
                    let sale_title = JSON.parse(data.SALE_TITLE_JSON);

                    $("#bidding_lot_img").attr('src' , 'https://www.seoulauction.com/nas_img'+data.LOT_IMG_PATH + '/' +data.LOT_IMG_NAME);
                    $("#sale_title").html(sale_title.ko);
                    $("#lot_id").html(data.LOT_NO);
                    $("#artist_name").html(data.ARTIST_NAME_KO_TXT);
                    $("#lot_title").html(data.TITLE_KO_TXT);
                    $("#grow_price").html('(호가단위 : ' + numberWithCommas(data.GROW_PRICE) + ' KRW)');
                    $("#expe_price").html('KRW ' + numberWithCommas(data.EXPE_PRICE_FROM_JSON.KRW) + '<br> ~ ' + numberWithCommas(data.EXPE_PRICE_TO_JSON.KRW));

                    let current_price = data.START_PRICE;
                    currentPrice = data.START_PRICE;
                    currentBidKind = 'paper_offline';


                    $("#selected_lot").text(numberWithCommas(current_price) + ' KRW');
                    $("#price_to_han").text(num2han(current_price) + ' 원');

                    $("#select_lot_scroll").empty();
                    while (current_price <= data.EXPE_PRICE_TO_JSON.KRW) {

                        let commasCurrentPrice = numberWithCommas(current_price);

                        let select_html = `<li>
                            <a href="#">
                                <div class="typo-area">
                                    <span id="` + current_price + `">` + commasCurrentPrice + ` KRW</span>
                                </div>
                            </a>
                         </li>`;

                        $("#select_lot_scroll").append(select_html);

                        current_price += data.GROW_PRICE;
                    }

                    <!-- [0516] 셀렉트 드롭다운 -->
                    let dropdown = $(".js-dropdown-btn").trpDropdown({
                        list: ".trp-dropdown_list-box",
                        area: ".trp-dropdown-area"
                    });
                    $(".trp-dropdown-area .trp-dropdown_list-box a").on("click", function ($e) {
                        $e.preventDefault();
                        var _this = $(this);
                        _this.closest(".trp-dropdown-area").find(".js-dropdown-btn em").text($("em", _this).text());
                        _this.closest(".trp-dropdown-area").find(".js-dropdown-btn span").text($("span", _this).text());

                        currentPrice = $("span", _this).attr('id');

                        $("#price_to_han").text(num2han(currentPrice) + ' 원');
                        dropdown.getClose();
                    });
                })

                .catch(function(error){
                    console.log(error);
                });
            }

            <!-- 응찰방법 -->
            $(".js-bidding_method .btn_item").on("click", function($e) {
                $(".js-bidding_method .btn_item").removeClass("active");
                $(this).addClass("active");

                let bk = $(this).text().trim();
                if(bk == '서면'){
                    currentBidKind = 'paper_offline';
                }else if(bk == '전화'){
                    currentBidKind = 'phone';
                }else if(bk == '서면+전화'){
                    currentBidKind = 'floor';
                }
            });

            <!-- 약관 -->
            let accordion_toggle;
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

            //응찰 신청
            $("#biding_req_btn").on('click', function(){

                //전체 동의 확인
                if(!$('#checkbox_all').is(":checked")){
                    alert('전체 동의를 해주세요.');
                    return;
                }

                let url = '/api/auction/sale/${saleNo}/lot/${lotNo}/bid';

                try {
                    axios.post(url, {
                        bid_price: currentPrice,
                        bid_kind_cd: currentBidKind
                    }).then(function(response) {

                        if(response.data.success){
                            alert('응찰에 성공하셨습니다.');
                            location.href ='/auction/live/list/${saleNo}';
                        }
                    });

                } catch (error) {
                    console.error(error);
                }

            });

        });
    </script>

</body>

</html>