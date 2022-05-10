
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
            }
        })
        .catch(function(error){
            console.log(error);
        });
	};
});

/*문의하기 상세*/
app.controller("inquiryViewCtl", function($scope, consts, common) {
	
	$scope.init = function(){
		let writeNo = getParameter("writeNo");
		console.log(writeNo);
		axios.get("/api/mypage/inquiries/"+writeNo, null)
        .then(function(response) {
            const result = response.data;

            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
        	$scope.inquiry = result.data.inquiryInfo;
			$scope.replyList =  result.data.inquiryReply;
			$scope.fileList =  result.data.inquiryFileList;
			$scope.$apply();
            }
        })
        .catch(function(error){
            console.log(error);
        });
	};
	
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
});
