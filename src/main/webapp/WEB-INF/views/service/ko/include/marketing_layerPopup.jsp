<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 모바일용 팝업 -->
<!-- 문화예술 -->
<div id="popup_marketing1-wrap" class="trp popupfixed-wrap default-popup ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-xxl mode-mb_fixed">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span class="txt_title type-big">문화 예술을 활용한 VIP 마케팅</span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <jsp:include page="marketing_art.jsp" />
                        </section>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- 기업홍보 -->
<div id="popup_marketing2-wrap" class="trp popupfixed-wrap default-popup ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-xxl mode-mb_fixed">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span class="txt_title type-big">기업 홍보∙아트 마케팅</span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <jsp:include page="marketing_vip.jsp" />
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 	기획경매 -->
<div id="popup_marketing3-wrap" class="trp popupfixed-wrap default-popup ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-xxl mode-mb_fixed">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <!-- [0516]텍스트수정 // -->
                            <span class="txt_title type-big">기획경매</span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <jsp:include page="marketing_plan.jsp" />
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 기업의 미술 -->
<div id="popup_marketing4-wrap" class="trp popupfixed-wrap default-popup ">
    <div class="popup-dim"></div>
    <div class="popup-align mode-xxl mode-mb_fixed">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span class="txt_title type-big">기업의 미술품 아트컨설팅</span>
                        </div>
                    </div>
                    <div class="pop-body scroll-type">
                        <section class="section" style="display: block;">
                            <jsp:include page="marketing_consulting.jsp" />
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- PC용 팝업 -->
<div id="popup_marketing_pc-wrap" class="trp popupfixed-wrap default-popup popup_marketing_pc">
    <div class="popup-dim"></div>
    <div class="popup-align mode-xxl mode-mb_fixed">
        <div class="popup-vertical">
            <div class="popup-layer">
                <div class="pop-panel">
                    <div class="pop-header">
                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                        <div class="title-box">
                            <span class="txt_title type-big">아트컨설팅 & 기업마케팅</span>
                        </div>
                    </div>
                    <div class="pop-body">
                        <section class="section tab-section">
                            <div class="tab-wrap">
                                <div class="tab-area type-left_mm">
                                    <ul class="tab-list js-left_mm">
                                        <li class="tab-popup_marketing1 active"><a href="#tab-cont-1"><span>문화 예술을 활용한 VIP 마케팅</span></a></li>
                                        <li class="tab-popup_marketing2"><a href="#tab-cont-2"><span>기업 홍보∙아트 마케팅</span></a></li>
                                        <li class="tab-popup_marketing3"><a href="#tab-cont-3"><span>기획 경매</span></a></li>
                                        <li class="tab-popup_marketing4"><a href="#tab-cont-3"><span>기업의 미술품 아트컨설팅</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </section>
                        <section class="section tab-con-section">
                            <!-- 문화예술 -->
                            <div class="tab-con scroll-type popup_marketing1">
                                <jsp:include page="marketing_art.jsp" />
                            </div>
                            <!-- 기업홍보 -->
                            <div class="tab-con scroll-type popup_marketing2">
                                <jsp:include page="marketing_vip.jsp" />
                            </div>
                            <!-- 기획경매 -->
                            <div class="tab-con scroll-type popup_marketing3">
                                <jsp:include page="marketing_plan.jsp" />
                            </div>
                            <!-- 기업의 미술 -->
                            <div class="tab-con scroll-type popup_marketing4">
                                <jsp:include page="marketing_consulting.jsp" />
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>