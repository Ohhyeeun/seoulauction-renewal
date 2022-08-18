   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <div id="popup_tooltip-wrap" class="trp popupfixed-wrap tooltip-popup">
        <div class="popup-dim"></div>
        <div class="popup-align mode-md mode-mb_fixed">
            <div class="popup-vertical">
                <div class="popup-layer">

                    <div class="pop-panel">
                        <div class="pop-header">
                            <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
                            <div class="title-box">
                                <span class="txt_title type-big">Payment guidelines</span>
                            </div>
                        </div>
                        <div class="pop-body scroll-type">
                            <section class="section" style="display: block;">
                                <div class="con-wrap-line">
                                    <p class="tb1">Methods of paying the full price of the artwork successfully bid upon are listed below.</p>
                                    <article class="group-box buyinfo-box">
<%--                                        <span class="box-title tt5">Wire transfer</span>--%>
                                        <span class="box-title tt5">Website payment</span>

                                        <ul class="mark_dot-list">
<%--                                            <li class="tb1">Bank : Woori Bank (Pyeongchangdong Branch)--%>
<%--                                                <p>- (Online Auction) Account :1005-500-700549</p>--%>
<%--                                                <p>- (Zero Base Auction) Account :1005-403-971518</p>--%>
<%--                                            </li>--%>
<%--                                            <li class="tb1">Account Name : SEOUL AUCTION</li>--%>
<%--                                            <li class="tb1">Swift code : HVBKKRSEXXX</li>--%>
                                            <li class="tb1">For an artwork bid upon via online auction and payment with a credit card that is accepted in Korea, credit card payments may be made on the Seoul Auction website. For a high-value item, there is a chance that credit card payment may not be accepted, in accordance with the policy of the relevant credit card company. The successful bidder should make the payment after logging in to the Seoul Auction website and confirming the hammer price.</li>
                                            <li class="tb1">Inquiries : (Phone) +82(0)2-2075-4422 <br>(Email) info@seoulauction.com</li>
                                            <li class="tb1">Business hours: (KST) 9:00-18:00</li>
                                        </ul>
                                    </article>
                                </div>
<%--                                <div class="buyinfo_txt">--%>
<%--                                    <p class="tb2">When making an account transfer, please write the name of the successful bidder in the deposit memo section. If the name of the account holder and name of the bidder are not the same, the deposit confirmation may be delayed. Seoul Auction assumes no responsibility for any inconvenience that may arise from a discrepancy between the name of the account holder and the name of the bidder.--%>
<%--                                    </p>--%>
<%--                                </div>--%>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
<!--     <script>
        (function() {
            var popup_tooltip = $(".js-popup_tooltip").trpLayerFixedPopup("#popup_tooltip-wrap");
            $(popup_tooltip.getBtn).on("click", function($e) {
                $e.preventDefault();
                popup_tooltip.open(this); // or false   
                popup_fixation("#popup_tooltip-wrap"); // pc 스크롤
                popup_motion_open("#popup_tooltip-wrap"); // mb 모션 
            });

            $("body").on("click", "#popup_tooltip-wrap .js-closepop, #popup_tooltip-wrap .popup-dim", function($e) {
                $e.preventDefault();
                popup_tooltip.close();
                popup_motion_close("#popup_tooltip-wrap");
            });
        })();
    </script> -->