
app.value('locale', 'ko');

//dialog
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"])
app.requires.push.apply(app.requires, ["bw.paging"]);
app.controller('academyListCtl', function($scope, consts, common, ngDialog) {
	
 var popup_marketing1 = $(".js-popup_myacademy_pay").trpLayerFixedPopup("#popup_myacademy_pay-wrap");
 
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
		$scope.academyPayDiscount = 0;
		$scope.academyPayTotal = comma(aca_pay_sum - dis_aca_pay);
		$scope.academyPayMethodCd =input.academy.PAY_METHOD_CD == 'card' ? '신용카드' :$scope.academyPayMethodCd =input.academy.PAY_METHOD_CD == 'vbank' ? '가상계좌' : '계좌이체';
		
		popup_marketing1.open(this); // or false
		popup_fixation("#popup_auction_live_record-wrap");
		popup_motion_open("#popup_myacademy_pay-wrap"); // mb 모션 
		
		$("body").on("click", "#popup_myacademy_pay-wrap .js-closepop, #popup_myacademy_pay-wrap .popup-dim, .confirmBtn", function($e) {
            $e.preventDefault();
            popup_marketing1.close();
            popup_motion_close("#popup_myacademy_pay-wrap");
        });
	}

});

	
comma = function(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}