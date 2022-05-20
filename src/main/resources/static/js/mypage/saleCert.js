app.value('locale', 'ko');
app.factory("saleCert", function($interval, ngDialog) {


	var objs = {
		saleCert: function($input, $callBack) {
			var popup_offline_payment = $(".js-popup_online_confirm").trpLayerFixedPopup("#popup_online_confirm-wrap");
            /* $(popup_offline_payment.getBtn).on("click", function($e) { */
				//$e.preventDefault();
                console.log("open11")
                popup_offline_payment.open(this); // or false 
                popup_fixation("#popup_online_confirm-wrap"); 
                
			console.log('본인인증 팝업 호출');
			console.log('saleCert 2');

			//확인필요.
			//$input.parent.cancelLotRefresh();
			$input.callBack = $callBack;
			$input.parent.modal = ngDialog.open({
				template: '/mypage/saleCert?sale_no=' + $input.sale.SALE_NO,
				controller: 'saleCertCtl',
				showClose: false,
				closeByDocument: false,
				animationEndSupport: false,
				resolve: { input: function() { return $input; } }
			});
		},

		saleCertCheck: function($input) {
			console.log('saleCertCheck');
			//if($input.parent.is_login == "true" && $input.parent.locale == 'ko' && ($input.parent.sale_cert.CNT || 0) <= 0){
			if ($input.parent.is_login == "true" && $input.parent.custInfo.LOCAL_KIND_CD != 'foreigner' && ($input.parent.sale_cert.CNT || 0) <= 0) {
				$input.parent.cancelLotRefresh();
				saleCert($input);
			}
		},


	};

	return objs;
});


