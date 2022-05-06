
app.value('locale', 'ko');

//dialog
app.requires.push.apply(app.requires, ["checklist-model", "ngDialog"])

app.controller('academyListCtl', function($scope, consts, common, ngDialog) {
	$scope.pageRows = 10;
	$scope.currentPage = 1;
	$scope.academyCnt = 0;

	$scope.loadAcademyList = function($page) {
		common.callAPI("/api/mypage/academies?page=" + $scope.currentPage + "&size=" + $scope.pageRows, null, $s);
	}

	var $s = function(data, status) {
		$scope.academyList = data["data"]["list"];
		$scope.academyCount = data["data"]["cnt"];
	};

	$scope.academyPayHis = function($input) {
		console.log($input);
		$input.parent.modal = ngDialog.open({
			template: '/mypage/academyPayPopup',
			controller: 'academyPayHisCtl',
			closeByDocument: false,
			showClose: false,
			animationEndSupport: false,
			resolve: { input: function() { return $input; } }
		});
	}
});


comma = function(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}