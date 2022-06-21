<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<footer class="footer">
    <div class="innerfooter">
        <section class="flex_wrap footer_menubox">
            <ul class="footer-gnbmenu">
                <li><a href="#">ABOUT US</a></li>
                <li><a href="#">PRESS</a></li>
                <li><a href="#">CAREERS</a></li>
                <li><a href="#">LOCATION</a></li>
                <li><a href="#">CUSTOMER CENTER</a></li>
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
                    <li><a href="#">Terms</a></li>
                    <li><a href="#"><strong>Privacy Policy</strong></a></li>
                    <li><a href="#">Information Mgmt. Rules</a></li>
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
                CEO : Lee Ok-Kyung   Tax Registration No : 101-81-46818   E-commerce Registration : Jong-Ro No. 01-2173<br>
                11, Pyeongchang 31-gil, Jongno-gu, Seoul, Korea   T. +82-02-395-0330<br>
                ⓒ Seoul Auction Corp.
            </p>
            <p>
                Any unauthorized reproduction, transmission, distribution, and/or crawling/scraping of images, videos, text, and other material or information <br>
                (including the website screen) is strictly forbidden by the Copyright Act, the Unfair Competition Prevention and Trade Secret Protection Act, and other relevant law.
            </p>
        </section>
    </div>
</footer>
<jsp:include page="../../common/commonJs.jsp" flush="false"/>
<%--메인이 아닐 경우에만 해당 JS  추가.--%>
<c:if test="${empty param.main}">
    <script src="/js/pages_common_en.js"></script>
</c:if>