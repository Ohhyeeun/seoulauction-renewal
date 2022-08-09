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

app.controller('InteListCtl', function($scope, common, ngDialog) {
	$scope.loadInteLotList = function($page) {
		
		
		/*페이징 param 존재할 경우(겸매상세에서 뒤로가기 눌렀을 경우)*/
		let page = getParameter("page");
		let saleKind = getParameter("saleKind");
		
		if(page){
			if(saleKind){
				$scope.saleKind = saleKind.toString().replace('#','')
				$('#taball').removeClass( 'active' );
				$('#tab'+$scope.saleKind).addClass( 'active' );
			}
			
			var regex = /[^0-9]/g;
			var result = page.toString().replace(regex, "");	
			$page = Number(result);
			history.replaceState({}, null, location.pathname);
		}
		/*페이징 param 존재할 경우*/
		
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

	var deleteList = [];
	
	$scope.inteFavorite = function(sale_no, lot_no) {
		let page = $scope.currentPage;
		let $count = 0 ;
		let $d = { "sale_no": sale_no, "lot_no": lot_no };
		deleteList.forEach(function(id,i) {
			if(id == sale_no+'_'+lot_no){
				$count += 1;
			}
		});
		if($count > 0){
			$('#heart_'+sale_no+'_'+lot_no).addClass( 'on' );
			//관심상품 재등록
			axios.post("/api/mypage/inteLotInsert", $d)
			.then(function(response) {
				const result = response.data;

				let success = result.success;
				
				deleteList.pop(sale_no+'_'+lot_no);
				if (!success) {
					alert(result.data.msg);
				}
				
			})
			.catch(function(error) {
				console.log(error);
			});
		} else {
			deleteList.push(sale_no+'_'+lot_no);
			/*마지막 LOT일 경우 삭제 시, 현재페이지 -1 페이지로 이동*/
			if($scope.inteLotList.length == 1 && $scope.inteLotList[0][1].length == 1){
					page = Number($scope.currentPage)-1;
					console.log(page);
			}
			
			axios.post("/api/mypage/inteLotDelete", $d)
			.then(function(response) {
				$('#heart_'+sale_no+'_'+lot_no).removeClass( 'on' );
				
				const result = response.data;

				let success = result.success;
				if (!success) {
					alert(result.data.msg);
				}
			})
			.catch(function(error) {
				console.log(error);
			});
		}
		
		let saleKind = $scope.saleKind ? $scope.saleKind : 'all';
		history.pushState('', null, "/mypage/inteLotList?page="+page+"&saleKind="+saleKind);
	}
/*	$scope.inteDel = function(sale_no, lot_no) {

		var $d = { "sale_no": sale_no, "lot_no": lot_no };

		axios.post("/api/mypage/inteLotDelete", $d)
			.then(function(response) {
				const result = response.data;

				let success = result.success;
				if (!success) {
					alert(result.data.msg);
				}
			})
			.catch(function(error) {
				console.log(error);
			});

	}*/


	$scope.tabClick = function(saleKind) {
		//탭 클릭 시, pathname 초기화
		history.replaceState({}, null, location.pathname);
		
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
		let saleKindParam =  $scope.saleKind ? $scope.saleKind : 'all'; 
		history.pushState('', null, "/mypage/inteLotList?page="+$scope.currentPage+"&saleKind="+saleKindParam);
		//history.pushState('', null, "/mypage/inteLotList?page="+5);
		if(saleKind !='online' && saleKind !='online_zb'){
			window.location.href="/auction/live/view/"+saleNo+"/"+lotNo
		} else {
			window.location.href="/auction/online/view/"+saleNo+"/"+lotNo
		}
	}


		$scope.goSale= function(saleKind, saleNo) {
		let saleKindParam =  $scope.saleKind ? $scope.saleKind : 'all'; 
		history.pushState('', null, "/mypage/inteLotList?page="+$scope.currentPage+"&saleKind="+saleKindParam);
		if(saleKind !='online' && saleKind !='online_zb'){
			window.location.href = "/auction/live/list/"+saleNo
		} else {
			window.location.href = "/auction/list/"+saleNo
		}
	}
	
});


