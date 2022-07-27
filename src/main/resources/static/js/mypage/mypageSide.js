app.value('locale', document.documentElement.lang);
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"]);
app.controller('myPageCtl', function($scope, consts, common, ngDialog) {	
	$scope.showRegularPayPopup = function(){
	//모바일에서 결제막음 - blueerr
	if(getCookie("mobileFlag") == 'mobile'){
		alert('앱모바일 결제는 준비중입니다. PC 또는 모바일 브라우저에서 결제를 하시기 바랍니다.');
		return;
	}
	window.open('/customer/TermCheckPop?locale='+$scope.locale,'popup','width=720,height=750,toobar=0,resizable=yes,status=0,scrollbars=0,left=500,top=100');
//	window.open('/customer/payRegularRequest','popup','width=720,height=750,toobar=0,resizable=yes,status=0,scrollbars=0');
	}
	
	$scope.loadMemberInfo = function(){
	 axios.get('/api/mypage/member' , null)
        .then(function(response) {
            const result = response.data;
            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
            	$scope.userRole = result.data.USER_ROLE;
            	$scope.validDate = result.data.VALID_DATE;
            	$scope.$apply();        		
            } 
        })
        .catch(function(error){
            console.log(error);
        });
	}
	
	var popup_marketing1 = $(".js-popup_memlv2_record").trpLayerFixedPopup("#popup_memlv2_record-wrap");
    var popup_tooltip = $(".js-popup_tooltip").trpLayerFixedPopup("#popup_tooltip-wrap");
    
		$scope.showMemHisPopup = function(){
        popup_marketing1.open(this); // or false   
        popup_fixation("#popup_memlv2_record-wrap"); // pc 스크롤
        popup_motion_open("#popup_memlv2_record-wrap"); // mb 모션 
        
        $("body").on("click", "#popup_memlv2_record-wrap .js-closepop, #popup_memlv2_record-wrap .popup-dim", function($e) {
        $e.preventDefault();
        popup_marketing1.close();
        popup_motion_close("#popup_memlv2_record-wrap");
   		 });
	}
	
	$scope.showTooltip = function(){
	   	popup_tooltip.open(this); // or false   
	    popup_fixation("#popup_tooltip-wrap"); // pc 스크롤
	    popup_motion_open("#popup_tooltip-wrap"); // mb 모션 
        
		$("body").on("click", "#popup_tooltip-wrap .js-closepop, #popup_tooltip-wrap .popup-dim", function($e) {
		    $e.preventDefault();
		    popup_tooltip.close();
		    popup_motion_close("#popup_tooltip-wrap");
		});
	}
});

app.controller('myPageCtlPopup', function($scope, consts, common, ngDialog) {
	$scope.loadMemberPayList = function(){
	 axios.get('/api/mypage/memberHistories' , null)
        .then(function(response) {
            const result = response.data;
            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
            	$scope.custPayList = result.data;
            	$scope.custPayCnt = result.data.length;
            	$scope.$apply();        		
            } 
        })
        .catch(function(error){
            console.log(error);
        });
	}
});


window.addEventListener('load', function () {
	var currentUrl = window.location.href;
	var addClassName;
	
	//div css로 id값 가져와서 넣기
	var className = document.getElementById('container').classList[0];
	if(className){
	document.getElementById(className).classList.add('on');
	}
});

	

