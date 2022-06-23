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



/*아이디찾기-아이디 검색 결과 */
(function() {
	var popup_idsearch1 = $("js-popup_idsearch1").trpLayerFixedPopup(".popup_idsearch1-wrap");
	$(popup_idsearch1.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_idsearch1.open(this); // or false   
		popup_fixation(".popup_idsearch1-wrap"); // pc_하단붙이기
	});

	$("body").on("click", ".popup_idsearch1-wrap .js-closepop, .popup_idsearch1-wrap .popup-dim, #confirm_1", function($e) {
		$e.preventDefault();
		$('.popup_idsearch1-wrap').attr("style", "display:none");
	});
})();

/*아이디찾기-일치하는 정보가 없을 경우  */
(function() {
	var popup_idsearch2 = $(".js-popup_idsearch2").trpLayerFixedPopup(".popup_idsearch2-wrap");
	$(popup_idsearch2.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_idsearch2.open(this); // or false   
		popup_fixation(".popup_idsearch2-wrap"); // pc_하단붙이기
	});

	$("body").on("click", ".popup_idsearch2-wrap .js-closepop, .popup_idsearch2-wrap .popup-dim, #confirm_2", function($e) {
		$e.preventDefault();
		$('.popup_idsearch2-wrap').attr("style", "display:none");
	});
})();
/*아이디찾기-항목 미입력*/
(function() {
	var popup_idsearch3 = $(".js-popup_idsearch3").trpLayerFixedPopup("#popup_idsearch3-wrap");
	$(popup_idsearch3.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_idsearch3.open(this); // or false   
		//popup_fixation("#popup_idsearch3-wrap");    // pc_하단붙이기
		//popup_motion_open("#popup_idsearch3-wrap");  // mb 모션 
	});

	$("body").on("click", ".popup_idsearch3-wrap .js-closepop, .popup_idsearch3-wrap .popup-dim, #confirm_3", function($e) {
		$e.preventDefault();
		$('.popup_idsearch3-wrap').attr("style", "display:none");
	});
})();

/*아이디찾기-소셜 회원인 경우*/
(function() {
	var popup_idsearch4 = $(".js-popup_idsearch4").trpLayerFixedPopup(".popup_idsearch4-wrap");
	$(popup_idsearch4.getBtn).on("click", function($e) {
		$e.preventDefault();
		popup_idsearch4.open(this); // or false   
		popup_fixation(".popup_idsearch4-wrap"); // pc_하단붙이기
	});

	$("body").on("click", ".popup_idsearch4-wrap .js-closepop, .popup_idsearch4-wrap .popup-dim, #confirm_4", function($e) {
		$e.preventDefault();
		$('.popup_idsearch4-wrap').attr("style", "display:none");
	});
})();

/*아이디찾기 버튼 클릭 */	
$('#findId').on('click', function() {
	var searchType = $('input[name="radioSet2"]:checked').val();
	var searchValue;
	var custName ;
	var inputNull ;
	var locale = document.documentElement.lang;
	if (searchType == 'email') {
		
		$("#email").find("input[type=text]").each(function(index,item){
	        if ($(this).val().trim() == '') {
				if(locale == 'en'){
					$('#inputTitle').text("Please enter " + $(this).attr("data-id"));
				} else {
					$('#inputTitle').text($(this).attr("data-id")+" 입력해 주세요.");
				}
	          	inputNull = true;
	          	return false;
	        }
	    });
            
		if(inputNull){
			$('.popup_idsearch3-wrap').attr("style", "display:block");
			return;
		} else {
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if (regEmail.test($('#custEmail').val()) === false) {
				if(locale == 'en'){
					$('#inputTitle').text('Check out the Email'); 
				} else {
					$('#inputTitle').text('이메일을 확인해주세요.'); 
				}
				
				$('.popup_idsearch3-wrap').attr("style", "display:block");
				return;
			}
			searchValue = $('#custEmail').val();
			custName = $('#custNameByEmail').val();
		}
		
	} else {
		$("#phone").find("input[type=text]").each(function(index,item){
                if ($(this).val().trim() == '') {
					if(locale == 'en'){
						$('#inputTitle').text("Please enter " + $(this).attr("data-id"));
					} else {
						$('#inputTitle').text($(this).attr("data-id")+" 입력해 주세요.");
					}
                  	inputNull = true;
                  	return false;
                }
        });
        
		if(inputNull){
			$('.popup_idsearch3-wrap').attr("style", "display:block");
			return;
		} else {
			var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if (regPhone.test($('#custPhone').val()) === false) {
				if(locale == 'en'){
				$('#inputTitle').text('Check out the Mobile'); 			
				} else {
				$('#inputTitle').text('휴대폰 번호를 확인해주세요.'); 
				}
				$('.popup_idsearch3-wrap').attr("style", "display:block");
				return;
			}
			searchValue = $('#custPhone').val();
			custName = $('#custNameByPhone').val();
		}
	}
	
	var formData = {"search_type" : searchType , "cust_name":custName, "search_value" : searchValue};
	
	axios.post("/api/login/findCustId", formData).then(function(response) {
		const result = response.data;
		let success = result.success;
		if (!success) {
			$('.popup_idsearch2-wrap').attr("style", "display:block");
		} else if(result.data.SOCIAL_YN == 'Y'){
			$('#socialType').text(result.data.SOCIAL_TYPE);
			$('.popup_idsearch4-wrap').attr("style", "display:block");
		} else {
			$('#custId').text(result.data.LOGIN_ID);
			$('.popup_idsearch1-wrap').attr("style", "display:block");
		}
	})
		.catch(function(error) {
			console.log(error);
		});

});


