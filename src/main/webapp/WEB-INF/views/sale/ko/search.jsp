<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- header -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>search | Seoul Auction</title>
    <link rel="stylesheet" href="/css/plugin/csslibrary.css">
    <link rel="stylesheet" href="/css/common.css" type="text/css" />
</head>
<body class="">
<div class="wrapper" >
    <div class="sub-wrap pageclass type-width_list">

        <!-- header -->
        <%--<link rel="stylesheet" href="/css/main.css" type="text/css" />--%>
        <jsp:include page="../../include/ko/header.jsp" flush="false"/>
        <!-- //header -->
        <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
        <script type="text/javascript" src="/js/angular/checklist-model.js"></script>
        <script type="text/javascript" src="/js/angular/rzslider.min.js"></script>
        <link href="/css/jquery.nouislider.css" rel="stylesheet">
        <script type="text/javascript" src="/js/customer/login.js"></script>
        <script>
            app.value('locale', 'ko');

            function recommandSearch(contents){

                $(".searchContent").val(contents);
                goSearch('searchContent', true);
            }

            function enterSearch(elementId, bIsKorean){
                if(window.event.keyCode == 13){
                    goSearch(elementId, bIsKorean);
                }
            }

            function goSearch(elementId, bIsKorean) {

                var sSearchContent = $("." + elementId).val();
                if(sSearchContent) {
                    location.href = bIsKorean ? "/sale/search?searchContent=" + sSearchContent : "/eng/sale/search?searchContent=" + sSearchContent;
                    setCookie('keyword', sSearchContent, 1);
                    $("#topSearchContent").val(sSearchContent);
                }
                else {
                    alert(bIsKorean ? "검색어를 입력해주세요." : "Please write search keyword.");
                }
            }

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

            app.requires.push.apply(app.requires, ["ngDialog", "checklist-model"]);
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
                $scope.firstChk = 0;

                $scope.reqRowCnts = {20:"<spring:message code='label.listup.lots' arguments='20' />",
                    50:"<spring:message code='label.listup.lots' arguments='50' />",
                    100:"<spring:message code='label.listup.lots' arguments='100' />"};

                $scope.sortBy = "ENDDE";
                $scope.moreBy = "MOREP";

                $scope.sale_kind_all = true;

                $scope.loadSubPage = function(subPage){
                    $scope.loadLotList(1, subPage);
                }

                $scope.initFilter = function(){
                    let checked = true;
                    $('input:checkbox[name="lotCheckBox"]').each(function(){
                        $(this).attr("checked", false);
                    });

                    $scope.sale_status_end_yn = 'N';
                    $scope.sale_status_ing_yn = 'N';
                    $scope.sale_status_ready_yn = 'N';
                    $('#mateNm').val('');
                }

                $scope.filterCheck = function(){

                    //경매일 체크
                    let checked = true;
                    $scope.firstChk = 0;
                    $('input:checkbox[name="lotCheckBox"]').each(function(){

                        let checkBoxChecked = $(this).is(":checked");
                        let checkBoxId = $(this).val();

                        if(checkBoxChecked == true && checkBoxId == 'end'){
                            $scope.sale_status_end_yn = 'Y';
                            $('#endLot').show();
                        }
                        if(checkBoxChecked == true && checkBoxId == 'ing'){
                            $scope.sale_status_ing_yn = 'Y';
                            $('#ingLot').show();
                        }
                        if(checkBoxChecked == true && checkBoxId == 'ready'){
                            $scope.sale_status_ready_yn = 'Y';
                            $('#readyLot').show();
                        }

                        if(checkBoxChecked == false && checkBoxId == 'end'){
                            $scope.sale_status_end_yn = 'N';
                            $('#endLot').hide();
                        }
                        if(checkBoxChecked == false && checkBoxId == 'ing'){
                            $scope.sale_status_ing_yn = 'N';
                            $('#ingLot').hide();
                        }
                        if(checkBoxChecked == false && checkBoxId == 'ready'){
                            $scope.sale_status_ready_yn = 'N';
                            $('#readyLot').hide();
                        }
                    });

                    $scope.search.mate_nm = $('#mateNm').val();
                    $scope.loadLotList($scope.currentPage, $scope.subPage);
                    $(".filter_fixed-wrap").removeClass("active");
                }

                $scope.init = function(){

                    $scope.search.keyword = "${param.searchContent}";
                    $scope.search.chk = "all";//검색 조건 (all 통합검색, art 작가명, title 작품명)

                    $('input:checkbox[name="lotCheckBox"]').attr("checked", true);

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

                    //추천 검색어
                    axios.get('/sale/selectRecommandArtist').then(function(response) {
                        console.log(response);
                        const success = response.data.success;

                        $('.word-items').empty();

                        if (success) {
                            const data = response.data.data;
                            data.map(item =>{
                                let html = `<button onclick="recommandSearch(` + item.name + `)">` + + `</button>`;
                                html = '<button onclick="recommandSearch(\''+item.name+'\');">' + item.name + '</button>'
                                $('.word-items').append(html);
                            });
                        }
                    })
                        .catch(function(error){
                            console.log(error);
                        });
                }

                $scope.search = function(){
                    $scope.loadLotList($scope.currentPage, $scope.subPage);
                }

                $scope.moreSearch = function(){

                    //더보기가 선택된 경우 더보기 계산
                    if($scope.firstChk > 0){
                        $scope.reqRowCnt = parseInt($scope.reqRowCnt) + 5;
                    }
                    $scope.loadLotList($scope.currentPage, $scope.subPage);
                }

                $scope.clearSearchCondition = function(){
                    $scope.search = {"sale_kind" : ['main', 'online', 'online_zb', 'hongkong', 'plan', 'exhibit']};

                    setCookie('page', "", 1);
                    setCookie('subPage', "", 1);
                    setCookie('size', "", 1);
                    setCookie('sale_kind', "", 1);
                    setCookie('keyword', "", 1);
                    setCookie('mate_nm', "", 1);
                    setCookie('from_dt', "", 1);
                    setCookie('to_dt', "", 1);
                    setCookie('chk', "", 1);
                    setCookie('from', "", 1);
                    setCookie('rows', "", 1);
                    setCookie('sort_by', "", 1);
                    setCookie('more_by', "", 1);
                }

                $scope.cnt = 0;
                $scope.loadLotList = function($page, $subPage){
                    $(".product-list").empty();

                    if($page > 1){
                        setCookie('prev_url', getCookie('curr_url'), 1);
                    }

                    //최신순선택
                    const sort = $("#selectSort option:selected").val();
                    if(sort == 1){
                        $scope.sortBy = "ENDDE";
                    }else if(sort == 2){
                        $scope.sortBy = "ESTAS";
                    }else if(sort ==3){
                        $scope.sortBy = "ESTDE";
                    }
                    const more = $("#selectMore option:selected").val();

                    if(more == 1){
                        $scope.moreBy = "MOREP";
                    }else if(more == 2){
                        $scope.moreBy = "PAGNG";
                    }

                    setCookie('page', $page, 1);
                    setCookie('subPage', $subPage, 1);
                    setCookie('size', name, 1);
                    setCookie('sale_kind', $scope.search.sale_kind, 1);
                    setCookie('keyword', $scope.search.keyword, 1);
                    setCookie('mate_nm', $scope.search.mate_nm, 1);
                    setCookie('from_dt', $scope.search.from_dt, 1);
                    setCookie('to_dt', $scope.search.to_dt, 1);
                    setCookie('chk', $scope.search.chk, 1);
                    setCookie('from', (($scope.currentPage - 1) * parseInt($scope.reqRowCnt)), 1);
                    setCookie('rows', parseInt($scope.reqRowCnt), 1);
                    setCookie('sort_by', $scope.sortBy, 1);
                    setCookie('more_by', $scope.moreBy, 1);
                    setCookie('sale_status_end_yn', $scope.sale_status_end_yn, 1);
                    setCookie('sale_status_ing_yn', $scope.sale_status_ing_yn, 1);
                    setCookie('sale_status_ready_yn', $scope.sale_status_ready_yn, 1);
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
                    data['more_by'] = $scope.moreBy;
                    data['sale_status_end_yn'] = $scope.sale_status_end_yn;
                    data['sale_status_ing_yn'] = $scope.sale_status_ing_yn;
                    data['sale_status_ready_yn'] = $scope.sale_status_ready_yn;

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

                                $("#panel-empty").empty().hide();
                                $("#panel_footer").show();


                                if(lotData.length != 0){

                                    // 최초 한번에 대해서만 subpage count 계산
                                    if($scope.firstChk == 0){
                                        $('#totalCount').empty();
                                        $('#allCount').empty();
                                        $('#liveCount').empty();
                                        $('#onlineCount').empty();

                                        $('#totalCount').append($scope.totalCount);
                                        $('#allCount').append('(' + $scope.allCount + ')');
                                        $('#liveCount').append('(' + $scope.liveCount + ')');
                                        $('#onlineCount').append('(' + $scope.onlineCount + ')');
                                        $scope.firstChk = 1;
                                    }

                                    $("#more_search").hide();
                                    $(".paging").empty();

                                    if($scope.moreBy == "MOREP") {

                                        if($scope.totalCount > $scope.pageRows){
                                            $("#more_search").show();
                                        }

                                    }else if($scope.moreBy == "PAGNG"){

                                        //paging이 선택된 경우 paging 계산
                                        paging({
                                            id: "paging_search",
                                            className:"paging",
                                            totalCount:$scope.totalCount,
                                            itemSize:$scope.reqRowCnt,
                                            pageSize:10,
                                            page:$page,
                                            callBackFunc:function(i) {
                                                $scope.loadLotList(i, $scope.subPage);
                                            }
                                        });
                                    }

                                    $(".product-list").empty();

                                    $.each(lotData , function(idx , el){
                                        let locale = document.documentElement.lang;
                                        const titleJSON = JSON.parse(el.TITLE_JSON);
                                        let artistJSON = "";
                                        if(el.ARTIST_NAME_JSON != null){
                                            artistJSON = JSON.parse(el.ARTIST_NAME_JSON);
                                        }
                                        const lotSizeJSON = JSON.parse(el.LOT_SIZE_JSON);
                                        const makeYearJSON = JSON.parse(el.MAKE_YEAR_JSON);
                                        const expePriceFromJSON = JSON.parse(el.EXPE_PRICE_FROM_JSON);
                                        const expePriceToJSON = JSON.parse(el.EXPE_PRICE_TO_JSON);
                                        const saleTitleJSON = JSON.parse(el.SALE_TITLE_JSON);
                                        let saleToDt = $filter('date')(el.SALE_TO_DT, 'yyyy-MM-dd HH:mm:ss');

                                        let size = "";
                                        let status = "";
                                        let heart_status = "";
                                        let heart_function= "";

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

                                        if(el.INTE_LOT_DEL == 'N'){

                                            heart_status = 'icon-heart_on';
                                            heart_function = 'inteDel';

                                        }else if(el.INTE_LOT_DEL != 'N'){

                                            heart_status = 'icon-heart_off';
                                            heart_function = 'inteSave';
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
                                            + '<i class="'+ heart_status + '" onclick="'+heart_function+'(\''+el.SALE_NO+'\', \''+el.LOT_NO+'\', \''+locale+'\');"></i></button></div>'
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


                                } else {

                                    // 검색결과가 없는 경우

                                    let html = '<ul class="product-list"></ul>'
                                        + '<div class="data-empty type-big" id="panel-empty">'
                                        + '<div class="img_empty">'
                                        + '<img src="/images/mobile/auction/symbol-none_data.png" alt="검색결과가 없습니다." /></div>'
                                        + '<div class="txt_empty">'
                                        + '<div class="title">검색결과가 없습니다.</div>'
                                        + '<div class="desc">단어의 철자나 띄어쓰기가 <br class="only-mb" />정확한지 확인해주세요</div></div></div>';


                                    $("#panel_content").empty();
                                    $("#panel_footer").hide();
                                    $('#totalCount').empty();
                                    $('#allCount').empty();
                                    $('#liveCount').empty();
                                    $('#onlineCount').empty();

                                    $("#panel_content").append(html);
                                    $('#totalCount').append(0);
                                    $('#allCount').append('(0)');
                                    $('#liveCount').append('(0)');
                                    $('#onlineCount').append('(0)');

                                }
                            }
                        })
                        .catch(function(error){
                            $scope.is_error = true;
                            console.log(error);
                        });


                }

            });
        </script>

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
                                            <input class="searchContent" type="text" placeholder="" value="${param.searchContent}" onkeyup="enterSearch('searchContent', true);">
                                            <button class="btn_del"><i class="form-search-del_lg"></i></button>
                                        </div>
                                        <button class="btn_search"><i class="form-search_lg" onclick="goSearch('searchContent', true);"></i></button>
                                    </div>
                                    <div class="suggestion-box">
                                        <div class="word">
                                            <span>추천 검색어</span>
                                        </div>
                                        <div class="word-items">
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
                                                    <li id="endLot"><span>지난경매</span><button><i class="icon-filter_del"></i></button></li>
                                                    <li id="ingLot"><span>진행경매</span><button><i class="icon-filter_del"></i></button></li>
                                                    <li id="readyLot"><span>예정경매</span><button><i class="icon-filter_del"></i></button></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col_item positon-col2">
                                            <div class="select-box" id="selectSort">
                                                <select class="select2Basic42" >
                                                    <option value="1">경매 최신순</option>
                                                    <option value="2">추정가 낮은순</option>
                                                    <option value="3">추정가 높은순</option>s
                                                </select>
                                            </div>
                                            <div class="select-box" id="selectMore">
                                                <select class="select2Basic42 js-select_page" >
                                                    <option value="1">더보기 방식</option>
                                                    <option value="2">페이지 방식</option>
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
                            <div class="panel-body" id="panel_content">

                                <ul class="product-list">
                                </ul>

                            </div>
                            <div class="panel-footer" id="panel_footer">
                                <div class="set-pc_mb">
                                    <div class="only-pc">
                                        <div id="paging_search" class="paging-area">
                                            <button class="btn btn_gray_line" id="more_search" type="button" ng-click="moreSearch();"><span>더보기</span></button>
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

