<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- header -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title>POPUP | Seoul Auction</title>
<link rel="stylesheet" href="/css/plugin/csslibrary.css">
<link rel="stylesheet" href="/css/common.css" type="text/css" />
<link rel="stylesheet" href="/css/pages_common_ko.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&display=swap"
	rel="stylesheet">
<!-- //header -->
</head>

<body>
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/ko/header.jsp" flush="false" />
			<script>
		app.value('locale', 'ko');
		</script>

			<!-- container -->
			<div id="container">
				<div id="contents" class="contents ">

					<section class="basis-section last-section">
						<div class="section-inner">
							<a class="btn btn_default js-popup_online_confirm mt10" href="#"
								role="button"><span>온라인 경매 번호 인증</span><i
								class="icon-page_next"></i></a>
						</div>
					</section>

				</div>
			</div>
			<!-- //container -->

			<!-- footer -->
			<jsp:include page="../../include/ko/footer.jsp" flush="false" />
			<!-- //footer -->

			<!-- stykey -->

			<div class="scroll_top-box">
				<div class="box-inner">
					<a href="#" class="btn-scroll_top js-scroll_top"><i
						class="icon-scroll_top"></i></a>
				</div>
			</div>
			<!-- // stykey -->

		</div>
	</div>

	<script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
	<!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
	<script type="text/javascript" src="/js/plugin/prefixfree.min.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="/js/plugin/jquerylibrary.js"
		type="text/javascript"></script>
	<!-- [0516]삭제
  <script type="text/javascript" src="/js/plugin/mojs.core.js" type="text/javascript"></script> 
