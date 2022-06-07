
app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["bw.paging", "ngDialog"]);

app.controller('liveBidListCtl', function($scope, consts, common) {

	$scope.loadLiveBidList = function($page) {
				$scope.currentPage = $page;
		 		$page = $scope.currentPage;
		 		
		 		$size = 5;
				$api = '/api/mypage/liveBids?page=' + $scope.currentPage + "&size=" + $size;
		       
		        axios.get($api , null)
		        .then(function(response) {
		            const result = response.data;
		
		            let success = result.success;
		            if(!success){
		                alert(result.data.msg);
		            } else {
					//$scope.liveBidList = result["data"]["list"];
					$scope.liveBidCnt = result["data"]["cnt"] || 0;
					
					$scope.liveBidList = Object.keys($scope.groupBy(result["data"]["list"],'SALE_NO')).map((key) => [Number(key), $scope.groupBy(result["data"]["list"],'SALE_NO')[key]]).sort((a, b) => b[0] - a[0]);
					console.log($scope.liveBidList);
					$scope.$apply();
		            }
		        })
		        .catch(function(error){
		            console.log(error);
		        });
		}
	

	$scope.liveBidHis = function(input) {
		  axios.get('/api/mypage/liveBidHistories/'+input.bid.SALE_NO+'/'+input.bid.LOT_NO , null)
		        .then(function(response) {
		            const result = response.data;
		
		            let success = result.success;
		            if(!success){
		                alert(result.data.msg);
		            } else {
					$scope.liveBidHisList = result["data"]["list"];
		            console.log($scope.liveBidHisList);
		            $scope.$apply();
		            }
		        })
		        .catch(function(error){
		            console.log(error);
		        })
		         .finally(function () {
			    document.getElementById('popup_auction_live_record-wrap').style.display="block";
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
	
});