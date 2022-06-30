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
                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Art Storage</span></h2>
                            <div class="page_desc"><span class="tb1">미술품 보관고</span></div>
                        </div>
                    </div>
                </section>

                <section class="basis-section tab-menu-section ">
                    <div class="section-inner">
                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class="active"><a href="#tab-cont-1"><span>인사 아트 스토리지</span></a></li>
                                    <li><a href="#tab-cont-2"><span>장흥 아트 스토리지</span></a></li>
                                    <li><a href="#tab-cont-3"><span>평창 아트 스토리지</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- 미술품보관 -->
                <section class="basis-section last-section tab-cont-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-storage">
                            <div class="panel-body">
                                <div class="tab-cont active" id="tab-cont-1">
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">인사 아트 스토리지</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-intro">
                                                <p class="tb1">도심에서도 편리하게 서울옥션 미술품 및 귀중품 전문보관소를 이용하실 수 있습니다. 인사아트스토리지는 미술 중심지 인사동에 위치하여 대중교통 이용이 편리합니다.<br>인사아트스토리지는 2.8㎡에서 8.3㎡ 규모의 작은 수장고도 갖춰 다양한 용도로 사용하실 수 있습니다. (개별열쇠출입) 또한 소품 등을 안전하고 편리하게 <br class="only-pc">보관할 수 있는 개인 캐비닛 시설도 사용하실 수 있습니다.</p>
                                            </div>

                                            <div class="storage-image">
                                                <img src="/images/pc/service/storage_insa.png" alt="인사 아트 스토리지">
                                            </div>
                                        </div>
                                    </article>
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">Art Storage System</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-system">
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_temp.png" alt="항온 항습 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body">
                                                        <div class="title"><span class="tt4">항온 항습 시스템</span></div>
                                                        <div class="desc tb1">
                                                            <p>미술품 각 특성에 알맞은 쾌적한 온도 및 습도 24시간 유지</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>온도 18~22도 / 습도 45~55% </li>
                                                            <li><i class="icon-system_arrow"></i>항시 유지 및 수치조절 가능</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_prevention.png" alt="방재 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body">
                                                        <div class="title"><span class="tt4">방재 시스템</span></div>
                                                        <!-- [0516]줄바꿈수정 -->
                                                        <div class="desc tb1">
                                                            <p>하론가스 소화방식으로 화재시 작품 손상 없이 진화</p>
                                                        </div>
                                                        <!-- // [0516]줄바꿈수정 -->
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>중앙 화재 경보 시스템</li>
                                                            <li><i class="icon-system_arrow"></i>열/매연 감지기 자동 작동</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_security.png" alt="보안 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body ">
                                                        <div class="title"><span class="tt4">보안 시스템</span></div>
                                                        <div class="desc tb1">
                                                            <p>국내 경비 1위 업체 SECOM을 포함한 최첨단 경비 시스템 24시간 풀가동</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>CCTV 보안 감시 및 24시간 녹화</li>
                                                            <li><i class="icon-system_arrow"></i>출입자 통제 관리</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">Location</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-navigation">
                                                <div class="map-area">
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6324.407551242206!2d126.98458899999999!3d37.573819!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa1d340079437e9ed!2z7J247IKs7JWE7Yq47IS87YSw!5e0!3m2!1sko!2skr!4v1653447816203!5m2!1sko!2skr"
                                                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                                <div class="navigation-area">
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_address"></i>
                                                                <span class="tt3">인사 아트 스토리지</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">지번 주소</div>
                                                                <div class="value">
                                                                    <p>서울특별시 종로구 관훈동 188</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">도로명 주소</div>
                                                                <div class="value">
                                                                    <p>서울특별시 종로구 인사동길 41-1</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_bus"></i>
                                                                <span class="tt3">버스</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">조계사</div>
                                                                <div class="value">
                                                                    <p>종로02번, 1005-1번, 5000번, 5005번, 5500번, 5500-1번, 5500-2번, 7900번, 9000번, 9401번</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">인사동, 아벤트리호텔</div>
                                                                <div class="value">
                                                                    <p>6005번</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">안국동</div>
                                                                <div class="value">
                                                                    <p>162번, 606번, 1020번</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">안국역, 종로경찰서, 인사동</div>
                                                                <div class="value">
                                                                    <p>109번, 151번, 162번, 171번, 172번, 272번</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_subway"></i>
                                                                <span class="tt3">지하철</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-3"><i>3</i>호선</span></div>
                                                                <div class="value">
                                                                    <p> 안국역 6번 출구, 종로3가역 5번 출구</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-1"><i>1</i>호선</span></div>
                                                                <div class="value">
                                                                    <p>종각역 3-1번 출구</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-5"><i>5</i>호선</span></div>
                                                                <div class="value">
                                                                    <p> 종로3가역 5번 출구</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="tab-cont " id="tab-cont-2">
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">장흥 아트 스토리지</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-intro">
                                                <p class="tb1">도심에서 30분 거리에 위치한 서울옥션 장흥아트스토리지는 대규모 주차장, 작품 전용 곤도라 등 완벽한 편의시설을 갖추고 있습니다.<br>장흥아트스토리지는 34㎡에서 67㎡에 이르기까지 다양한 규모의 수장고를 갖춰 대형 작품 및 대량 물품의 안전한 보관에 최적화 되어 있습니다.</p>
                                            </div>
                                            <div class="storage-image">
                                                <img src="/images/pc/service/storage_jangheung.png" alt="장흥 아트 스토리지">
                                            </div>
                                        </div>
                                    </article>
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">Art Storage System</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-system">
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_temp.png" alt="항온 항습 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body">
                                                        <div class="title"><span class="tt4">항온 항습 시스템</span></div>
                                                        <div class="desc tb1">
                                                            <p>미술품 각 특성에 알맞은 쾌적한 온도 및 습도 24시간 유지</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>온도 18~22도 / 습도 45~55% </li>
                                                            <li><i class="icon-system_arrow"></i>항시 유지 및 수치조절 가능</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_prevention.png" alt="방재 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body">
                                                        <div class="title"><span class="tt4">방재 시스템</span></div>
                                                        <!-- [0516]줄바꿈수정 -->
                                                        <div class="desc tb1">
                                                            <p>하론가스 소화방식으로 화재시 작품 손상 없이 진화</p>
                                                        </div>
                                                        <!-- // [0516]줄바꿈수정 -->
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>중앙 화재 경보 시스템</li>
                                                            <li><i class="icon-system_arrow"></i>열/매연 감지기 자동 작동</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_security.png" alt="보안 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body ">
                                                        <div class="title"><span class="tt4">보안 시스템</span></div>
                                                        <div class="desc tb1">
                                                            <p>국내 경비 1위 업체 SECOM을 포함한 최첨단 경비 시스템 24시간 풀가동</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>CCTV 보안 감시 및 24시간 녹화</li>
                                                            <li><i class="icon-system_arrow"></i>출입자 통제 관리</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">Location</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-navigation">
                                                <div class="map-area">
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3155.7453945215475!2d126.9497178!3d37.725653699999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc60fbd9039ca8fff!2z6rCA64KY7JWE7Yq47YyM7YGs!5e0!3m2!1sko!2skr!4v1653456572151!5m2!1sko!2skr"
                                                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                                <div class="navigation-area">
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_address"></i>
                                                                <span class="tt3">장흥 아트 스토리지</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info line-style tb1">
                                                                <div class="key">지번 주소</div>
                                                                <div class="value">
                                                                    <p>경기도 양주시 장흥면 일영리 45-10<span class="only_ib-pc">,</span> <br class="only-mb">경기도 양주시 장흥면 일영리 5-1</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info line-style tb1">
                                                                <div class="key">도로명 주소</div>
                                                                <div class="value">
                                                                    <p>경기도 양주시 장흥면 권율로 113<span class="only_ib-pc">,</span> <br class="only-mb">경기도 양주시 장흥면 권율로 143-8</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="tab-cont " id="tab-cont-3">
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">평창 아트 스토리지</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-intro">
                                                <p class="tb1">평창 보관고는 19.8m²~26.4m²규모의 크기를 갖고 있으며 서울 평창동에 위치하고 있기에 수시로 작품을 확인 또는 교체하거나 경매 출품을 목적으로 하는 고객들에게 적합합니다.</p>
                                            </div>
                                            <div class="storage-image">
                                                <img src="/images/pc/service/storage_pyongchang.png" alt="평창 아트 스토리지">
                                            </div>
                                        </div>
                                    </article>
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">Art Storage System</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-system">
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_temp.png" alt="항온 항습 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body">
                                                        <div class="title"><span class="tt4">항온 항습 시스템</span></div>
                                                        <div class="desc tb1">
                                                            <p>미술품 각 특성에 알맞은 쾌적한 온도 및 습도 24시간 유지</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>온도 18~22도 / 습도 45~55% </li>
                                                            <li><i class="icon-system_arrow"></i>항시 유지 및 수치조절 가능</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_prevention.png" alt="방재 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body">
                                                        <div class="title"><span class="tt4">방재 시스템</span></div>
                                                        <!-- [0516]줄바꿈수정 -->
                                                        <div class="desc tb1">
                                                            <p>하론가스 소화방식으로 화재시 작품 손상 없이 진화</p>
                                                        </div>
                                                        <!-- // [0516]줄바꿈수정 -->
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>중앙 화재 경보 시스템</li>
                                                            <li><i class="icon-system_arrow"></i>열/매연 감지기 자동 작동</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="item-area">
                                                    <div class="item-header">
                                                        <div class="img-box">
                                                            <img src="/images/pc/service/storage_system_security.png" alt="보안 시스템">
                                                        </div>
                                                    </div>
                                                    <div class="item-body ">
                                                        <div class="title"><span class="tt4">보안 시스템</span></div>
                                                        <div class="desc tb1">
                                                            <p>국내 경비 1위 업체 SECOM을 포함한 최첨단 경비 시스템 24시간 풀가동</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>CCTV 보안 감시 및 24시간 녹화</li>
                                                            <li><i class="icon-system_arrow"></i>출입자 통제 관리</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="storage-area">
                                        <div class="article-header">
                                            <div class="title"><span class="tt2">Location</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-navigation">
                                                <div class="map-area">
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6321.213092524356!2d126.97563500000001!3d37.61141800000001!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xcdaccdc4d2e8f1f5!2zKOyjvCnshJzsmrjsmKXshZg!5e0!3m2!1sko!2sus!4v1653456672905!5m2!1sko!2sus"
                                                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                                <div class="navigation-area">
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_address"></i>
                                                                <span class="tt3">평창 아트 스토리지</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">지번 주소</div>
                                                                <div class="value">
                                                                    <p>서울특별시 종로구 평창31길 11</p>
                                                                    <p>서울특별시 종로구 평창30길 24</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">도로명 주소</div>
                                                                <div class="value">
                                                                    <p>서울특별시 종로구 평창동 465-10</p>
                                                                    <p>서울특별시 종로구 평창동 98번지</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_car"></i>
                                                                <span class="tt3">자동차</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">강남에서 출발</div>
                                                                <div class="value">
                                                                    <p>강변북로 &gt; 내부순환도로
                                                                        (홍제동 방면) &gt; 내부순환도로
                                                                        국민대램프 &gt; 국민대(북악터널 방면)
                                                                        &gt; 북악터널 지나서 횡단보도 우회전</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">종로에서 출발</div>
                                                                <div class="value">
                                                                    <p>광화문 &gt; 3호선 경복궁역에서
                                                                        우회전(자하문 터널 방면) &gt;
                                                                        홍지동 3거리 (상명대앞) &gt;
                                                                        북악터널 방면 &gt; 롯데아파트
                                                                        횡단보도에서 좌회전</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_bus"></i>
                                                                <span class="tt3">버스</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">롯데삼성아파트</div>
                                                                <div class="value">
                                                                    <p>1711번, 1020번, 7211번, 110번, 153번</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_subway"></i>
                                                                <span class="tt3">지하철</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-3"><i>3</i>호선</span> 경복궁역</div>
                                                                <div class="value">
                                                                    <p>3번 출구 &gt; 버스 1020번, 1711번 환승 &gt; 롯데아파트 정류장 하차</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-3"><i>3</i>호선</span> 홍제역</div>
                                                                <div class="value">
                                                                    <p>유진상가 앞 &gt; 버스 110번, 153번 환승 &gt; 롯데아파트 정류장 하차</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-4"><i>4</i>호선</span> 길음역</div>
                                                                <div class="value">
                                                                    <p>3번 출구 &gt; 버스 153번, 7211번 환승 &gt; 롯데아파트 정류장 하차</p>
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
                            <div class="panel-footer">
                                <!-- 문의하기 -->
                                <article class="inquiry-article ">
                                    <div class="inquiry-box">
                                        <div class="typo-area">
                                            <div class="icon-box">
                                                <i class="icon-academy_inquiry"></i>
                                            </div>
                                            <div class="title-box">
                                                <strong>문의하기</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>서울옥션 보관고팀</span> <em>김경순 팀장</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <em>010-4703-0481</em></li>
                                                        <li><span>E.</span> <a href="mailto:kks@seoulauction.com"><em>kks@seoulauction.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryForm" role="button"><span>1:1 문의</span></a>
                                        </div>
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

<!-- tab menu -->
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
</body>

</html>