-->


	<script type="text/javascript" src="/js/common.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="/js/pages_common_ko.js"
		type="text/javascript"></script>

	<form id="reset_form">
		<div id="popup_online_confirm-wrap"
			class="trp popupfixed-wrap online_confirm-popup ">
			<div class="popup-dim"></div>
			<div class="popup-align mode-ms mode-mb_full">
				<div class="popup-vertical">
					<div class="popup-layer">
						<div class="pop-panel">
							<div class="pop-header">
								<a class="btn_close icon-pop_close js-closepop" href="#"
									title="닫기">X</a>
								<div class="title-box">
									<span class="txt_title">온라인 경매 번호 인증</span>
								</div>
							</div>
							<div class="pop-body scroll-type">
								<section class="section">
									<div class="text-area">
										<P class="text-base">온라인 경매 회차당 한번 번호 인증 후 경매에 참여하실 수
											있습니다.</P>
									</div>
									<div class="form-area">
										<div class="form_label">
											<label for="name-1" class="mem_txt">휴대폰 인증</label> <i>*</i>
										</div>
										<div class="form_body">
											<div class="input-group">
												<input type="text" id="phone" class="form-control"
													maxLength=13 onkeypress="phoneNumber(this);"
													onkeyup="onlyNumber(this);" placeholder="휴대폰 번호 입력">
												<button class="btn btn_light_gray_line" type="button"
													onClick="authNumRequest('442')">
													<span id="authNumRequest">인증번호 요청</span>
												</button>
											</div>
											<p class="error_text tb2 messageArea" id="messageArea1"></p>
											<div class="re-check">
												<div class="form_body">
													<div class="input-group">
														<input type="text" id="authNum"
															class="form-control authNum" value="" maxlength=6
															onkeyup="onlyNumber(this, 'number');"
															placeholder="인증번호 입력">
														<button class="btn btn_light_gray_line authNum"
															id="authBtn" type="button" onClick="authNumConfirm()">
															<span>인증</span>
														</button>
													</div>
													<p class="error_text tb2 messageArea" id="messageArea2"></p>
													<p class="error_text tb2 messageArea" id="messageArea3"></p>

												</div>
											</div>
										</div>
									</div>
									<div class="accordion-area policy_accordion">
										<div class="check_all-wrap js_all-1">
											<ul class="accordion-list policy js-accordion_policy">
												<li class="trp_acitem">
													<div class="header-area">
														<div class="accordion_name">
															<div class="trp checkbox-box">
																<input id="checkbox_01" class="checkbox_all checkbox_01"
																	value="01" type="checkbox" name="agreeCert_checkbox">
																<i></i> <label for="checkbox_01"><span
																	class="required">[필수]</span> 온라인 응찰 안내</label>
															</div>
														</div>
														<a href="#" class="acc_btn"> <i
															class="icon-accordion_arrow_down"></i>
														</a>
													</div>
													<div class="con-area">
														<div class="con-header">
															<div class="policy_cont">
																<div class="trp checkbox-box">
																	<input id="checkbox_01"
																		class="checkbox_all checkbox_01" value="01"
																		type="checkbox" name="agreeCert_checkbox"> <i></i>
																	<label for="checkbox_01 tb1">확인 하였습니다.</label>
																</div>
															</div>
														</div>
														<div class="con-body">
															<div class="text-area scroll-type">
																<ul>
																	<li>낙찰 시, 낙찰금의 18%(부가세별도)의 구매수수료가 발생합니다.</li>
																	<li class="point_item">응찰 및 낙찰은 취소가 불가능합니다. 낙찰 철회
																		시 낙찰가의 30%에 해당하는 낙찰철회비가 부과되오니 신중히 응찰 바랍니다.</li>
																	<li>응찰은 작품 컨디션 확인 후 진행 되는 것을 전제로 하며, 작품 컨디션에 액자
																		상태는 포함되지 않습니다.</li>
																	<li>마감시간 30초 내에 응찰이 있을 경우, 자동으로 30초 연장됩니다.</li>
																	<li>접속자의 컴퓨터, 인터넷 환경에 따라 반영 속도 차이가 있을 수 있으니 비딩 시
																		유의해 주시기 바랍니다.</li>
																	<li class="point_item">[1회 응찰] 또는 [자동 응찰] 버튼을 누르시면
																		‘확인안내 없이’ 바로 응찰이 되어 취소가 가능합니다.</li>
																	<li class="point_item">남은 시간 1초 미만 시 응찰은 서버 반영 전
																		종료 될 수 있으니, 주의가 필요합니다.</li>
																	<li>[자동 응찰 중지하기]는 자동 응찰 ‘취소가 아닙니다’, 응찰자가 자동응찰을
																		중지하는 경우 중지 전까지의 응찰 및 낙찰은 유효합니다. 또한 자동응찰의 중지는 서버에 반영이
																		되는 시점에 효력이 발생하므로, <em>응찰자가 중지버튼을 클릭한 시점보다 더 높은
																			금액에 중지되고 이 금액에 낙찰 될 수 있습니다.</em>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</li>
												<li class="trp_acitem">
													<div class="header-area">
														<div class="accordion_name">
															<div class="trp checkbox-box">
																<input id="checkbox_02" class="checkbox_all checkbox_02"
																	value="02" type="checkbox" name="agreeCert_checkbox">
																<i></i> <label for="checkbox_02"><span
																	class="required">[필수]</span> 약관 동의 안내</label>
															</div>
														</div>
														<a href="#" class="acc_btn"> <i
															class="icon-accordion_arrow_down"></i>
														</a>
													</div>
													<div class="con-area">
														<div class="con-header">
															<div class="policy_cont">
																<div class="trp checkbox-box">
																	<input id="checkbox_all"
																		class="checkbox_all checkbox_02" value="02"
																		type="checkbox" name="agreeCert_checkbox"> <i></i>
																	<label for="checkbox_all tb1">모두 동의합니다.</label>
																</div>
															</div>
														</div>
														<div class="con-body">
															<div class="text-area scroll-type check_item">
																<ul class="">
																	<li>
																		<div class="trp checkbox-box">
																			<input id="checkbox_all1" class="item02 checkbox_02"
																				type="checkbox" name="agreeCert_checkbox"> <i></i>
																			<label for="checkbox_all1">본인은 서울옥션
																				경매약관(바로가기)을 모두 읽고 이해하였으며, 그 적용에 동의합니다.</label>
																		</div>
																	</li>
																	<li>
																		<div class="trp checkbox-box">
																			<input id="checkbox_all2" class="item02 checkbox_02"
																				type="checkbox" name="agreeCert_checkbox"> <i></i>
																			<label for="checkbox_all2">응찰은 작품 실물 및 컨디션을
																				확인하였음을 전제로 합니다.</label>
																		</div>
																	</li>
																	<li>
																		<div class="trp checkbox-box">
																			<input id="checkbox_all3" class="item02 checkbox_02"
																				type="checkbox" name="agreeCert_checkbox"> <i></i>
																			<label for="checkbox_all3">낙찰자는 후 7일 이내(낙찰가
																				3억원 이상인 경우 21일 이내)에 구매수수료를 포함한 금액을 입금하여야 합니다.</label>
																		</div>
																	</li>
																	<li>
																		<div class="trp checkbox-box">
																			<input id="checkbox_all4" class="item02 checkbox_02"
																				type="checkbox" name="agreeCert_checkbox"> <i></i>
																			<label for="checkbox_all4">낙찰자가 ①지정된 기일에
																				낙찰대금을 납부하지 않거나, ②부득이 낙찰을 철회하는 경우, 낙찰가의 30%에 해당하는 금액을
																				낙찰철회(위약금)로 납부하여야 합니다.</label>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</li>
											</ul>
										</div>
										<div class="text-area">
											<p class="tb2">
												응찰 관련 문의가 있으신 경우, 귀하의 담당자(<em>홍길동 02-2075-4411</em>)에게 <br
													class="only-pc">연락주시기 바랍니다.
											</p>
										</div>
									</div>
									<div class="btn-area">
										<div class="btn_set-float tac">
											<a class="btn btn_gray_line" href="" role="button"> <span>취소</span>
											</a> <a class="btn btn_point disabled" href="" role="button"
												onClick="saleCertSuccess();" id="saleCertSuccess"> <span>확인</span>
											</a>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		
    	var popup_offline_payment = $(".js-popup_online_confirm").trpLayerFixedPopup("#popup_online_confirm-wrap");
    		
		document.addEventListener("DOMContentLoaded", function(){
			var saleNo;
			
		    var auth_end_time;
		    var timer_duration;
		    var checkHpAuth = { "valid": false, "message": "", "check": false , "saleCert": false, "agreeCert":false};
		    var form_data = { "can_auth": false , "auth_num": null};
			var auth_req_btn_txt = "인증번호요청";
			var auth_exists = "";
			var phone ;
			var messageArea1 = document.getElementById('messageArea1');
			var messageArea2 = document.getElementById('messageArea2');
			var messageArea3 = document.getElementById('messageArea3');
			
			authNumRequest = function(SALE_NO) {
				saleNo = SALE_NO;
				phone = document.getElementById('phone').value;
				
				var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
				if (phone == null || phone == '') {
					messageArea1.innerText = "휴대폰 번호를 입력해주세요";
					return;
				}
				else if (regPhone.test(phone) === false) {
					messageArea1.innerText = "휴대전화번호를 확인해주세요.";
					return;
				}
				
				//안내문구 초기화
			 	document.querySelectorAll('.messageArea').forEach(function(ele){ele.innerText=""});
				
			 	document.querySelectorAll('.authNum').forEach(function(ele,index){ele.disabled=false; if(index==0){ele.value = ""}});
				//document.getElementById('authNum').value = "";
				//document.getElementsByClassName('authNum').disabled = false;
				
				form_data.can_auth = false;
			
				clearInterval(timer_duration);
				checkHpAuth.message = "";
				
				$d = { "to_phone": phone, "bid_auth": true, "sale_no": SALE_NO };
			
				axios.post('/api/mypage/saleCert/sendAuthNum', $d)
					.then(function(response) {
						console.log(response);
						const data = response.data;
						let success = data.success;
			
						if (success) {
							console.log(data["data"].AUTH_EXISTS);
							if (data["data"].AUTH_EXISTS) {
									messageArea1.innerText = "이미 등록된 휴대폰 번호 입니다.\n" + "다른 번호를 입력해 주세요.";
									//This number is already authorized.\n" + "Please log-in again with the first authenticated ID and start bidding.						
							} else {
								form_data.can_auth = true;
			
								var auth_num_send_status = data["data"].SEND_STATUS;
								
								auth_end_time = moment(new Date()).add(120, 'seconds');
								
								if (auth_num_send_status) {
									timer_duration = setInterval(setAuthDuration, 1000);
									console.log("======> set timer");
								}
								document.getElementById('authNumRequest').innerText = "인증번호 재요청";
								 
								//성공 후 안내메세지 초기화
								messageArea1.innerText = "";
							}
						}
					})
					.catch(function(error) {
						console.log(error);
					});
				
			}

			setAuthDuration = function() {
				console.log('setAuthDuration 5');
				var f = 'm:s';
				var s = moment(auth_end_time).diff(moment(new Date()), 'seconds');
				console.log(s);
				if (s > 0) {
					messageArea3.innerText = "남은시간 : " + moment.duration(s, "seconds").format(f);
				}
				else if (s == 0) {
					//$scope.duraionEnd();
					form_data.can_auth = false;
					checkHpAuth.message = "0";
					clearInterval(timer_duration);
					console.log("======> cancel timer");
					//인증번호 초기화(세션 null)
					
					axios.post('/api/mypage/saleCert/clearAuthNum', {})
					.then(function(response) {
						messageArea2.innerText = "인증 시간이 초과되었습니다. 다시 요청 하세요.";
						document.getElementById('messageArea3').innerText = "";
					})
					.catch(function(error) {
						console.log(error);
					});
				}
			}
			
			authNumConfirm = function() {
				messageArea2.innerText = "";
				var authNum = document.getElementById('authNum').value;
				if (authNum == null || authNum == '') {
					messageArea2.innerText = "인증번호를 입력해 주세요.";
					return;
				}
				

				//		$d = {"sale_no": $scope.sale.SALE_NO, "hp": $scope.form_data.hp, "done_cd": (is_same_hp ? "no_modify" : "un_modify"), "auth_num": $scope.form_data.auth_num};

				$d = { "auth_num": authNum };

				axios.post('/api/mypage/saleCert/confirmAuthNum4sale', $d)
					.then(function(response) {
						const data = response.data;
						let success = data.success;
						//console.log(data['data']['sale_cert_no']);
						//추후 변경 필요. (data['data']['sale_cert_no'] > 0) 추가
						//if (success && data['data']['sale_cert_no'] > 0) {
						if (success) {
							document.querySelectorAll('.authNum').forEach(function(ele){ele.disabled=true});
						
							//인증 성공 후 타이머 초기화
							messageArea2.innerText = "인증에 성공 하였습니다.";
							
							//인증 성공 후 타이머 초기화
							clearInterval(timer_duration);
							messageArea3.innerText = "";

							checkHpAuth.check = true;
							
							//수정필요
							//$scope.parent.sale_cert.CNT = 1;

							finallySalCert();
							
						} else {
							messageArea2.innerText = "인증에 실패하였습니다.\n" +"다시 등록해 주세요.";
							checkHpAuth.check = false;
						}
						checkHpAuth.valid = data;
					})
					.catch(function(error) {
						console.log(error);
					})
					
			}
					
			//확인버튼
			saleCertSuccess = function (){
				if(checkHpAuth.check){
				//$scope.parent.sale_cert?????? 로그인 사용자의 전화번호오ㅏ 인증전화번호를 비교????(추후 확인필요)
				//var is_same_hp = (($scope.sale_cert.HP || '').replace(/[^\d]/g, "") == $scope.form_data.hp.replace(/[^\d]/g, ""));
				var is_same_hp = false;

				$d = { "sale_no": saleNo, "to_phone": phone, "done_cd": (is_same_hp ? "no_modify" : "un_modify")};
					
				axios.post('/api/mypage/saleCert/inertSaleCert', $d)
				.then(function(response) {
					const data = response.data;
					let success = data.success;
					if(success){
						//변경필요.
						if (!is_same_hp) {
							if (confirm("고객정보의 핸드폰번호와 일치하지 않습니다.\n인증받은 핸드폰번호로 갱신하시겠습니까?")) {
								$d = { "hp": phone, "sale_cert_no": data['data']['sale_cert_no'] };
								axios.post('/api/mypage/saleCert/updateSaleCertHp', $d)
									.then(function(response) {
										console.log('갱신완료');			
									})
									.catch(function(error) {
										console.log(error);
									});
							}
						}
						checkHpAuth.saleCert = true;
						saleCertClose(true);
					}
				})
				.catch(function(error) {
					console.log(error);
				
				});
				}
			}
			
			//체크박스
			$("input[type='checkBox']").change(function(e) {
				if(e.target.classList.contains('item02')){
					if(!e.target.checked || $(".item02:checked").length == 4){
						$('.checkbox_all.checkbox_02').prop("checked", e.target.checked);
					}
				} else if(e.target.classList.contains('checkbox_all')){
						$('.checkbox_'+e.target.value).prop("checked", e.target.checked);
				}
				finallySalCert();
			});

			finallySalCert = function(){
				var checkboxLen = $("input:checkbox[name=agreeCert_checkbox]").length; //체크박스 전체 개수
				var checkedLen = $("input:checkbox[name=agreeCert_checkbox]:checked").length; //체크된 개수
				if(checkHpAuth.check && checkboxLen == checkedLen){
					$('#saleCertSuccess').removeClass( 'disabled' );
				} else {
					$('#saleCertSuccess').addClass( 'disabled' );
				}
			}
			
			saleCertClose = function(success) {
				//데이터 초기화
				clearInterval(timer_duration);
				document.querySelectorAll('.messageArea').forEach(function(ele){ele.innerText=""});
				document.querySelectorAll('.authNum').forEach(function(ele){ele.disabled=false});
				$( "#reset_form" ).each( function () {
		            this.reset();
		        });
				
				//팝업 닫기
				popup_offline_payment.close();
			}
			});
		
