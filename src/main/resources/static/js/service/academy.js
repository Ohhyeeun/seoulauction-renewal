
app.value('locale', 'ko');
app.requires.push.apply(app.requires, ["bw.paging"]);
app.controller('academyNowListCtl', function($scope, consts, common ) {
	$scope.pageRows = 10; 
	$scope.reqRowCnt = 10;
	$scope.currentPage = 1;
	$scope.academyCnt = 0;
	$scope.db_now = null;
	
 	$scope.loadAcademyNowList = function($page){
 		$scope.currentPage = $page;
 		
 		$page = $scope.currentPage;
 		$size = 8;
 		
 		$api = "/api/service/academies/now?page="+$page+"&size="+$size;
 		
 		axios.get($api , null)
        .then(function(response) {
            const result = response.data;
            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
				$scope.academyList = result.data.list;
				$scope.academyCnt =result.data.cnt;
				$scope.db_now = result.data.list[0].DB_NOW;
				$scope.$apply();
            }
        })
        .catch(function(error){
            console.log(error);
        });
 	   
	}
 		
 	var $s = function(data, status) { 
 		$scope.academyCnt = data["tables"]["ACADEMY_LIST_NOW_CNT"]["rows"][0]["CNT"];
 		$scope.academyList = data["tables"]["ACADEMY_LIST"]["rows"];
 		$scope.academyListRow = data["tables"]["ACADEMY_LIST"]["rows"][0];
 		$scope.academyNewCnt = data["tables"]["ACADEMY_LIST_NOW_CNT"]["rows"][0];
 		
 		$scope.db_now = $scope.academyListRow.DB_NOW;
 		$scope.pageRows = parseInt($scope.reqRowCnt);
 		
	};
	
 	$scope.moreView = function(){
	    var showLeng = $("li[name=academyList]:visible").length;
	    showLeng += 4;
	    curShowLeng = showLeng;
	    $("li[name=academyList]:lt(" + showLeng + ")").show();
	}
	
	$scope.getAcademyImg = function(param){
		if(param == "artauction"){ // 대학생 아카데미
			return "academy-thum_student.jpg";
		}else if(param == "artbrunch"){ // CEO
			return "academy-thum_ceo.jpg";
		}else if(param == "artculture"){ //아트마켓
			return "academy-thum_market.jpg";
		}else if(param == "artisttalk"){ //작가론
			return "academy-thum_authorism.jpg";
		}else if(param == "culture"){ // 건축
			return "academy-thum_architecture.jpg";
		}else if(param == "lecture"){ // 특강
			return "academy-thum_lecture.jpg";
		}
	}
	
	
	$scope.getAcademyNm = function(param){
		if(param == "artauction"){ // 대학생 아카데미
			return "대학생 아카데미";
		}else if(param == "artbrunch"){ // CEO
			return "프라이빗";
		}else if(param == "artculture"){ //아트마켓
			return "아트마켓";
		}else if(param == "artisttalk"){ //작가론
			return "작가론";
		}else if(param == "culture"){ // 건축
			return "건축";
		}else if(param == "lecture"){ // 특강
			return "특강";
		}
	}
	
	$scope.getAcademyTitle = function(param){
		return JSON.parse(param)['ko'];
	}
	
});


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
    return requestParam.replace("#","");
}
    

app.controller('academyDetailCtl', function($scope, consts, common) {
	$scope.is_login = 'false';
	if(userNo != ''){
		$scope.is_login = 'true';	
	}
	let academyNo = getParameter("academyNo");
	let academyCd = getParameter("academyCd");
	$scope.loadAcademyDetail = function($page){
		axios.get("/api/service/academies/"+academyCd+"/"+academyNo)
        .then(function(response) {
            const result = response.data;
            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
				$scope.academyView = result.data;
				$scope.academyView.TITLE = JSON.parse(result.data.TITLE_JSON)['ko'];
				$scope.academyView.CONTENTS = JSON.parse(result.data.CONTENTS_JSON)['ko'];
				$scope.db_now = result.data.DB_NOW;
				$scope.$apply();
            }
        })
 	}
 		
 	var $s = function(data, status) { 
 		$scope.academyView = data["tables"]["ACADEMY_VIEW"]["rows"];
 		$scope.academyViewRow = data["tables"]["ACADEMY_VIEW"]["rows"][0];
 		$scope.academyNewCnt = data["tables"]["ACADEMY_LIST_NOW_CNT"]["rows"][0];
 		
 		$scope.db_now = $scope.academyViewRow.DB_NOW;
 		
	};
	
	$scope.getAcademyNm = function(param){
		if(param == "artauction"){ // 대학생 아카데미
			return "대학생 아카데미";
		}else if(param == "artbrunch"){ // CEO
			return "프라이빗";
		}else if(param == "artculture"){ //아트마켓
			return "아트마켓";
		}else if(param == "artisttalk"){ //작가론
			return "작가론";
		}else if(param == "culture"){ // 건축
			return "건축";
		}else if(param == "lecture"){ // 특강
			return "특강";
		}
	}
	
	$scope.goAcademyList = function(){
		location.href = '/service/academyList?academyCd=' + academyCd
	}
});


