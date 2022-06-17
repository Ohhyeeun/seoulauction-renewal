
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
			
				axios.post('/api/cert/sendAuthNum', $d)
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
					
					axios.post('/api/cert/clearAuthNum', {})
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

				$d = { "auth_num": authNum , "to_phone": phone};

				axios.post('/api/cert/confirmAuthNumCheck', $d)
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
							checkHpAuth.is_same_hp= data.data.is_same_hp;
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
				

				$d = { "sale_no": saleNo, "to_phone": phone, "done_cd": (checkHpAuth.is_same_hp ? "no_modify" : "un_modify")};
					
				axios.post('/api/cert/inertSaleCert', $d)
				.then(function(response) {
					const data = response.data;
					let success = data.success;
					if(success){
						
						if (!checkHpAuth.is_same_hp) {
							if (confirm("고객정보의 핸드폰번호와 일치하지 않습니다.\n인증받은 핸드폰번호로 갱신하시겠습니까?")) {
								$d = { "hp": phone, "sale_cert_no": data['data']['sale_cert_no'] };
								axios.post('/api/cert/updateSaleCertHp', $d)
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