</script>

	<script>
        (function() {
            
            $(popup_offline_payment.getBtn).on("click", function($e) {
                $e.preventDefault();
                console.log("open11")
                popup_offline_payment.open(this); // or false 
                popup_fixation("#popup_online_confirm-wrap"); // pc 하단 붙이기
            });

            $("body").on("click", "#popup_online_confirm-wrap .js-closepop, #popup_online_confirm-wrap .popup-dim", function($e) {
                $e.preventDefault();
                saleCertClose();
            });


            /* 아코디언 */
            var pop_accordion = $(".js-accordion-btn").trpToggleBtn(
                function($this) {
                    $($this).addClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideDown("fast");
                },
                function($this) {
                    $($this).removeClass("on");
                    $($this).closest(".payment_price-accordion").find(".accordion-body").slideUp("fast");
                });

        })();
    </script>
	<script>
        //비밀번호마스킹버튼
        $('.js-pw_mask').click(function() {
            $(this).toggleClass('on');
        })

        //약관아코디언
        $(".js-accordion_policy").trpAccordionMenu(".acc_btn", ".con-area", "on");
        //약관체크
        $(".js_all-1").trpCheckBoxAllsImg(".js_all", ".js_item");

        //     if($("#license_check").is(":checked")){
        //   $('.license_input').prop("type", "password");
        // }else{
        //   $('.license_input').prop("type", "text");
        // }
    </script>


</body>

</html>