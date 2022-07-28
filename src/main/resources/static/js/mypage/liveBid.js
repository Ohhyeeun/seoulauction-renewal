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

app.controller('liveBidListCtl', function($scope, consts, common) {

	var popup_marketing1 = $(".js-popup_auction_live_record").trpLayerFixedPopup("#popup_auction_live_record-wrap");
	var popup_offline_payment = $(".js-popup_offline_payment").trpLayerFixedPopup("#popup_offline_payment-wrap");
	
	$scope.loadLiveBidList = function($page) {
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
		         .finally(function () {
			    document.getElementById('popup_auction_live_record-wrap').style.display="block";
			  });
					        
		
	}
	
	$scope.liveBidHammer = function(input) {
		  axios.get('/api/mypage/liveBidHammers/'+input.bid.SALE_NO, null)
		        .then(function(response) {
		            const result = response.data;
		
		            let success = result.success;
		            if(!success){
		                alert(result.data.msg);
		            } else {
					$scope.liveBidHisHammerList = result["data"]["list"];
					$scope.liveBidHisHammerCnt = result["data"]["cnt"]["tatal_count"];
					$scope.liveBidHisHammerTotalFee = result["data"]["cnt"]["sum_fee"];
					$scope.liveBidHisHammerTotalBidPrice = result["data"]["cnt"]["sum_bid_price"];
					$scope.liveBidHisHammerTotalPayPrice = result["data"]["cnt"]["sum_total_price"];
		            console.log($scope.liveBidHisHammerList);
		            $scope.$apply();
		            
		            popup_offline_payment.open(this); // or false
					popup_fixation("#popup_offline_payment-wrap");
		            
		            $("body").on("click", "#popup_offline_payment-wrap .js-closepop, #popup_offline_payment-wrap .popup-dim", function($e) {
		                $e.preventDefault();
		                popup_offline_payment.close();
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
	
	$scope.goSale= function(saleNo) {
		history.pushState('', null, "/mypage/liveBidList?page="+$scope.currentPage);
		window.location.href = "/auction/list/"+saleNo
	}


	$scope.goLotDetail= function(saleNo, lotNo) {
		history.pushState('', null, "/mypage/liveBidList?page="+$scope.currentPage);
		//history.pushState('', null, "/mypage/inteLotList?page="+5);
		window.location.href="/auction/live/view/"+saleNo+"/"+lotNo
	}

	
});