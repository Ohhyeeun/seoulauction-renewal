<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Art Storage</span></h2>
                            <div class="page_desc"><span class="tb1"></span></div>
                        </div>
                    </div>
                </section>

                <section class="basis-section tab-menu-section ">
                    <div class="section-inner">
                        <div class="tab-wrap">
                            <div class="tab-area type-left_lg">
                                <ul class="tab-list js-maintab_list">
                                    <li class="active"><a href="#tab-cont-1"><span>Insa Art Storage</span></a></li>
                                    <li><a href="#tab-cont-2"><span>Jangheung Art Storage</span></a></li>
                                    <li><a href="#tab-cont-3"><span>Pyeongchang Art Storage</span></a></li>
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
                                            <div class="title"><span class="tt2">Insa Art Storage</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-intro">
                                                <p class="tb1">Seoul Auction manages a storage for artworks and valuables in the downtown area of Seoul. Located in Insa-dong, the heart of Korean art, Insa Art Storage is easily accessible by public transportation.
                                                    Smaller storages ranging from 2.8㎡ to 8.3㎡can serve multiple functions and must use personal key to access. It also has a personal cabinet facility to safely and conveniently keep smaller works and valuables.
                                                </p>
                                            </div>
                                            <div class="storage-image">
                                                <img src="/images/pc/service/storage_insa_eng.png" alt="인사 아트 스토리지">
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
                                                        <div class="desc tb1">
                                                            <p>24-hour maintenance of optimum temperature and humidity levels per artwork</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>Temperature: 18 to 22 degrees Celsius / Humidity: 45 to 55%</li>
                                                            <li><i class="icon-system_arrow"></i>Maintained year-round (figures can be adjusted if necessary)</li>
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
                                                        <div class="title"><span class="tt4">Emergency ventilation system</span></div>
                                                        <!-- [0516]줄바꿈수정 -->
                                                        <div class="desc tb1">
                                                            <p>Extinguishing of fires (with halon gas) without damaging artworks</p>
                                                        </div>
                                                        <!-- // [0516]줄바꿈수정 -->
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>Centralized fire alarm system</li>
                                                            <li><i class="icon-system_arrow"></i>Automatically-activated heat/smoke detectors</li>
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
                                                        <div class="title"><span class="tt4">Security system</span></div>
                                                        <div class="desc tb1">
                                                            <p>Cutting-edge security system operated on 24-hour basis in partnership with Secom, Korea’s top security service provider</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>CCTV surveillance (recorded on 24-hour basis)</li>
                                                            <li><i class="icon-system_arrow"></i>Strict control/management of all who enter or exit</li>
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
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.1801140855937!2d126.98256296560056!3d37.57437622979644!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e80af6660b%3A0xa1d340079437e9ed!2sInsa%20Art%20Center!5e0!3m2!1sen!2skr!4v1657182162521!5m2!1sen!2skr"
                                                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                                <div class="navigation-area">
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_address"></i>
                                                                <span class="tt3">Insa Art Storage</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">Land-lot number</div>
                                                                <div class="value">
                                                                    <p>188, Gwanhun-dong, Jongno-gu, Seoul, Korea</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">Road name</div>
                                                                <div class="value">
                                                                    <p>41-1, Insadong-gil, Jongno-gu, Seoul, Korea</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_bus"></i>
                                                                <span class="tt3">bus</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">Jogyesa</div>
                                                                <div class="value">
                                                                    <p>Jongno02, 1005-1, 5000, 5005, 5500, 5500-1, 5500-2, 7900, 9000, 9401</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">Insa-dong Aventree Hotel</div>
                                                                <div class="value">
                                                                    <p>6005</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">Anguk-dong</div>
                                                                <div class="value">
                                                                    <p>162, 606, 1020</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">Anguk Station, Jongno Police Station, Insa-dong</div>
                                                                <div class="value">
                                                                    <p>109, 151, 162, 171, 172, 272</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_subway"></i>
                                                                <span class="tt3">subway</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-3">Line <i>3</i></span></div>
                                                                <div class="value">
                                                                    <p>Anguk, Jongno 3(sam)-ga</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-1">Line <i>1</i></span></div>
                                                                <div class="value">
                                                                    <p>Jonggak</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-5">Line <i>5</i></span></div>
                                                                <div class="value">
                                                                    <p>Jongno 3(sam)-ga</p>
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
                                            <div class="title"><span class="tt2">Jangheung Art Storage</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-intro">
                                                <p class="tb1">Seoul Auction Jangheung Art Storage is half an hour away from the downtown area of Seoul. It has wonderful facilities, such as a large parking lot and gondolas for artworks. Jangheung Art Storage is an optimum place to securely store large artworks and considerable amount of goods as it has different sizes of storages units spanning from 34㎡ to 67㎡.
                                                </p>
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
                                                        <div class="title"><span class="tt4">HVAC system</span></div>
                                                        <div class="desc tb1">
                                                            <p>24-hour maintenance of optimum temperature and humidity levels per artwork</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>Temperature: 18 to 22 degrees Celsius / Humidity: 45 to 55%</li>
                                                            <li><i class="icon-system_arrow"></i>Maintained year-round (figures can be adjusted if necessary)</li>
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
                                                        <div class="title"><span class="tt4">Emergency ventilation system</span></div>
                                                        <!-- [0516]줄바꿈수정 -->
                                                        <div class="desc tb1">
                                                            <p>Extinguishing of fires (with halon gas) without damaging artworks</p>
                                                        </div>
                                                        <!-- // [0516]줄바꿈수정 -->
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>Centralized fire alarm system</li>
                                                            <li><i class="icon-system_arrow"></i>Automatically-activated heat/smoke detectors</li>
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
                                                        <div class="title"><span class="tt4">Security system</span></div>
                                                        <div class="desc tb1">
                                                            <p>Cutting-edge security system operated on 24-hour basis in partnership with Secom, Korea’s top security service provider</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>CCTV surveillance (recorded on 24-hour basis)</li>
                                                            <li><i class="icon-system_arrow"></i>Strict control/management of all who enter or exit</li>
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
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3281.1347720361805!2d126.89608671553113!3d34.676547880440694!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357243c5d1b8bff5%3A0x410b3184ced09976!2sJangheung%20Culture%20and%20Art%20Hall!5e0!3m2!1sen!2skr!4v1657182114841!5m2!1sen!2skr"
                                                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                                <div class="navigation-area">
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_address"></i>
                                                                <span class="tt3">Jangheung Art Storage</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info  tb1">
                                                                <div class="key">Land-lot number</div>
                                                                <div class="value">
                                                                    <p>45-10, Iryeong-ri, Jangheung-myeon, Yangju-si, Gyeonggi-do, Korea <span class="only_ib-pc">/ </span> <br class="only-mb">5-1, Iryeong-ri, Jangheung-myeon, Yangju-si, Gyeonggi-do, Korea</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">Road name</div>
                                                                <div class="value">
                                                                    <p>113, Gwonyul-ro, Jangheung-myeon, Yangju-si, Gyeonggi-do, Korea <span class="only_ib-pc">/ </span> <br class="only-mb">143-8, Gwonyul-ro, Jangheung-myeon, Yangju-si, Gyeonggi-do, Korea</p>
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
                                            <div class="title"><span class="tt2">Pyeongchang Art Storage</span></div>
                                        </div>
                                        <div class="article-body">
                                            <div class="storage-intro">
                                                <p class="tb1">The Pyeongchang Storage is 19.8m²~26.4m² in area, located in Pyeongchang-dong, Seoul. This place will meet needs of clients, not only those who want to check and replace their artworks, but also submit works to auction.
                                                </p>
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
                                                        <div class="title"><span class="tt4">HVAC system</span></div>
                                                        <div class="desc tb1">
                                                            <p>24-hour maintenance of optimum temperature and humidity levels per artwork</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>Temperature: 18 to 22 degrees Celsius / Humidity: 45 to 55%</li>
                                                            <li><i class="icon-system_arrow"></i>Maintained year-round (figures can be adjusted if necessary)</li>
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
                                                        <div class="title"><span class="tt4">Emergency ventilation system</span></div>
                                                        <!-- [0516]줄바꿈수정 -->
                                                        <div class="desc tb1">
                                                            <p>Extinguishing of fires (with halon gas) without damaging artworks</p>
                                                        </div>
                                                        <!-- // [0516]줄바꿈수정 -->
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>Centralized fire alarm system</li>
                                                            <li><i class="icon-system_arrow"></i>Automatically-activated heat/smoke detectors</li>
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
                                                        <div class="title"><span class="tt4">Security system</span></div>
                                                        <div class="desc tb1">
                                                            <p>Cutting-edge security system operated on 24-hour basis in partnership with Secom, Korea’s top security service provider</p>
                                                        </div>
                                                        <ul class="info tb1">
                                                            <li><i class="icon-system_arrow"></i>CCTV surveillance (recorded on 24-hour basis)</li>
                                                            <li><i class="icon-system_arrow"></i>Strict control/management of all who enter or exit</li>
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
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12642.426151049722!2d126.95812573955078!3d37.6114182!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357cbd3f81484fa5%3A0xcdaccdc4d2e8f1f5!2zKOyjvCnshJzsmrjsmKXshZg!5e0!3m2!1sen!2skr!4v1657182061162!5m2!1sen!2skr"
                                                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                                </div>
                                                <div class="navigation-area">
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_address"></i>
                                                                <span class="tt3">Pyeongchang Art Storage</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">Land-lot number</div>
                                                                <div class="value">
                                                                    <p>465-10, Pyeongchang-dong, Jongno-gu, Seoul, Korea</p>
                                                                    <p>98, Pyeongchang-dong, Jongno-gu, Seoul, Korea</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key">Road name</div>
                                                                <div class="value">
                                                                    <p>11, Pyeongchang 31-gil, Jongno-gu, Seoul, Korea</p>
                                                                    <p>24, Pyeongchang 30-gil, Jongno-gu, Seoul, Korea</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_bus"></i>
                                                                <span class="tt3">bus</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key">Lotte Samsung Apartment</div>
                                                                <div class="value">
                                                                    <p>1711, 1020, 7211, 110, 153</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-area">
                                                        <div class="item-header">
                                                            <div class="title">
                                                                <i class="icon-navi_subway"></i>
                                                                <span class="tt3">subway</span>
                                                            </div>
                                                        </div>
                                                        <div class="item-body">
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-3">Line <i>3</i></span></div>
                                                                <div class="value">
                                                                    <p>Anguk, Jongno 3(sam)-ga</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-1">Line <i>1</i></span></div>
                                                                <div class="value">
                                                                    <p>Jonggak</p>
                                                                </div>
                                                            </div>
                                                            <div class="navi-info tb1">
                                                                <div class="key subway-line"><span class="subway-color line-5">Line <i>5</i></span></div>
                                                                <div class="value">
                                                                    <p>Jongno 3(sam)-ga</p>
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
                                                <strong>Contact</strong>
                                            </div>
                                            <div class="info-guide">
                                                <div class="manager-box"> <span>Head of Team, Art Storage Team</span> <em>Kim Kyoungsoon</em> </div>
                                                <div class="contact-box">
                                                    <ul>
                                                        <li><span>T.</span> <a href="tel:82-10-4703-0481"><em>+82-10-4703-0481</em></a></li>
                                                        <li><span>E.</span> <a href="mailto:kks@seoulauction.com"><em>kks@seoulauction.com</em></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn-area">
                                            <a class="btn btn_gray_line" href="/mypage/inquiryForm" role="button"><span>1:1 Inquiry</span></a>
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
        <jsp:include page="../../include/en/footer.jsp" />
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