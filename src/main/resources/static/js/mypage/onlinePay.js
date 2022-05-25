
app.value('locale', 'ko');


app.controller('onlinePayListCtl', function($scope, consts, common) {
	$scope.suc_yn = null;
	$scope.pay_sat_cd = null;

	$scope.loadOnlinePayList = function($page) {
		$scope.currentPage = $page;
 		$page = $scope.currentPage;
 		
 		$size = 3;
		$api = '/api/mypage/onlinePaies?page=' + $scope.currentPage + "&size=" + $size;

		common.callAPI($api, null, function(data, status) {
			$scope.allCnt = data["data"]["payCount"]["ROW_CNT"] || 0;
			$scope.paidCnt = data["data"]["payCount"]["PAID_CNT"] || 0;
			$scope.payCnt = $scope.allCnt - $scope.paidCnt;
			$scope.custInfo = data["data"]["customerInfo"];
			$scope.payList = $scope.groupBy(data["data"]["payList"],'SALE_NO');
		});
	};

/*		$scope.loadOnlinePayList = function($page) {
				$scope.currentPage = $page;
		 		$page = $scope.currentPage;
		 		
		 		$size = 3;
				$api = '/api/mypage/onlinePaies?page=' + $scope.currentPage + "&size=" + $size;
		       
		        axios.get($api , null)
		        .then(function(response) {
		            const result = response.data;
		
		            let success = result.success;
		            if(!success){
		                alert(result.data.msg);
		            } else {
					$scope.allCnt = result["data"]["payCount"]["ROW_CNT"] || 0;
					$scope.paidCnt = result["data"]["payCount"]["PAID_CNT"] || 0;
					$scope.payCnt = $scope.allCnt - $scope.paidCnt;
					$scope.payList = result["data"]["payList"];
					$scope.custInfo = result["data"]["customerInfo"];
					$scope.totalCnt = result["data"]["payTotalCount"];
					$scope.payListTemp = $scope.groupBy($scope.payList,'SALE_NO');
					
					console.log($scope.allCnt);
					console.log($scope.paidCnt);
		            }
		        })
		        .catch(function(error){
		            console.log(error);
		        });
		}*/

	$scope.showPurchasePopup = function(lot_no, sale_no, bid_price, pay_price) {
		//모바일에서 결제막음 - blueerr
		if (getCookie("mobileFlag") == 'mobile') {
			alert('앱모바일 결제는 준비중입니다. PC 또는 모바일 브라우저에서 결제를 하시기 바랍니다.');
			return;
		}

		if (bid_price <= pay_price) {
			alert("일부납부 금액이 결제금액보다 큽니다");
			return;
		} else {
			self.location.href = '/customer/payPurchaseRequest?lot_no=' + lot_no + "&sale_no=" + sale_no, 'popup', 'width=720,height=750,toobar=0,resizable=yes,status=0,scrollbars=0';
			// 			window.open('/customer/payPurchaseRequest?lot_no=' + lot_no + "&sale_no=" + sale_no, 'popup','width=720,height=750,toobar=0,resizable=yes,status=0,scrollbars=0');
		}
	}

	$scope.showPurchasePopupTest = function(lot_no, sale_no, bid_price, pay_price) {
		//모바일에서 결제막음 - blueerr
		if (getCookie("mobileFlag") == 'mobile') {
			alert('앱모바일 결제는 준비중입니다. PC 또는 모바일 브라우저에서 결제를 하시기 바랍니다.');
			return;
		}

		if (bid_price <= pay_price) {
			alert("일부납부 금액이 결제금액보다 큽니다");
			return;
		} else {
			window.open('/customer/payPurchaseRequestTest?lot_no=' + lot_no + "&sale_no=" + sale_no, 'popup', 'width=720,height=750,toobar=0,resizable=yes,status=0,scrollbars=0');
		}
	}

	$scope.groupBy = function(xs, key) {
		  return xs.reduce(function(rv, x) {
		    (rv[x[key]] = rv[x[key]] || []).push(x);
		    return rv;
		  }, {});
		};
	
});