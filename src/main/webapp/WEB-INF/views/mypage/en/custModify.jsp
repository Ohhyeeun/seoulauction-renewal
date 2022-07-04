<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../../include/en/header.jsp" flush="false"/>

<link rel="stylesheet" href="/css/plugin/csslibrary.css">
<sec:authentication property="details.socialYn" var="socialYn"></sec:authentication>
<sec:authentication property="details.socialType" var="socialType"></sec:authentication>
<sec:authentication property="details.userNo" var="userNo"></sec:authentication>
<sec:authentication property="details.userKind" var="userKind"></sec:authentication>
<sec:authentication property="details.loginId" var="loginId"></sec:authentication>
<sec:authentication property="details.userNm" var="userNm"></sec:authentication>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="thisYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
 
<script>
console.log('${sessionScope.SPRING_SECURITY_CONTEXT.authentication}')
	var socialYn = '${socialYn}';
	var socialType = '${socialType}';
	var userNo = '${userNo}';
	var userKind = '${userKind}';
</script>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/nav.jsp" flush="false" />
            <!-- container -->
            <div id="container" class="custModify">
                <div id="contents" class="contents">

                    <section class="basis-section last-section mypage-section">
                        <div class="section-inner">

                            <div class="content-panel type_panel-mypage_memberModify">
                                <div class="panel-body">
                                    <div class="mypage-container">

                                        <!-- 마이페이지 싸이드 메뉴 -->
                                        <jsp:include page="include/mypageSide.jsp" flush="false" />

                                        <div class="content-area">
                                            <div class="subtitle-wrap">
                                                <div class="subtitle-inner">
                                                    <div class="title">
                                                        <span class="tt2">Change Information</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <div class="required">
                                                    <span>
                                                        <i>*</i>
                                                        Required
                                                    </span>
                                                </div>
                                                <form id="modifyForm">
                                                <ul class="form_list">
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="id" class="label_text">Account ID</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body id_space">
                                                            <div class="sns_icon-wrap">
                                                                <span class="mem_text">${loginId }</span>
	                                            				<c:if test="${socialYn == 'Y' }">
	                                                                <span class="sns_icon">
	                                                                    <img id="snsImg">
	                                                                </span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label name_space">
                                                            <label for="name" class="label_text">Name</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body">
                                                            <span class="mem_text">${userNm }</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="yy" class="label_text">Birth Date</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body select-box_wrap">
                                                            <div class="select-box">
                                                                <select name="born_dt" class="select2Basic50" id="yy" onchange="bornDtValidCheck()">
                                                                    <option value="1">Year</option>
                                                                    <c:forEach var="cnt" begin="0" end="${thisYear - 12 - 1920 }" step="1">
                                                                    	<option value="${thisYear - 12 - cnt}">${thisYear - 12 - cnt}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="select-box">
                                                                <select name="born_dt" class="select2Basic50" id="mm" onchange="bornDtValidCheck()">
                                                                    <option value="1">Month</option>
                                                                    <c:forEach var="cnt" begin="1" end="12" step="1">
                                                                    	<option value="<fmt:formatNumber value='${cnt}' pattern ='00' />"><fmt:formatNumber value='${cnt}' pattern ='00' /></option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="select-box">
                                                                <select name="born_dt" class="select2Basic50" id="dd" onchange="bornDtValidCheck()">
                                                                    <option value="1">Day</option>
                                                                    <c:forEach var="cnt" begin="1" end="31" step="1">
                                                                    	<option value="<fmt:formatNumber value='${cnt}' pattern ='00' />"><fmt:formatNumber value='${cnt}' pattern ='00' /></option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="gender" class="label_text">Gender</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body">
                                                            <span class="trp radio-box">
                                                                <input id="radio1-1" type="radio" name="sex_cd" value="male" onclick="javascript:sexCdValid=true;buttonActive();">
                                                                <i></i>
                                                                <label for="radio1-1">Male</label>
                                                            </span>
                                                            <span class="trp radio-box">
                                                                <input id="radio1-2" type="radio" name="sex_cd" value="female" onclick="javascript:sexCdValid=true;buttonActive();">
                                                                <i></i>
                                                                <label for="radio1-2">Female</label>
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="email" class="label_text">Email</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <input type="text" tabindex="4" onkeyup="emailValidCheck()" name="email" id="email" class="form-control" placeholder="">
															<button class="btn btn_light_gray_line mt10" type="button" onclick="emailDuplCheck()">
                                                                <span>Check Availability</span>
                                                            </button>
                                                            <p class="error_text tb2" id="emailMsg"></p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="country" class="label_text">Country</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <div class="select-box country_box">
                                                                <select class="select2Basic" id="nation_cd" tabindex="5" name="nation_cd" onchange="changeNation();">
																	<option value="">Select your country</option>
																</select>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="phoneNo" class="label_text">Mobile Number</label>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <input type="text" tabindex="6" onkeyup="onlyNumber(this, 'number');" name="hp" id="hp" class="form-control" placeholder="">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="zipno" class="label_text">Address</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <span class="mem_text address_text mt0">Postal Code</span>
                                                            <div>
                                                                <input onblur="addrValidBlur()" type="text" tabindex="7" name="zipno" id="zipno" class="form-control" placeholder="">
                                                            </div>
                                                            <span class="mem_text address_text">Address Line</span>
                                                            <div>
                                                                <input onblur="addrValidBlur()" type="text" tabindex="8" name="addr" id="addr" class="form-control" placeholder="">
															</div>
                                                            <span class="mem_text address_text">Province / state. City</span>
                                                            <div>
                                                                <input onblur="addrValidBlur()" type="text" tabindex="9" name="addr_dtl" id="addr_dtl" class="form-control" placeholder="">
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="deli_zipno" class="label_text">Shipping Address</label>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <span class="trp checkbox-box address_text2">
                                                                <input id="copyAddrChk" type="checkbox" onclick="copyAddr()">
                                                                <i></i>
                                                                <label for="copyAddrChk">If the address is the same as above, please select the checkbox.</label>
                                                            </span>
                                                            <div>
                                                                <span class="mem_text address_text">Postal Code</span>
                                                                <div>
	                                                                <input onblur="addrValidBlur()" type="text" tabindex="7" name="deli_zipno" id="deli_zipno" class="form-control" placeholder="">
	                                                            </div>
	                                                            <span class="mem_text address_text">Address Line</span>
	                                                            <div>
	                                                                <input onblur="addrValidBlur()" type="text" tabindex="8" name="deli_addr" id="deli_addr" class="form-control" placeholder="">
																</div>
	                                                            <span class="mem_text address_text">Province / state. City</span>
	                                                            <div>
	                                                                <input onblur="addrValidBlur()" type="text" tabindex="9" name="deli_addr_dtl" id="deli_addr_dtl" class="form-control" placeholder="">
	                                                            </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="checkbox1" class="label_text">Receive via</label>
                                                        </div>
                                                        <div class="form_body" id="pushWayList">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="checkbox1" class="label_text">Art Work Interest</label>
                                                        </div>
                                                        <div class="form_body widthExtend box_Over" id="interestAreaList">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="writer" class="label_text">Favorite Artist</label>
                                                        </div>
                                                        <div class="form_body widthExtend">
                                                            <div class="input-group">
                                                                <input type="text" id="writer" class="form-control" value="" placeholder="">
                                                                <button onclick="artistSearch()" class="btn btn_light_gray_line" type="button">
                                                                    <span>Artist search</span>
                                                                </button>
                                                            </div>
                                                            <ul class="writer_list js-writer_del-list" id="artistList">
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <input type="hidden" name="addr_old_yn" id="addr_old_yn" />
                                                <input type="hidden" name="deli_addr_old_yn" id="deli_addr_old_yn" />
                                                </form>
                                                <div class="dropOut_text">
                                                    <a href="#" onclick="custLeave();">Delete Account</a>
                                                </div>
                                                <div class="btn_area" onclick="custModify()">
                                                    <button class="btn btn_point btn_lg" id="modifyButton" type="button" disabled>
                                                        <span>SAVE</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="panel-footer"></div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/en/footer.jsp" flush="false" />
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
    <!-- 팝업 : side popup -->
	<jsp:include page="include/mypageSidePopup.jsp" flush="false"/>
	
	<!-- 작가검색 -->
	<div id="writer_search1-wrap" class="trp popupfixed-wrap default-popup ">
	    <div class="popup-dim"></div>
	    <div class="popup-align mode-ms mode-mb_full">
	        <div class="popup-vertical">
	            <div class="popup-layer">
	                <div class="pop-panel">
	                    <div class="pop-header">
	                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
	                        <div class="title-box">
	                            <span class="txt_title type-big">Author Search</span>
	                        </div>
	                    </div>
	                    <div class="pop-body scroll-type">
	                        <section class="section">
	                            <div class="search-group">
	                                <input type="text" id="artist_word" class="form-control" value="" placeholder="Enter name">
	                                <button onclick="findArtistNewForm()" class="btn btn_black" type="button"><span>Search</span></button>
	                            </div>
	                            <article class="articles-box">
	                                <div class="table-panel">
	                                    <div class="table-header">
	                                        <div class="dataTables_length tb1">
	                                            <span>Result <em id="artistCnt"></em></span>
	                                        </div>
	                                    </div>
	                                    <div class="table-body">
	                                        <div class="table_scroll thead_item">
	                                            <table class="table_base list-table writer_list">
	                                                <thead>
	                                                    <tr>
	                                                        <th class="radio">Select</th>
	                                                        <th>Artist</th>
	                                                        <th>Year of birth/death</th>
	                                                    </tr>
	                                                </thead>
	                                            </table>
	                                        </div>
	                                    </div>
	                                    <div class="table-body">
	                                        <div class="table_scroll scroll-type tbody_item writer_btn_list">
	                                            <table class="table_base list-table writer_list">
	                                                <tbody id="artistListBody">
	                                                 <tr>
	                                                        <td colspan="3">
	                                                            <div class="data-empty_mem tb1">
	                                                                No results were found for your search.
	                                                            </div>
	                                                        </td>
	                                                    </tr>
	                                                </tbody>
	                                            </table>
	                                        </div>
	                                    </div>
	                                </div>
	                            </article>
	                            <div class="btn-set search-group_btn">
	                                <a id="writerClose" class="btn btn_default" href="#" role="button">
	                                    <span>Cancel</span>
	                                </a>
	                                <a onclick="setArtists()" class="btn btn_point" href="#" role="button">
	                                    <span>Registration</span>
	                                </a>
	                            </div>
	                        </section>
	                    </div>
	                </div>
	
	            </div>
	        </div>
	    </div>
	</div>
</body>
<!-- 회원정보수정 비밀번호확인 -->
<script type="text/javascript" src="/js/mypage/custModify.js"></script>
<script>
    $(".js-history_back").click(function() {
    	window.location.href="/mypage/main";
    })
</script>
</html>