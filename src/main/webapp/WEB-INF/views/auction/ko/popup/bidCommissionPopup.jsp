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
						<section class="section" style="display: block;">
							<article class="articles-box">
								<table class="table_base data-table name-bid_commission">
									<thead>
									<tr>
										<th>낙찰가 (원)</th>
										<th>수수료율 (VAT 포함)</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td>
											<span>~ 10,000,000</span>
										</td>
										<td>
											<span>낙찰가의 19.8%</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>10,000,001 ~</span>
										</td>
										<td>
											<span>1,000만원 X 19.8% + (낙찰가 - 1,000만원) X 16.5%</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>그외 국내지역</span>
										</td>
										<td>
											<span>15만원</span>
										</td>
									</tr>
									</tbody>
								</table>
							</article>
							<article class="articles-typo">
								<p class="text-help">
									예시) 낙찰가 5,000만원일 경
								</p>
								<ul class="mark_dot-list">
									<li class="text-help">낙찰 수수료 : 198만원 + (5,000만원 - 1,000만원)*16.5%=8,580</li>
									<li class="text-help">총 구매대금 : 낙찰가 + 낙찰수수료 = 58,580,000원</li>
								</ul>
							</article>
						</section>
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