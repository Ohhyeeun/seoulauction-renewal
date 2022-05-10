
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

app.controller('inquiryWriteCtl', function($scope, consts, common, inquiryService) {
	inquiryService.setScope($scope);
});
	

app.service("inquiryService", function($rootScope, common, locale) {
	this.setScope = function($scope) {
		$scope.hp1s = ["010", "011", "016", "017", "018", "019"];
		$scope.emails = ["naver.com", "nate.com", "gmail.com", "daum.net", "hanmail.net", "hotmail.com"];
		$scope.form_data = {};
		$scope.sell_data = {};
		$scope.init = function() {
			$api = "/api/mypage/categories";
			$d = { "grp_ids": ["bbs_inquiry_category"] };
	        axios.post($api , $d).then(function(response) {
	            const result = response.data;
	
	            let success = result.success;
	            if(!success){
	                alert(result.data.msg);
	            } else {
	        	$scope.inqCate = result.data.category;
				$scope.custInfo =  result.data.customerInfo;
				$scope.$apply();
	            }
	        })
	        .catch(function(error){
	            console.log(error);
	        });
		}


		$scope.changeCate1 = function() {
			var elements = document.getElementsByClassName('hide_row');
			
			$scope.form_data.cate2 ="";
			
			for (var i = 0; i < elements.length; i++) {
				if ($scope.form_data.cate1 == "sell" || $scope.form_data.cate1 == "chineseart") {
					elements[i].style.display = 'block';
				}
				else {
					elements[i].style.display = 'none';
				}
			}


			$scope.inqCate2 = [];
			for (i in $scope.inqCate) {
				if ($scope.inqCate[i].P_CD_ID == $scope.form_data.cate1) {
					$scope.inqCate2.push($scope.inqCate[i]);
				}
			}
		}

		$scope.checkValidData = function() {
			console.log($scope.form_data.cate1);
			if (!$scope.isValidString($scope.form_data.cate1)) {
				if (locale == "ko") {
					alert("카테고리(대분류)를 선택하세요.");
				} else {
					alert("Select a category(Major category).");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == 'payment' || $scope.form_data.cate1 == 'others' || $scope.form_data.cate1 == 'homepage') && !$scope.isValidString($scope.form_data.cate2) && $scope.form_data.cate2 == "") {
				if (locale == "ko") {
					alert("카테고리(중분류)를 선택하세요.");
				} else {
					alert("Select a category(subdivision).");
				}
				return false;
			}

			if (!$scope.isValidString($scope.form_data.title)) {
				if (locale == "ko") {
					alert("제목을 넣어주세요.");
				} else {
					alert("Please put a title.");
				}
				return false;
			}

			if (!$scope.isValidString(document.getElementById('contents').value)) {
				if (locale == "ko") {
					alert("내용을 넣어주세요.");
				} else {
					alert("Please put the contents.");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart") && !$scope.isValidString($scope.sell_data.artist_name)) {
				if (locale == "ko") {
					alert("작가명을 넣어주세요");
				} else {
					alert("Please put the image of the work.");
				}
				return false;
			}

			if ($scope.form_data.cate1 == 'sell' && !$scope.isValidString($scope.sell_data.work_size)) {
				if (locale == "ko") {
					alert("작품 크기를 넣어주세요.");
				} else {
					alert("Please put the size of the artwork.");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart") && !$scope.isValidString($scope.sell_data.possession_details)) {
				if (locale == "ko") {
					alert("소장 경위를 입력해주세요.");
				} else {
					alert("Please enter the reason of ownership.");
				}
				return false;
			}


			//첨부파일 체크
			if (document.getElementById("file").files.length > 0) {
				files = document.getElementById("file").files
		        let maxSize  = 10 * 1024 * 1024 
				
				for(file of files){	
					console.log(file);
					//첨부파일 용량체크				
					if(file.size > maxSize){
						alert("파일 사이즈는 최대 10MB입니다.");		
						return false;				
					}
					
					var filename = file.name;
					var lastDot = filename.lastIndexOf('.');
					var fileExt = filename.substring(lastDot+1, filename.length).toLowerCase();
					var extArray = ["jpg", "jpeg", "png", "gif", "pdf", "zip", "alz"];

					//파일 확장자 체크
					if(extArray.indexOf(fileExt) == -1){
						alert("확장자(jpg, jpeg, png, gif, pdf, zip, alz)를 확인해주세요.");	
						return false;		
					}					
				}
				
				if(files.length > 10){
						alert("최대 10개의 파일 업로드 가능합니다. ");			
						return false;			
				}
				
			} else {
				if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart")) {
					if (locale == "ko") {
						alert("작품 이미지를 넣어주세요.");
					} else {
						alert("Please put the image of the work.");
					}
					return false;
				}
			}
			return true;
		}

		$scope.email_yn = false;
		$scope.sms_yn = false;

		$scope.cancel = function() {
			document.location.href = "/mypage/inquiryList";
		}

		$scope.saveForm = function() {
			if (!$scope.isValidString($scope.form_data.cate1) && !$scope.isValidString($scope.form_data.cate2)) {
				if (locale == "ko") {
					alert("카테고리를 선택하세요.");
				} else {
					alert("Select a category.");
				}
				return false;
			}

			document.getElementById("cate_cd").value = $scope.isValidString($scope.form_data.cate2) ? $scope.form_data.cate2 : $scope.form_data.cate1;

			for (i in $scope.inqCate) {
				if ($scope.inqCate[i].CD_ID == document.getElementById("cate_cd").value) {
					document.getElementById("emp_no").value = $scope.inqCate[i].CD_VAL;
				}
			}

			if ($scope.form_data.cate1 == "sell" || $scope.form_data.cate1 == "chineseart") {

				document.getElementById("tmp_work_name").append($scope.sell_data.work_name);
				document.getElementById("tmp_artist_name").append($scope.sell_data.artist_name);
				document.getElementById("tmp_work_material").append($scope.sell_data.work_material);

				var category = "";
				if ($scope.isValidString($scope.sell_data.work_category1)) {
					category = $scope.sell_data.work_category1;
					if ($scope.isValidString($scope.sell_data.work_category2)) {
						category += " < " + $scope.sell_data.work_category2;
						if ($scope.isValidString($scope.sell_data.work_category3)) {
							category += " < " + $scope.sell_data.work_category3;
						}
					}
				}
				document.getElementById("tmp_work_category").append(category);
				document.getElementById("tmp_work_estate").append($scope.sell_data.work_estate);
				document.getElementById("tmp_hope_price").append($scope.sell_data.hope_price);
				document.getElementById("tmp_artist_desc").append($scope.sell_data.artist_desc);
				document.getElementById("tmp_work_desc").append($scope.sell_data.work_desc);
				document.getElementById("tmp_possession_details").append($scope.sell_data.possession_details);
				document.getElementById("tmp_work_size").append($scope.sell_data.work_size);

				document.getElementById("contents").value = $scope.form_data.content + "\n\n" + document.getElementById("sell_form").innerHTML;
			}
			else {
				console.log($scope.form_data.content);
				document.getElementById("contents").value = $scope.form_data.content;
			}


			if ($scope.checkValidData()) {
				let form = document.querySelector('#frmInquiry');
				var formData = new FormData(form);
				
				axios.post("/api/mypage/inquiry" , formData, {
				  headers: {
				    'Content-Type': 'multipart/form-data'
				  }
				}).then(function(response) {
		            const result = response.data;
		
		            let success = result.success;
		            if(!success){
		                alert(result.data.msg);
		            } else {
		        			if ($scope.locale == 'ko') {
								alert("등록되었습니다.");
							} else {
								alert("Registered.");
							}
							document.location.href = "/mypage/inquiryList";
		            }
		        })
		        .catch(function(error){
		            console.log(error);
		        });
	        /*
				common.callFileAPI("/api/mypage/inquiry", formData,
					function(data, status) {
						console.log("====>" + data);
						if (data['success']) {
							if ($scope.locale == 'ko') {
								alert("등록되었습니다.");
							} else {
								alert("Registered.");
							}
							document.location.href = "/mypage/inquiryList";
						} else {
							if ($scope.locale == 'ko') {
								alert("실패하셨습니다.\n다시 시도해주세요.");
							} else {
								alert("You failed.\nPlease try again.");
							}
						}
					},
					function(data, status, headers, config) {
						if ($scope.locale == 'ko') {
							alert("실패하셨습니다.\n다시 시도해주세요.");
						} else {
							alert("You failed.\nPlease try again.");
						}
					}
				);
				*/
			}
		}


		$scope.sell_categories1 = ["근현대", "고미술", "기타"];
		$scope.sell_categories1_1 = ["국내", "국외"];
		$scope.sell_categories1_1_1 = ["회화", "조각", "사진", "멀티플", "공예품", "기타"];
		$scope.sell_categories1_2 = ["회화", "서예", "도자기-청자", "도자기-백자", "도자기-분청", "목기", "공예품", "기타"];
		$scope.sell_categories1_3 = ["시계", "보석/장신구", "와인", "서적", "인형/장난감/모형", "포스터", "스포츠수집품", "가구/디자인소품", "부동산", "자동차", "근현대사자료", "기타"];

		$scope.changeSellCate1 = function() {
			document.getElementById("work_category2").style.display = "none";
			document.getElementById("work_category3").style.display = "none";
			$scope.sell_data.work_category2 = "";
			$scope.sell_data.work_category3 = "";
			
			$scope.sell_categories2 = [];
			$scope.sell_categories3 = [];

			if ($scope.sell_data.work_category1 == "근현대") {
				$scope.sell_categories2 = $scope.sell_categories1_1;
				document.getElementById("work_category2").style.display = "block";
			}
			else if ($scope.sell_data.work_category1 == "고미술") {
				$scope.sell_categories2 = $scope.sell_categories1_2;
				document.getElementById("work_category2").style.display = "block";
			}
			else if ($scope.sell_data.work_category1 == "기타") {
				$scope.sell_categories2 = $scope.sell_categories1_3;
				document.getElementById("work_category2").style.display = "block";
			}
		}

		$scope.changeSellCate2 = function() {
			document.getElementById("work_category3").style.display = "none";
			$scope.sell_data.work_category3 = "";
			$scope.sell_categories3 = [];

			if ($scope.sell_data.work_category1 == "근현대") {
				$scope.sell_categories3 = $scope.sell_categories1_1_1;
				document.getElementById("work_category3").style.display = "block";
			}
		}
	}
});
	