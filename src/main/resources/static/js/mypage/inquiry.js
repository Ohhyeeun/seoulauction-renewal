
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

	$scope.currentPage = 1;

 	$scope.loadInquiryList = function($page){

 		$scope.currentPage = $page;
 		 	
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
			$scope.reply =  result.data.inquiryReply;
			$scope.fileList =  result.data.inquiryFileList;
			console.log($scope.reply);
			$scope.$apply();
            }
        })
        .catch(function(error){
            console.log(error);
        });
	};
	

    
/*    $scope.downloadfile = async function(url, name) {
    // blob 형태로 들고 있어야 함.
    const res = await fetch(url);
    const blob = await res.blob();

    // anchor tag를 통해 다운 받는 방법
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = url;
    link.innerHTML = 'download';
    document.body.appendChild(link);
	}*/
});

app.controller('inquiryWriteCtl', function($scope, consts, common, inquiryService) {

	inquiryService.setScope($scope);
});
	

app.service("inquiryService", function($rootScope, common, locale) {
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
		}


		$scope.changeCate1 = function() {
			var elements = document.getElementsByClassName('hide_row');
			
			$scope.form_data.cate2 ="";
			
			for (var i = 0; i < elements.length; i++) {
				if ($scope.form_data.cate1 == "sell" || $scope.form_data.cate1 == "chineseart") {
					
					console.log(elements[i]);
					elements[i].style.display = 'flex';
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

		$scope.fileValidCheck = function(){
				let files = document.getElementById("file").files;
				
		        let maxSize  = 10 * 1024 * 1024 
		        
		        let fileNameList = [];
				if(files.length > 10){
						if (locale == "ko") {
							alert("최대 10개의 파일 업로드 가능합니다. ");		
						} else {
							alert("You can upload 10 files");		
						}
						document.getElementById("file").files =[];
						return false;			
				}
				
				for(let i =0; i < files.length; i++){	
					let file = files[i];
					
					//첨부파일 용량체크				
					if(file.size > maxSize){
						if (locale == "ko") {
							alert("파일 사이즈는 최대 10MB입니다.");	
						} else {
							alert("ou can attach files of 10 MB or less.");	
						}
						document.getElementById("file").files =[];		
						return false;				
					}
					
					let filename = file.name;
					
					let lastDot = filename.lastIndexOf('.');
					let fileExt = filename.substring(lastDot+1, filename.length).toLowerCase();
					let extArray = ["jpg", "jpeg", "png", "gif", "pdf", "zip", "alz"];
					
					//파일 확장자 체크
					if(extArray.indexOf(fileExt) == -1){
						if (locale == "ko") {
							alert("확장자(jpg, jpeg, png, gif, pdf, zip, alz)를 확인해주세요.");
						} else {
							alert("File type : jpg, jpeg, png, gif, pdf, zip, alz");
						}
						document.getElementById("file").files =[];	
						return false;		
					}	
					
					fileNameList.push({"fileIndex" : i, "fileName":filename });		
				}
				
				/*for(file  of files){	
					console.log(file);
					//첨부파일 용량체크				
					if(file.size > maxSize){
						if (locale == "ko") {
							alert("파일 사이즈는 최대 10MB입니다.");	
						} else {
							alert("ou can attach files of 10 MB or less.");	
						}
						document.getElementById("file").files =[];		
						return false;				
					}
					
					let filename = file.name;
					
					let lastDot = filename.lastIndexOf('.');
					let fileExt = filename.substring(lastDot+1, filename.length).toLowerCase();
					let extArray = ["jpg", "jpeg", "png", "gif", "pdf", "zip", "alz"];
					
					//파일 확장자 체크
					if(extArray.indexOf(fileExt) == -1){
						if (locale == "ko") {
							alert("확장자(jpg, jpeg, png, gif, pdf, zip, alz)를 확인해주세요.");
						} else {
							alert("File type : jpg, jpeg, png, gif, pdf, zip, alz");
						}
						document.getElementById("file").files =[];	
						return false;		
					}	
					
					fileNameList.push({filename});		
				}*/
				
				$scope.fileNameList = fileNameList;
				$scope.$apply();
			
		}
		
		$scope.deleteFile = function(index){
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
					alert("이메일을 넣어주세요.");
				} else {
					alert("Please put a email.");
				}
				return false;
			}
			
			if (!$scope.isValidString(document.getElementById('hp').value)) {
				if (locale == "ko") {
					alert("휴대폰 번호를 넣어주세요.");
				} else {
					alert("Please put a mobile.");
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

			if (!$scope.isValidString($scope.form_data.content)) {
				if (locale == "ko") {
					alert("내용을 넣어주세요.");
				} else {
					alert("Please put the contents.");
				}
				return false;
			}

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart") && !$scope.isValidString($scope.sell_data.work_name)) {
				if (locale == "ko") {
					alert("작품명을 넣어주세요");
				} else {
					alert("Please put the image of the work.");
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

			if (($scope.form_data.cate1 == 'sell' || $scope.form_data.cate1 == "chineseart" ) && document.getElementById("file").files.length == 0) {
				if (locale == "ko") {
					alert("작품 이미지를 넣어주세요.");
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
		            alert(error);
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


window.addEventListener('load', function () {
	$('#inquirySubject, #inquiryContent').on('keyup', function() {
	        $('#'+$(this).attr('data-id')+'_length').html('<em>'+$(this).val().length+'</em> <span>/ '+$(this).attr('data-size')+'</span>');
	        if($(this).val().length > $(this).attr('data-size')) {
	            $(this).val($(this).val().substring(0, $(this).attr('data-size')));
	            $('#'+this.id+'_length').html('<em>'+$(this).val().length+'</em> <span>/ '+$(this).attr('data-size')+'</span>');
	        }
	    });
});
