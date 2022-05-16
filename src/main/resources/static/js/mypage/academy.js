
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
	
	$scope.academyPayHis = function($input) {
		console.log($input);
		$input.parent.modal = ngDialog.open({
			template: '/mypage/academyPayPopup',
			controller: 'academyPayHisCtl',
			closeByDocument: false,
			showClose: false,
			animationEndSupport: false,
			resolve: { input: function() { return $input; } }
		});
	}
});


app.controller('academyPayHisCtl', function($scope, consts, input, common) {	
	$scope.parent = input.parent;

	$scope.close = function(modal){
		$scope.parent.modal.close();
	}

	var aca_pay_sum = input.academy.ACADEMY_PAY;
	var dis_aca_pay = parseInt(aca_pay_sum) * 0.05;

	$scope.academyPay = comma(input.academy.ACADEMY_PAY);
	$scope.academyPayDiscount = comma(dis_aca_pay);
	$scope.academyPayTotal = comma(aca_pay_sum - dis_aca_pay);


	/*		 $d = {"academy_no" : input.academy.ACADEMY_NO}
			common.callAPI('/api/mypage/academyPayInfo', $d, function(data, status){
				console.log(data);
			}); */

});
	
comma = function(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}