<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 경매 호가 팝업 -->
<div id="popup_alert3-wrap" class="trp popupfixed-wrap default-popup ">
	<div class="popup-dim"></div>
	<div class="popup-align mode-md mode-mb_fixed">
		<div class="popup-vertical">
			<div class="popup-layer">

				<div class="pop-panel">
					<div class="pop-header">
						<a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
						<div class="title-box">
							<span class="txt_title">경매호가표 안내</span>
						</div>
					</div>
					<div class="pop-body scroll-type">
						<section class="section" style="display: block;">
							<article class="articles-box">
								<table class="table_base data-table name-price_tag">
									<thead>
									<tr>
										<th>현재가 구간 (원)</th>
										<th>호가 단위 (원)</th>
									</tr>
									</thead>
									<tbody id="grow_off_tbody"></tbody>
								</table>
							</article>
						</section>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<%--경매 호가 스크립트 --%>
<script>
	let dataArray = [];

	//라이브 경매 호가
	dataArray.push({'up': null, 'down': '100만', 'price': 50000});
	dataArray.push({'up': '100만', 'down': '200만', 'price': 100000});
	dataArray.push({'up': '200만', 'down': '400만', 'price': 200000});
	dataArray.push({'up': '400만', 'down': '1000만', 'price': 300000});
	dataArray.push({'up': '1,000만', 'down': '2,000만', 'price': 500000});
	dataArray.push({'up': '2,000만', 'down': '3,000만', 'price': 1000000});
	dataArray.push({'up': '3,000만', 'down': '5,000만', 'price': 2000000});
	dataArray.push({'up': '5,000만', 'down': '1억', 'price': 3000000});
	dataArray.push({'up': '1억', 'down': '2억', 'price': 5000000});
	dataArray.push({'up': '2억', 'down': '3억', 'price': 10000000});
	dataArray.push({'up': '3억', 'down': '5억', 'price': 20000000});
	dataArray.push({'up': '5억', 'down': '10억', 'price': 30000000});
	dataArray.push({'up': '10억', 'down': '20억', 'price': 50000000});
	dataArray.push({'up': '20억', 'down': null, 'price': 100000000});

	$.each(dataArray, function (idx, item) {
		let text = (item.up != null ? item.up + ' 이상' : '') + ' ~ ' + (item.down != null ? item.down + ' 미만' : '');
		let html = '<tr><td><span>' + text + '</span>'
				+ '</td><td>'
				+ '<span>' + numberWithCommas(item.price) + '</span>'
				+ '</td></tr>';
		$("#grow_off_tbody").append(html);
	});

	var popup_alert3 = $(".js-popup_alert3").trpLayerFixedPopup("#popup_alert3-wrap");
	$(popup_alert3.getBtn).on("click", function ($e) {
		$e.preventDefault();
		popup_alert3.open(this); // or false
		popup_fixation("#popup_alert3-wrap"); // pc 스크롤
		popup_motion_open("#popup_alert3-wrap"); // mb 모션
	});

	$("body").on("click", "#popup_alert3-wrap .js-closepop, #popup_alert3-wrap .popup-dim", function ($e) {
		$e.preventDefault();
		popup_alert3.close();
		popup_motion_close("#popup_alert3-wrap");
	});
</script>