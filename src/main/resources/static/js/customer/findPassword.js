/*아이디찾기선택 */
$('.js-menuType-header input').on('change', function() {
	$('.js-menuType-body .js-ds_item').hide();
	var idx = $('.js-menuType-header input').index($('.js-menuType-header input:checked'));
	$('.js-menuType-body .js-ds_item' + idx).show();

	if (idx >= 1) {
		$(".js-ds_item2_check").hide();
	} else {
		$(".js-ds_item2_check").show();
	}
});

/*비밀번호 찾기 버튼 클릭 */

$('#findPassword').on('click', function() {
	var searchType = $('input[name="radioSet2"]:checked').val();
	var searchValue;
	var custName;
	var custId;
	var popupNumber;
	
	if (searchType == 'email') {
		if ($('#custIdByEmail').val() == '' || $('#custNameByEmail').val() == '' || $('#custEmail').val() == '') {
			$('#popup_pwsearch0-wrap').attr("style", "display:block");
			return;
		} else {
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if (regEmail.test($('#custEmail').val()) === false) {
				alert('이메일을 확인해주세요.');
				return;
			}
			searchValue = $('#custEmail').val();
			custName = $('#custNameByEmail').val();
			custId = $('#custIdByEmail').val();
			popupNumber=2;
		}

	} else {
		if ($('#custIdByPhone').val() == '' || $('#custNameByPhone').val() == '' || $('#custPhone').val() == '') {
			$('#popup_pwsearch0-wrap').attr("style", "display:block");
			return;
		} else {
			var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if (regPhone.test($('#custPhone').val()) === false) {
				alert('휴대폰 번호를 확인해주세요.');
				return;
			}
			searchValue = $('#custPhone').val();
			custName = $('#custNameByPhone').val();
			custId = $('#custIdByPhone').val();
			popupNumber=1;
		}
	}
	var formData = { "search_type": searchType, "login_id": custId, "cust_name": custName, "search_value": searchValue };

	axios.post("/api/login/findCustPassword", formData).then(function(response) {
		const result = response.data;
		let success = result.success;
		if (!success) {
			$('#popup_pwsearch3-wrap').attr("style", "display:block");
		} else if (result.data.SOCIAL_TYPE) {
			$('#socialType').text(result.data.SOCIAL_TYPE);
			$('#popup_pwsearch4-wrap').attr("style", "display:block");
		} else {
			$('#popup_pwsearch'+popupNumber+'-wrap').attr("style", "display:block");
		}
	})
		.catch(function(error) {
			console.log(error);
		});

});

/* 비밀번호찾기-휴대폰 번호로 찾기 */
(function() {
	var popup_pwsearch1 = $(".js-popup_pwsearch1").trpLayerFixedPopup("#popup_pwsearch1-wrap");
	$(popup_pwsearch1.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_pwsearch1.open(this); // or false   
		popup_fixation("#popup_pwsearch1-wrap"); // pc_하단붙이기
	});

	$("body").on("click", "#popup_pwsearch1-wrap .js-closepop, #popup_pwsearch1-wrap .popup-dim", function($e) {
		$e.preventDefault();
		popup_pwsearch1.close();
	});
})();

/* 비밀번호찾기-이메일로 찾기 */
(function() {
	var popup_pwsearch2 = $(".js-popup_pwsearch2").trpLayerFixedPopup("#popup_pwsearch2-wrap");
	$(popup_pwsearch2.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_pwsearch2.open(this); // or false   
		popup_fixation("#popup_pwsearch2-wrap"); // pc_하단붙이기
	});

	$("body").on("click", "#popup_pwsearch2-wrap .js-closepop, #popup_pwsearch2-wrap .popup-dim", function($e) {
		$e.preventDefault();
		popup_pwsearch2.close();
	});
})();

/*  비밀번호찾기-일치정보가 없을 경우*/
(function() {
	var popup_pwsearch3 = $(".js-popup_pwsearch3").trpLayerFixedPopup("#popup_pwsearch3-wrap");
	$(popup_pwsearch3.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_pwsearch3.open(this); // or false   
		popup_fixation("#popup_pwsearch3-wrap"); // pc_하단붙이기
	});

	$("body").on("click", "#popup_pwsearch3-wrap .js-closepop, #popup_pwsearch3-wrap .popup-dim", function($e) {
		$e.preventDefault();
		popup_pwsearch3.close();
	});
})();



/* 비밀번호찾기-소셜 회원인 경우 */

(function() {
	var popup_pwsearch4 = $(".js-popup_pwsearch4").trpLayerFixedPopup("#popup_pwsearch4-wrap");
	$(popup_pwsearch4.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_pwsearch4.open(this); // or false   
		popup_fixation("#popup_pwsearch4-wrap"); // pc_하단붙이기
	});

	$("body").on("click", "#popup_pwsearch4-wrap .js-closepop, #popup_pwsearch4-wrap .popup-dim", function($e) {
		$e.preventDefault();
		popup_pwsearch4.close();
	});
})();