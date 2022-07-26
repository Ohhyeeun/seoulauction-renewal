
var page = document.referrer;
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
/*문의하기 목록*/
app.requires.push.apply(app.requires, ["bw.paging"]);

app.controller('inquiryListCtl', function($scope, consts, common) {
	$scope.pageRows = 10;

 	$scope.loadInquiryList = function($page){
		let page = getParameter("page");
		
 		$scope.currentPage = page ? page : getCookie('page') ? getCookie('page') : $page;
		console.log('page :' +  page);
		console.log('getCookie :' +  getCookie('page'));
		
		
		history.replaceState({}, null, location.pathname);
		setCookie('page', '', 0);

		console.log('??????');
		console.log($scope.currentPage);
		$page = $scope.currentPage;
 		$size = 10;
 		
 		$api = "/api/mypage/inquiries?page="+$page+"&size="+$size;
 	   	
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
		$scope.page = getParameter("page");
		let writeNo = getParameter("writeNo");
		
		/*페이징 넣기*/
		setCookie('page', $scope.page);
		history.replaceState({}, null, location.pathname);
		/*페이징 넣기*/
		
		axios.get("/api/mypage/inquiries/"+writeNo, null)
        .then(function(response) {
            const result = response.data;
            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
        	$scope.inquiry = result.data.inquiryInfo;
			$scope.reply =  result.data.inquiryReply;
			$scope.fileList =  result.data.inquiryFileList;
			$scope.$apply();
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
	console.log($rootScope);
	this.setScope = function($scope) {
		$scope.paramCate1 = getParameter("cate1");

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
				if(result.data.customerInfo.HP){
					$scope.custInfo.HP = result.data.customerInfo.HP.replaceAll('-','');
				}
				
				if($scope.paramCate1){
					$scope.form_data.cate1 = $scope.paramCate1;
					$scope.changeCate1()
				}
		
				$scope.$apply();
	            }
	        })
	        .catch(function(error){
	            console.log(error);
	        });
	        $("#inqCate2").hide();
	        $("#sellCate2").hide();
	        $("#sellCate3").hide();
		}


		$scope.changeCate1 = function() {
			var elements = document.getElementsByClassName('hide_row');
			$scope.form_data.cate1 = $("#category1 option:selected").val();
			$scope.form_data.cate2 ="";

			for (var i = 0; i < elements.length; i++) {
				if ($scope.form_data.cate1 == "sell" || $scope.form_data.cate1 == "chineseart") {

					elements[i].style.display = 'flex';
				}
				else {
					elements[i].style.display = 'none';
				}
			}

			$scope.inqCate2 = [];
			$("#inqCate2").hide();
			for (i in $scope.inqCate) {
				if ($scope.inqCate[i].P_CD_ID == $scope.form_data.cate1) {
					$scope.inqCate2.push($scope.inqCate[i]);
					$scope.$apply();
					$("#inqCate2").show();

				}
			}
			$scope.$apply();
		}

		$scope.changeCate2 = function() {
			$scope.form_data.cate2 = $("#category2 option:selected").val();
		}
		
		$scope.fileCount=0;
		 
		$scope.fileNameList=[];
		$scope.fileHtml ;

		$("#file").change(function(e){
			let maxSize  = 10 * 1024 * 1024 
				if($scope.fileNameList.length > 9){
						if (locale == "ko") {
							alert("최대 10개의 파일 업로드 가능합니다. ");		
						} else {
							alert("You can upload 10 files");		
						}
						return false;			
				}
				
			let files = e.target.files;
			for(let i =0; i < files.length; i++){	
			
			let file = files[i];
			
			//첨부파일 용량체크				
			if(file.size > maxSize){
				if (locale == "ko") {
					alert("파일 사이즈는 최대 10MB입니다.");	
				} else {
					alert("ou can attach files of 10 MB or less.");	
				}
				return false;				
			}
			
			let filename = file.name;
			
			let lastDot = filename.lastIndexOf('.');
			let fileExt = filename.substring(lastDot+1, filename.length).toLowerCase();
			let extArray = ["jpg", "jpeg", "png", "gif", "pdf", "zip", "alz"];
			
			//파일 확장자 체크
			if(extArray.indexOf(fileExt) == -1){
				if (locale == "ko") {
					alert("첨부 가능한 파일 유형을 확인해 주세요.");
				} else {
					alert("File type : jpg, jpeg, png, gif, pdf, zip, alz");
				}
				return false;		
			}	
			console.log(filename);
			$scope.fileNameList.push({"fileIndex" : $scope.fileCount, "fileName":filename });		
		}
				
			
		  var x = $("#file"),
	 	  y = x.clone();
	  
		  y.attr("id", "file"+$scope.fileCount);
		  $('#fileHtml').append(y);
			  
			$scope.fileCount = $scope.fileCount+ 1;
			$scope.$apply();
			$("#file")[0].value = '';
	    });
	    

		
/*		$scope.deleteFile = function(index){
			let fileNameList = [];
		    const dataTransfer = new DataTransfer();
		    
		    let files = $('#file')[0].files;	
		    
		    let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
		    
		    fileArray.splice(index, 1);	//해당하는 index의 파일을 배열에서 제거
		    
		    fileArray.forEach(function(file,index) {
			dataTransfer.items.add(file); 
		    fileNameList.push({"fileIndex" : index, "fileName":file.name });		
		    });
		    
		    
		    $('#file')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
		    
		    $scope.fileNameList = fileNameList;
		}*/
		
		
		$scope.deleteFile = function(index){
			
		    let fileNameArray = Array.from($scope.fileNameList);
		    fileNameArray.forEach(function(file,i) {
			if(file.fileIndex == index){
				fileNameArray.splice(i, 1);
				document.getElementById('file'+index).remove();
			}
		    });
		    
		    $scope.fileNameList = fileNameArray;
		    
		}
		
		$scope.checkValidData = function() {

			if (!$scope.isValidString($scope.form_data.cate1)) {
				if (locale == "ko") {
					alert("카테고리(대분류)를 선택하세요.");
				} else {
					alert("Select a category(Major category).");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == 'payment_shipping' || $scope.form_data.cate1 == 'others' || $scope.form_data.cate1 == 'exhibition') && !$scope.isValidString($scope.form_data.cate2) && $scope.form_data.cate2 == "") {				
				if (locale == "ko") {
					alert("카테고리(중분류)를 선택하세요.");
				} else {
					alert("Select a category(subdivision).");
				}
				return false;
			}


			if (!$scope.isValidString(document.getElementById('emailAccount').value)) {
				if (locale == "ko") {
					alert("이메일을 입력해주세요.");
				} else {
					alert("Please put a email.");
				}
				return false;
			} else if($scope.isValidString(document.getElementById('emailAccount').value)){
				var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
				if (regEmail.test(document.getElementById('emailAccount').value) === false) {
					if(locale == 'ko'){
						alert('이메일 형식에 맞게 입력해 주세요.'); 
					} else {
						alert('Check out the Email'); 
					}
					return false;
				}
			}
			
			if (!$scope.isValidString(document.getElementById('hp').value)) {
				if (locale == "ko") {
					alert("휴대폰 번호를 입력해주세요.");
				} else {
					alert("Please put a mobile.");
				}
				return false;
			} else if($scope.isValidString(document.getElementById('hp').value)){
				var regPhone = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
				if (regPhone.test(document.getElementById('hp').value) === false) {
					if(locale == 'ko'){
						alert('휴대폰번호 형식에 맞게 입력해 주세요.'); 
						return;
					} else {
						alert('Check out the mobile'); 
						return;
					}
				}
			}
			
			if (!$scope.isValidString($scope.form_data.title)) {
				if (locale == "ko") {
					alert("제목을 입력해주세요.");
				} else {
					alert("Please put a title.");
				}
				return false;
			}

			if (!$scope.isValidString($scope.form_data.content)) {
				if (locale == "ko") {
					alert("내용을 입력해주세요.");
				} else {
					alert("Please put the contents.");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart") && !$scope.isValidString($scope.sell_data.work_name)) {
				if (locale == "ko") {
					alert("작품명을 입력해주세요");
				} else {
					alert("Please put the Artwork of the artwork.");
				}
				return false;
			}
			
			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart") && !$scope.isValidString($scope.sell_data.artist_name)) {
				if (locale == "ko") {
					alert("작가명을 입력해주세요");
				} else {
					alert("Please put the Author of the artwork.");
				}
				return false;
			}

			if ($scope.form_data.cate1 == 'sell' && !$scope.isValidString($scope.sell_data.work_size)) {
				if (locale == "ko") {
					alert("작품 크기를 입력해주세요.");
				} else {
					alert("Please put the size of the artwork.");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart") && !$scope.isValidString($scope.sell_data.possession_details)) {
				if (locale == "ko") {
					alert("소장 경위를 입력해주세요.");
				} else {
					alert("Please enter the Inspector of ownership.");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart" ) && document.getElementById("file").files.length == 0) {
				if (locale == "ko") {
					alert("작품 이미지를 등록해주세요.");
				} else {
					alert("Please put the image of the work.");
				}
				return false;
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

				//작품명
				document.getElementById("tmp_work_name").innerText= $scope.sell_data.work_name;
				//작가명
				document.getElementById("tmp_artist_name").innerText= $scope.sell_data.artist_name;
				//작품재질
				document.getElementById("tmp_work_material").innerText = $scope.sell_data.work_material ? $scope.sell_data.work_material :'';
				//추정시대
				document.getElementById("tmp_work_estate").innerText = $scope.sell_data.work_estate ? $scope.sell_data.work_estate : '';
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
				
				//작품크기
				document.getElementById("tmp_work_size").innerText = $scope.sell_data.work_size ? $scope.sell_data.work_size : '';
				//작품구분
				document.getElementById("tmp_work_category").innerText = category;
				//희망가격
				document.getElementById("tmp_hope_price").innerText = $scope.sell_data.hope_price ? $scope.sell_data.hope_price : '';
				//작가설명
				document.getElementById("tmp_artist_desc").innerText = $scope.sell_data.artist_desc ? $scope.sell_data.artist_desc: '';
				//작품설명
				document.getElementById("tmp_work_desc").innerText = $scope.sell_data.work_desc ? $scope.sell_data.work_desc : '';
				//소장경위
				document.getElementById("tmp_possession_details").innerText = $scope.sell_data.possession_details ? $scope.sell_data.possession_details: '';

				document.getElementById("inquiryContents").value = $scope.form_data.content + "\n\n" + document.getElementById("sell_form").innerHTML;
			}
			else {
				document.getElementById("inquiryContents").value = $scope.form_data.content;
			}

			
			
			if ($scope.checkValidData()) {
				document.getElementById('file').remove();
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
								alert("문의하신 내용이 등록 되었습니다.");
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
			$scope.sell_data.work_category1 = $("#work_category1 option:selected").val();
			$scope.sell_data.work_category2 = "";
			$scope.sell_data.work_category3 = "";
			
			$scope.sell_categories2 = [];
			$scope.sell_categories3 = [];
			$("#sellCate2").hide();
			$("#sellCate3").hide();
			if ($scope.sell_data.work_category1 == "근현대") {
				$scope.sell_categories2 = $scope.sell_categories1_1;
				$scope.$apply();
				$("#sellCate2").show();
			}
			else if ($scope.sell_data.work_category1 == "고미술") {
				$scope.sell_categories2 = $scope.sell_categories1_2;
				$scope.$apply();
				$("#sellCate2").show();
			}
			else if ($scope.sell_data.work_category1 == "기타") {
				$scope.sell_categories2 = $scope.sell_categories1_3;
				$scope.$apply();
				$("#sellCate2").show();
			}
		}

		$scope.changeSellCate2 = function() {
			$scope.sell_data.work_category2 = $("#work_category2 option:selected").val();
			document.getElementById("work_category3").style.display = "none";
			
			$scope.sell_data.work_category3 = "";
			$scope.sell_categories3 = [];

			$("#sellCate3").hide();
			if ($scope.sell_data.work_category1 == "근현대") {
				$scope.sell_categories3 = $scope.sell_categories1_1_1;
				$scope.$apply();
				$("#sellCate3").show();
			}
		}
		
		$scope.changeSellCate3 = function() {
			$scope.sell_data.work_category3 = $("#work_category3 option:selected").val();
		}

	}
});

window.addEventListener('load', function () {
	$('#inquirySubject, #inquiryContent').on('keyup', function() {
	        $('#'+$(this).attr('data-id')+'_length').html('<em>'+$(this).val().length+'</em> <span>/ '+$(this).attr('data-size')+'</span>');
	        if($(this).val().length > $(this).attr('data-size')) {
	            $(this).val($(this).val().substring(0, $(this).attr('data-size')));
	            $('#'+this.id+'_length').html('<em>'+$(this).val().length+'</em> <span>/ '+$(this).attr('data-size')+'</span>');
	        }
	    });		
	    
	   
});

/*window.onpageshow = function(event) {
	if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	
	        }
	}*/
/*window.onpopstate = function(event) {
    alert("location: " + document.location + ", state: " + JSON.stringify(event.state));
}*/