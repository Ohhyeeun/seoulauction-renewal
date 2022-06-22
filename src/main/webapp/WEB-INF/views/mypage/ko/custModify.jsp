<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
<head>
    <title>회원정보수정 | Seoul Auction</title>
</head>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
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
                                                        <span class="tt2">회원정보수정</span>
                                                    </div>
                                                    <div class="btn-wrap js-history_back m-ver"><i class="icon-page_back"></i></div>
                                                </div>
                                            </div>
                                            <div class="contents-wrap">
                                                <div class="required">
                                                    <span>
                                                        <i>*</i>
                                                        필수
                                                    </span>
                                                </div>
                                                <form id="modifyForm">
                                                <ul class="form_list">
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="id" class="label_text">아이디</label>
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
                                                        	<c:if test="${userKind == 'person' }">
                                                            <label for="name" class="label_text">이름</label>
                                                            </c:if>
                                                            <c:if test="${userKind != 'person' }">
                                                            <label for="name" class="label_text">업체명</label>
                                                            </c:if>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body">
                                                            <span class="mem_text">${userNm }</span>
                                                        </div>
                                                    </li>
                                                    
                                                    <c:if test="${userKind == 'person' }">
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="yy" class="label_text">생년월일</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body select-box_wrap">
                                                            <div class="select-box">
                                                                <select name="born_dt" class="select2Basic50" id="yy" onchange="bornDtValidCheck()">
                                                                    <option value="1">년도</option>
                                                                    <c:forEach var="cnt" begin="0" end="${thisYear - 12 - 1920 }" step="1">
                                                                    	<option value="${thisYear - 12 - cnt}">${thisYear - 12 - cnt}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="select-box">
                                                                <select name="born_dt" class="select2Basic50" id="mm" onchange="bornDtValidCheck()">
                                                                    <option value="1">월</option>
                                                                    <c:forEach var="cnt" begin="1" end="12" step="1">
                                                                    	<option value="<fmt:formatNumber value='${cnt}' pattern ='00' />"><fmt:formatNumber value='${cnt}' pattern ='00' /></option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="select-box">
                                                                <select name="born_dt" class="select2Basic50" id="dd" onchange="bornDtValidCheck()">
                                                                    <option value="1">일</option>
                                                                    <c:forEach var="cnt" begin="1" end="31" step="1">
                                                                    	<option value="<fmt:formatNumber value='${cnt}' pattern ='00' />"><fmt:formatNumber value='${cnt}' pattern ='00' /></option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="gender" class="label_text">성별</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body">
                                                            <span class="trp radio-box">
                                                                <input id="radio1-1" type="radio" name="sex_cd" value="male" onclick="javascript:sexCdValid=true;buttonActive();">
                                                                <i></i>
                                                                <label for="radio1-1">남자</label>
                                                            </span>
                                                            <span class="trp radio-box">
                                                                <input id="radio1-2" type="radio" name="sex_cd" value="female" onclick="javascript:sexCdValid=true;buttonActive();">
                                                                <i></i>
                                                                <label for="radio1-2">여자</label>
                                                            </span>
                                                        </div>
                                                    </li>
                                                    </c:if>
                                                    
                                                    <c:if test="${userKind != 'person' }">
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="licenseNo" class="label_text">사업자등록번호</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <div class="input-group">
                                                                <input type="text" onkeyup="compNoValidCheck(); "id="comp_no" name="comp_no" class="form-control" value="" placeholder="">
                                                                <button class="btn btn_light_gray_line" type="button" onclick="compNoExistCheck()">
                                                                    <span>중복확인</span>
                                                                </button>
                                                            </div>
                                                            <p class="error_text tb2" id="compNoMsg"></p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="email" class="label_text">대표자명</label>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <input type="text" name="comp_owner" id="comp_owner" class="form-control" value="" placeholder="">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="email" class="label_text">업무 담당자</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <input type="text" onkeyup="compManNameValidCheck()" name="comp_man_name" id="comp_man_name" class="form-control" value="김유미" placeholder="">
                                                            <p class="error_text tb2" id="compManNameMsg"></p>
                                                        </div>
                                                    </li>
                                                    </c:if>
                                                    
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="phoneNo" class="label_text">휴대폰번호</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <div class="input-group">
                                                                <input type="text" maxLength=13 onkeypress="phoneNumber(this);" onkeyup="onlyNumber(this, 'number');compareOldHp();" name="hp" id="hp" class="form-control" placeholder="">
                                                                <button onclick="authNumRequest()" class="btn btn_light_gray_line" type="button">
                                                                    <span id="authNumMsg">인증번호 요청</span>
                                                                </button>
                                                            </div>
                                                            <div class="input-group" id="hpAuthArea" style="display:none">
                                                                <input type="text" maxlength=6 onkeyup="onlyNumber(this, 'number');" name="hp_auth" id="hp_auth" class="form-control authNum" value="" placeholder="인증번호 입력">
                                                                <button onclick="authNumConfirm()" class="btn btn_light_gray_line authNum" type="button">
                                                                    <span>인증번호 확인</span>
                                                                </button>
                                                            </div>
                                                            <p class="error_text tb2" id="hpMsg"></p>
															<p class="error_text tb2" id="checkHpAuthMsg"></p>
                                                        </div>
                                                    </li>
                                                    
                                                    <c:if test="${userKind != 'person' }">
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="telNo" class="label_text">전화번호</label>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <input type="text" name="tel" id="tel" onblur="telNumber(this);" onkeyup="onlyNumber(this, 'number');" class="form-control" value="" placeholder="">
                                                        </div>
                                                    </li>
                                                    </c:if>
                                                    
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="email" class="label_text">이메일</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <input type="text" onkeyup="emailValidCheck()" name="email" id="email" class="form-control" placeholder="">
                                                            <p class="error_text tb2" id="emailMsg"></p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="zipno" class="label_text">주소</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <div class="input-group">
                                                                <input type="text" onclick="addressSearch()" name="zipno" id="zipno" class="form-control" placeholder="" readonly>
                                                                <button onclick="addressSearch('addr')" class="btn btn_light_gray_line" type="button">
                                                                    <span>주소검색</span>
                                                                </button>
                                                            </div>
                                                            <span class="mem_text address_text" id="addr"></span>
                                                            <div>
                                                                <input type="text" onkeyup="addrDtlValidCheck()" name="addr_dtl" id="addr_dtl" class="form-control" value="" placeholder="">
                                                            </div>
                                                            <p class="error_text tb2" id="addrMsg"></p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="deli_zipno" class="label_text">배송 주소</label>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <span class="trp checkbox-box address_text2">
                                                                <input id="copyAddrChk" type="checkbox" onclick="copyAddr()">
                                                                <i></i>
                                                                <label for="copyAddrChk">주소와 동일한 경우 체크해 주세요.</label>
                                                            </span>
                                                            <div class="input-group">
                                                                <input type="text" name="deli_zipno" id="deli_zipno" class="form-control" value="" placeholder="" readonly>
                                                                <button onclick="addressSearch('deli')" class="btn btn_light_gray_line" type="button">
                                                                    <span>주소검색</span>
                                                                </button>
                                                            </div>
                                                            <span class="mem_text address_text" id="deli_addr"></span>
                                                            <div>
                                                                <input type="text" name="deli_addr_dtl" id="deli_addr_dtl" class="form-control" value="" placeholder="">
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="checkbox1" class="label_text">정보수신방법</label>
                                                        </div>
                                                        <div class="form_body" id="pushWayList">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="checkbox1" class="label_text">작품관심분야</label>
                                                        </div>
                                                        <div class="form_body widthExtend box_Over" id="interestAreaList">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="writer" class="label_text">관심작가</label>
                                                        </div>
                                                        <div class="form_body widthExtend">
                                                            <div class="input-group">
                                                                <input type="text" id="writer" class="form-control" value="" placeholder="">
                                                                <button onclick="artistSearch()" class="btn btn_light_gray_line" type="button">
                                                                    <span>작가 검색</span>
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
                                                    <a href="#" onclick="custLeave();">회원탈퇴</a>
                                                </div>
                                                <div class="btn_area" onclick="custModify()">
                                                    <button class="btn btn_point btn_lg" id="modifyButton" type="button" disabled>
                                                        <span>회원정보 수정</span>
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
            <jsp:include page="../../include/ko/footer.jsp" flush="false" />
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
	
	<!-- 주소검색 address_search1 -->
	<div id="address_search1-wrap" class="trp popupfixed-wrap default-popup ">
	    <div class="popup-dim"></div>
	    <div class="popup-align mode-ms mode-mb_full">
	        <div class="popup-vertical">
	            <div class="popup-layer">
	
	                <div class="pop-panel">
	                    <div class="pop-header">
	                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
	                        <div class="title-box">
	                            <span class="txt_title type-big">주소검색</span>
	                        </div>
	                    </div>
	                    <div class="pop-body scroll-type">
	                        <section class="section" style="display: block;">
	
	                            <div class="search-group sm">
	                                <input type="text" id="addr_word" class="form-control" onkeypress="$event.keyCode === 13 && findAddrNewForm();" placeholder="도로명주소 건물번호 검색">
	                                <button class="btn btn_black" id="findAddr" type="button" onclick="findAddrNewForm()"><span>검색</span></button>
	                            </div>
	
	                            <article class="articles-box">
	                                <div class="table-panel">
	                                    <div class="table-header">
	                                        <div class="dataTables_length result_txt">
	                                            검색 결과
	                                        </div>
	                                    </div>
	                                    <div class="table-body">
	                                        <div class="table_scroll scroll-type">
	                                            <table class="table_base list-table add_list">
	                                                <thead>
	                                                    <tr>
	                                                        <th>우편번호</th>
	                                                        <th>주소</th>
	                                                    </tr>
	                                                </thead>
	                                                <tbody id="addrListBody">
	                                                	<tr><td colspan="2"><div class="data-empty_mem tb1">검색결과가 없습니다.</div></td></tr>
	                                                </tbody>
	                                            </table>
	                                        </div>
	                                    </div>
	                                </div>
	                            </article>
	                        </section>
	                    </div>
	                </div>
	
	            </div>
	        </div>
	    </div>
	</div>
	
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
	                            <span class="txt_title type-big">작가검색</span>
	                        </div>
	                    </div>
	                    <div class="pop-body scroll-type">
	                        <section class="section">
	                            <div class="search-group">
	                                <input type="text" id="artist_word" class="form-control" value="" placeholder="이름 입력">
	                                <button onclick="findArtistNewForm()" class="btn btn_black" type="button"><span>검색</span></button>
	                            </div>
	                            <article class="articles-box">
	                                <div class="table-panel">
	                                    <div class="table-header">
	                                        <div class="dataTables_length tb1">
	                                            <span>전체<em id="artistCnt"></em>건</span>
	                                        </div>
	                                    </div>
	                                    <div class="table-body">
	                                        <div class="table_scroll thead_item">
	                                            <table class="table_base list-table writer_list">
	                                                <thead>
	                                                    <tr>
	                                                        <th class="radio">선택</th>
	                                                        <th>작가명</th>
	                                                        <th>출생/사망년도</th>
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
	                                                                검색결과가 없습니다.
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
	                                    <span>취소</span>
	                                </a>
	                                <a onclick="setArtists()" class="btn btn_point" href="#" role="button">
	                                    <span>등록</span>
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
</html>