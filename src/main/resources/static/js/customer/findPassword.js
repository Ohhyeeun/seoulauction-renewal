app.value('locale', document.documentElement.lang);

	var popup_idsearch3 = $(".js-popup_idsearch3").trpLayerFixedPopup("#popup_idsearch3-wrap");
	var popup_pwsearch1 = $(".js-popup_pwsearch1").trpLayerFixedPopup("#popup_pwsearch1-wrap");
	var popup_pwsearch2 = $(".js-popup_pwsearch2").trpLayerFixedPopup("#popup_pwsearch2-wrap");
	var popup_pwsearch3 = $(".js-popup_pwsearch3").trpLayerFixedPopup("#popup_pwsearch3-wrap");
	var popup_pwsearch4 = $(".js-popup_pwsearch4").trpLayerFixedPopup("#popup_pwsearch4-wrap");
	


	
/*비밀번호 찾기 버튼 클릭 */
$('#findPassword').on('click', function() {	
	var searchType = $('input[name="radioSet2"]:checked').val();
	var searchValue;
	var custName;
	var custId;
	var popupNumber;
	var inputNull;
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
			popup_idsearch3.open(this);
			return;
		} else {
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if (regEmail.test($('#custEmail').val()) === false) {
				if(locale == 'en'){
					$('#inputTitle').text('Check out the Email'); 
				} else {
					$('#inputTitle').text('이메일을 확인해주세요.'); 
				}
				popup_idsearch3.open(this);
				return;
			}
			searchValue = $('#custEmail').val();
			custName = $('#custNameByEmail').val();
			custId = $('#custIdByEmail').val();
			popupNumber=2;
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
			popup_idsearch3.open(this);
			return;
		} else {
			var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if (regPhone.test($('#custPhone').val()) === false) {
				if(locale == 'en'){
				$('#inputTitle').text('Check out the Mobile'); 			
				} else {
				$('#inputTitle').text('휴대폰 번호를 확인해주세요.'); 
				}
				popup_idsearch3.open(this);
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
			popup_pwsearch3.open(this);
		} else if (result.data.SOCIAL_YN == 'Y') {
			$('#socialType').text(result.data.SOCIAL_TYPE);
			popup_pwsearch4.open(this);
		} else {
			eval('popup_pwsearch'+popupNumber).open(this);
		}
	})
		.catch(function(error) {
			console.log(error);
		});

});

	
/*미입력*/
(function() {
    $("body").on("click", "#popup_idsearch3-wrap .js-closepop, #popup_idsearch3-wrap .popup-dim, #confirm_1", function($e) {
        $e.preventDefault();
        popup_idsearch3.close();
        //popup_motion_close("#popup_idsearch3-wrap");  //  mb 모션 
    });
})();

/* 비밀번호찾기-휴대폰 번호로 찾기 */
(function() {
	$("body").on("click", "#popup_pwsearch1-wrap .js-closepop, #popup_pwsearch1-wrap .popup-dim", function($e) {
		$e.preventDefault();
		popup_pwsearch1.close();
	});
	
})();

/* 비밀번호찾기-이메일로 찾기 */
(function() {
	$("body").on("click", "#popup_pwsearch2-wrap .js-closepop, #popup_pwsearch2-wrap .popup-dim", function($e) {
		$e.preventDefault();
		popup_pwsearch2.close();
	});
})();

/*  비밀번호찾기-일치정보가 없을 경우*/
(function() {
	$("body").on("click", "#popup_pwsearch3-wrap .js-closepop, #popup_pwsearch3-wrap .popup-dim, #confirm_4", function($e) {
		$e.preventDefault();
		popup_pwsearch3.close();
	});	
})();


/* 비밀번호찾기-소셜 회원인 경우 */
(function() {
	$("body").on("click", "#popup_pwsearch4-wrap .js-closepop, #popup_pwsearch4-wrap .popup-dim, #confirm_5", function($e) {
		$e.preventDefault();
		popup_pwsearch4.close();
	});
})();

