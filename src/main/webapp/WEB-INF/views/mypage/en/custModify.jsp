<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script>
	console.log('${sessionScope.SPRING_SECURITY_CONTEXT.authentication}')
</script>
<body class="">
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/header.jsp" flush="false" />
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
                                                <ul class="form_list">
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="id" class="label_text">아이디</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body id_space">
                                                            <div class="sns_icon-wrap">
                                                                <span class="mem_text">Gildong.hong92</span>
                                                                <span class="sns_icon">
                                                                    <img src="/images/common/icon-sns_naver.png">
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label name_space">
                                                            <label for="name" class="label_text">이름</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body">
                                                            <span class="mem_text">홍길동</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="yy" class="label_text">생년월일</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body select-box_wrap">
                                                            <div class="select-box">
                                                                <select class="select2Basic50" id="yy">
                                                                    <option value="1">년도</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                </select>
                                                            </div>
                                                            <div class="select-box">
                                                                <select class="select2Basic50" id="mm">
                                                                    <option value="1">월</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                </select>
                                                            </div>
                                                            <div class="select-box">
                                                                <select class="select2Basic50" id="dd">
                                                                    <option value="1">일</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
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
                                                                <input id="radio1-1" type="radio" name="radioset1">
                                                                <i></i>
                                                                <label for="radio1-1">남자</label>
                                                            </span>
                                                            <span class="trp radio-box">
                                                                <input id="radio1-2" type="radio" name="radioset1">
                                                                <i></i>
                                                                <label for="radio1-2">여자</label>
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="phoneNo" class="label_text">휴대폰번호</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <div class="input-group">
                                                                <input type="text" id="phoneNo" class="form-control" value="010-111-2222" placeholder="">
                                                                <button class="btn btn_light_gray_line" type="button">
                                                                    <span>인증번호 요청</span>
                                                                </button>
                                                            </div>
                                                            <div class="input-group">
                                                                <input type="text" id="phoneNo" class="form-control" value="" placeholder="인증번호 입력">
                                                                <button class="btn btn_light_gray_line" type="button">
                                                                    <span>인증번호 확인</span>
                                                                </button>
                                                            </div>
                                                            <p class="error_text tb2">안내 메시지 출력 영역</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="email" class="label_text">이메일</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <input type="text" id="email" class="form-control" value="gildong.hong92@seoulauction.co.kr" placeholder="">
                                                            <p class="error_text tb2">안내 메시지 출력 영역</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="zipcode" class="label_text">주소</label>
                                                            <i>*</i>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <div class="input-group">
                                                                <input type="text" id="zipcode" class="form-control" value="03344" placeholder="">
                                                                <button class="btn btn_light_gray_line" type="button">
                                                                    <span>주소검색</span>
                                                                </button>
                                                            </div>
                                                            <span class="mem_text address_text">서울특별시 종로구 평창 31길 5 (평창동)</span>
                                                            <div>
                                                                <input type="text" id="address" class="form-control" value="" placeholder="평창동 앞마당 상세주소">
                                                            </div>
                                                            <p class="error_text tb2">안내 메시지 출력 영역</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="zipcode2" class="label_text">배송 주소</label>
                                                        </div>
                                                        <div class="form_body vertical_item">
                                                            <span class="trp checkbox-box address_text2">
                                                                <input id="checkbox1" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox1">주소와 동일한 경우 체크해 주세요.</label>
                                                            </span>
                                                            <div class="input-group">
                                                                <input type="text" id="zipcode2" class="form-control" value="03344" placeholder="">
                                                                <button class="btn btn_light_gray_line" type="button">
                                                                    <span>주소검색</span>
                                                                </button>
                                                            </div>
                                                            <span class="mem_text address_text">서울특별시 종로구 평창 31길 5 (평창동)</span>
                                                            <div>
                                                                <input type="text" id="address2" class="form-control" value="" placeholder="평창동 앞마당 상세주소">
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="checkbox1" class="label_text">정보수신방법</label>
                                                        </div>
                                                        <div class="form_body">
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox1" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox1">이메일</label>
                                                            </span>
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox2" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox2">SMS</label>
                                                            </span>
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox3" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox3">전화</label>
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="checkbox1" class="label_text">작품관심분야</label>
                                                        </div>
                                                        <div class="form_body widthExtend box_Over">
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox1" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox1">해외미술</label>
                                                            </span>
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox2" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox2">국내 근현대 미술</label>
                                                            </span>
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox3" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox3">도자기</label>
                                                            </span>
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox3" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox3">고화</label>
                                                            </span>
                                                            <span class="trp checkbox-box">
                                                                <input id="checkbox3" type="checkbox">
                                                                <i></i>
                                                                <label for="checkbox3">고서</label>
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form_label">
                                                            <label for="writer" class="label_text">관심작가</label>
                                                        </div>
                                                        <div class="form_body widthExtend">
                                                            <div class="input-group">
                                                                <input type="text" id="writer" class="form-control" value="유혜경" placeholder="">
                                                                <button class="btn btn_light_gray_line" type="button">
                                                                    <span>작가 검색</span>
                                                                </button>
                                                            </div>
                                                            <ul class="writer_list js-writer_del-list">
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <span>김우진</span>
                                                                    <button>
                                                                        <i class="icon-filter_del"></i>
                                                                    </button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <div class="dropOut_text">
                                                    <a href="#">회원탈퇴</a>
                                                </div>
                                                <div class="btn_area">
                                                    <button class="btn btn_point btn_lg" type="button">
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
</body>
<!-- 회원정보수정 비밀번호확인 -->
<script type="text/javascript" src="/js/mypage/custConfirm.js"></script>
</html>