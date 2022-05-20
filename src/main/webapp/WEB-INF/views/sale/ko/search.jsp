<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<body class="">
<div class="wrapper" >
    <div class="sub-wrap pageclass type-width_list">

        <!-- header -->
        <link rel="stylesheet" href="/css/main.css" type="text/css" />
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->
        <link href="/css/angular/rzslider.css" rel="stylesheet">
        <link href="/css/angular/ngDialog.css" rel="stylesheet">
        <link href="/css/angular/popup.css" rel="stylesheet">
        <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
        <script type="text/javascript" src="/js/angular/checklist-model.js"></script>
        <script type="text/javascript" src="/js/angular/paging.js"></script>
        <script type="text/javascript" src="/js/angular/rzslider.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-duration-format/1.3.0/moment-duration-format.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ng-dialog/0.5.6/js/ngDialog.min.js"></script>
        <link href="/css/jquery.nouislider.css" rel="stylesheet">
        <script type="text/javascript" src="/js/customer/login.js"></script>
        <script>

            app.value('locale', 'ko');

            function dotSubString(str,len){
                let result ='';
                if(str.length > len){
                    result = str.substring(0,len)+'...';
                }else{
                    result = str;
                }
                return result;
            }

            function setCookie(cName, cValue, cDay){
                var expire = new Date();
                expire.setDate(expire.getDate() + cDay);
                cookies = cName + '=' + encodeURIComponent(cValue) + '; path=/ ';
                if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
                document.cookie = cookies;
            }

            function getCookie(cName) {
                cName = cName + '=';
                var cookieData = document.cookie;
                var start = cookieData.indexOf(cName);
                var cValue = '';
                if(start != -1){
                    start += cName.length;
                    var end = cookieData.indexOf(';', start);
                    if(end == -1)end = cookieData.length;
                    cValue = cookieData.substring(start, end);
                }
                return decodeURIComponent(cValue);
            }

            function size_text_cm(src, $filter){
                var returnValue = "";
                var cmSize = "";

                cmSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1, 1) : "";
                cmSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2, 1) : "";
                cmSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3, 1) +
                    "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
                cmSize += cmSize != "" ? src.UNIT_CD : "";
                cmSize += cmSize != "" &&  src.CANVAS != 0 ? " (" + (src.CANVAS_EXT_YN == "Y" ? "변형" : "") + src.CANVAS + ")" : "";

                returnValue = src.PREFIX;
                returnValue += (src.DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
                returnValue += (src.SUFFIX ? " (" + src.SUFFIX + ") " : "");

                return returnValue;
            }

            function size_text(src, $filter){
                var returnValue = "";
                var cmSize = "";
                var inchSize = "";

                cmSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1, 1) : "";
                cmSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2, 1) : "";
                cmSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3, 1) +
                    "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
                cmSize += cmSize != "" ? src.UNIT_CD : "";
                cmSize += cmSize != "" &&  src.CANVAS != 0 ? " (" + (src.CANVAS_EXT_YN == "Y" ? "변형" : "") + src.CANVAS + ")" : "";

                inchSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1 * 0.393701, 1) : "";
                inchSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2 * 0.393701, 1) : "";
                inchSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3 * 0.393701, 1) + "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
                inchSize += inchSize != "" ? "in" : "";

                returnValue = src.PREFIX;
                returnValue += (src.DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
                returnValue += (src.SUFFIX ? " (" + src.SUFFIX + ") " : "") + (inchSize != "" ?  ", " + inchSize : "");

                return returnValue;
            }

            var getLoginInfo = $("#accountBtn").next().text();
            if( getLoginInfo != "LOGOUT" ){ $(document).on('click', 'a[href="#"]', function(e){
                e.preventDefault();
            });	}

            app.requires.push.apply(app.requires, ["bw.paging", "ngDialog", "checklist-model"]);
            app.controller('lotListCtl', function($scope, consts, common, is_login, locale, $filter) {
                $scope.popstate = false;
                $scope.is_login = is_login;
                $scope.locale = locale;
                $scope.pageRows = 20;
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

                $scope.checkLotDays = function(){
                    if($scope.sale_kind_all){
                        $scope.search.sale_kind = $scope.sale_kind_list.map(function(item) { return item.cd; });
                    }
                    else{
                        $scope.search.sale_kind = [];
                    }
                }
                $scope.sortBy = "ENDDE";
                $scope.orders={
                    "ENDDE": "<spring:message code="label.sort.by.latest" />",
                    "ESTAS": "<spring:message code="label.sort.by.ESTAS" />",
                    "ESTDE": "<spring:message code="label.sort.by.ESTDE" />"};

                $scope.moreBy = "PAGNG";
                $scope.mores={
                    "PAGNG": "<spring:message code="label.more.by.PAGNG" />",
                    "MOREP": "<spring:message code="label.more.by.MOREP" />"};

                $scope.sale_kind_list = [
                    {"text":"<spring:message code="label.online" />", "cd":"online, online_zb"},
                    {"text":"<spring:message code="label.online_zb" />", "cd":"online_zb"},
                    {"text":"<spring:message code="label.offline" />", "cd":"main, hongkong, plan"},
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


                $scope.loadSubPage = function(subPage){
                    $scope.loadLotList(1, subPage);
                }

                $scope.init = function(){

                    $scope.firstChk = 0;

                    $scope.checkSaleKindAll();
                    $scope.search.keyword = "${param.searchContent}";
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
                                $scope.loadLotList(getCookie('page'), 'all');
                            }
                            else{
                                $scope.loadLotList(1, 'all');
                            }
                        }
                        else{
                            $scope.loadLotList(1, 'all');
                        }
                    }
                }

                $scope.search = function(){
                    $scope.loadLotList(1, 'all');
                }

                $scope.clearSearchCondition = function(){
                    $scope.search = {"sale_kind" : ['main', 'online', 'online_zb', 'hongkong', 'plan', 'exhibit']};
                    setCookie('keyword', "", 1);
                    setCookie('chk', "", 1);
                    setCookie('mate_nm', "", 1);
                    setCookie('from_dt', "", 1);
                    setCookie('to_dt', "", 1);
                }

                $scope.cnt = 0;
                $scope.loadLotList = function($page, $subPage){

                    $(".product-list").empty();
                    $(".paging").empty();

                    if($page > 1){
                        setCookie('prev_url', getCookie('curr_url'), 1);
                    }

                    setCookie('page', $page, 1);
                    setCookie('subPage', $subPage, 1);
                    setCookie('keyword', $scope.search.keyword, 1);
                    setCookie('chk', $scope.search.chk, 1);
                    setCookie('mate_nm', $scope.search.mate_nm, 1);
                    setCookie('from_dt', $scope.search.from_dt, 1);
                    setCookie('to_dt', $scope.search.to_dt, 1);

                    $scope.currentPage = $page;
                    $scope.subPage = $subPage;
                    $api = "/sale/searchList";

                    let data = {};
                    data['page'] = $page;
                    data['sub_page'] = $subPage;
                    data['size'] = name;
                    data['sale_kind'] = $scope.search.sale_kind;
                    data['keyword'] = $scope.search.keyword;
                    data['mate_nm'] = $scope.search.mate_nm;
                    data['from_dt'] = $scope.search.from_dt;
                    data['to_dt'] = $scope.search.to_dt;
                    data['chk'] = $scope.search.chk;
                    data['from'] = (($scope.currentPage - 1) * parseInt($scope.reqRowCnt));
                    data['rows'] = parseInt($scope.reqRowCnt);
                    data['sort_by'] = $scope.sortBy;

                    axios.post($api , data)
                        .then(function(response) {
                            console.log(response.data);
                            const result = response.data;
                            let success = result.success;
                            let lotData = [];

                            if(!success){
                                alert("데이터 로딩 실패");
                            } else {
                                lotData = JSON.parse(JSON.stringify(result.data.list));
                                $scope.lotList = lotData;

                                let cntList = JSON.parse(JSON.stringify(result.data.cntList));

                                $scope.totalCount = cntList[0].CNT;
                                $scope.allCount = cntList[0].ALL_CNT;
                                $scope.liveCount = cntList[0].LIVE_CNT;
                                $scope.onlineCount = cntList[0].ONLINE_CNT;
                                $scope.pageRows = parseInt($scope.reqRowCnt);

                                if(lotData.length != 0){

                                    if($scope.firstChk == 0){
                                        $("#totalCount").append($scope.totalCount);
                                        $("#allCount").append('(' + $scope.allCount + ')');
                                        $("#liveCount").append('(' + $scope.liveCount + ')');
                                        $("#onlineCount").append('(' + $scope.onlineCount + ')');
                                        $scope.firstChk = 1;
                                    }

                                    $(".paging").show();
                                    let html = '<div class="paging">'
                                        + '<a href="#"  class="prev_end icon-page_prevprev">FIRST</a>'
                                        + '<a href="#" class="prev icon-page_prev">PREV</a>'
                                        + '<strong class="on">1</strong>'
                                        + '<a><em>2</em></a>'
                                        + '<a href="#"><em>3</em></a>'
                                        + '<a href="#"><em>4</em></a>'
                                        + '<a href="#"><em>5</em></a>'
                                        + '<a href="#"><em>6</em></a>'
                                        + '<a href="#"><em>7</em></a>'
                                        + '<a href="#"><em>8</em></a>'
                                        + '<a href="#"><em>9</em></a>'
                                        + '<a href="#"><em>10</em></a>'
                                        + '<a href="#" class="next icon-page_next "><em>NEXT</em></a>'
                                        + '<a href="#" class="next_end icon-page_nextnext">END</a></div>';

                                    $(".paging-area").append(html);

                                } else {
                                    $(".paging").hide();
                                }

                                $.each(lotData , function(idx , el){
                                    let locale = document.documentElement.lang;
                                    const titleJSON = JSON.parse(el.TITLE_JSON);
                                    const artistJSON = JSON.parse(el.ARTIST_NAME_JSON);
                                    const lotSizeJSON = JSON.parse(el.LOT_SIZE_JSON);
                                    const makeYearJSON = JSON.parse(el.MAKE_YEAR_JSON);
                                    const expePriceFromJSON = JSON.parse(el.EXPE_PRICE_FROM_JSON);
                                    const expePriceToJSON = JSON.parse(el.EXPE_PRICE_TO_JSON);
                                    const saleTitleJSON = JSON.parse(el.SALE_TITLE_JSON);
                                    let saleToDt = $filter('date')(el.SALE_TO_DT, 'yyyy-MM-dd HH:mm:ss');

                                    let size = "";
                                    let status = "";

                                    if(locale === 'ko'){
                                        size = size_text_cm(lotSizeJSON[0], $filter);
                                    }else{
                                        size = size_text(lotSizeJSON[0], $filter);
                                    }

                                    if(expePriceFromJSON[el.CURR_CD] == undefined) {
                                        expePriceFromJSON[el.CURR_CD] = '0';
                                    }
                                    if(expePriceToJSON[el.CURR_CD] == undefined) {
                                        expePriceToJSON[el.CURR_CD] = '0';
                                    }
                                    if(el.START_PRICE == undefined) {
                                        el.START_PRICE = '0';
                                    }
                                    if(el.LAST_PRICE == undefined) {
                                        el.LAST_PRICE = '0';
                                    }

                                    if (el.END_YN == 'N' || el.CLOSE_YN == 'N') {
                                        status = "진행중";
                                    }else if(el.END_YN == 'Y' || el.CLOSE_YN == 'Y'){
                                        status = "완료";
                                    }

                                    let html = '<li class="">'
                                        + '<div class="li-inner">'
                                        + '<article class="item-article">'
                                        + '<div class="image-area">'
                                        + '<figure class="img-ratio">'
                                        + '<div class="img-align">'
                                        + '<img src="https://www.seoulauction.com/nas_img/' + el.LOT_IMG_PATH + '/' + el.LOT_IMG_NAME + ' " alt="' + titleJSON + '">'
                                        + '</div></figure></div>'
                                        + '<div class="typo-area">'
                                        + '<div class="product_info">'
                                        + '<div class="num_heart-box">'
                                        + '<span class="num">' + el.LOT_NO + '</span>'
                                        + '<button class="heart js-work_heart">'
                                        + '<i class="icon-heart_off"></i></button></div>'
                                        + '<div class="info-box">'
                                        + '<div class="title"><span>' + artistJSON[locale] + ' </span><span class="sub"> (' + el.BORN_YEAR + ')</span></div>'
                                        + '<div class="desc"><span> ' + dotSubString(titleJSON[locale], 35) + ' </span></div>'
                                        + '<div class="standard">'
                                        + '<span> ' + el.MATE_NM + ' </span>'
                                        + '<div class="size_year">'
                                        + '<span> ' + size + ' </span>'
                                        + '<span> '+ makeYearJSON[locale] +' </span></div></div></div>'
                                        + '<div class="price-box">'
                                        + '<dl class="price-list">'
                                        + '<dt>추정가</dt>'
                                        + '<dd> ' + el.CURR_CD + ' ' + expePriceFromJSON[el.CURR_CD].toLocaleString()  + '</dd>'
                                        + '<dd>~ '+ expePriceToJSON[el.CURR_CD].toLocaleString() +' </dd></dl>'
                                        + '<dl class="price-list">'
                                        + '<dt>시작가</dt>'
                                        + '<dd> ' + el.CURR_CD + ' ' + el.START_PRICE.toLocaleString() + '</dd></dl>'
                                        + '<dl class="price-list">'
                                        + '<dt>현재가</dt>'
                                        + '<dd><strong>' + el.CURR_CD + ' ' + el.LAST_PRICE.toLocaleString()  + '</strong><em>(응찰'+ el.BID_CNT +')</em></dd></dl></div>'
                                        + '<div class="state-box">'
                                        + '<div class="state op-ing">'
                                        + '<div>' + status + '</div></div>'
                                        + '<div class="other">'
                                        + '<div class="d_name"> '+ saleTitleJSON[locale] +' </div>'
                                        + '<div class="d_day"> ' + saleToDt + ' KST</div></div></div></div></div></article></div></div>';

                                    $(".product-list").append(html);
                                });
                            }
                        })
                        .catch(function(error){
                            $scope.is_error = true;
                            console.log(error);
                        });


                }


                /* 관심작품 Start */
                // 관심작품 로직 추가(2018.08.14 YDH)
                $scope.inteSave = function($input) {
                    var $d = {"baseParms":{"sale_no":$input.sale_no, "lot_no":$input.lot_no},
                        "actionList":[
                            {"actionID":"add_cust_inte_lot", "actionType":"insert", "tableName":"CUST_INTE_LOT", "parmsList":[{}]}
                        ]};

                    $api = "/sale/addCustInteLot";

                    let data = {};
                    data['sale_no'] = $input.sale_no;
                    data['lot_no'] = $input.lot_no;

                    axios.post($api , data)
                        .then(function(response) {
                            console.log(response);
                            const result = response.data;
                            let success = result.success;
                            let lotData = [];

                            if(!success){
                                alert("데이터 로딩 실패");
                            } else {
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
                            }
                        })
                        .catch(function(error){
                            console.log(error);
                        });

                };

                $scope.inteDel = function($input) {
                    var $d = {"baseParms":{"sale_no":$input.sale_no, "lot_no":$input.lot_no},
                        "actionList":[
                            {"actionID":"del_cust_inte_lot", "actionType":"delete", "tableName":"CUST_INTE_LOT", "parmsList":[{}]}
                        ]};

                    $api = "/sale/delCustInteLot";

                    let data = {};
                    data['sale_no'] = $input.sale_no;
                    data['lot_no'] = $input.lot_no;

                    axios.post($api , data)
                        .then(function(response) {
                            console.log(response);
                            const result = response.data;
                            let success = result.success;
                            let lotData = [];

                            if(!success){
                                alert("데이터 로딩 실패");
                            } else {
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
                            }
                        })
                        .catch(function(error){
                            console.log(error);
                        });

                    /*
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
                    })*/
                };
                /* 관심작품 End */
            });
        </script>
        <script type="text/javascript" src="/js/bid.js"></script>

        <!-- container -->
        <div id="container" ng-controller="lotListCtl" data-ng-init="init();">
            <div id="contents" class="contents">
                <section class="basis-section search-section">
                    <div class="section-inner">
                        <div class="content-panel type_panel-search">
                            <div class="panel-header">
                                <div class="search_results">"<strong>${param.searchContent}</strong>" 검색결과 <q id="totalCount"></q> 개</div>
                            </div>
                            <div class="panel-body">
                                <div class="search-area">
                                    <div class="search-box">
                                        <div class="input_del">
                                            <input class="" type="text" placeholder="" value="${param.searchContent}">
                                            <button class="btn_del"><i class="form-search-del_lg"></i></button>
                                        </div>
                                        <button class="btn_search"><i class="form-search_lg" ng-model="search.keyword" ng-keypress="$event.keyCode === 13 && loadLotList(1, 'all');"></i></button>
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
                                            <li class="active"><a href="" ng-click="loadSubPage('all');" ><span>전체</span> <em id="allCount"></em></a></li>
                                            <li><a href="#tab-cont-2" ng-click="loadSubPage('live');" ><span>라이브</span> <em id="liveCount"></em></a></li>
                                            <li><a href="#tab-cont-3" ng-click="loadSubPage('online');" ><span>온라인</span> <em id="onlineCount"></em></a></li>
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
                                                    <li><span>예정경매</span><button><i class="icon-filter_del"></i></button></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col_item positon-col2">
                                            <div class="select-box">
                                                <select class="select2Basic42" ng-model="sortBy">
                                                    <option ng-repeat="(key, value) in orders" value="{{key}}">{{value}}</option>
                                                </select>
                                            </div>
                                            <div class="select-box">
                                                <select class="select2Basic42 js-select_page" ng-model="moreBy">
                                                    <option ng-repeat="(key, value) in mores" value="{{key}}">{{value}}</option>
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
                                </ul>

                            </div>
                            <div class="panel-footer">
                                <div class="set-pc_mb">
                                    <div class="only-pc">
                                        <div class="paging-area">

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

        <!-- footer -->
        <!--footer도 아래와 같이 inculde 하는게 맞지만 일단 깨져서 적용 안함-->
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
<script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script>

