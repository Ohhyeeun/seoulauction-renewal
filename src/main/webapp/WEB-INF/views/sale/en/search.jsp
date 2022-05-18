<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="../../include/en/header.jsp" flush="false"/>

<script>
    var getLoginInfo = $("#accountBtn").next().text();
    if( getLoginInfo != "LOGOUT" ){ $(document).on('click', 'a[href="#"]', function(e){
        e.preventDefault();
    });	}

    app.requires.push.apply(app.requires, ["bw.paging", "ngDialog", "checklist-model"]);
    app.controller('lotListCtl', function($scope, consts, common, is_login, locale, $filter) {
        $scope.popstate = false;
        $scope.is_login = is_login;
        $scope.locale = locale;
        $scope.pageRows = 20;//consts.LOT_LIST_ROWS;
        $scope.reqRowCnt = "20";
        $scope.currentPage = 1;
        $scope.totalCount = 0;
        $scope.db_now = null;
        $scope.sale_no = null;
        $scope.sale_status = null;
        $scope.lot_map = {};
        $scope.is_error = false;
        $scope.now_timer_start = false;
        $scope.list_timer_start = false;
        $scope.modal = null;
        $scope.expe_from_price = null;
        $scope.expe_to_price = null;
        $scope.search = {"sale_kind" : []};

        $scope.reqRowCnts = {20:"<spring:message code='label.listup.lots' arguments='20' />",
            50:"<spring:message code='label.listup.lots' arguments='50' />",
            100:"<spring:message code='label.listup.lots' arguments='100' />"};


        $scope.sortBy = "ENDDE";
        $scope.orders={
            "ENDDE": "<spring:message code="label.sort.by.latest" />",
            "LOTAS": "<spring:message code="label.sort.by.LOTAS" />",
            "LOTDE": "<spring:message code="label.sort.by.LOTDE" />",
            "ESTAS": "<spring:message code="label.sort.by.ESTAS" />",
            "ESTDE": "<spring:message code="label.sort.by.ESTDE" />"};

        $scope.sale_kind_list = [
            {"text":"<spring:message code="label.online" />", "cd":"online"},
            {"text":"<spring:message code="label.online_zb" />", "cd":"online_zb"},
            {"text":"<spring:message code="label.offline" />", "cd":"main"},
            {"text":"<spring:message code="label.offline.hk" />", "cd":"hongkong"},
            {"text":"<spring:message code="label.plan" />", "cd":"plan"}];
        /* {"text":"<spring:message code="label.exhibit" />", "cd":"exhibit"}]; */

        $scope.sale_kind_all = true;
        $scope.checkSaleKindAll = function(){
            if($scope.sale_kind_all){
                $scope.search.sale_kind = $scope.sale_kind_list.map(function(item) { return item.cd; });
            }
            else{
                $scope.search.sale_kind = [];
            }
        }

        $scope.uncheckAll = function(){
            $scope.sale_kind_all = false;
        }

        $scope.init = function(){
            $scope.checkSaleKindAll();
            $scope.search.keyword = "${param.searchContent}";
            //$scope.search.keyword1 = "${param.searchContent1}";//작품명 검색
            $scope.search.chk = "all";//검색 조건 (all 통합검색, art 작가명, title 작품명)

            if(getCookie("prev_url").indexOf("lotDetail") > -1 || getCookie("prev_url").indexOf("lotSearchList") > -1){
                if($scope.search.keyword == "undefined" || $scope.search.keyword.length == 0 ){
                    if(getCookie("keyword") == "undefined"){
                        $scope.search.keyword = undefined;
                    }else{
                        $scope.search.keyword = getCookie("keyword");
                    }
                    if(getCookie("chk") == "undefined"){
                        $scope.search.chk = "all";
                    }else{
                        $scope.search.chk = getCookie("chk");
                    }

                    if(getCookie("mate_nm") == "undefined"){
                        $scope.search.mate_nm = undefined;
                    }else{
                        $scope.search.mate_nm = getCookie("mate_nm");
                    }

                    if(getCookie("from_dt") == "undefined"){
                        $scope.search.from_dt = undefined;
                    }else{
                        $scope.search.from_dt = getCookie("from_dt");
                    }

                    if(getCookie("to_dt") == "undefined"){
                        $scope.search.to_dt = undefined;
                    }else{
                        $scope.search.to_dt = getCookie("to_dt");
                    }
                }
            }

            if($scope.search.keyword.length > 0){
                if(getCookie("prev_url").indexOf("lotDetail") > -1 || getCookie("prev_url").indexOf("lotSearchList") > -1){
                    if(getCookie('page') != undefined){
                        $scope.loadLotList(getCookie('page'));
                    }
                    else{
                        $scope.loadLotList(1);
                    }
                }
                else{
                    $scope.loadLotList(1);
                }
            }
        }

        $scope.search = function(){
            $scope.loadLotList(1);
        }

        $scope.clearSearchCondition = function(){
            $scope.search = {"sale_kind" : ['main', 'online', 'online_zb', 'hongkong', 'plan', 'exhibit']};

            setCookie('keyword', "", 1);
            //setCookie('keyword1', "", 1);
            setCookie('chk', "", 1);
            setCookie('mate_nm', "", 1);
            setCookie('from_dt', "", 1);
            setCookie('to_dt', "", 1);
        }

        $scope.cnt = 0;
        $scope.loadLotList = function($page){

            if($page > 1){
                setCookie('prev_url', getCookie('curr_url'), 1);
            }

            setCookie('page', $page, 1);

            setCookie('keyword', $scope.search.keyword, 1);
            //setCookie('keyword1', $scope.search.keyword1, 1);
            setCookie('chk', $scope.search.chk, 1);
            setCookie('mate_nm', $scope.search.mate_nm, 1);
            setCookie('from_dt', $scope.search.from_dt, 1);
            setCookie('to_dt', $scope.search.to_dt, 1);

            $scope.currentPage = $page;

            $d = {"baseParms":{
                    "list_type": "SEARCH", "sale_kind" : $scope.search.sale_kind
                    , "keyword": $scope.search.keyword, "mate_nm": $scope.search.mate_nm
                    , "from_dt": $scope.search.from_dt, "to_dt": $scope.search.to_dt
                    //, "keyword1": $scope.search.keyword1
                    , "chk": $scope.search.chk
                },
                "actionList":[
                    {"actionID":"search_list_count", "actionType":"select" , "tableName": "LOT_CNT" ,"parmsList":[{"for_count":true}]},
                    {"actionID":"search_list_paging", "actionType":"select" , "tableName": "LOTS"
                        ,"parmsList":[{
                            "from": (($scope.currentPage - 1) * parseInt($scope.reqRowCnt))
                            , "rows":parseInt($scope.reqRowCnt)
                            , "sort_by":$scope.sortBy}
                        ]
                    },
                    {"actionID":"get_customer_by_cust_no", "actionType":"select" , "tableName": "CUST_INFO" ,"parmsList":[]},
                    {"actionID":"search_log", "actionType":"insert" , "tableName": "SEARCH_LOG" ,"parmsList":[{}]},
                ]};

            common.callActionSet($d, function(data, status) {
                if(data.tables.LOTS.rows.length != 0){
                    $(".wrap_paging").show();
                } else { $(".wrap_paging").hide(); }
                $scope.totalCount = data["tables"]["LOT_CNT"]["rows"][0].CNT;
                $scope.lotList = data["tables"]["LOTS"]["rows"];
                $scope.custInfo = data["tables"]["CUST_INFO"]["rows"][0];
                $scope.searchLog = data["tables"]["SEARCH_LOG"]["rows"];
                $scope.pageRows = parseInt($scope.reqRowCnt);
            }, function(){
                $scope.is_error = true;
            });
        }


        /* 관심작품 Start */
        // 관심작품 로직 추가(2018.08.14 YDH)
        $scope.inteSave = function($input) {
            var $d = {"baseParms":{"sale_no":$input.sale_no, "lot_no":$input.lot_no},
                "actionList":[
                    {"actionID":"add_cust_inte_lot", "actionType":"insert", "tableName":"CUST_INTE_LOT", "parmsList":[{}]}
                ]};
            common.callActionSet($d, function(data, status) {
                if(data.tables["CUST_INTE_LOT"]["rows"].length > 0) {
                    if($scope.locale == 'ko') {
                        alert("관심작품 추가가 완료되었습니다.\n추가된 관심작품은 ACCOUNT페이지에서 확인하실 수 있습니다.");
                        window.location.reload(true);
                    }else {
                        alert("A favorite work has been added.\nYou can find your favorite works on your account page.");
                        window.location.reload(true);
                    }
                    return true;
                }
            })
        };

        $scope.inteDel = function($input) {
            var $d = {"baseParms":{"sale_no":$input.sale_no, "lot_no":$input.lot_no},
                "actionList":[
                    {"actionID":"del_cust_inte_lot", "actionType":"delete", "tableName":"CUST_INTE_LOT", "parmsList":[{}]}
                ]};
            common.callActionSet($d, function(data, status) {
                if(data.tables["CUST_INTE_LOT"]["rows"].length > 0) {
                    if($scope.locale == 'ko') {
                        alert("관심작품이 삭제되었습니다.");
                        window.location.reload(true);
                    }else {
                        alert("A favorite work has been deleted.");
                        window.location.reload(true);
                    }
                    return true;
                }
            })
        };
        /* 관심작품 End */
    });
