
app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["bw.paging", "ngDialog"]);

app.controller('onlinePayListCtl', function($scope, consts, common) {
	$scope.suc_yn = null;
	$scope.pay_sat_cd = null;

	$scope.loadOnlinePayList = function($page) {
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
					$scope.custInfo = result["data"]["customerInfo"];
					$scope.totalCnt = result["data"]["payTotalCount"];
					$scope.payList = Object.keys($scope.groupBy(result["data"]["payList"],'SALE_NO')).map((key) => [Number(key), $scope.groupBy(result["data"]["payList"],'SALE_NO')[key]]).sort((a, b) => b[0] - a[0]);
					$scope.$apply();
					
					console.log($scope.totalCnt);
					console.log($scope.totalCnt);
		            }
		        })
		        .catch(function(error){
		            console.log(error);
		        });
		}

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
	
	$scope.comma = function(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	$scope.total = function(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	$scope.fee = function(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
});