
app.value('locale', 'ko');


app.controller('onlinePayListCtl', function($scope, consts, common) {
	$scope.suc_yn = null;
	$scope.pay_sat_cd = null;

	$scope.init = function() {
		$api = "/api/mypage/saleList"
		common.callAPI($api, null, function(data, status) {
			$scope.saleList = data["data"]["saleList"];
			$scope.loadOnlinePayList(1);
		});
	}



	$scope.loadOnlinePayList = function($page, $searchType) {
		
/*		var searchMonth = document.getElementById('searchMonth');
		var searchKeyword = document.getElementById('searchKeyword');
		var searchStartDt = document.getElementById('searchStartDt');
		var searchEndDt = document.getElementById('searchEndDt');
*/
		$scope.pageRows = 100;
		$scope.currentPage = $page;
		$api = '/api/mypage/onlinePaies?page=' + $scope.currentPage + "&size=" + $scope.pageRows;
/*
		if ($searchType == 'searchMonth') {
			//검색 초기화
			searchKeyword.value = '';
			searchStartDt.value = '';
			searchEndDt.value = '';
			
			if (searchMonth.value) {
				$api += '&searchMonth=' + searchMonth.value;
			}
		} else if ($searchType == 'searchDetail') {
			//검색 초기화
			searchMonth.value = '';
			
			if (searchKeyword.value) {
				searchKeyword = encodeURIComponent(searchKeyword.value);
				$api += '&searchKeyword=' + searchKeyword;
			}
			if (searchStartDt.value) {
				$api += '&searchStartDt=' + searchStartDt.value;
			}
			if (searchEndDt.value) {
				$api += '&searchEndDt=' + searchEndDt.value;
			}
		}*/
		common.callAPI($api, null, function(data, status) {
			$scope.allCnt = data["data"]["payCount"]["ROW_CNT"] || 0;
			$scope.paidCnt = data["data"]["payCount"]["PAID_CNT"] || 0;
			$scope.payCnt = $scope.allCnt - $scope.paidCnt;
			$scope.payList = data["data"]["payList"];
			$scope.custInfo = data["data"]["customerInfo"];
			
			$scope.payListTemp = $scope.groupBy($scope.payList,'SALE_TITLE_KR');
			console.log($scope.payListTemp);
 
		});
	};

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