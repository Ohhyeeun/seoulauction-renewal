app.directive('opacity', opacity);
function opacity($timeout) {
    return {
        link: function (scope, element, attrs) {
            var value = attrs.opacity;
            $timeout(function () {
                element[0].style.opacity = value;
            },100);
        }
    }
}
app.value('locale', document.documentElement.lang);
app.requires.push.apply(app.requires, ["bw.paging", "ngDialog"]);

app.controller('InteListCtl', function($scope, common, ngDialog) {
	$scope.loadInteLotList = function($page) {
		$scope.currentPage = $page;
		$page = $scope.currentPage;
		$size = 5;
		$api = "/api/mypage/inteLots?page=" + $page + "&size=" + $size
		if ($scope.saleKind) {
			$api += "&sale_kind=" + $scope.saleKind;
		}

		axios.get($api, null)
			.then(function(response) {
				const result = response.data;

				let success = result.success;
				if (!success) {
					alert(result.data.msg);
				} else {
					$scope.inteLotCnt = result.data.cnt;
					$scope.inteLotList = Object.keys($scope.groupBy(result.data.list, 'TO_DT')).map((key) => [Number(key), $scope.groupBy(result.data.list, 'TO_DT')[key]]).sort((a, b) => b[0] - a[0]);
					
					console.log($scope.inteLotList);
					$scope.$apply();
				}
			})
			.catch(function(error) {
				console.log(error);
			});

	}


	/*	$scope.inteSave = function($input) {
			var $d = { "sale_no": $input.sale_no, "lot_no": $input.lot_no }
			common.callActionSet('', $d, function(data, status) {
				if (data["data"].success) {
					if ($scope.locale == 'ko') {
						alert("관심작품 추가가 완료되었습니다.\n추가된 관심작품은 ACCOUNT페이지에서 확인하실 수 있습니다.");
						window.location.reload(true);
					} else {
						alert("A favorate work has been added.\nYou can find your favorite works on your account page.");
						window.location.reload(true);
					}
					return true;
				}
			})
	
		}*/

	$scope.inteDel = function(sale_no, lot_no) {
		console.log(sale_no);
		console.log(lot_no);

		var $d = { "sale_no": sale_no, "lot_no": lot_no };

		axios.post("/api/mypage/inteLotDelete", $d)
			.then(function(response) {
				const result = response.data;

				let success = result.success;
				if (!success) {
					alert(result.data.msg);
				} else {
					$scope.loadInteLotList($scope.currentPage);
				}
			})
			.catch(function(error) {
				console.log(error);
			});

	}


	$scope.tabClick = function(saleKind) {
		$scope.saleKind = saleKind;
		$scope.loadInteLotList(1);
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

	$scope.goLotDetail= function(saleKind, saleNo, lotNo) {
		if(saleKind !='online' && saleKind !='online_zb'){
			window.location.href="/auction/live/view/"+saleNo+"/"+lotNo
		} else {
			window.location.href="/auction/online/view/"+saleNo+"/"+lotNo
		}
	}

});



