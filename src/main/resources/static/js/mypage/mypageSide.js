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
            	console.log(result.data);
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
	document.getElementById(className).classList.add('on');
});

	

