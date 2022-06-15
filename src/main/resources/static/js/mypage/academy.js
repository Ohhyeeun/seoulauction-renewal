
app.value('locale', 'ko');

//dialog
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"])
app.requires.push.apply(app.requires, ["bw.paging"]);
app.controller('academyListCtl', function($scope, consts, common, ngDialog) {
	

	$scope.loadAcademyList = function($page) {
		$scope.currentPage = $page;
 		 	
 		$page = $scope.currentPage;
 		$size = 10;
 		
 		
 		 $api = "/api/mypage/academies?page="+$page+"&size="+$size;
 	   	/*common.callAPI($api , null , $scope.showInquiry); */
 	   	
        axios.get($api , null)
        .then(function(response) {
            const result = response.data;

            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
			$scope.academyList = result.data.list;
			$scope.academyCnt =result.data.cnt;
		
			$scope.$apply();
            }
        })
        .catch(function(error){
            console.log(error);
        });
 		
	}
	
	$scope.academyPayHis = function(input) {
		
		var aca_pay_sum = input.academy.ACADEMY_PAY;
		//var dis_aca_pay = parseInt(aca_pay_sum) * 0.05;
		var dis_aca_pay = 0;
	
		$scope.academyPay = comma(input.academy.ACADEMY_PAY);
		//$scope.academyPayDiscount = comma(dis_aca_pay);
		$scope.academyPayDiscount = 0;
		$scope.academyPayTotal = comma(aca_pay_sum - dis_aca_pay);
		$scope.academyPayMethodCd =input.academy.PAY_METHOD_CD == 'card' ? '신용카드' : '가상계좌';
		
		document.getElementById('popup_myacademy_pay-wrap').style.display="block";
	}
	
	$scope.receiptPopup = function(input) {
		var status = "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540"; 
        var url = "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+input.pay.PG_TRANS_ID+"&type="+input.type; 
        //type  값  세팅  ::  매출전표: 0,  현금영수증: 1 
        
        window.open(url,"popupIssue",status); 
	}
	
});

	
comma = function(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}