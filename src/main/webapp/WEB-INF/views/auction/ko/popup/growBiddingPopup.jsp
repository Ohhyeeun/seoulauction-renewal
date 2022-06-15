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