<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<footer class="footer">
    <div class="innerfooter">
        <section class="flex_wrap footer_menubox">
            <ul class="footer-gnbmenu">
                <li><a href="/footer/companyIntro">회사소개</a></li>
                <li><a href="/footer/boardMediaList">언론보도</a></li>
                <li><a href="/footer/boardIncruitList">채용공고</a></li>
                <li><a href="/footer/location">위치안내</a></li>
                <li><a href="/footer/boardNoticeList">공지사항</a></li>
                <li><a href="/footer/faq">FAQ</a></li>
            </ul>

            <ul class="snsbox_icon">
                <li><a href="#" class="sns-icon sns-icon01"></a></li>
                <li><a href="#" class="sns-icon sns-icon02"></a></li>
                <li><a href="#" class="sns-icon sns-icon03"></a></li>
                <li><a href="#" class="sns-icon sns-icon04"></a></li>
                <li><a href="#" class="sns-icon sns-icon05"></a></li>
            </ul>
        </section>
        <section class="flex_wrap footer_infobox">
            <div class="footer-infomenubox">
                <ul class="flex_wrap footer-infomenu">
                    <li><a href="/footer/terms">경매약관</a></li>
                    <li><a href="/footer/privacy">개인정보처리방침</a></li>
                    <li><a href="/footer/rules">내부관리규정</a></li>
                </ul>

                <div class="Familysite-selectbox">
                    <a href="#none" class="Familysite">Family Site</a>
                    <ul class="familyselect">
                        <li><a href="https://www.auctionblue.com/index" target="_blank">Print Bakery</a></li>
                        <li><a href="https://printbakery.com/" target="_blank">Auction Blue</a></li>
                        <li><a href="https://sotwo.com/" target="_blank">SOTOW</a></li>
                    </ul>
                </div>
            </div>

            <p class="bottom-p-spacing20">
                ㈜서울옥션 · 대표이사 : 이옥경   사업자등록번호 : 101-81-46818   통신판매업신고 : 종로 제01-2173호<br>
                주소 : 서울특별시 종로구 평창31길 11 (평창동 465-10)  고객센터 : 02-395-0330<br>
                ⓒ Seoul Auction Corp.
            </p>
            <p>
                (주)서울옥션이 매도인인 경우를 제외하고, 사이트상의 모든 상품 및 거래에 대하여 (주)서울옥션은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
                따라서 (주)서울옥션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.<br><br>

                서울옥션 웹사이트의 콘텐츠(이미지/문자/영상/화면 등)에 대한 무단 복제, 배포, 전송, 게시, 크롤링/스크래핑 등 행위는 저작권법, 부정경쟁방지 및 영업비밀보호에 관한 법률 등 관련 법령에 의하여 금지됩니다.
            </p>
        </section>
    </div>
</footer>
<jsp:include page="../../common/commonJs.jsp" flush="false"/>
<%--메인이 아닐 경우에만 해당 JS  추가.--%>
<c:if test="${empty param.main}">
    <script src="/js/pages_common_ko.js"></script>
</c:if>