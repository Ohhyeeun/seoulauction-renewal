app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["bw.paging", "ngDialog"]);



app.controller('liveBidReqListCtl', function($scope, consts, common) {

	var popup_marketing1 = $(".js-popup_auction_live_record").trpLayerFixedPopup("#popup_auction_live_record-wrap");
	
	$scope.loadLiveBidReqList = function($page) {
				$scope.currentPage = $page;
		 		$page = $scope.currentPage;
		 		
		 		$size = 5;
				$api = '/api/mypage/liveBidReqs?page=' + $scope.currentPage + "&size=" + $size;
		       
		        axios.get($api , null)
		        .then(function(response) {
		            const result = response.data;
		
		            let success = result.success;
		            if(!success){
		                alert(result.data.msg);
		            } else {
					//$scope.liveBidReqList = result["data"]["list"];
					$scope.liveBidReqCnt = result["data"]["cnt"] || 0;
					
					$scope.liveBidReqList = Object.keys($scope.groupBy(result["data"]["list"],'SALE_NO')).map((key) => [Number(key), $scope.groupBy(result["data"]["list"],'SALE_NO')[key]]).sort((a, b) => b[0] - a[0]);
					$scope.$apply();					            
		            }
		        })
		        .catch(function(error){
		            console.log(error);
		        });
		}
	

	$scope.liveBidReqHis = function(input) {
		  axios.get('/api/mypage/liveBidReqHistories/'+input.bidReq.SALE_NO+'/'+input.bidReq.LOT_NO , null)
		        .then(function(response) {
		            const result = response.data;
		
		            let success = result.success;
		            if(!success){
		                alert(result.data.msg);
		            } else {
					$scope.liveBidReqHisList = result["data"]["list"];
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
		        .catch(function(error){
		            console.log(error);
		        })       
		
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
	
});