//1-2
app.controller('saleCertCtl', function($scope, consts, common, $interval, input, locale, $filter) {
	console.log(input.parent);
	$scope.sale = input.sale;
	$scope.parent = input.parent;

	//해당 값은 parent에서 자동 셋팅될 것으로 보임...(어디서 넣는건지 확인필요)
	$scope.sale_cert = $scope.parent.sale_cert;
	$scope.callBack = input.callBack;



	$scope.close = function(success) {
		//console.log($scope.callBack);
		if ($scope.parent.refreshLots) $scope.parent.refreshLots();
		if ($scope.parent.runLotsRefresh) $scope.parent.runLotsRefresh();
		$scope.parent.modal.close();

		//해당 부분 확인 필요? 닫으면 무조건 지우는게 아닌가?
		if ($scope.parent.sale_cert) {
			if (($scope.parent.sale_cert.CNT || 0) <= 0) setCookie('sale_cert_cancel', true); //브라우저가 닫히면 세션을 지운다.
			else if (success && $scope.callBack) $scope.callBack(input);
		}

	

	}

	var $e = function() {
		$scope.is_processing = false;
	}

	var $s = function(data, status) {
		$scope.is_processing = false;
	};

	var finalRefresh = function() {
		$scope.is_processing = false;
	}

	$scope.hp1s = ["010", "011", "016", "017", "018", "019"];

	$scope.form_data = { "can_auth": false };
	$scope.form_data.auth_num = null;
	$scope.auth_req_btn_txt = "인증번호요청";
	$scope.auth_exists = "";
	$scope.checkHpAuth = { "valid": false, "message": "", "check": "" };

	//인증번호 요청 - 2
	$scope.authNumRequest = function() {
		console.log('authNumRequest 4');
		var auth_exists = document.getElementById("auth_exists");
		//		$scope.chkAgree = $("input:checkbox[id='chkAgree']").is(":checked") == true;

		//		console.log($scope.chkAgree);

		var checkboxLen = $("input:checkbox[name=agreeCert_checkbox]").length; //체크박스 전체 개수
		var checkedLen = $("input:checkbox[name=agreeCert_checkbox]:checked").length; //체크된 개수


		if (checkboxLen != checkedLen) {
			alert($scope.locale == 'ko' ? "약관에 모두 동의해주세요." : "Please agree to all the terms and conditions.");
			return;
		} else {
			var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if (($scope.form_data.phone == null || $scope.form_data.phone == '')) {
				alert("휴대폰 번호를 입력해주세요");
				return;
			}
			else if (regPhone.test($scope.form_data.phone) === false) {
				alert('휴대전화번호를 확인해주세요.');
				return;
			}
		}


		//초기화
		auth_exists.innerText = "";

		$scope.form_data.can_auth = false;

		$scope.form_data.auth_num = null;
		$interval.cancel($scope.timer_duration);

		$scope.checkHpAuth.message = "";
		
		$d = { "to_phone": $scope.form_data.hp, "bid_auth": true, "sale_no": $scope.sale.SALE_NO };

		axios.post('/api/mypage/saleCert/sendAuthNum', $d)
			.then(function(response) {
				console.log(response);
				const data = response.data;
				let success = data.success;

				if (success) {
					if (data["data"].AUTH_EXISTS) {
						if ($scope.locale == 'ko') {
							document.getElementById("auth_exists").innerText = "이미 등록된 휴대폰 번호 입니다.\n" + "다른 번호를 입력해 주세요.";
						} else {
							document.getElementById("auth_exists").innerText = "This number is already authorized.\n" + "Please log-in again with the first authenticated ID and start bidding."
						}
					} else {
						$scope.form_data.can_auth = true;

						$scope.auth_num_send_status = data["data"].SEND_STATUS;
						$scope.auth_end_time = moment(new Date()).add(120, 'seconds');
						if ($scope.auth_num_send_status) {
							$scope.timer_duration = $interval($scope.setAuthDuration, 1000);
							console.log("======> set timer");
						}
						$scope.auth_req_btn_txt = "인증번호 재요청";
					}

					console.log($scope.auth_exists);
				}
			})
			.catch(function(error) {
				console.log(error);
			});

		/*		common.callAPI('/api/mypage/saleCert/sendAuthNum', $d,
					function(data, status) {
						try {
		
							if(data["data"].AUTH_EXISTS){
									if($scope.locale == 'ko'){
										$scope.auth_exists = "이미 등록된 휴대폰 번호 입니다.\n" + "다른 번호를 입력해 주세요.";		
									}else{
										$scope.auth_exists ="This number is already authorized.\n" +"Please log-in again with the first authenticated ID and start bidding."
									}
									
									console.log($scope.form_data.auth_exists);						
								return;
							}
		
							$scope.form_data.can_auth = true;
		
							$scope.auth_num_send_status = data["data"].SEND_STATUS;
							$scope.auth_end_time = moment(new Date()).add(120, 'seconds');
							if($scope.auth_num_send_status){
								$scope.timer_duration = $interval($scope.setAuthDuration, 1000);
								console.log("======> set timer");
							}
							$scope.auth_req_btn_txt = "인증번호 재요청";
						}
						catch(err) {
							$scope.auth_num_send_status = false;
						}
					}
				);*/
	}

	//모든 약관 동의
	$scope.checkboxAll = function() {
		var list = document.querySelectorAll("input[name=agreeCert_checkbox]");
		for (var element of list) {
			element.checked = document.getElementById("agreeCert_checkbox_all").checked;
		}
	}


	$scope.authNumConfirm = function() {
		console.log('authNumConfirm 6');
		if ($scope.form_data.auth_num == null || $scope.form_data.auth_num == '') {
			$scope.checkHpAuth.message = "인증번호를 넣으세요.";
			return;
		}


		//$scope.parent.sale_cert?????? 로그인 사용자의 전화번호오ㅏ 인증전화번호를 비교????(확인필요)
		//var is_same_hp = (($scope.sale_cert.HP || '').replace(/[^\d]/g, "") == $scope.form_data.hp.replace(/[^\d]/g, ""));
		var is_same_hp = false;

		//		$d = {"sale_no": $scope.sale.SALE_NO, "hp": $scope.form_data.hp, "done_cd": (is_same_hp ? "no_modify" : "un_modify"), "auth_num": $scope.form_data.auth_num};
		console.log($scope.form_data.hp);

		$d = { "sale_no": $scope.sale.SALE_NO, "to_phone": $scope.form_data.hp, "done_cd": (is_same_hp ? "no_modify" : "un_modify"), "auth_num": $scope.form_data.auth_num };

		axios.post('/api/mypage/saleCert/confirmAuthNum4sale', $d)
			.then(function(response) {

				const data = response.data;
				let success = data.success;

				console.log(data);
				//console.log(data['data']['sale_cert_no']);
				//추후 변경 필요. (data['data']['sale_cert_no'] > 0) 추가
				//if (success && data['data']['sale_cert_no'] > 0) {
				if (success) {
					$scope.checkHpAuth.message = "인증에 성공 하였습니다.";
					$scope.checkHpAuth.check = "ok";
					//수정필요
					//$scope.parent.sale_cert.CNT = 1;

					if (!is_same_hp) {
						if (confirm("고객정보의 핸드폰번호와 일치하지 않습니다.\n인증받은 핸드폰번호로 갱신하시겠습니까?")) {
							$d = { "hp": $scope.form_data.hp, "sale_cert_no": data['data']['sale_cert_no'] };

							axios.post('/api/mypage/saleCert/updateSaleCertHp', $d)
								.then(function(response) {
									console.log('갱신완료');
									//추후 수정 필요.
									//$scope.parent.sale_cert.HP = $scope.form_data.hp;
									$scope.close(true)
								})
								.catch(function(error) {
									console.log(error);
								});
						} else {
							$scope.close(true);
						}
					} else {
						$scope.close(true);
					}
				} else {
					$scope.checkHpAuth.message = "인증에 실패 하였습니다. 다시 요청 하세요.";
					$scope.checkHpAuth.check = "";
				}
				$scope.checkHpAuth.valid = data;
			})
			.catch(function(error) {
				console.log(error);
			})
			.finally(function() {
				//타이머 초기화 필요.
			});


		//인증번호 비교
		/*		common.callAPI('/api/mypage/saleCert/confirmAuthNum4sale', $d, 
					function(data, status) {
						console.log(data);
						console.log(data['data']['sale_cert_no']);
						if(data['success'] && data['data']['sale_cert_no'] > 0) {
							$scope.checkHpAuth.message ="인증에 성공 하였습니다.";
							$scope.checkHpAuth.check = "ok";
							//수정필요
							$scope.parent.sale_cert.CNT = 1;
		
							if(!is_same_hp){
								if(confirm("고객정보의 핸드폰번호와 일치하지 않습니다.\n인증받은 핸드폰번호로 갱신하시겠습니까?")){
										$d = {"hp": $scope.form_data.hp, "sale_cert_no": data['data']['sale_cert_no']};
								  	
										  common.callAPI('/api/mypage/saleCert/updateSaleCertHp',$d, function(){
												$scope.parent.sale_cert.HP = $scope.form_data.hp;
										  }, null, $scope.close(true));
								}else{
								}
							}else{
								$scope.close(true);
							}
						}else {
							$scope.checkHpAuth.message ="인증에 실패 하였습니다. 다시 요청 하세요.";
							$scope.checkHpAuth.check = "";
						}
						$scope.checkHpAuth.valid = data;
							}
				, null, function() {
					$interval.cancel($scope.timer_duration);
					console.log("======> cancel timer");
					$scope.form_data.auth_num = null;
				});*/
	}


	$scope.getHpAuthMsg = function() {
		return $scope.checkHpAuth.message;
	}

	
	$scope.setAuthDuration = function() {
		console.log('setAuthDuration 5');
		var f = 'm:s';
		var s = moment($scope.auth_end_time).diff(moment(new Date()), 'seconds');
		console.log(s);
		if (s > 0) {
			$scope.checkHpAuth.message = "남은시간 : " + moment.duration(s, "seconds").format(f);
		}
		else if (s == 0) {
			//$scope.duraionEnd();
			$scope.form_data.can_auth = false;
			$scope.checkHpAuth.message = "0";
			$interval.cancel($scope.timer_duration);
			console.log("======> cancel timer");
			//인증번호 초기화(세션 null)
			common.callAPI('/api/mypage/saleCert/clearAuthNum', {}, function() {
				$scope.checkHpAuth.message = "인증 시간이 초과되었습니다. 다시 요청 하세요.";
			});
		}
	}
});

