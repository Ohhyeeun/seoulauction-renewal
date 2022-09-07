<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 낙찰수수료 -->
<div id="popup_alert1-wrap" class="trp popupfixed-wrap default-popup ">
	<div class="popup-dim"></div>
	<div class="popup-align mode-md mode-mb_fixed">
		<div class="popup-vertical">
			<div class="popup-layer">

				<div class="pop-panel">
					<div class="pop-header">
						<a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
						<div class="title-box">
							<span class="txt_title">낙찰 수수료</span>
						</div>
					</div>
					<div class="pop-body scroll-type">
						<!-- [0613]전체수정 -->
						<section class="section" style="display: block;">
							<article class="articles-box">
								<table class="table_base data-table name-bid_commission">
									<thead>
									<tr>
										<th>국내 경매</th>
										<th>홍콩 경매</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>
											<span>일괄 18% (부가세 별도)</span>
										</td>
										<td>
											<span>일괄 18%</span>
										</td>
									</tr>
									</tbody>
								</table>
							</article>
							<article class="articles-typo">
								<ul class="mark_dot-list">
									<li class="text-help">낙찰가(Hammer Price) : 경매사가 낙찰봉을 두드리면서 낙찰된 금액</li>
									<li class="text-help">구매가(Purchase Price) : 낙찰가 + 낙찰 수수료 + 부가가치세가 합산된 금액</li>
<%--									<li class="text-help">현재가 기준 891,000원</li>--%>
								</ul>
							</article>
						</section>
						<!-- //[0613]전체수정 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	(function() {
		var popup_alert1 = $(".js-popup_alert1").trpLayerFixedPopup("#popup_alert1-wrap");
		$(popup_alert1.getBtn).on("click", function($e) {
			$e.preventDefault();
			popup_alert1.open(this); // or false
			popup_fixation("#popup_alert1-wrap"); // pc 스크롤
			popup_motion_open("#popup_alert1-wrap"); // mb 모션
		});

		$("body").on("click", "#popup_alert1-wrap .js-closepop, #popup_alert1-wrap .popup-dim", function($e) {
			$e.preventDefault();
			popup_alert1.close();
			popup_motion_close("#popup_alert1-wrap");
		});
	})();
</script>