</script>
<script type="text/javascript" src="/js/bid.js"></script>

<div id="container">
    <div id="contents" class="contents">


        <section class="basis-section search-section">
            <div class="section-inner">
                <div class="content-panel type_panel-search">
                    <div class="panel-header">
                        <div class="search_results">"<strong>이우환</strong>" 검색결과 총<em>30</em>개</div>
                    </div>
                    <div class="panel-body">

                        <div class="search-area">
                            <div class="search-box">
                                <div class="input_del">
                                    <input class="" type="text" placeholder="" value="이우환">
                                    <button class="btn_del"><i class="form-search-del_lg"></i></button>
                                </div>
                                <button class="btn_search"><i class="form-search_lg"></i></button>
                            </div>
                            <div class="suggestion-box">
                                <div class="word">
                                    <span>추천 검색어</span>
                                </div>
                                <div class="word-items">
                                    <button>이우환</button><button>김완기</button>
                                    <button>김창열</button><button>쿠사마</button>
                                    <button>호크니</button><button>박서보</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="basis-section tab-auction-section">
            <div class="section-inner">

                <!-- 텝메뉴 -->
                <div class="content-panel type_panel-search_tab2">
                    <div class="panel-header">

                        <div class="tab-wrap">
                            <div class="tab-area type-left">
                                <ul class="tab-list js-list_tab">
                                    <li class="active"><a href="#tab-cont-1"><span>전체</span> <em>(30)</em></a></li>
                                    <li><a href="#tab-cont-2"><span>라이브</span> <em>(20)</em></a></li>
                                    <li><a href="#tab-cont-3"><span>온라인</span> <em>(10)</em></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <div class="panel-body">
                        <article class="search_tab-article">
                            <div class="article-body">

                                <div class="col_item positon-col1">
                                    <div class="filter-box">
                                        <div class="btn_set">
                                            <button class="filter_btn js-filter_btn"><i class="icon-filter"></i></button>
                                        </div>
                                        <ul class="filter-list js-filter_del-list">
                                            <li><span>지난경매</span><button><i class="icon-filter_del"></i></button></li>
                                            <li><span>진행경매</span><button><i class="icon-filter_del"></i></button></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col_item positon-col2">
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

                            <li class="">
                                <div class="li-inner">
                                    <article class="item-article">
                                        <div class="image-area">
                                            <figure class="img-ratio">
                                                <div class="img-align">
                                                    <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                </div>
                                            </figure>
                                        </div>
                                        <div class="typo-area">
                                            <div class="product_info">
                                                <div class="num_heart-box">
                                                    <span class="num">1</span>
                                                    <button class="heart js-work_heart"><i class="icon-heart_off"></i></button>
                                                </div>
                                                <div class="info-box">
                                                    <div class="title"><span>데미안허스트</span><span class="sub">(1965)</span></div>
                                                    <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                    <div class="standard">
                                                        <span>spray paint on canvas</span>
                                                        <div class="size_year">
                                                            <span>80.9 X 73.4cm</span>
                                                            <span>2021</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="price-box">
                                                    <dl class="price-list">
                                                        <dt>추정가</dt>
                                                        <dd>KRW 9,900,000,000</dd>
                                                        <dd>~ 9,900,000,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>시작가</dt>
                                                        <dd>KRW 4,500,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>현재가</dt>
                                                        <dd><strong>KRW 9,00,000,000</strong><em>(응찰1)</em></dd>
                                                    </dl>
                                                </div>
                                                <div class="state-box">
                                                    <div class="state op-ing">
                                                        <div>진행중</div>
                                                    </div>
                                                    <div class="other">
                                                        <div class="d_name">ZEROBASE: The Edit</div>
                                                        <div class="d_day">2022/03/31(목) 14:00 KST</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </li>

                            <li class="">
                                <div class="li-inner">
                                    <article class="item-article">
                                        <div class="image-area">
                                            <figure class="img-ratio">
                                                <div class="img-align">
                                                    <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                </div>
                                            </figure>
                                        </div>
                                        <div class="typo-area">
                                            <div class="product_info">
                                                <div class="num_heart-box">
                                                    <span class="num">2</span>
                                                    <button class="heart js-work_heart"><i class="icon-heart_off"></i></button>
                                                </div>
                                                <div class="info-box">
                                                    <div class="title"><span>데미안허스트</span><span class="sub">(1965)</span></div>
                                                    <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                    <div class="standard">
                                                        <span>spray paint on canvas</span>
                                                        <div class="size_year">
                                                            <span>80.9 X 73.4cm</span>
                                                            <span>2021</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="price-box">
                                                    <dl class="price-list">
                                                        <dt>추정가</dt>
                                                        <dd>KRW 9,900,000,000</dd>
                                                        <dd>~ 9,900,000,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>시작가</dt>
                                                        <dd>KRW 4,500,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>현재가</dt>
                                                        <dd><strong>KRW 9,00,000,000</strong><em>(응찰1)</em></dd>
                                                    </dl>
                                                </div>
                                                <div class="state-box">
                                                    <div class="state op-ing">
                                                        <div>진행중</div>
                                                    </div>
                                                    <div class="other">
                                                        <div class="d_name">ZEROBASE: The Edit</div>
                                                        <div class="d_day">2022/03/31(목) 14:00 KST</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </li>

                            <li class="">
                                <div class="li-inner">
                                    <article class="item-article">
                                        <div class="image-area">
                                            <figure class="img-ratio">
                                                <div class="img-align">
                                                    <img src="/images/pc/thumbnail/auction03.jpg" alt="">
                                                </div>
                                            </figure>
                                        </div>
                                        <div class="typo-area">
                                            <div class="product_info">
                                                <div class="num_heart-box">
                                                    <span class="num">3</span>
                                                    <button class="heart js-work_heart"><i class="icon-heart_off"></i></button>
                                                </div>
                                                <div class="info-box">
                                                    <div class="title"><span>데미안허스트</span><span class="sub">(1965)</span></div>
                                                    <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                    <div class="standard">
                                                        <span>spray paint on canvas</span>
                                                        <div class="size_year">
                                                            <span>80.9 X 73.4cm</span>
                                                            <span>2021</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="price-box">
                                                    <dl class="price-list">
                                                        <dt>추정가</dt>
                                                        <dd>KRW 9,900,000,000</dd>
                                                        <dd>~ 9,900,000,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>시작가</dt>
                                                        <dd>KRW 4,500,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>현재가</dt>
                                                        <dd><strong>KRW 9,00,000,000</strong><em>(응찰1)</em></dd>
                                                    </dl>
                                                </div>
                                                <div class="state-box">
                                                    <div class="state op-ing">
                                                        <div>진행중</div>
                                                    </div>
                                                    <div class="other">
                                                        <div class="d_name">ZEROBASE: The Edit</div>
                                                        <div class="d_day">2022/03/31(목) 14:00 KST</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </li>

                            <li class="">
                                <div class="li-inner">
                                    <article class="item-article">
                                        <div class="image-area">
                                            <figure class="img-ratio">
                                                <div class="img-align">
                                                    <img src="/images/pc/thumbnail/auction01.jpg" alt="">
                                                </div>
                                            </figure>
                                        </div>
                                        <div class="typo-area">
                                            <div class="product_info">
                                                <div class="num_heart-box">
                                                    <span class="num">4</span>
                                                    <button class="heart js-work_heart"><i class="icon-heart_off"></i></button>
                                                </div>
                                                <div class="info-box">
                                                    <div class="title"><span>데미안허스트</span><span class="sub">(1965)</span></div>
                                                    <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                    <div class="standard">
                                                        <span>spray paint on canvas</span>
                                                        <div class="size_year">
                                                            <span>80.9 X 73.4cm</span>
                                                            <span>2021</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="price-box">
                                                    <dl class="price-list">
                                                        <dt>추정가</dt>
                                                        <dd>KRW 9,900,000,000</dd>
                                                        <dd>~ 9,900,000,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>시작가</dt>
                                                        <dd>KRW 4,500,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>현재가</dt>
                                                        <dd><strong>KRW 9,00,000,000</strong><em>(응찰1)</em></dd>
                                                    </dl>
                                                </div>
                                                <div class="state-box">
                                                    <div class="state op-ing">
                                                        <div>진행중</div>
                                                    </div>
                                                    <div class="other">
                                                        <div class="d_name">ZEROBASE: The Edit</div>
                                                        <div class="d_day">2022/03/31(목) 14:00 KST</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </li>

                            <li class="">
                                <div class="li-inner">
                                    <article class="item-article">
                                        <div class="image-area">
                                            <figure class="img-ratio">
                                                <div class="img-align">
                                                    <img src="/images/pc/thumbnail/auction02.jpg" alt="">
                                                </div>
                                            </figure>
                                        </div>
                                        <div class="typo-area">
                                            <div class="product_info">
                                                <div class="num_heart-box">
                                                    <span class="num">5</span>
                                                    <button class="heart js-work_heart"><i class="icon-heart_off"></i></button>
                                                </div>
                                                <div class="info-box">
                                                    <div class="title"><span>데미안허스트</span><span class="sub">(1965)</span></div>
                                                    <div class="desc"><span>Air (From The Series The Elements)</span></div>
                                                    <div class="standard">
                                                        <span>spray paint on canvas</span>
                                                        <div class="size_year">
                                                            <span>80.9 X 73.4cm</span>
                                                            <span>2021</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="price-box">
                                                    <dl class="price-list">
                                                        <dt>추정가</dt>
                                                        <dd>KRW 9,900,000,000</dd>
                                                        <dd>~ 9,900,000,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>시작가</dt>
                                                        <dd>KRW 4,500,000</dd>
                                                    </dl>
                                                    <dl class="price-list">
                                                        <dt>현재가</dt>
                                                        <dd>-</dd>
                                                    </dl>
                                                </div>
                                                <div class="state-box">
                                                    <div class="state op-end">
                                                        <div>종료</div>
                                                    </div>
                                                    <div class="other">
                                                        <div class="d_name">ZEROBASE: The Edit</div>
                                                        <div class="d_day">2022/03/31(목) 14:00 KST</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </li>
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

<jsp:include page="../../include/en/footer.jsp" flush="false"/>

