<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<sec:authorize access="hasRole('ROLE_EMPLOYEE_USER')">
	<sec:authentication property="details.authorities" var="authorities"></sec:authentication>
</sec:authorize>
<script>
var authorities = '${authorities}'
</script>
<link href="/css/angular/sa.common.2.0.css" rel="stylesheet">



<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>아카데미 | Seoul Auction</title>
    <!-- //header -->
</head>

<body class="">
<div class="wrapper">
    <div class="sub-wrap pageclass">
        <!-- header -->
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <script type="text/javascript" src="/js/service/academy.js"></script>
        <!-- //header -->

        <!-- container -->
        <div id="container" ng-controller="academyListCtl" data-ng-init="loadAcademyList(1)" ng-cloak>
            <div id="contents" class="contents">

                <!-- page title -->

                <section class="page_title-section type-dark">
                    <div class="section-inner full_size ">
                        <div class="center-box">
                            <h2 class="page_title"><span class="th1">Academy</span></h2>
                            <div class="page_desc"><span class="tb1">아카데미</span></div>
                        </div>
                    </div>
                </section>


                <section class="basis-section">
                    <div class="section-inner">
                        <div class="tab-wrap">

                            <div class="set-pc_mb">
                                <div class="only-pc">
                                    <ul class="tab_icon-list ">
                                        <li class="{{activeAcademyCd('all')}}" ng-click="goAcademyList('all')">
                                            <div class="li-inner">
                                                <a href="#" class="tab-btn">
                                                    <div class="icon"><i class="icon-tab_all"></i></div>
                                                    <div class="txt">
                                                        <span>전체</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="{{activeAcademyCd('artculture')}}" ng-click="goAcademyList('artculture')">
                                            <div class="li-inner">
                                                <a href="#" class="tab-btn">
                                                    <div class="icon"><i class="icon-tab_market"></i></div>
                                                    <div class="txt">
                                                        <span>아트마켓</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="{{activeAcademyCd('artisttalk')}}" ng-click="goAcademyList('artisttalk')">
                                            <div class="li-inner">
                                                <a href="#" class="tab-btn">
                                                    <div class="icon"><i class="icon-tab_authorism"></i></div>
                                                    <div class="txt">
                                                        <span>작가론</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="{{activeAcademyCd('artbrunch')}}" ng-click="goAcademyList('artbrunch')">
                                            <div class="li-inner">
                                                <a href="#" class="tab-btn">
                                                    <div class="icon"><i class="icon-tab_ceo"></i></div>
                                                    <div class="txt">
                                                        <span>CEO</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="{{activeAcademyCd('artauction')}}" ng-click="goAcademyList('artauction')">
                                            <div class="li-inner">
                                                <a href="#" class="tab-btn">
                                                    <div class="icon"><i class="icon-tab_student"></i></div>
                                                    <div class="txt">
                                                        <span>대학생 아카데미</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="{{activeAcademyCd('culture')}}" ng-click="goAcademyList('culture')">
                                            <div class="li-inner">
                                                <a href="#" class="tab-btn">
                                                    <div class="icon"><i class="icon-tab_architecture"></i></div>
                                                    <div class="txt">
                                                        <span>건축</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="{{activeAcademyCd('lecture')}}" ng-click="goAcademyList('lecture')">
                                            <div class="li-inner">
                                                <a href="#" class="tab-btn">
                                                    <div class="icon"><i class="icon-tab_lectuure"></i></div>
                                                    <div class="txt">
                                                        <span>특강</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="only-mb">
                                    <div class="select-box">
                                        <select class="" id="">
                                            <option value="1">전체</option>
                                            <option value="2">아트마켓</option>
                                            <option value="3">작가론</option>
                                            <option value="4">CEO</option>
                                            <option value="5">대학생 아카데미</option>
                                            <option value="6">건축</option>
                                        </select>
                                        <i class="icon-select_arrow"></i>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <!-- 진행 중인 OR 마가 아카데미 -->
                <section class="basis-section last-section">
                    <div class="section-inner">

                        <div class="content-panel type_panel-ing_end_academy">
                            <div class="panel-body">
                                <article class="service-article js-service_more">
                                    <div class="article-body">
                                        <ul class="service-list">
                                            <li class="" ng-repeat="academyList in academyList">
                                                <div class="li-inner">
                                                    <a href="#" ng-click="goAcademyDetail(academyList)">
                                                        <div class="item-area">
                                                            <div class="image-box">
                                                                <figure class="img-ratio">
                                                                    <div class="img-align">