<script type="text/javascript" src="/js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/pages_common_ko.js" type="text/javascript"></script>

<!-- ===텝메뉴=== -->
<script>
    $('.js-list_tab a').on('click', function($e) {
        $e.preventDefault();
        var tar = $(this).position().left;
        var scrollX = tar - ($(".js-list_tab").parents(".tab-area").width() / 2) + $(this).width() / 2;

        if ($(this).parents('li').hasClass('active')) {
            return false;
        } else {
            $(".js-list_tab li").removeClass('active');
            $(this).parents('li').addClass('active');

            $(".js-list_tab").parents(".tab-area").scrollLeft(scrollX);
        }
    });
</script>

<!-- ===필터===  -->
<script>
    /* 필터 삭제 */
    $(".js-filter_del-list button").on("click", function($e) {
        $(this).closest("li").remove();
    })
</script>

<!-- pc, mb select 값변경  -->
<script>
    $(function() {
        $(window).on("resize", function($e) {
            select_resize_change();
        });

        function select_resize_change() {
            if ($("body").hasClass("is_mb")) {
                $(".js-select_page").val("2");
            } else {
                $(".js-select_page").val("1");
            }
            $(".js-select_page").trigger('change');
        }
        select_resize_change();
    });
</script>


<aside class="filter_fixed-wrap">
    <div class="popup-dim"></div>

    <div class="fixed-panel">
        <div class="panel-header">
            <button class="filter_close js-filter_close">
                <i class="icon-pop_view_close"></i>
            </button>
            <div class="title-box">
                <div class="box-inner">
                    <span>Filter</span>
                    <button class="btn-filter_refresh">
                        <i class="icon-filter_refresh"></i><span>초기화</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="panel-body scroll-type">

            <article class="filter_potion-article">
                <ul class="js-toggle_accordion">
                    <li class="">
                        <div class="accordion-header">
                            <a href="#" class="header-box" data-active="">
                                <span>경매일</span>
                                <i class="icon-accordion_arrow_thin"></i>
                            </a>
                        </div>
                        <div class="accordion-body">
                            <ul class="check-list">
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox1" type="checkbox" name="">
                                            <i></i>
                                            <label for="checkbox1">지난 경매</label>
                                        </span>
                                </li>
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox2" type="checkbox" name="">
                                            <i></i>
                                            <label for="checkbox2">진행 경매</label>
                                        </span>
                                </li>
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox3" type="checkbox" name="">
                                            <i></i>
                                            <label for="checkbox3">예정 경매</label>
                                        </span>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="accordion-header">
                            <div class="header-box">
                                <span>재질</span>
                            </div>
                        </div>
                        <div class="accordion-body">
                            <ul class="check-list">
                                <li>
                                    <input type="text" placeholder="작품재질 입력" ng-model="search.mate_nm">
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </article>

        </div>
        <div class="panel-footer">
            <div class="btn_set">
                <div class="btn_item"><a class="btn btn_point btn_lg" href="#" role="button" ng-keypress="$event.keyCode === 13 && loadLotList(1, 'all');"><span>필터적용</span></a> </div>
            </div>
        </div>
    </div>
</aside>
<script>
    /* 팝업 열고,닫기 */
    $(".js-filter_btn").on("click", function() {
        $(".filter_fixed-wrap").addClass("active");
    });
    $(".filter_fixed-wrap .js-filter_close, .filter_fixed-wrap .popup-dim").on("click", function() {
        $(".filter_fixed-wrap").removeClass("active");
    });

    /* 토글 */
    var toggle_accordion = $(".js-toggle_accordion a").trpToggleBtn(
        function($this) {
            var _li = $($this).closest("li");
            _li.addClass("on");
            //_li.find(".accordion-body").addClass("on");
            _li.find(".accordion-body").slideDown("fast");
        },
        function($this) {
            var _li = $($this).closest("li");
            _li.removeClass("on");
            _li.find(".accordion-body").removeClass("on");
            _li.find(".accordion-body").slideUp("fast");

        });
    toggle_accordion.setBtn(0);
</script>

</body>

</html>