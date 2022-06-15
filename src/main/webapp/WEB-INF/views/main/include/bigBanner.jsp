<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="visual visual-contents">
    <div class="swiper-container visual-swiper">
        <div class="swiper-wrapper">
        <%--  슬라이드 동적생성      --%>
        </div>

        <span class="visualController">
            <button type="button" class="playBtn pc-ver"></button>
            <button type="button" class="stopBtn pc-ver"></button>
            <span class="swiper-progressbar">
                <span class="visual-progressbar"></span>
            </span>
            <span class="swiper-pagination visual-pagaination"></span>
        </span>
    </div>
    <div class="swiper-btn-wrap">
        <div class="swiper-button-next slide-btnright pc-ver"></div>
        <div class="swiper-button-prev slide-btnleft pc-ver"></div>
    </div> 
</section>