<%--                                                                     <img ng-src="<spring:eval expression="@environment.getProperty('image.root.path')" />{{academyList.IMG_VIEW_PATH}}/{{academyList.VIEW_FILE_NAME}}" alt=""> --%>
																		<img ng-src="/images/pc/service/{{getAcademyImg(academyList.ACADEMY_CD)}}" alt="" />
                                                                    </div>
                                                                    <figcaption class="typo-align">
                                                                        <div class="category_name">
                                                                            <span>{{getAcademyNm(academyList.ACADEMY_CD)}}</span>
                                                                        </div>
                                                                    </figcaption>
                                                                </figure>
                                                            </div>
                                                            <div class="typo-box">
                                                                <div class="state">
                                                                	<!-- to_dt(종료일시)가 지났으면 신청가능/마감 안띄움-->
																	<span ng-if = "(db_now < academyList.TO_DT.substring(0,10) || db_now == academyList.TO_DT.substring(0,10)) && (academyList.CLOSE_YN == 'N' || academyList.CLOSE_YN == null)" class="allowed">신청가능</span>
                                                                    <span ng-if = "(db_now < academyList.TO_DT.substring(0,10) || db_now == academyList.TO_DT.substring(0,10)) && academyList.CLOSE_YN == 'Y'"class="deadline">신청마감</span>
                                                                    
                                                                    <span ng-if = "(academyList.FROM_DT.substring(0,10) < db_now || academyList.FROM_DT.substring(0,10) == db_now) && db_now < academyList.TO_DT.substring(0,10)" class="progress">강의진행중</span>
                                                                    <span ng-if = "db_now > academyList.TO_DT.substring(0,10)" class="end">강의종료</span>
                                                                </div>
                                                                <div class="title"><span class="ft_sb">{{getAcademyTitle(academyList.TITLE_JSON)}}</span></div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="article-footer">

<!--                                         <div class="set-pc_mb"> -->
<!--                                             <div class="only-pc"> -->
<!--                                                 <div class="paging-area"> -->
<!--                                                     <div class="paging"> -->
<!--                                                         <a href="#" class="prev_end icon-page_prevprev">FIRST</a><a href="#" class="prev icon-page_prev">PREV</a> -->
<!--                                                         <strong class="on">1</strong> -->
<!--                                                         <a href="#"><em>2</em></a> -->
<!--                                                         <a href="#"><em>3</em></a> -->
<!--                                                         <a href="#"><em>4</em></a> -->
<!--                                                         <a href="#"><em>5</em></a> -->
<!--                                                         <a href="#"><em>6</em></a> -->
<!--                                                         <a href="#"><em>7</em></a> -->
<!--                                                         <a href="#"><em>8</em></a> -->
<!--                                                         <a href="#"><em>9</em></a> -->
<!--                                                         <a href="#"><em>10</em></a> -->
<!--                                                         <a href="#" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                             <div class="only-mb"> -->
<!--                                                 <div class="paging-area"> -->
<!--                                                     <div class="paging"> -->
<!--                                                         <a href="#" class="prev_end icon-page_prevprev">FIRST</a><a href="#" class="prev icon-page_prev">PREV</a> -->
<!--                                                         <strong class="on">1</strong> -->
<!--                                                         <a href="#"><em>2</em></a> -->
<!--                                                         <a href="#"><em>3</em></a> -->
<!--                                                         <a href="#"><em>4</em></a> -->
<!--                                                         <a href="#"><em>5</em></a> -->
<!--                                                         <a href="#" class="next icon-page_next "><em>NEXT</em></a><a href="#" class="next_end icon-page_nextnext">END</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->

											<div class="wrap_paging" ng-if="academyCnt != 0">
												<paging page="currentPage"
													page-size=12
													total="academyCnt"
													paging-action="loadAcademyList(page)"
													scroll-top="true"
													hide-if-empty="true"
													show-prev-next="true"
													show-first-last="true"
													ul-class="page_ul"
													active-class="page_active"
												    disabled-class="page_disable"
												    text-next-class="icon-page_next next page_btn sp_btn btn_next02"
												    text-prev-class="icon-page_prev prev page_btn sp_btn btn_prev02"
												    text-first-class="icon-page_prevprev prev_end page_btn sp_btn btn_prev "
												    text-last-class="icon-page_nextnext next_end page_btn sp_btn btn_next">
												</paging>				
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
</body>

</html>