<script type="text/javascript" src="/js/common/paging.js"></script>
<script>

</script>

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
<script>



    function inteSave(saleNo, lotNo, locale) {
        let api = "/sale/addCustInteLot?saleNo="+saleNo+"&lotNo="+lotNo;
        axios.get(api , null)
            .then(function(response) {
                console.log(response);
                const result = response.data;
                let success = result.success;

                if(!success){
                    alert("데이터 로딩 실패");
                } else {
                    if(result.data > 0) {
                        if(locale == 'ko') {
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

    function inteDel(saleNo, lotNo, locale) {

        $api = "/sale/delCustInteLot?saleNo="+saleNo+"&lotNo="+lotNo;

        axios.get($api , null)
            .then(function(response) {
                console.log(response);
                const result = response.data;
                let success = result.success;

                if(!success){
                    alert("데이터 로딩 실패");
                } else {
                    if(result.data > 0) {
                        if(locale == 'ko') {
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

    };

</script>

<aside class="filter_fixed-wrap">
    <div class="popup-dim"></div>

    <div class="fixed-panel" ng-controller="lotListCtl" data-ng-init="init();">
        <div class="panel-header">
            <button class="filter_close js-filter_close">
                <i class="icon-pop_view_close"></i>
            </button>
            <div class="title-box">
                <div class="box-inner">
                    <span>Filter</span>
                    <button class="btn-filter_refresh">
                        <i class="icon-filter_refresh" ng-click="initFilter();"></i><span>초기화</span>
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
                                            <input id="checkbox1" type="checkbox" name="lotCheckBox" value="end">
                                            <i></i>
                                            <label for="checkbox1">지난 경매</label>
                                        </span>
                                </li>
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox2" type="checkbox" name="lotCheckBox" value="ing">
                                            <i></i>
                                            <label for="checkbox2">진행 경매</label>
                                        </span>
                                </li>
                                <li>
                                        <span class="trp checkbox-box">
                                            <input id="checkbox3" type="checkbox" name="lotCheckBox" value="ready">
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
                                    <input type="text" placeholder="작품재질 입력" ng-model="search.mate_nm" id="mateNm">
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </article>

        </div>
        <div class="panel-footer" >
            <div class="btn_set">
                <div class="btn_item"><a class="btn btn_point btn_lg" href="#" role="button" ng-click="filterCheck();"><span>필터적용</span></a> </div>
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