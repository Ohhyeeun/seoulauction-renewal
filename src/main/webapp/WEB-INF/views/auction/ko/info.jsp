<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../include/ko/header.jsp" flush="false"/>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/nav.jsp" flush="false"/>
        <!-- //header -->
        <script>
            app.value('locale', 'ko');
        </script>

        <!-- container -->
        <div id="container">
            <div id="contents" class="contents">
                <!-- page title -->
                <section class="page_title-section">
                    <div class="section-inner full_size">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">경매안내</span></h2>
                        </div>
                    </div>
                </section>

                <section class="basis-section tab-menu-section">
                    <div class="section-inner">
                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class="active"><a href="#tab-cont-1"><span>라이브경매안내</span></a></li>
                                    <li><a href="#tab-cont-2"><span>온라인경매안내</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="basis-section last-section infoaction-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-infoaction">
                            <div class="panel-body">
                                <div class="tab-cont active" id="tab-cont-1">
                                    <article class="infoaction-area">
                                        <div class="article-header">
                                            <div>
                                                <p class="tb1_1">서울옥션 미술품 경매는 지난 1998년부터 서울에서 시작해 지난 2008년에는 홍콩에 진출하였으며 매년 부산과 대구 등에서도 열리고 있습니다.</p>
                                                <ul class="mark_dot-list tb1_1 info_dot_list step0_list">
                                                    <li><em>라이브 경매</em> : 서울에서 열리는 정기 경매로 한국 근현대 작품, 해외작품, 고미술품 등이 출품됩니다.</li>
                                                    <li><em>홍콩 경매</em> : 한국 근현대 작품을 세계 시장에 알리고 해외에 흩어진 고미술품을 환수하며 또한 해외 유명 작가의 작품이 출품되는 경매로 연간 3-4회 열립니다.</li>
                                                    <li><em>기획 경매</em> : 기획 경매는 부산, 대구 등의 지역 경매는 물론 신진 작가 소개 및 자선 경매 등 테마가 있는 기획 작품을 선보입니다.</li>
                                                </ul>
                                            </div>
                                            <nav class="tab_move-bar js-tab_move">
                                                <ul>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step1">
                                                                <div class="teb_txt">STEP 01</div>
                                                                <div class="teb_title tb1">회원가입</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step2">
                                                                <div class="teb_txt">STEP 02</div>
                                                                <div class="teb_title tb1">프리뷰</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step3">
                                                                <div class="teb_txt">STEP 03</div>
                                                                <div class="teb_title tb1">응찰방법</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step4">
                                                                <div class="teb_txt">STEP 04</div>
                                                                <div class="teb_title tb1">응찰예약</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step5">
                                                                <div class="teb_txt">STEP 05</div>
                                                                <div class="teb_title tb1">낙찰확인 및 결제</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step6">
                                                                <div class="teb_txt">STEP 06</div>
                                                                <div class="teb_title tb1">수령 및 배송</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <div class="article-body">
                                            <div class="step-area">
                                                <div class="step_stage" id="view-step1">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 01</div>
                                                        <div class="teb_title tt3">회원 가입</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_header">
                                                            <ol class="tb1_1">
                                                                <li><span>1. 서울옥션 라이브 경매는 <em>정회원에 가입한 회원에</em> 한해 응찰에 참여할 수 있습니다.</span></li>
                                                                <li>2. 정회원 가입은 서울옥션 홈페이지 신청은 물론 전시 및 경매 현장에서도 가입 가능합니다.</li>
                                                                <li>3. 정회원의 연회비는 국내 거주자 20만원, 해외 거주자 500USD이며 부가세는 별도입니다.</li>
                                                                <li>4. 정회원 등록시 도록, 전시 안내 등의 간행물 수령은 물론 다양한 혜택을 받을 수 있습니다.</li>
                                                            </ol>
                                                            <div class="inquiry_txt">
                                                                <i class="icon-inquiry"></i>
                                                                <span class="tb1">단, 정회원에 현장가입되었더라도 서울옥션 홈페이지 회원에 가입되지 않은 회원은 온라인 경매에 참여하실 수 없으므로 온라인 경매 참여를 원할 시 서울옥션 홈페이지 www.seoulauction.com에 회원 가입을 별도로 해 주시기 바랍니다.</span>
                                                            </div>
                                                        </div>
                                                        <div class="con_body">
                                                            <div class="join_box">
                                                                <ul>
                                                                    <li>
                                                                        <div class="box_header">
                                                                            <img src="/images/mobile/footer/icon_live_01.png">
                                                                            <p class="tt4">홈페이지 회원가입</p>
                                                                        </div>
                                                                        <div class="box_body">
                                                                            <div class="txt_area">
                                                                                <p class="tb1">서울옥션 홈페이지 회원가입시 회원 가입 절차에 따라 작성을 완료해 주시기 바랍니다.</p>
                                                                                <div class="btn_box">
                                                                                    <a href="/join" class="btn btn_default">
                                                                                        <span>회원가입</span>
                                                                                    </a>
                                                                                </div>
                                                                            </div>
                                                                            <div class="explanation_area">
                                                                                <dl>
                                                                                    <dt>
                                                                                        <i class="icon-inquiry only-pc"></i>
                                                                                        <span class="tb1">홈페이지 정회원 가입 방법</span>
                                                                                    </dt>
                                                                                    <dd class="tb1">로그인 후 마이페이지 > 정회원 결제하기 버튼을 클릭하면 카드/가상계좌로 연회비 결제가 가능합니다. </dd>
                                                                                </dl>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="box_header">
                                                                            <img src="/images/mobile/footer/icon_live_02.png">
                                                                            <p class="tt4">전시/경매 현장 가입</p>
                                                                        </div>
                                                                        <div class="box_body">
                                                                            <div class="txt_area">
                                                                                <p class="tb1">서울옥션 본사 및 강남센터, 홍콩 법인 등 방문 시 정회원 등록을 신청하시면 가입하실 수 있습니다.</p>
                                                                            </div>
                                                                            <div class="explanation_area">
                                                                                <dl>
                                                                                    <dt>
                                                                                        <i class="icon-inquiry only-pc"></i>
                                                                                        <span class="tb1">현장에서 회원가입 및 결제를 진행하신 경우</span>
                                                                                    </dt>
                                                                                    <dd class="tb1">담당직원이 확인 후 정회원 전환 진행을 도와드립니다.</dd>
                                                                                </dl>
                                                                                <dl>
                                                                                    <dt>
                                                                                        <i class="icon-inquiry only-pc"></i>
                                                                                        <span class="tb1">도록 뒷장에 신청서를 작성하여 FAX로 보내신 경우</span>
                                                                                    </dt>
                                                                                    <dd class="tb1">입금 뒤 전화하시면 회원 가입 여부를 신속하게 확인할 수 있습니다.</dd>
                                                                                </dl>
                                                                                <dl>
                                                                                    <dt class="exception_txt">
                                                                                        <span class="tb1">정회원 계좌안내</span>
                                                                                    </dt>
                                                                                    <dd class="tb1">우리은행 1005-701-207754 서울옥션</dd>
                                                                                </dl>
                                                                                <dl>
                                                                                    <dt>
                                                                                        <i class="icon-inquiry only-pc"></i>
                                                                                        <span class="tb1">문의</span>
                                                                                    </dt>
                                                                                    <dd class="tb1">전화 02-395-0330</dd>
                                                                                    <dd class="tb1"><span>메일</span><a href="mailto:sos@seoulauction.com"> sos@seoulauction.com</a></dd>
                                                                                </dl>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step2">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 02</div>
                                                        <div class="teb_title tt3">프리뷰</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_header">
                                                            <ul class="mark_dot-list tb1_1 info_dot_list step2">
                                                                <li>프리뷰는 경매에 출품된 모든 작품을 감상하고 상태를 확인할 수 있는 전시회입니다.</li>
                                                                <li>프리뷰 관람은 경매 응찰과 관계없이 누구나 무료로 관람이 가능합니다.</li>
                                                                <li>프리뷰 전시장에서 스페셜리스트에게 요청하시면 경매 작품에 대한 안내를 받으실 수 있습니다.</li>
                                                                <li>프리뷰 일정은 문자, SNS, 홈페이지, 도록(초대장) 등을 통해 공지 됩니다.</li>
                                                            </ul>
                                                        </div>
                                                        <div class="con_body">
                                                            <div class="preview_box">
                                                                <div class="inner">
                                                                    <div class="img_box">
                                                                        <img src="/images/mobile/footer/icon_live_03.png">
                                                                    </div>
                                                                    <ul class="mark_dot-list tb1 info_dot_list step2_2">
                                                                        <li>당사는 경매물품을 있는 그대로 출품합니다.</li>
                                                                        <li>경매되는 작품상태에 대한 보증은 경매 시점의 상태에 준합니다.</li>
                                                                        <li>전시를 통해 작품의 실물을 확인하였음을 전제로 진행합니다.</li>
                                                                        <li>프리뷰 전시를 통해 작품의 상태를 충분히 확인하시고 응찰하시길 권유합니다.</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step3">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 03</div>
                                                        <div class="teb_title tt3">응찰 방법</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_header">
                                                            <div class="means_txt_wrap">
                                                                <div class="txt_box">
                                                                    <p class="tb1_1">경매 응찰 방법은 아래와 같이 4가지 방법으로 가능합니다.</p>
                                                                    <p class="tb1_1">경매 응찰 후 해당 작품을 낙찰 받으시면 구매 취소가 어려우니 신중히 선택하시기 바랍니다.</p>
                                                                </div>
                                                                <div class="btn_box">
                                                                    <a class="btn btn_gray_line">
                                                                        <%--TODO 응찰 등록 신청서 파일 다운로드--%>
                                                                        <span>응찰등록신청서</span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="con_body">
                                                            <div class="means_box_wrap">
                                                                <div class="means_box">
                                                                    <ul>
                                                                        <li>
                                                                            <div class="inner">
                                                                                <div class="img_box">
                                                                                    <img src="/images/mobile/footer/icon_live_04.png">
                                                                                </div>
                                                                                <dl>
                                                                                    <dt class="tt4">현장 응찰</dt>
                                                                                    <dd class="tb1">경매 당일 현장에서 응찰 등록서 작성 후, 패들을 부여 받아 직접 응찰 할 수 있습니다.</dd>
                                                                                </dl>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="inner">
                                                                                <div class="img_box">
                                                                                    <img src="/images/mobile/footer/icon_live_05.png">
                                                                                </div>
                                                                                <dl>
                                                                                    <dt class="tt4">전화 응찰</dt>
                                                                                    <dd class="tb1">사전에 전화응찰 신청을 하고, 경매 당일 담당 직원과 전화 통화를 통하여 실시간으로 대리 응찰을 진행할 수 있습니다.</dd>
                                                                                </dl>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="inner">
                                                                                <div class="img_box">
                                                                                    <img src="/images/mobile/footer/icon_live_06.png">
                                                                                </div>
                                                                                <dl>
                                                                                    <dt class="tt4">서면 응찰</dt>
                                                                                    <dd class="tb1">접수된 서면은 보조경매사를 통해 대리 응찰이 이뤄집니다. 서면응찰자의 응찰금액이 동일할 경우, 당사에 먼저 응찰서를 제출한 응찰자에게 낙찰됩니다.
                                                                                        <p class="tb1">서면: 당사의 소정 양식에 따라 서면으로 작품 희망가 최고 한도까지 제출하는 방식 </p>
                                                                                    </dd>
                                                                                </dl>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="inner">
                                                                                <div class="img_box">
                                                                                    <img src="/images/mobile/footer/icon_live_07.png">
                                                                                </div>
                                                                                <dl>
                                                                                    <dt class="tt4">온라인 라이브 응찰</dt>
                                                                                    <dd class="tb1">홈페이지에서 사전 신청하여 온라인 패들 번호 부여받은 후, 경매 당일 온라인 라이브경매 페이지에서 경매 진행 상황을 모니터링하며 응찰 버튼을 눌러 응찰할 수 있습니다.</dd>
                                                                                </dl>
                                                                            </div>
                                                                        </li>

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step4">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 04</div>
                                                        <div class="teb_title tt3">응찰 예약</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_header">
                                                            <p class="tb1">라이브 경매 참여 시, 미리 경매참여 예약을 하실 수 있습니다.</p>
                                                        </div>
                                                        <div class="con_body">
                                                            <div class="join_box reservation_box">
                                                                <ul>
                                                                    <li>
                                                                        <div class="box_header">
                                                                            <img src="/images/mobile/footer/icon_live_08.png">
                                                                            <p class="tt4">응찰등록신청서 제출</p>
                                                                        </div>
                                                                        <div class="box_body">
                                                                            <div class="txt_area">
                                                                                <ul class="mark_dot-list tb1 info_dot_list step4">
                                                                                    <li>경매의 서면 및 전화로 응찰을 원하는 회원분들은 도록 뒷부분에 있는 응찰등록신청서를 작성해 제출해주시기 바랍니다.</li>
                                                                                    <li>응찰 마감을 위한 서류 접수는 팩스를 통해 경매 전일 오후 7시까지 접수해주시기 바랍니다.</li>
                                                                                </ul>
                                                                            </div>

                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="box_header">
                                                                            <img src="/images/mobile/footer/icon_live_09.png">
                                                                            <p class="tt4">홈페이지 응찰 예약 신청</p>
                                                                        </div>
                                                                        <div class="box_body">
                                                                            <div class="txt_area">
                                                                                <ul class="mark_dot-list tb1 info_dot_list step4">
                                                                                    <li>현장/서면/전화 응찰을 원하는 경우, 홈페이지에서 편리하게 작품 응찰 신청이 가능합니다.</li>
                                                                                    <li>홈페이지 가입 후 정회원이면 홈페이지에서 응찰 신청이 가능합니다.</li>
                                                                                    <li>작품응찰신청 내역은 마이페이지 > 라이브경매관리 > 응찰신청내역에서 확인하실 수 있습니다.</li>
                                                                                    <li>응찰 마감은 홈페이지에서 가능하며 응찰 신청은 경매 전일까지 접수 가능합니다.</li>
                                                                                </ul>
                                                                            </div>

                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step5">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 05</div>
                                                        <div class="teb_title tt3">낙찰확인 및 결제</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_body">
                                                            <div class="identify_box">
                                                                <ol>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">1. 낙찰 및 우선 순위</dt>
                                                                            <dd class="tb1">내정가 이상으로 최고가를 제시한 응찰자에게 경매작품이 낙찰되며, 동일 금액의 경우 아래 기준에 따라 낙찰이 결정됩니다. <br>현장, 서면, 전화응찰자가 동일한 금액으로 경합할 경우에는 서면 > 현장 > 전화응찰자순으로 우선 순위가 주어집니다.</dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">2. 낙찰 확인</dt>
                                                                            <dd class="tb1">낙찰 시, 현장에서 낙찰확인서에 본인 서명을 반드시 해 주시기 바랍니다.
                                                                                <div class="inquiry_txt">
                                                                                    <i class="icon-inquiry"></i>
                                                                                    <span class="tb1">낙찰자는 낙찰을 철회할 수 없습니다. 부득이 철회를 하는 경우에는 낙찰일로부터 7일 이내에 서면으로 철회의사를 통보하고, 위약별로 <em>낙찰가의 30%</em>에 해당하는 금액을 <em>낙찰일로부터 7일 이내에</em> 납부하여야 합니다.</span>
                                                                                </div>
                                                                                <div class="btn_box">
                                                                                    <a href="/footer/terms" class="btn btn_default">
                                                                                        <span>경매약관</span>
                                                                                    </a>
                                                                                </div>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">3. 구매 수수료</dt>
                                                                            <dd class="tb1">
                                                                                <ul>
                                                                                    <li><span><em>국내경매</em> : 일괄 18% (부가세 별도)</span></li>
                                                                                    <li><span><em>홍콩경매</em> : 일괄 18% </span></li>
                                                                                </ul>
                                                                                <ul class="txt_box">
                                                                                    <li><span><em>낙찰가(Hammer Price)</em> : 경매사가 낙찰봉을 두드리면서 낙찰된 금액</span></li>
                                                                                    <li><span><em>구매가(Purchase Price)</em> : 낙찰가 + 낙찰 수수료 + 부가가치세가 합산된 금액 </span></li>
                                                                                </ul>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">4. 결제 안내</dt>
                                                                            <dd class="tb1">낙찰받은 작품에 대한 총 구매대금 결제방법은 아래와 같습니다
                                                                                <div class="txt_box_last">
                                                                                    <div>
                                                                                        <div class="inquiry_txt">
                                                                                            <i class="icon-inquiry"></i>
                                                                                            <span class="tb1">계좌 입금</span>
                                                                                        </div>
                                                                                        <ul>
                                                                                            <li><em>입금 계좌번호 : 우리은행 1005-902-012409 (주)서울옥션</em> (입금 후 전화 확인 바랍니다)</li>
                                                                                            <li><em>문의</em> : 전화 02-395-0330, 메일 <a href="mailto:sos@seoulauction.com">sos@seoulauction.com</a></li>
                                                                                        </ul>
                                                                                        <p>계좌입금 시 입금 메모란에 실제 낙찰자의 이름을 명시해 주십시오. 입금자와 낙찰자의 이름이 일치하지 않을 경우, 입금확인이 어려울 수 있으며, 이에 대한 불이익은 서울옥션에서 책임지지 않습니다.</p>
                                                                                    </div>


                                                                                    <div class="txt_area">
                                                                                        <ul class="mark_dot-list tb1 info_dot_list">
                                                                                            <li>낙찰자는 경매 후 7일(낙찰가 3억원 이상인 경우는 21일) 이내에 구매수수료를 포함한 금액을 입금하신 후 작품을 인수하시기 바랍니다.</li>
                                                                                            <li>낙찰자는 응찰 전 당사와의 합의에 의하여 구매대금을 분할 납부할 수 있습니다.</li>
                                                                                            <li>낙찰자는 총 구매대금을 당사 지정의 은행계정송금, 자기앞수표, 현금 등으로 지불할 수 있습니다.</li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                </ol>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step6">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 06</div>
                                                        <div class="teb_title tt3">수령 및 배송</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_body">
                                                            <div class="ship_box">
                                                                <div class="txt_box">
                                                                    <p class="tt4">낙찰자 작품 인수 방법</p>
                                                                    <ol class="tb1">
                                                                        <li>1. 경매의 낙찰작품은 <em>담당자를 통해</em> 일정을 확인 할 수 있습니다.</li>
                                                                        <li>2. 작품 직접 수령장소 : <em>서울시 종로구 평창30길 24 (평창동98번지) 서울옥션하우스 지하1층 수장고</em>에서만 가능합니다.</li>
                                                                        <li>3. 낙찰 작품의 <em>희망 수령 날짜 하루 전까지</em> '판매 담당자'와 <em>방문일자 예약 필히</em> 하신 후 방문 부탁드립니다.
                                                                            <p>전일 방문 예약제로 운영하오니, <em>예약없이 당일 방문시 작품 수령 불가능합니다.</em></p>
                                                                        </li>
                                                                        <li>4. 작품수령 가능 요일, 시간 : <em>월요일 ~ 금요일</em>(법정 공휴일 제외) / 당사 업무시간 오전 9시 ~ 6시 점심시간(오전 12시~오후1시) 제외.
                                                                            <p>낙찰자 승용차에 작품 상차시 참고 : 작품 전체 크기 <em>90 * 118cm</em>까지 가능함(캔버스 50호 크기)</p>
                                                                        </li>
                                                                        <li>5. 낙찰자 직접 작품 수령이 어려울 경우 당사는 <em>낙찰자의 책임과 비용부담 하에</em> 작품의 운송(미술품운송 전문업체)을 주선해드립니다.
                                                                            <p>작품 파손, 분실의 위험이 크므로 <em>택배업체는 주선 안함</em></p>
                                                                        </li>
                                                                    </ol>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="tab-cont" id="tab-cont-2">
                                    <article class="infoaction-area">
                                        <div class="article-header">
                                            <div>
                                                <p class="tb1_1">서울옥션이 국내 최초로 시작한 온라인 경매는 폭넓은 작가군과 합리적인 가격의 작품을 선보입니다.</p>
                                                <p class="tb1_1">미술품과 더불어 명품 및 주얼리, 오디오, 디자인가구, 피규어 등 누구나 쉽게 경매에 참여할 수 있는 라이프스타일 아이템을 선보입니다.</p>
                                            </div>
                                            <nav class="tab_move-bar js-tab_move online_tab">
                                                <ul>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step1_online">
                                                                <div class="teb_txt">STEP 01</div>
                                                                <div class="teb_title tb1">회원가입</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step2_online">
                                                                <div class="teb_txt">STEP 02</div>
                                                                <div class="teb_title tb1">프리뷰</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step3_online">
                                                                <div class="teb_txt">STEP 03</div>
                                                                <div class="teb_title tb1">응찰방법</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step4_online">
                                                                <div class="teb_txt">STEP 04</div>
                                                                <div class="teb_title tb1">낙찰확인 및 결제</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="li-inner">
                                                            <a href="#view-step5_online">
                                                                <div class="teb_txt">STEP 05</div>
                                                                <div class="teb_title tb1">수령 및 배송</div>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <div class="article-body">
                                            <div class="step-area">
                                                <div class="step_stage" id="view-step1_online">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 01</div>
                                                        <div class="teb_title tt3">회원 가입</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_header">
                                                            <div>
                                                                <p class="tb1_1">서울옥션 미술품 온라인 경매는 별도의 가입비 없이 홈페이지에서 회원 가입 후 경매 전 인증을 마치면 누구나 참여 가능합니다.</p>
                                                                <p class="tb1_1">단, 오프라인 미술품 경매는 정회원(유료 회원)에 가입한 회원에 한해 응찰에 참여하실 수 있습니다. </p>
                                                            </div>
                                                            <div class="inquiry_txt">
                                                                <i class="icon-inquiry"></i>
                                                                <span class="tb1">서울옥션 홈페이지 회원 가입 절차에 따라 작성을 완료해 주시기 바랍니다.</span>
                                                            </div>
                                                        </div>
                                                        <div class="con_body">
                                                            <div class="join_box">
                                                                <ul class="join_box_online">
                                                                    <li>
                                                                        <div class="box_header">
                                                                            <img src="/images/mobile/footer/icon_live_01.png">
                                                                            <p class="tt4">홈페이지 회원가입</p>
                                                                        </div>
                                                                        <div class="box_body">
                                                                            <div class="txt_area">
                                                                                <div class="btn_set">
                                                                                    <div class="btn_box">
                                                                                        <a class="btn btn_default">
                                                                                            <span>회원가입</span>
                                                                                        </a>
                                                                                    </div>
                                                                                    <div class="btn_box">
                                                                                        <a class="btn btn_default">
                                                                                            <span>현재 진행중인 경매</span>
                                                                                        </a>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step2_online">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 02</div>
                                                        <div class="teb_title tt3">프리뷰</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_header">
                                                            <ul class="mark_dot-list tb1_1 info_dot_list step2">
                                                                <li>프리뷰는 경매에 출품된 모든 작품을 감상하고 상태를 확인할 수 있는 전시회입니다.</li>
                                                                <li>프리뷰 관람은 경매 응찰과 관계없이 누구나 무료로 관람이 가능합니다.</li>
                                                                <li>프리뷰 전시장에서 스페셜리스트에게 요청하시면 경매 작품에 대한 안내를 받으실 수 있습니다.</li>
                                                                <li>프리뷰 일정은 문자, SNS, 홈페이지, 도록(초대장) 등을 통해 공지 됩니다.</li>
                                                            </ul>
                                                        </div>
                                                        <div class="con_body">
                                                            <div class="preview_box">
                                                                <div class="inner">
                                                                    <div class="img_box">
                                                                        <img src="/images/mobile/footer/icon_live_03.png">
                                                                    </div>
                                                                    <ul class="mark_dot-list tb1 info_dot_list step2_2">
                                                                        <li>당사는 경매물품을 있는 그대로 출품합니다.</li>
                                                                        <li>경매되는 작품상태에 대한 보증은 경매 시점의 상태에 준합니다.</li>
                                                                        <li>전시를 통해 작품의 실물을 확인하였음을 전제로 진행합니다.</li>
                                                                        <li>프리뷰 전시를 통해 작품의 상태를 충분히 확인하시고 응찰하시길 권유합니다.</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step3_online">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 03</div>
                                                        <div class="teb_title tt3">응찰 방법</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_header">
                                                            <ul class="mark_dot-list tb1_1 info_dot_list step2">
                                                                <li>프리뷰 전시 기간 동안 홈페이지를 통해 응찰 가능하며, 경매 마감 시간부터 lot 번호 순차적으로 마감됩니다.</li>
                                                                <li>경매 마감시간 30초 전에 응찰이 있을 경우, 자동으로 30초 연장 됩니다.</li>
                                                                <li>온라인 경매 회차에 따라 위 마감 시간이 다를 수 있습니다.</li>
                                                                <li>동의 절차를 거친 뒤 온라인 응찰을 진행하실 수 있습니다.</li>
                                                            </ul>
                                                            <div class="means_txt_wrap_online">
                                                                <div class="inner">
                                                                    <div class="inquiry_txt">
                                                                        <i class="icon-inquiry"></i>
                                                                        <span class="tb1">온라인 경매 전, 익스플로러를 사용 하시는 경우 설정을 확인해 주시기 바랍니다.</span>
                                                                    </div>
                                                                    <div class="btn_box">
                                                                        <a class="btn btn_gray_line">
                                                                            <span>온라인 경매 페이지 자동 새로고침 해결 방법</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="con_body">
                                                            <div class="join_box">
                                                                <ul>
                                                                    <li>
                                                                        <div class="box_header">
                                                                            <img src="/images/mobile/footer/icon_live_04.png">
                                                                            <p class="tt4 onlime_item">1회 응찰</p>
                                                                        </div>
                                                                        <div class="box_body box_body_online">
                                                                            <div class="txt_area">
                                                                                <p class="tb1">주어진 금액에 따라 1회씩 수동응찰</p>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="box_header">
                                                                            <img src="/images/mobile/footer/icon_live_07.png">
                                                                            <p class="tt4 onlime_item">자동응찰</p>
                                                                        </div>
                                                                        <div class="box_body box_body_online">
                                                                            <div class="txt_area">
                                                                                <p class="tb1">작품의 한도액을 미리 설정해 자동으로 응찰</p>
                                                                                <p class="tb1"><em>자동응찰의 경우 상대 응찰자가 없으면 최소<br> 금액으로 낙찰됩니다.</em></p>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <dl class="online_table_box">
                                                                <dt>
                                                                    <p class="tb1_1">다음과 같이 온라인 경매 응찰 금액대별 호가단위가 자동 변경됩니다.</p>
                                                                    <p class="tb1_1">이는 2019년 11월 1일자 기준, 온라인 상에서 진행되는 모든 경매부터 적용됩니다.</p>
                                                                </dt>
                                                                <dd>
                                                                    <table class="table_base data-table name-bid_commission">
                                                                        <thead>
                                                                        <tr>
                                                                            <th>이상</th>
                                                                            <th>미만</th>
                                                                            <th>호가</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <span>~</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>100만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>5만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>100만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>300만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>10만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>300만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>500만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>20만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>500만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>1000만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>20만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>1000만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>3000만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>50만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>3000만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>5000만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>100만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>5000만원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>1억원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>200만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>1억원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>2억원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>300만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <span>2억원</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>~</span>
                                                                            </td>
                                                                            <td>
                                                                                <span>500만원</span>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step4_online">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 04</div>
                                                        <div class="teb_title tt3">낙찰확인 및 결제</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_body">
                                                            <div class="identify_box">
                                                                <ol>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">1. 낙찰 및 우선 순위</dt>
                                                                            <dd class="tb1">경매 낙찰은 시작 후 최고가를 제시한 응찰자에게 경매작품이 낙찰되며, 자동응찰 > 수동 응찰 순으로 우선적으로 낙찰 기회가 주어집니다. <br>동일한 금액의 응찰이 발생할 경우 서버시각에 따라 먼저 응찰금액을 입력하신 분에게 우선 순위가 주어집니다. <br>응찰 시 응찰 단위 기준으로 금액이 상승합니다.</dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">2. 낙찰 확인</dt>
                                                                            <dd class="tb1">낙찰 시, 이메일로 낙찰확인서가 발송 됩니다. 혹은 홈페이지 로그인 > 마이페이지 > 온라인 경매관리>결제/구매내역에서 낙찰 금액 및 수수료를 확인 하실 수 있습니다.
                                                                                <div class="inquiry_txt">
                                                                                    <i class="icon-inquiry"></i>
                                                                                    <span class="tb1">낙찰자는 낙찰을 철회할 수 없습니다. 부득이 철회를 하는 경우에는 낙찰일로부터 7일 이내에 서면으로 철회의사를 통보하고, 위약별로 <em>낙찰가의 30%</em>에 해당하는 금액을 <em>낙찰일로부터 7일 이내에</em> 납부하여야 합니다.</span>
                                                                                </div>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">3. 구매 수수료</dt>
                                                                            <dd class="tb1">
                                                                                <ul>
                                                                                    <li>낙찰가에 따른 낙찰수수료는 기본적으로 아래의 방침을 따릅니다. 단, 내부정책에 따라 다른 수수료율이 적용되는 경우가 있습니다.</li>
                                                                                    <li><span><em>온라인 경매 일괄</em> : 18% (부가세 별도) </span></li>
                                                                                </ul>
                                                                                <ul class="txt_box">
                                                                                    <li><span><em>낙찰가(Hammer Price)</em> : 경매사가 낙찰봉을 두드리면서 낙찰된 금액</span></li>
                                                                                    <li><span><em>구매가(Purchase Price)</em> : 낙찰가 + 낙찰 수수료 + 부가가치세가 합산된 금액 </span></li>
                                                                                </ul>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                    <li>
                                                                        <dl>
                                                                            <dt class="tt4">4. 결제 안내</dt>
                                                                            <dd class="tb1">낙찰받은 작품에 대한 총 구매대금 결제방법은 아래와 같습니다
                                                                                <div class="txt_box_last">
                                                                                    <div class="article">
                                                                                        <div class="inquiry_txt">
                                                                                            <i class="icon-inquiry"></i>
                                                                                            <span class="tb1">계좌 입금</span>
                                                                                        </div>
                                                                                        <ul>
                                                                                            <li><em>온라인 경매 : 우리은행 1005-200-281649 (주)서울옥션</em> (입금 후 전화 확인 바랍니다)</li>
                                                                                            <li><em>제로베이스 경매 : 우리은행 1005-403-971518 (주)서울옥션</em> (입금 후 전화 확인 바랍니다)</li>
                                                                                            <li><em>문의</em> : 전화 02-395-0330, 메일 <a href="mailto:sos@seoulauction.com">sos@seoulauction.com</a></li>
                                                                                        </ul>
                                                                                        <p>계좌입금 시 입금 메모란에 실제 낙찰자의 이름을 명시해 주십시오. 입금자와 낙찰자의 이름이 일치하지 않을 경우, 입금확인이 어려울 수 있으며, 이에 대한 불이익은 서울옥션에서 책임지지 않습니다.</p>
                                                                                    </div>
                                                                                    <div class="article">
                                                                                        <div class="inquiry_txt">
                                                                                            <i class="icon-inquiry"></i>
                                                                                            <span class="tb1">홈페이지 결제</span>
                                                                                        </div>
                                                                                        <ul>
                                                                                            <li>온라인 경매의 작품은 홈페이지 내에서 카드 결제가 가능합니다. 고가품의 경우 카드사의 방침에 의해 결제가 불가능할 수 있습니다.</li>
                                                                                            <li>낙찰자는 로그인 후, 마이페이지 > 온라인경매관리 > 결제/구매내역에서 낙찰내역 확인과 결제를 진행해 주시기 바랍니다.</li>
                                                                                        </ul>
                                                                                    </div>
                                                                                    <div class="article">
                                                                                        <div class="inquiry_txt">
                                                                                            <i class="icon-inquiry"></i>
                                                                                            <span class="tb1">방문결제 입금</span>
                                                                                        </div>
                                                                                        <ul>
                                                                                            <li>온라인 결제가 불가능한 카드로 결제를 원하실 경우, 서울옥션 (평창동 본사)에 방문 후결제가 가능합니다.</li>
                                                                                            <li>사전에 결제 문의를 주시면 담당자가 관련 안내 드리겠습니다.</li>
                                                                                        </ul>
                                                                                    </div>


                                                                                    <div class="txt_area">
                                                                                        <ul class="mark_dot-list tb1 info_dot_list">
                                                                                            <li>낙찰자는 경매 후 7일(낙찰가 3억원 이상인 경우는 21일) 이내에 구매수수료를 포함한 금액을 입금하신 후 작품을 인수하시기 바랍니다.</li>
                                                                                            <li>낙찰자는 응찰 전 당사와의 합의에 의하여 구매대금을 분할 납부할 수 있습니다.</li>
                                                                                            <li>낙찰자는 총 구매대금을 당사 지정의 은행계정송금, 자기앞수표, 현금 등으로 지불할 수 있습니다.</li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </dd>
                                                                        </dl>
                                                                    </li>
                                                                </ol>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="step_stage" id="view-step5_online">
                                                    <div class="step_title">
                                                        <div class="teb_txt tb2">STEP 05</div>
                                                        <div class="teb_title tt3">수령 및 배송</div>
                                                    </div>
                                                    <div class="step_con">
                                                        <div class="con_body">
                                                            <div class="ship_box">
                                                                <div class="txt_box">
                                                                    <p class="tt4">낙찰자 작품 인수 방법</p>
                                                                    <ol class="tb1">
                                                                        <li>1. 경매의 낙찰작품은 <em>구매자 직접 작품수령</em>을 원칙으로 합니다.</li>
                                                                        <li>2. 작품 직접 수령장소 : <em>서울시 종로구 평창30길 24 (평창동98번지) 서울옥션하우스 지하1층 수장고</em>에서만 가능합니다.</li>
                                                                        <li>3. 낙찰 작품의 <em>희망 수령 날짜 하루 전까지</em> '판매 담당자'와 <em>방문일자 예약 필히</em> 하신 후 방문 부탁드립니다.
                                                                            <p>전일 방문 예약제로 운영하오니, <em>예약없이 당일 방문시 작품 수령 불가능합니다.</em></p>
                                                                        </li>
                                                                        <li>4. 작품수령 가능 요일, 시간 : <em>월요일 ~ 금요일</em>(법정 공휴일 제외) / 당사 업무시간 오전 9시 ~ 6시 점심시간(오전 12시~오후1시) 제외.
                                                                            <p>낙찰자 승용차에 작품 상차시 참고 : 작품 전체 크기 <em>90 * 118cm</em>까지 가능함(캔버스 50호 크기)</p>
                                                                        </li>
                                                                        <li>5. 낙찰자 직접 작품 수령이 어려울 경우 당사는 <em>낙찰자의 책임과 비용부담 하에</em> 작품의 운송(미술품운송 전문업체)을 주선해드립니다.
                                                                            <p>작품 파손, 분실의 위험이 크므로 <em>택배업체는 주선 안함</em></p>
                                                                        </li>
                                                                    </ol>
                                                                </div>
                                                                <div class="txt_area">
                                                                    <p class="tb1_1">기본 배송(편도)</p>
                                                                    <ul class="mark_dot-list tb1_1 info_dot_list step5">
                                                                        <li>서울 및 수도권 지역 무료 배송 진행</li>
                                                                        <li>수도권 외 지역은 월 2회 운송사 지정 일정(주말 포함)에 맞춰 일괄 무료 배송 진행</li>
                                                                        <li>상기 일정 외 개별 운송 진행 및 도서 산간(제주 포함)지역, 해외 운송의 경우 운송비 고객 부담</li>
                                                                        <li>특수 설치 및 추가 운송 인력 소요 작품의 경우 고객 비용 부담</li>
                                                                        <li>배송 문의: 02-2075-4404</li>
                                                                    </ul>
                                                                    <div class="bottom_txt">
                                                                        <p class="tb1_1">※ 단, 경매에 따라 무료배송 진행이 아닌, 유료배송으로 진행 될 수도 있습니다.</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
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
<script>
    $('.js-maintab_list a').on('click', function(e) {
        e.preventDefault();
        var tar = $(this).position().left;
        var scrollX = tar - ($(".js-maintab_list").parents(".tab-area").width() / 2) + $(this).width() / 2;


        if ($(this).parents('li').hasClass('active')) return false;
        var id = $(this).attr('href');
        if ($(id).length > 0) {
            $('.tab-cont').removeClass('active');
            $(id).addClass('active');
            $(this).parents('li').siblings('li').removeClass('active').end().addClass('active');

            $(".js-maintab_list").parents(".tab-area").scrollLeft(scrollX);
        }

        return false;
    });
</script>
<script>
    $(".js-tab_move a").on("click", function($e) {
        $e.preventDefault();
        var _goY = $(this).attr("href");
        trpScrollTop(_goY, 10);
    })
</script>
</body>

</html>