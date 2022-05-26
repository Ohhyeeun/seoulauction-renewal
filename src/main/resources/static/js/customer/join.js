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
            
app.controller('joinFormCtl', function($scope, consts, common, ngDialog) {
	$scope.type = "";
	$scope.socialType = "";
	$scope.langType = "";
	$scope.find_word = "";
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
	        return requestParam;
	    }
	}
	
	$scope.isPerson = function() {
		return $scope.type == 'person';
	}
	
	$scope.isSocial = function() {
		return $scope.type == 'social';
	}
	
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
		
	$scope.init = function(){
		var request = new Request();
		$scope.type = request.getParameter("type");
		$scope.socialType = request.getParameter("socialType");
		$scope.type = $scope.socialType != '' ? 'social' : $scope.type;
		$scope.langType = document.documentElement.lang;
		$scope.form_data = {};
		
		if($scope.isSocial()){
			$scope.form_data = {};
			$scope.form_data.loginId = loginId;
			$scope.form_data.cust_name = name;
			$scope.form_data.hp = mobile;
			$scope.form_data.email = email;
			$scope.form_data.social_login_id = socialLoginId;
			$scope.form_data.social_email = socialEmail;
		}
		
		console.log($scope.type)
		console.log($scope.socialType)
		console.log($scope.form_data)
	}	
	
	//주소검색 팝업호출
	$scope.addressSearch = function(){
		var address_search1 = $(".js-address_search1").trpLayerFixedPopup("#address_search1-wrap")
        address_search1.open(this); // or false   
        popup_fixation("#address_search1-wrap");
	}
	
	//주소검색
	$scope.findAddrNewForm = function(){
		let data = {};
		console.log($scope.find_word)
        data['find_word'] = $scope.find_word;
        axios.post('/api/mypage/findAddr' , data)
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
	
	$scope.setHomeAddr = function(addr) {
		console.log("test")
		$scope.form_data.zipno = addr.postcd;
		$scope.form_data.addr = addr.address;
		address_search1.close();
		common.setFocus("addr_dtl");
	};
});

