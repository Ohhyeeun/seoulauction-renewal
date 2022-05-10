
app.value('locale', 'ko');
/*문의하기 목록*/
app.requires.push.apply(app.requires, ["bw.paging"]);
app.controller('inquiryListCtl', function($scope, consts, common) {
	
	$scope.pageRows = 3;
	$scope.currentPage = 1;

 	$scope.loadInquiryList = function($page){

 		$scope.currentPage = $page;
 		 	
 		$page = $scope.currentPage;
 		$size = 3;
 		
 		
 		 $api = "/api/mypage/inquiries?page="+$page+"&size="+$size;
 	   	/*common.callAPI($api , null , $scope.showInquiry); */
 	   	
        axios.get($api , null)
        .then(function(response) {
            const result = response.data;

            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
        	$scope.inquiryCnt = result.data.cnt;
			$scope.inquiryList =  result.data.list;
			$scope.$apply();
			console.log($scope.inquiryList);
            }
        })
        .catch(function(error){
            console.log(error);
        });
	};
});

