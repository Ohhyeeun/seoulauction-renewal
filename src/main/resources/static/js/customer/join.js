app.value('locale', 'ko');
app.value('is_login', 'false');
	
// 카카오
var kakaoUser;
// 구글
var googleUser = {};
var googleProfile;
// 네이버
var naverLogin;

app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('joinCtl', function($scope, consts, common, ngDialog) {
	$scope.form_data = {};
	
	if(socialExist == 'Y'){
		alert("이미 가입된 계정입니다. 로그인해주세요.")
		location.href = '/join'
	}
	
	$scope.goJoin = function(type){
		location.href = '/joinForm?type=' + type				
	}
	// 카카오 init
	Kakao.init('cf2233f55e74d6d0982ab74909c97835');
	// SDK 초기화 여부 판단
	console.log(Kakao.isInitialized() ? "카카오init성공" : "카카오init실패");

	var googleInit = function() {
		gapi.load('auth2', function() {
			auth2 = gapi.auth2.init({
				client_id: '5285017753-1tkl3r19jc3e7hesflsm0jj9uhgm7f4j.apps.googleusercontent.com',
				cookiepolicy: 'single_host_origin',
			});
			$scope.JoinWithGoogle(document.getElementById('googleIdJoin'));
		});
	};

	// 구글 init
	googleInit();

	// 네이버초기화
	naverLogin = new naver.LoginWithNaverId({
		clientId: "5qXZytacX_Uy60o0StGT",
		callbackUrl: "https://local.seoulauction.com:9000/social/naver/callback?action=login",
		isPopup: false,
		loginButton: {
			color: "green",
			type: 3,
			height: 60
		}
	});

	// 네이버 init
	naverLogin.init();

	// 애플 init
	AppleID.auth.init({
		clientId: 'com.seoulauction.renewal-web',
		scope: 'name email',
		redirectURI: 'https://local.seoulauction.com:9000/api/login/auth/apple',
		state: 'SARenewal',
		usePopup: true
	});

	// SNS공통회원가입
	function submitJoin(socialType, name, email, mobile, sub) {
		document.getElementById('name').value = name;
		document.getElementById('email').value = email;
		document.getElementById('mobile').value = mobile;
		document.getElementById('sub').value = sub;

		var form = document.getElementById('joinForm');
		form.action = '/joinForm?socialType=' + socialType;
		form.submit();
	}

	// 카카오 로그인 / 카카오 회원가입
	$scope.joinWithKakao = function() {
		Kakao.Auth.login({
			success: function(authObj) {
				Kakao.Auth.setAccessToken(authObj.access_token); // access-token 저장
				$scope.getKakaoUser();
			},
			fail: function(err) {
				console.log(err);
			}
		});

	}

	// 카카오사용자정보로 DB조회하여 로그인진행
	$scope.getKakaoUser = function() {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function(res) {
				kakaoUser = res.kakao_account;

				console.log(kakaoUser);
				submitJoin("KA", kakaoUser.profile.nickname, kakaoUser.email, null, null);
			},
			fail: function(error) {
				alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
			}
		});
	}

	// 구글회원가입
	$scope.JoinWithGoogle = function(element) {
		auth2.attachClickHandler(element, {},
			function(googleUser) {
				googleProfile = googleUser.getBasicProfile();
				submitJoin("GL", googleProfile.getName(), googleProfile.getEmail(), null, null, null);
			}, function(error) {
				alert(JSON.stringify(error, undefined, 2));
			});
	}

	// 네이버회원가입
	$scope.naverJoin = function() {
		naverLogin = new naver.LoginWithNaverId({
			clientId: "5qXZytacX_Uy60o0StGT",
			callbackUrl: "https://local.seoulauction.com:9000/social/naver/callback?action=join",
			isPopup: false
		});
	
		naverLogin.init();
		var loginButton = document.getElementById("naverIdLogin").firstChild;
		loginButton.click();
	};

	// 네이버 로그인
	$scope.joinWithApple = function() {
		var loginButton = document.getElementById("appleid-signin").firstChild;
		loginButton.click();
	}

	//애플로 로그인 성공 시.
	document.addEventListener('AppleIDSignInOnSuccess', (data) => {
		var name = '';
		if (data.detail.user != undefined) {
			var user = data.detail.user;
			name = user.name.lastName + user.name.firstName;
			console.log(name);
		}
		var token = data.detail.authorization.id_token;
		var payload = JSON.parse(atob(token.split(".")[1]))
		console.log(payload)
		var email = payload.email;
		var sub = payload.sub;

		console.log("email : " + email + "sub : " + sub);
		submitJoin("AP", name, payload.email, null, payload.sub);
	});

	//애플로 로그인 실패 시.
	document.addEventListener('AppleIDSignInOnFailure', (error) => {
		console.log("AppleIDSignInOnFailure")
		console.log(error)
	});

});

