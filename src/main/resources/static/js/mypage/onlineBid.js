
app.value('locale', document.documentElement.lang);
app.requires.push.apply(app.requires, ["bw.paging", "ngDialog"]);

app.controller('onlineBidListCtl', function($scope, consts, common) {

	var popup_marketing1 = $(".js-popup_auction_live_record").trpLayerFixedPopup("#popup_auction_live_record-wrap");

	$scope.loadonlineBidList = function($page) {
		$scope.currentPage = $page;
		$page = $scope.currentPage;

		$size = 5;
		$api = '/api/mypage/onlineBids?page=' + $scope.currentPage + "&size=" + $size;

		axios.get($api, null)
			.then(function(response) {
				const result = response.data;

				let success = result.success;
				if (!success) {
					alert(result.data.msg);
				} else {
					//$scope.onlineBidList = result["data"]["list"];
					$scope.onlineBidCnt = result["data"]["cnt"] || 0;
					$scope.onlineBidList = Object.keys($scope.groupBy(result["data"]["list"], 'SALE_NO')).map((key) => [Number(key), $scope.groupBy(result["data"]["list"], 'SALE_NO')[key]]).sort((a, b) => b[0] - a[0]);
					var test = [];
					$scope.onlineBidList.map((key) => {
					var count =0;
					key[1].map((key2 => {
						if (key2.CLOSE_YN == 'N') {
							count += 1;
						}
					}
					))
					if(count > 0 ){
						key.push({'SALE_CLOSE_YN':'N'});
					} else {
						key.push({'SALE_CLOSE_YN':'Y'});
					}
					});
					
					console.log($scope.onlineBidList);
					console.log($scope.onlineBidList);
					/*key.map((arrayKey)=> console.log('?' + arrayKey[1]))*/
					$scope.$apply();
				}
			})
			.catch(function(error) {
				console.log(error);
			});
	}


	$scope.onlineBidHis = function(input) {
		axios.get('/api/mypage/onlineBidHistories/' + input.bid.SALE_NO + '/' + input.bid.LOT_NO, null)
			.then(function(response) {
				const result = response.data;

				let success = result.success;
				if (!success) {
					alert(result.data.msg);
				} else {
					$scope.onlineBidHisList = result["data"]["list"];
					console.log($scope.onlineBidHisList);
					$scope.$apply();

					popup_marketing1.open(this); // or false
					popup_fixation("#popup_auction_live_record-wrap");

					$("body").on("click", "#popup_auction_live_record-wrap .js-closepop, #popup_auction_live_record-wrap .popup-dim", function($e) {
						$e.preventDefault();
						popup_marketing1.close();
						popup_motion_close("#popup_auction_live_record-wrap");
					});
				}
			})
			.catch(function(error) {
				console.log(error);
			})
			.finally(function() {
				document.getElementById('popup_auction_live_record-wrap').style.display = "block";
			});


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

	$scope.bidGroup = function(bid) {
		return JSON.parse(bid);
	}


});