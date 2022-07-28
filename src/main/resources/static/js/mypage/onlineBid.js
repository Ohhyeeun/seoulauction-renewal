
app.value('locale', document.documentElement.lang);
app.requires.push.apply(app.requires, ["bw.paging", "ngDialog"]);

var getParameter = function(param){
	var requestParam ="";
    var url = unescape(location.href);
    var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
    for(var i = 0 ; i < paramArr.length ; i++){
       var temp = paramArr[i].split("=");
       if(temp[0].toUpperCase() == param.toUpperCase()){
         requestParam = paramArr[i].split("=")[1];
         break;
       }
    }
    return requestParam;
}

app.controller('onlineBidListCtl', function($scope, consts, common) {

	var popup_marketing1 = $(".js-popup_auction_live_record").trpLayerFixedPopup("#popup_auction_live_record-wrap");

	$scope.loadonlineBidList = function($page) {
		/*페이징 param 존재할 경우(겸매상세에서 뒤로가기 눌렀을 경우)*/
		let page = getParameter("page");
		
		if(page){			
			var regex = /[^0-9]/g;
			var result = page.toString().replace(regex, "");	
			$page = Number(result);
			history.replaceState({}, null, location.pathname);
		}
		/*페이징 param 존재할 경우*/
		
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
					$scope.onlineBidList = Object.keys($scope.groupBy(result["data"]["list"], 'TO_DT')).map((key) => [Number(key), $scope.groupBy(result["data"]["list"], 'TO_DT')[key]]).sort((a, b) => b[0] - a[0]);
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


	$scope.goLotDetail= function(saleNo, lotNo) {
		history.pushState('', null, "/mypage/onlineBidList?page="+$scope.currentPage);
		//history.pushState('', null, "/mypage/inteLotList?page="+5);
		window.location.href="/auction/online/view/"+saleNo+"/"+lotNo
	}
	$scope.goSale= function(saleNo) {
		history.pushState('', null, "/mypage/onlineBidList?page="+$scope.currentPage);
		window.location.href = "/auction/list/"+saleNo
	}
	
});