var address_search1 = $(".js-address_search1").trpLayerFixedPopup("#address_search1-wrap")
$("body").on("click", "#address_search1-wrap .js-closepop, #address_search1-wrap .popup-dim", function($e) {
    $e.preventDefault();
    address_search1.close();
});

var staff_search1 = $(".js-staff_search1").trpLayerFixedPopup("#staff_search1-wrap");
$("body").on("click", "#staff_search1-wrap .js-closepop, #staff_search1-wrap .popup-dim", function($e) {
    $e.preventDefault();
    staff_search1.close();
});
        



app.controller('joinFormCtl', function($scope, consts, common, ngDialog, $interval) {
	$scope.type = "";
	$scope.socialType = "";
	$scope.langType = "";
	$scope.find_word = "";
	$scope.form_data = "";
	
	function Request(){
		this.getParameter = function(param){
	    	var requestParam ="";
	        var url = unescape(location.href);
	        var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
	
	        for(var i = 0 ; i < paramArr.length ; i++){
	           var temp = paramArr[i].split("=");
	           if(temp[0].toUpperCase() == param.toUpperCase()){
	             requestParam = paramArr[i].split("=")[1];
	             break;
	           }
	        }
	        return requestParam.replace("#","");
	    }
	}
	
	// 개인/사업자회원구분
	$scope.isPerson = function() {
		return $scope.type.startsWith('person') || $scope.type.startsWith('social');
	}
	
	// 개인/소셜회원구분
	$scope.isSocial = function() {
		return $scope.type.startsWith('social');
	}
	
	// 소셜타입명
	$scope.getSocialName = function() {
		if($scope.socialType == "NV"){
			return "naver";
		}else if($scope.socialType == "KA"){
			return "kakao";
		}else if($scope.socialType == "GL"){
			return "google";
		}else if($scope.socialType == "AP"){
			return "apple";
		}
	}
	
	$scope.idValid = false;
	$scope.nameValid = false;
	$scope.emailValid = false;
	$scope.init = function(){
		var request = new Request();
		$scope.type = request.getParameter("type");
		$scope.socialType = request.getParameter("socialType");
		$scope.type = $scope.socialType != '' ? 'social' : $scope.type;
		$scope.langType = document.documentElement.lang;
		$scope.form_data = {};
		
		if ($scope.langType == 'ko') {
			$scope.form_data.local_kind_cd = 'korean';
			$scope.form_data.nation_cd = 'KR';
		}else{
			$scope.form_data.local_kind_cd = 'foreigner';
		}
		
		//마케팅약관 아코디언 활성화 default
		if($scope.isPerson() || $scope.isSocial()){
			$("#marketingPerson").trigger("click");	
			$scope.form_data.cust_kind_cd = 'person';
		}else{
			$("#marketingCompany").trigger("click");
			$scope.form_data.cust_kind_cd = 'company';
		}
		
		//소셜에서 받은 value setting
		if($scope.isSocial()){
			$scope.idValid = true;
			$scope.form_data.cust_name = name;
			$scope.nameValid = name != '' && name != undefined ? true : false;
			$scope.form_data.hp = mobile;
			$scope.form_data.email = email;
			$scope.emailValid = email != '' && email != undefined ? true : false;
			$scope.form_data.social_login_id = socialLoginId;
			$scope.form_data.social_email = socialEmail;
			$scope.form_data.social_type = $scope.socialType;
		}
		
		//국가목록 api호출
		if($scope.langType == 'en'){
			let data = {"grp_ids": ["nation"]};
			axios.post('/api/login/nations' , data)
	        .then(function(response) {
	            const result = response.data;
	            $scope.nationList = result.data;
				$scope.$apply();
	        })
	        .catch(function(error){
	            console.log(error);
	        });
		}
	}	
	
	//아이디 validation (api호출)
	$scope.idValidCheckBlur = function() {
		if($scope.isSocial()) return;
		
		if($scope.form_data.login_id === "" || $scope.form_data.login_id === undefined){
			if ($scope.langType == 'ko') {
				$scope.login_id_msg = "ID를 입력해 주세요.";
			} else {
				$scope.login_id_msg = "From 6 to 14 characters.";
			}
			
			$scope.idValid = false;
		}else{
			let data = {};
	        data['loginId'] = $scope.form_data.login_id;
			axios.post('/api/login/isIdExist' , data)
	        .then(function(response) {
	            const result = response.data;
	            if(result && result.length > 0){
					$scope.idValid = false;
					if(result[0].STAT_CD == "stop"){
						if ($scope.langType == 'ko') {
		                	$scope.login_id_msg = "이용제한 아이디 입니다. 서비스 이용을 원하시면 고객센터(02-395-0330)로 연락바랍니다.";
						} else {
							$scope.login_id_msg = "This is a restricted ID. If you wish to use the service, please contact the customer center (02-395-0330)";
						}
					}else{
						if ($scope.langType == 'ko') {
			                $scope.login_id_msg = "이미 사용중인 ID입니다.";
						} else {
							$scope.login_id_msg = "This ID is already in use.";
						}
					}
	            }else{
					$scope.idValid = true;
					if ($scope.langType == 'ko') {
						$scope.login_id_msg = "사용가능한 ID 입니다.";
					} else {
						$scope.login_id_msg = "ID available.";
					}
				}
				$scope.$apply();
				$scope.allValidCheck();
	        })
	        .catch(function(error){
	            console.log(error);
	        });
		}
		
	}
	
	//아이디 validation (입력오류)
	$scope.idValidCheckChange = function() {
		$scope.idValid = false; //아이디 수정 시 중복체크api호출까지 일단 valid false
		var regExp = /^[a-z][a-z0-9]{5,13}$/g;
		
		if (!regExp.test($scope.form_data.login_id)){
			const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
			if (regExp.test($scope.form_data.login_id)) {
				$scope.form_data.login_id = $scope.form_data.login_id.replace(regExp, '');
			}
			if ($scope.langType == 'ko') {
				$scope.login_id_msg = "영문자로 시작되는 아이디를 입력해 주세요. 6~14자 영문자 또는 숫자이어야 합니다.";
			} else {
				$scope.login_id_msg = "From 6 to 14 characters.";
			}
		}else{
			$scope.login_id_msg = "";
		}
		$scope.allValidCheck();
	}
	
	//비밀번호 validation
	$scope.passwdValid = false;
	$scope.passwdValidChange = function() {
		var pw = $scope.form_data.passwd;
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length < 8 || pw.length > 16 || (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){
			if ($scope.langType == 'ko') {
				$scope.passwd_msg = "입력하신 비밀번호는 사용 불가능 합니다. 영문자, 숫자, 특수문자 조합으로 8~16자로 다시 입력해 주세요.";
			} else {
				$scope.passwd_msg = "Password must be at least 8 characters and contain one lowercase letter, number, and a special character.";
			}
			$scope.passwdValid = false;
		}else {
			if ($scope.langType == 'ko') {
				$scope.passwd_msg = "사용가능한 비밀번호 입니다.";
			} else {
				$scope.passwd_msg = "This password is available.";
			}
			$scope.passwdValid = true;
		}
		$scope.allValidCheck();
	}

	//비밀번호 마스킹 on/off
	var pw_mask;
    pw_mask = $(".js-pw_mask").trpToggleBtn(
    function($this) {
        $($this).addClass("on");
        $($this).closest(".pw_mask_box").find("input").attr("type", "text");
    },
    function($this) {
        $($this).removeClass("on");
        $($this).closest(".pw_mask_box").find("input").attr("type", "password");
    });
	
	//이름 validation
	$scope.nameValidCheck = function(){
		if($scope.form_data.cust_name == '' || $scope.form_data.cust_name == undefined){
			$scope.nameValid = false;			
		}else{
			$scope.nameValid = true;
		}
		$scope.allValidCheck();
	}
	
	//핸드폰번호 validation
	$scope.checkHpAuth = {"valid" : false, "message":"", "check": ""};
	$scope.authNumValid = false;
	$scope.authNumberShowYn = false;
	$scope.authNumMsg = "인증번호 요청";
	$scope.authNumRequest = function() {
		var phone = $scope.form_data.hp;		
		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if (phone == null || phone == '') {
			$scope.hp_msg = "휴대폰 번호를 입력해주세요";
			return;
		}
		else if (regPhone.test(phone) === false) {
			$scope.hp_msg = "휴대전화번호를 확인해주세요.";
			return;
		}
				
		$interval.cancel($scope.timer_duration);
		$scope.form_data.hp_auth="";
		
		$d = {"to_phone": phone };
		axios.post('/api/mypage/saleCert/sendAuthNum', $d)
		.then(function(response) {
			console.log(response);
						const data = response.data;
						let success = data.success;
			
						if (success) {
							console.log(data["data"].AUTH_EXISTS);
							if (data["data"].AUTH_EXISTS) {
									$scope.hp_msg = "이미 등록된 휴대폰 번호 입니다.\n" + "다른 번호를 입력해 주세요.";
									//This number is already authorized.\n" + "Please log-in again with the first authenticated ID and start bidding.						
							} else {
								$scope.auth_num_send_status = data.data.SEND_STATUS;
								$scope.auth_end_time = moment(new Date()).add(120, 'seconds');
								if($scope.auth_num_send_status){
								$scope.timer_duration = $interval($scope.setAuthDuration, 1000);
								console.log("======> set timer");
								}
								if ($scope.langType == 'ko') {
									$scope.checkHpAuth.valid = true;
									$scope.hp_msg = "";
									$scope.authNumberShowYn = true; //인증번호 입력 필드 show
									$scope.authNumMsg = "인증번호 재전송";
									
								}else if ($scope.langType == 'en') {
									$scope.checkHpAuth.valid = false;
									$scope.authNumValid = true;		
									$scope.authNumMsg = "인증번호 재전송(영어)";
									
								}
							}
						}
		})
		.catch(function(error) {
			console.log(error);
		});
	}
	
	//핸드폰인증번호 validation
	$scope.authNumConfirm = function() {
		if($scope.form_data.hp_auth == null || $scope.form_data.hp_auth == '') {
			$scope.hp_msg = "인증번호를 넣으세요.";
			return;
		}
		$d = {"auth_num":$scope.form_data.hp_auth};
		axios.post('/api/mypage/saleCert/confirmAuthNum4sale', $d)
			.then(function(response) {
				const data = response.data;
				let success = data.success;
				if(success) {
					$interval.cancel($scope.timer_duration);
					$scope.hp_msg ="인증에 성공 하였습니다.";
					$scope.authNumValid  = true;
					$scope.checkHpAuth.message = "";
				}else {
					$scope.hp_msg ="인증에 실패 하였습니다. 다시 요청 하세요.";
					$scope.authNumValid  = false;
				}
		})
		.catch(function(error) {
			console.log(error);
		})
	}
	
	$scope.getHpAuthMsg = function() {
		return $scope.checkHpAuth.message;
	}
	
	$scope.setAuthDuration = function() {
		if(!$scope.checkHpAuth.valid){
			$interval.cancel($scope.timer_duration);
		}
 		var f = 'm:s';
    	var s = moment($scope.auth_end_time).diff(moment(new Date()), 'seconds');
    	if(s > 0) {
    		$scope.checkHpAuth.message = "남은시간 : " + moment.duration(s, "seconds").format(f);
    	}
    	else if (s == 0) {
    		//$scope.duraionEnd();
    		$scope.checkHpAuth.message = "0";
    		$interval.cancel($scope.timer_duration);
    		console.log("======> cancel timer");
    		axios.post('/api/mypage/saleCert/clearAuthNum', {})
					.then(function(response) {
						document.getElementById('hpMsg').innerText="";
						document.getElementById('checkHpAuthMsg').innerText="인증 시간이 초과되었습니다. 다시 요청 하세요.";
					})
					.catch(function(error) {
						console.log(error);
					});
    	}
    }
	
	//이메일 validation
	$scope.emailValidCheck = function() {
		if($scope.form_data.email == "" || $scope.form_data.email == undefined){
			$scope.email_msg = "이메일을 입력해주세요.";
			$scope.emailValid = false;
		}else{
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		    if (!regEmail.test($scope.form_data.email)) {
		    	if ($scope.langType == 'ko') {
			    	$scope.email_msg = "형식에 맞지 않습니다.";
				} else {
					$scope.email_msg = "The email you entered is not available.";
				}
		    	$scope.emailValid = false;  
		    }else{
				$scope.email_msg = "";
				$scope.emailValid = true;
			}
		}
		if ($scope.langType == 'ko') {
			$scope.allValidCheck();
		}
	}
	
	//해외회원 이메일 validation (api호출)
	$scope.emailDuplCheck = function() {
		//외국 가입자 이메일 중복체크필요
		let data = {};
	    data['email'] = $scope.form_data.email;
		axios.post('/api/login/isEmailExist' , data)
	    .then(function(response) {
	        const result = response.data;
	        if(result && result.length > 0){
				$scope.email_msg = "The email you entered is already in use.";
				$scope.emailValid = false;
	        }else{
				$scope.email_msg = "The email you entered is available.";
				$scope.emailValid = true;
			}
			$scope.$apply();
			$scope.allValidCheck();
	    })
	    .catch(function(error){
	        console.log(error);
	    });
	}
	
	//주소 validation
	$scope.addrValid = false;
	$scope.addr_msg = "주소를 입력해주세요.";
	//주소검색 팝업호출
	$scope.addressSearch = function(){
		var address_search1 = $(".js-address_search1").trpLayerFixedPopup("#address_search1-wrap")
        address_search1.open(this); // or false   
        popup_fixation("#address_search1-wrap");
	}
	
	//주소검색
	$scope.findAddrNewForm = function(){
		let data = {};
        data['find_word'] = $scope.find_word;
        axios.post('/api/mypage/address' , data)
	        .then(function(response) {
	            const result = response.data;
	
	            let success = result.success;
	            if(!success){
	                alert(result.data.msg);
	            } else {
					$scope.addressList = result.data.addresses;
					$scope.$apply();
	            }
	        })
	        .catch(function(error){
	            console.log(error);
	        });
	}
	
	$scope.setAddr = function(addr) {
		$scope.form_data.zipno = addr.postcd;
		$scope.form_data.addr = addr.address;
		address_search1.close();
		common.setFocus("addr_dtl");
		$scope.addr_msg = "상세주소를 입력해주세요.";
	};
	
	//주소상세 validation
	$scope.addrDtlValidCheck = function() {
		if($scope.form_data.addr_dtl == "" || $scope.form_data.addr_dtl == undefined){
			$scope.addr_msg = "상세주소를 입력해주세요.";
			$scope.addrValid = false;
		}else{
			if($scope.form_data.zipno == "" || $scope.form_data.zipno == undefined){
				$scope.addr_msg = "주소를 입력해주세요.";
				$scope.addrValid = false;
			}else{
				$scope.addrValid = true;
				$scope.addr_msg = "";
			}
		}
		$scope.allValidCheck();
	}
	
	//직원검색 팝업호출
	$scope.employeeSearch = function(){
        staff_search1.open(this); // or false   
        popup_fixation("#staff_search1-wrap");
	}
	
	//직원검색
	$scope.findEmpNewForm = function(){
		let data = {};
        data['emp_name'] = $scope.emp_name;
        axios.post('/api/login/employee' , data)
	        .then(function(response) {
	            const result = response.data;
	
	            let success = result.success;
	            if(!success){
	                alert(result.data.msg);
	            } else {
					$scope.employeeList = result.data.list;
					$scope.empLength = result.data.cnt;
					$scope.$apply();
	            }
	        })
	        .catch(function(error){
	            console.log(error);
	        });
	}
	
	$scope.setEmp = function(emp) {
		$scope.dept_name_txt = emp.DEPT_NAME;
		$scope.emp_name_txt = emp.EMP_NAME;
		$scope.form_data.emp_no = emp.EMP_NO;
		staff_search1.close();
	};
	
	$scope.employeeDelete = function(){
		if(confirm("삭제하시겠습니까?")){
	        $scope.dept_name_txt = '';
			$scope.emp_name_txt = '';
			$scope.form_data.emp_no = '';
		}
	}
	
	//약관아코디언
	$(".js-accordion_policy").trpAccordionMenu(".acc_btn", ".con-area", "on");
		
	//약관체크
	$scope.allCheckPerson = false;
	$scope.checkAllPerson = function(){ 
		$("input:checkbox[name=chk_per]").change();
		$scope.allCheckPerson = !$scope.allCheckPerson;
		if($scope.allCheckPerson){
			$scope.form_data.personOnlineAgree = true;
			$scope.form_data.personOfflineAgree = true;
			$scope.form_data.personAgree1 = true;
			$scope.form_data.maketingAgree1 = true;
		}else{
			$scope.form_data.personOnlineAgree = false;
			$scope.form_data.personOfflineAgree = false;
			$scope.form_data.personAgree1 = false;
			$scope.form_data.maketingAgree1 = false;
		}
	} 
		
	$scope.onChangeCheckbox_P = function(){
		if($("input:checkbox[name=chk_per]:checked").length < 4){
			$scope.allCheckPerson = false;
		}else{
			$scope.allCheckPerson = true;
		}
	}
	
	$scope.clickPushWay = function(){
		if($("input:checkbox[name=pushway_per]:checked").length > 0){
			$scope.form_data.maketingAgree1 = true;
		}
	}
	
	//사업자 약관체크
	$scope.allCheckComp = false;
	$scope.checkAllCompany = function(){ 
		$scope.allCheckComp = !$scope.allCheckComp;
		if($scope.allCheckComp){
			$scope.form_data.compOnlineAgree = true;
			$scope.form_data.compOfflineAgree = true;
			$scope.form_data.compAgree1 = true;
			$scope.form_data.compMaketingAgree1 = true;
		}else{
			$scope.form_data.compOnlineAgree = false;
			$scope.form_data.compOfflineAgree = false;
			$scope.form_data.compAgree1 = false;
			$scope.form_data.compMaketingAgree1 = false;
		}
	}

	$scope.onChangeCheckbox_C = function(){
		if($("input:checkbox[name=chk_com]:checked").length < 4){
			$scope.allCheckComp = false;
		}else{
			$scope.allCheckComp = true;
		}
	}
	
	//해외회원 국가 validation
	$scope.countryValid = false;
	$scope.changeNation = function(){
		if($scope.select_nation != "" && $scope.select_nation != undefined){
			var sn = $scope.select_nation.split("|");
			$scope.form_data.nation_cd = sn[0];
			$scope.nationMobile = sn[1];
			$scope.countryValid = true;
		}else{
			$scope.countryValid = false;
		}
		$scope.allValidCheck();
	}
	
	//해외회원 주소 validation
	$scope.addrValidEn = false;
	$scope.addrValidBlur = function(){
		if($scope.form_data.zipno != '' && $scope.form_data.zipno != undefined
			&& $scope.form_data.addr != '' && $scope.form_data.addr != undefined
			&& $scope.form_data.addr_dtl != '' && $scope.form_data.addr_dtl != undefined){
			$scope.addrValidEn = true;		
		}else{
			$scope.addrValidEn = false;
		}
		$scope.allValidCheck();
	}
	
	//해외회원 응찰 validation
	$scope.bidValid = false;
	$scope.bidValidCheck = function(yn){
		$scope.form_data.fore_bid_req_yn = yn;
		$('input:radio[name="bidRadio"]:input[value=' + !yn + ']').attr("checked", false);
		$scope.bidValid = true;
		$scope.allValidCheck();
	}
	
	//해외회원 신분증 파일첨부 validation
	$scope.fileValid = false;
	$scope.fileValidCheck = function(inputId){
		var file = document.getElementById("fore_" + inputId + "_file").files[0];
		let maxSize  = 5 * 1024 * 1024 
			
		//첨부파일 용량체크				
		if(file.size > maxSize){
			var msg = "Files of 5 MB or less can be attached";
			if(inputId == 'id'){
				$scope.fore_id_msg = msg;	
				$scope.fore_id_filename = "";	
			}else if(inputId == 'doc'){
				$scope.fore_doc_msg = msg;	
				$scope.fore_doc_filename = "";	
			}
			document.getElementById("fore_" + inputId + "_file").value = '';
			$scope.fileValid = false;
			$scope.$apply();
			$scope.allValidCheck();
			return false;				
		}
		
		var filename = file.name;
		var lastDot = filename.lastIndexOf('.');
		var fileExt = filename.substring(lastDot+1, filename.length).toLowerCase();
		var extArray = ["jpg", "jpeg", "png", "gif", "pdf", "zip", "alz"];
		
		//파일 확장자 체크
		if(extArray.indexOf(fileExt) == -1){
			var msg = "Please re-register as an image file.";
			if(inputId == 'id'){
				$scope.fore_id_msg = msg;	
				$scope.fore_id_filename = "";	
			}else if(inputId == 'doc'){
				$scope.fore_doc_msg = msg;	
				$scope.fore_doc_filename = "";	
			}
			document.getElementById("fore_" + inputId + "_file").value = '';
			$scope.fileValid = false;
			$scope.$apply();
			$scope.allValidCheck();
			return false;		
		}
		
		if(inputId == 'id'){
			$scope.fore_id_msg = "";
			$scope.fore_id_filename = filename;	
		}else if(inputId == 'doc'){
			$scope.fore_doc_msg = "";
			$scope.fore_doc_filename = filename;	
		}
		
		if($('input[type="file"]')[0].files.length + $('input[type="file"]')[1].files.length < 2){
			$scope.fileValid = false;
		}else{
			$scope.fileValid = true;
		}
		
		$scope.$apply();
		$scope.allValidCheck();
	}
	
	//전체 validation
	$scope.allValidCheck = function() {
		if($scope.isPerson()){
			if($scope.langType == 'ko'){
				if($scope.isSocial()){ 
					//내국소셜회원 필수 필드 : 이름/휴대폰번호/이메일/주소
					if($scope.nameValid && $scope.authNumValid && $scope.emailValid && $scope.addrValid){
						$('#joinButton').removeClass('disabled');
					}else{
						$('#joinButton').addClass('disabled');
					}
				}else{ 
					//내국개인회원 필수 필드 : 아이디/비밀번호/이름/휴대폰번호/이메일/주소 
					if($scope.idValid && $scope.passwdValid && $scope.nameValid && $scope.authNumValid && $scope.emailValid && $scope.addrValid){
						$('#joinButton').removeClass('disabled');
					}else{
						$('#joinButton').addClass('disabled');
					}
				}
			}else if($scope.langType == 'en'){
				if($scope.isSocial()){ 
					//외국소셜회원 필수 필드 : 이름/이메일/국가/주소/입찰여부/신분증/증빙서류
					if($scope.nameValid && $scope.emailValid && $scope.countryValid && $scope.addrValidEn && $scope.bidValid){
						if($scope.form_data.fore_bid_req_yn == 'N' || ($scope.form_data.fore_bid_req_yn == 'Y' && $scope.fileValid)){
							$('#joinButton').removeClass('disabled');								
						}else{
							$('#joinButton').addClass('disabled');
						}
					}else{
						$('#joinButton').addClass('disabled');
					}
				}else{
					//외국개인회원 필수 필드 : 아이디/비밀번호/이름/이메일/국가/주소/입찰여부/신분증/증빙서류
					if($scope.idValid && $scope.passwdValid && $scope.nameValid && $scope.emailValid && $scope.countryValid && $scope.addrValidEn && $scope.bidValid){
						if($scope.form_data.fore_bid_req_yn == 'N' || ($scope.form_data.fore_bid_req_yn == 'Y' && $scope.fileValid)){
							$('#joinButton').removeClass('disabled');								
						}else{
							$('#joinButton').addClass('disabled');
						}
					}else{
						$('#joinButton').addClass('disabled');
					}
				}
			}
		}else {
			//사업자회원
			console.log("its company")
		}
	}
							
	//가입버튼 클릭시 미입력 필수사항 focus처리 + 약관 validation
	$scope.join = function() {
		if($('#joinButton').hasClass('disabled') || !$scope.idValid){
//			console.log($scope.idValid ? '아이디통과' : '아이디실패');	console.log($scope.passwdValid ? '비번통과' : '비번실패'); console.log($scope.nameValid ? '이름통과' : '이름실패'); 
//			console.log($scope.authNumValid ? '핸드폰통과' : '핸드폰실패'); console.log($scope.emailValid ? '이메일통과' : '이메일실패');  console.log($scope.addrValid ? '주소통과' : '주소실패');					 
//			console.log($scope.bidValid ? '응찰여부통과' : '응찰여부실패'); console.log($scope.countryValid ? '국가통과' : '국가실패'); console.log($scope.addrValidEn ? '외국주소통과' : '외국주소실패');
			alert("필수항목을 모두 입력해 주세요.");
			if($scope.isPerson()){
				if($scope.langType == 'ko'){
					if($scope.isSocial()){ 
						//내국소셜회원 필수 필드 : 이름/휴대폰번호/이메일/주소
						if(!$scope.nameValid) $("#cust_name").focus();
						else if(!$scope.authNumValid) $("#hp").focus();
						else if(!$scope.emailValid) $("#email").focus();
						else if(!$scope.addrValid) $("#addr_dtl").focus();
					}else{ 
						//내국개인회원 필수 필드 : 아이디/비밀번호/이름/휴대폰번호/이메일/주소
						if(!$scope.idValid) $("#login_id").focus();
						else if(!$scope.passwdValid) $("#passwd").focus(); 
						else if(!$scope.nameValid) $("#cust_name").focus();
						else if(!$scope.authNumValid) $("#hp").focus();
						else if(!$scope.emailValid) $("#email").focus();
						else if(!$scope.addrValid) $("#addr_dtl").focus();
					}
				}else if($scope.langType == 'en'){
					if($scope.isSocial()){ 
						//외국소셜회원 필수 필드 : 이름/이메일/국가/주소/입찰여부/신분증/증빙서류
						if(!$scope.nameValid) $("#cust_name").focus();
						else if(!$scope.emailValid) $("#email").focus();
						else if(!$scope.countryValid) $("#select_nation").focus();
						else if(!$scope.addrValidEn) $("#zipno").focus();
						else if(!$scope.bidValid) $("#bid").focus();
					}else{
						//외국개인회원 필수 필드 : 아이디/비밀번호/이름/이메일/국가/주소/입찰여부/신분증/증빙서류
						if(!$scope.idValid) $("#login_id").focus();
						else if(!$scope.passwdValid) $("#passwd").focus(); 
						else if(!$scope.nameValid) $("#cust_name").focus();
						else if(!$scope.emailValid) $("#email").focus();
						else if(!$scope.countryValid) $("#select_nation").focus();
						else if(!$scope.addrValidEn) $("#zipno").focus();
						else if(!$scope.bidValid) $("#bid").focus();
					}
				}
			}else {
				//사업자회원
				console.log("its company")
			}
			return;
		}else{
			if($scope.isPerson()){
				//국내/해외/개인/소셜회원 약관체크 
				if (!$scope.form_data.personOnlineAgree) {
					if ($scope.langType == 'ko') {
						alert("온라인 경매 약관에 동의 하셔야 됩니다.");
					} else {
						alert("Agree the Online Auction Terms.");
					}
					$("input[name=chk_per]")[3].focus();
					return;
				}else if (!$scope.form_data.personOfflineAgree) {
					if ($scope.langType == 'ko') {
						alert("오프라인 경매 약관에 동의 하셔야 됩니다.");
					} else {
						alert("Agree the Offline Auction Terms.");
					}
					$("input[name=chk_per]")[3].focus();
					return;
				}else if (!$scope.form_data.personAgree1) {
					if ($scope.langType == 'ko') {
						alert("개인정보 수집 및 이용에 동의 하셔야 됩니다.");
					} else {
						alert("Agree to collect and use personal information.");
					}
					$("input[name=chk_per]")[3].focus();
					return;
				}
			}else{
				//사업자 약관체크
				
			}
		}
		
		$scope.joinAction();
	}
	
	//회원가입
	$scope.joinAction = function() {
		let form = document.querySelector('#joinForm');
		var formData = new FormData(form);
		
		if($scope.langType == 'en'){
			formData.set('hp', '+' + $scope.nationMobile + ' ' + $scope.form_data.hp);
			formData.append('fore_bid_req_yn', $scope.form_data.fore_bid_req_yn);
		}else if($scope.langType == 'ko'){
			formData.set('addr', $scope.form_data.addr);
		}
		if($scope.isSocial()){
			formData.set('social_type', $scope.form_data.social_type);
		}
		if($scope.form_data.emp_no != undefined){
			formData.set('emp_no', $scope.form_data.emp_no);
		}else{
			formData.delete('emp_no');	
		}
		formData.append('cust_kind_cd', $scope.form_data.cust_kind_cd);
		formData.append('push_way_email', $scope.form_data.push_way_email != undefined ? $scope.form_data.push_way_email : false);
		formData.append('push_way_sms', $scope.form_data.push_way_sms != undefined ? $scope.form_data.push_way_sms : false);
		formData.append('push_way_phone', $scope.form_data.push_way_phone != undefined ? $scope.form_data.push_way_phone : false);
		formData.append('local_kind_cd', $scope.form_data.local_kind_cd);
		formData.append('nation_cd', $scope.form_data.nation_cd);
		formData.set('maketingAgree1', $scope.form_data.maketingAgree1 != undefined ? $scope.form_data.maketingAgree1 : false);
		
		// Display the key/value pairs
		for (var pair of formData.entries()) {
		    console.log(pair[0]+ ', ' + pair[1]); 
		}

		axios.post("/api/login/join" , formData, {
			headers: {
			  'Content-Type': 'multipart/form-data'
			}
		}).then(function(response) {
			var result = response.data;
			if(result.success){
				location.href = '/joinDone'
			}
		})
		.catch(function(error){
		    console.log(error);
		});
//		let data = $scope.form_data
//		axios.post('/api/login/join' , data)
//	        .then(function(response) {
//				var result = response.data;
//				if(result.success){
//					location.href = '/joinDone'
//				}
//	        })
//	        .catch(function(error){
//	        });
	}
});