app.controller('academyListCtl', function($scope, consts, common) {
	$scope.pageRows = 10; 
	$scope.reqRowCnt = 10;
	$scope.currentPage = 1;
	$scope.academyCnt = 0;
	$scope.db_now = null;
	
	let academyCd = getParameter("academyCd");
	$scope.loadAcademyList = function($page){
		$scope.currentPage = $page;

 		$page = $scope.currentPage;
 		$size = 12;
		axios.get("/api/service/academies/"+academyCd + "?page="+$page+"&size="+$size)
        .then(function(response) {
            const result = response.data;
            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
				$scope.academyList = result.data.list;
				$scope.academyCnt =result.data.cnt;
				$scope.db_now = result.data.list[0].DB_NOW;
				$scope.$apply();
            }
        })

		if(academyCd == 'all'){
			$("#academy_category").val("1").prop("selected", true);
		}else if(academyCd == 'artculture'){
			$("#academy_category").val("2").prop("selected", true);
		}else if(academyCd == 'artisttalk'){
			$("#academy_category").val("3").prop("selected", true);
		}else if(academyCd == 'artbrunch'){
			$("#academy_category").val("4").prop("selected", true);
		}else if(academyCd == 'artauction'){
			$("#academy_category").val("5").prop("selected", true);
		}else if(academyCd == 'lecture'){
			$("#academy_category").val("6").prop("selected", true);
		}
 	}
 		
	$scope.getAcademyNm = function(param){
		if(param == "artauction"){ // 대학생 아카데미
			return "대학생 아카데미";
		}else if(param == "artbrunch"){ // CEO
			return "프라이빗";
		}else if(param == "artculture"){ //아트마켓
			return "아트마켓";
		}else if(param == "artisttalk"){ //작가론
			return "작가론";
		}else if(param == "culture"){ // 건축
			return "건축";
		}else if(param == "lecture"){ // 특강
			return "특강";
		}
	}
	
	$scope.getAcademyTitle = function(param){
		return JSON.parse(param)['ko'];
	}
	
	$scope.activeAcademyCd = function(param){
		if(param == academyCd)
			return "active";
		else
			return "";
	}
	
	$scope.goAcademyList = function(param){
		location.href = '/service/academyList?academyCd=' + param
	}
	
	$scope.goAcademyDetail = function(academy){
		var toDt = academy.TO_DT.substring(0,10);
		var readFlag = false;
		if(authorities == ""){
			if(toDt > $scope.db_now){ //미로그인 + 강의종료아님
				readFlag = true;
			}
		}else{
			if(authorities.indexOf('ROLE_EMPLOYEE_USER') > -1){ //직원회원
				readFlag = true;
			}else{ //일반회원
				if(toDt > $scope.db_now){ //일반회원 + 강의종료아님
					readFlag = true;
				}	
			}
		}
		
		if(readFlag){
			location.href = "/service/academyDetail?academyNo=" + academy.ACADEMY_NO + "&academyCd=" + academy.ACADEMY_CD
		}
	}
	
	$scope.getAcademyImg = function(param){
		if(param == "artauction"){ // 대학생 아카데미
			return "academy-thum_student.jpg";
		}else if(param == "artbrunch"){ // CEO
			return "academy-thum_ceo.jpg";
		}else if(param == "artculture"){ //아트마켓
			return "academy-thum_market.jpg";
		}else if(param == "artisttalk"){ //작가론
			return "academy-thum_authorism.jpg";
		}else if(param == "culture"){ // 건축
			return "academy-thum_architecture.jpg";
		}else if(param == "lecture"){ // 특강
			return "academy-thum_lecture.jpg";
		}
	}

	$scope.changeAcademyCate = function() {

		$scope.academy_category = $("#academy_category option:selected").val();

		if ($scope.academy_category == "1") { // 전체
			$scope.goAcademyList('all');
		} else if ($scope.academy_category == "2") { //아트마켓
			$scope.goAcademyList('artculture');
		} else if ($scope.academy_category == "3") { //작가론
			$scope.goAcademyList('artisttalk');
		} else if ($scope.academy_category == "4") { //프라이빗
			$scope.goAcademyList('artbrunch');
		} else if ($scope.academy_category == "5") { //대학생 아카데미
			$scope.goAcademyList('artauction');
		} else if ($scope.academy_category == "6") { //건축
			$scope.goAcademyList('lecture');
		}

	}


});



