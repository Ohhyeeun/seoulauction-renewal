app.value('locale', 'ko');
var langType = document.documentElement.lang;
var bornDtValid, sexCdValid, hpValid, emailValid, addrValid, countryValid = false;
var compNoValid, compManNameValid = false; 
var oldHp, oldCompNo, oldEmail = '';
var nationList, artistList, inteArtistList = [];
var inteArtistJson = {};
$(window).on("load", function() {
	if(socialYn == 'Y'){
       document.getElementById('snsImg').src = '/images/common/icon-sns_' + snsFullName() + '.png';
	}
});

function getCustDetails(){
	axios.get('/api/mypage/custs/' + userNo)
		.then(function(response) {
			const result = response.data;
			if(result.success == true){
				const data = result.data;
				console.log(data)
				$("#custName").html(data.CUST_NAME);
				if(!undefCheck(data.BORN_DT)){
					$("#yy").val(data.BORN_DT.split("-")[0]); $("#select2-yy-container").html(data.BORN_DT.split("-")[0]);
					$("#mm").val(data.BORN_DT.split("-")[1]); $("#select2-mm-container").html(data.BORN_DT.split("-")[1]);
					$("#dd").val(data.BORN_DT.split("-")[2]); $("#select2-dd-container").html(data.BORN_DT.split("-")[2]);
					bornDtValid = true;
				}
				if(!undefCheck(data.SEX_CD)){
					if(data.SEX_CD == 'female'){
						$("input[name='sex_cd'][value='female']").prop("checked", true);
					}else if(data.SEX_CD == 'male'){
						$("input[name='sex_cd'][value='male']").prop("checked", true);
					}
					sexCdValid = true;
				}
				if(!undefCheck(data.HP)){
					oldHp = data.HP;
					$("#hp").val(data.HP);
					hpValid = true;
				}
				if(!undefCheck(data.EMAIL)){
					oldEmail = data.EMAIL;
					$("#email").val(data.EMAIL);
					emailValid = true;
				}
				if(!undefCheck(data.ZIPNO)){
					$("#zipno").val(data.ZIPNO);
					if(langType == 'ko'){
						$("#addr").html(data.ADDR);
					}else{
						$("#addr").val(data.ADDR);
					}
					$("#addr_dtl").val(data.ADDR_DTL);
					if(!undefCheck(data.ADDR) && !undefCheck(data.ADDR_DTL)){
						addrValid = true;
					}else{
						$("#addrMsg").html('상세주소를 등록해주세요.');	
					}
				}else{
					$("#addrMsg").html('주소를 등록해주세요.');
				}
				if(!undefCheck(data.DELI_ZIPNO)){
					$("#deli_zipno").val(data.DELI_ZIPNO);
					if(langType == 'ko'){
						$("#deli_addr").html(data.DELI_ADDR);
					}else{
						$("#deli_addr").val(data.DELI_ADDR);
					}
					$("#deli_addr_dtl").val(data.DELI_ADDR_DTL);
				}
//				if(data.PUSH_WAY_JSON != "[\"\"]"){
				if(!undefCheck(data.PUSH_WAY_JSON)){
					var pushWay = JSON.parse(data.PUSH_WAY_JSON);
					pushWay.forEach(function(ele){
						$("#pushway_" + ele).prop('checked', true);
					});					
				}
//				if(data.INTE_AREA_JSON != "[\"\"]"){
				if(!undefCheck(data.INTE_AREA_JSON)){
					var inteArea = JSON.parse(data.INTE_AREA_JSON);
					inteArea.forEach(function(ele){
						$("#" + ele).prop('checked', true);
					});					
				}
				if(!undefCheck(data.INTE_ARTIST_LIST)){
					artistList = data.INTE_ARTIST_LIST;
					artistList.forEach(function(ele){
						var tmpJson = JSON.parse(ele.ARTIST_NAME_JSON);
						var artistName = '';
						if(langType == 'ko'){
							artistName = tmpJson["ko"];
						}else{
							artistName = tmpJson["en"];
						}
						inteArtistList.push(ele.ARTIST_NO);
						inteArtistJson[ele.ARTIST_NO] = artistName;
						$("#artistList").append('<li id="artist' + ele.ARTIST_NO + '"><span>' + artistName + '</span><button><i class="icon-filter_del" onclick="deleteArtist(' + ele.ARTIST_NO + ')"></i></button></li>');
					});		
				}
				
				//사업자
				if(!undefCheck(data.COMP_NO)){
					oldCompNo = data.COMP_NO;
					$("#comp_no").val(data.COMP_NO.substring(0, 3) + "-" + data.COMP_NO.substring(3, 5) + "-" + data.COMP_NO.substring(5));
					compNoValid = true;
				}
				if(!undefCheck(data.COMP_OWNER)){
					$("#comp_owner").val(data.COMP_OWNER);
				}
				if(!undefCheck(data.COMP_MAN_NAME)){
					$("#comp_man_name").val(data.COMP_MAN_NAME);
					compManNameValid = true;
				}
				if(!undefCheck(data.TEL)){
					$("#tel").val(data.TEL);
				}
				
				//해외
				if(!undefCheck(data.NATION_CD) && langType != 'ko'){
					nationList.forEach(function(ele){
						if(ele.CD_ID == data.NATION_CD){
							$("#nation_cd").val(ele.CD_ID + "|" + ele.CD_VAL3);
							return false;
						}
					});
					$("#select2-nation_cd-container").text($("#nation_cd option:selected").text())
					countryValid = true;
				}
				
				buttonActive();
			}else{
				alert(result.data.msg);
			}
		})
		.catch(function(error) {
			console.log(error);
		});
}
$(document).ready(function() {
	let interestAreaData = {"grp_ids": ["interest_area"]};
	axios.post('/api/mypage/interestAreas' , interestAreaData)
	.then(function(response) {
	    const result = response.data;
	    var interestAreaList = result.data;
		interestAreaList.forEach(function(ele){
			if (langType == 'ko') {
				$("#interestAreaList").append("<span class='trp checkbox-box'><input name='inte_area' id='" + ele.CD_ID + "' value='" + ele.CD_ID + "' type='checkbox'><i></i><label for='" + ele.CD_ID + "'>" + ele.CD_NM + "</label></span>");
			}else{
				$("#interestAreaList").append("<span class='trp checkbox-box'><input name='inte_area' id='" + ele.CD_ID + "' value='" + ele.CD_ID + "' type='checkbox'><i></i><label for='" + ele.CD_ID + "'>" + ele.CD_NM_EN + "</label></span>");
			}
		});		
	    
	})
	.catch(function(error){
	    console.log(error);
	});
	
	
	let pushWayData = {"grp_ids": ["push_way"]};
	axios.post('/api/login/pushWays' , pushWayData)
	.then(function(response) {
	    const result = response.data;
	    var pushWayList = result.data;
		pushWayList.forEach(function(ele){
			if (langType == 'ko') {
				$("#pushWayList").append("<span class='trp checkbox-box'><input type='checkbox' name='push_way' id='pushway_" + ele.CD_ID + "' value='" + ele.CD_ID + "'><i></i><label for='checkbox1'>" + ele.CD_NM + "</label>");
			}else{
				$("#pushWayList").append("<span class='trp checkbox-box'><input type='checkbox' name='push_way' id='pushway_" + ele.CD_ID + "' value='" + ele.CD_ID + "'><i></i><label for='checkbox1'>" + ele.CD_NM_EN + "</label>");
			}
		});	
		
		if (langType == 'ko') {
			getCustDetails();	
	    }
	})
	.catch(function(error){
	    console.log(error);
	});
	
	//국가목록 api호출
	if(langType == 'en'){
		let data = {"grp_ids": ["nation"]};
		axios.post('/api/login/nations' , data)
	    .then(function(response) {
	        const result = response.data;
	        nationList = result.data;
	        nationList.forEach(function(ele){
				$("#nation_cd").append("<option value='" + ele.CD_ID + "|" + ele.CD_VAL3 + "'>" + ele.CD_NM + "</option>");
//				$("#nation_cd").append("<option value='" + ele.CD_ID + "'>" + ele.CD_NM + "</option>");
			})
			
			getCustDetails();
	    })
	    .catch(function(error){
	        console.log(error);
	    });
	}
		
	
});

function snsFullName(){
	if(socialType === 'NV'){
		return 'naver';
	}else if(socialType === 'KA'){
		return 'kakao';
	}else if(socialType === 'GL'){
		return 'google';
	}else if(socialType === 'AP'){
		return 'apple';
	} 
}

function undefCheck(param){
	if(param == undefined || param == '' || param == null){
		return true;
	}else{
		return false;
	}
}

function replaceAll(str, searchStr, replaceStr) {
	if(undefCheck(str)){
		return '';
	}else{
	   return str.split(searchStr).join(replaceStr);
	}
}

//수정 버튼 (비)활성화
function buttonActive(){
	console.log(bornDtValid ? '생일통과' : '생일실패');	console.log(sexCdValid ? '성별통과' : '성별실패');	console.log(hpValid ? '폰통과' : '폰실패');	console.log(emailValid ? '이메일통과' : '이메일실패');	console.log(addrValid ? '주소통과' : '주소실패');
	console.log(compNoValid ? '사업자번호통과' : '사업자번호실패');	console.log(compManNameValid ? '업무 담당자통과' : '업무 담당자실패');
	if(userKind == 'person'){ //개인 소셜
		if(langType == 'ko'){ //국내
			if(bornDtValid && sexCdValid && hpValid && emailValid && addrValid){
				$('#modifyButton').removeAttr('disabled');
			}else{
				$('#modifyButton').attr('disabled', 'disabled');
			}
		}else{ //해외
			if(bornDtValid && sexCdValid && emailValid && countryValid && addrValid){
				$('#modifyButton').removeAttr('disabled');
			}else{
				$('#modifyButton').attr('disabled', 'disabled');
			}
		}
	}else { //사업자
		if(hpValid && emailValid && addrValid && compNoValid && compManNameValid){
			$('#modifyButton').removeAttr('disabled');
		}else{
			$('#modifyButton').attr('disabled', 'disabled');
		}
	}
	
}

//생년월일 validation
function bornDtValidCheck(){
	if($("#yy").val() > 1 && $("#mm").val().length > 1 && $("#dd").val().length > 1){
		bornDtValid = true;		
	}else{
		bornDtValid = false;
	}
	buttonActive();
}

var timer_duration = '';
var auth_end_time = '';
function compareOldHp(){
	var hp = $("#hp").val();
	if(oldHp == hp){
		$("#hpMsg").html('등록된 휴대폰 번호와 동일합니다.');
		$("#authNumMsg").html("인증번호 요청");
		document.getElementById('hpAuthArea').style.display="none";
		document.getElementById('checkHpAuthMsg').innerText="";
		clearInterval(timer_duration);
		hpValid = true;
		buttonActive();
		return;
	}else{
		hpValid = false;
		buttonActive();
	}
}

//인증번호 요청
function authNumRequest(){
	if(hpValid){
		compareOldHp();
		return;
	}
	var phone = $("#hp").val();
	
	document.querySelectorAll('.authNum').forEach(function(ele){ele.disabled=false});
	document.getElementById('hpAuthArea').style.display="none";
	document.getElementById('hpMsg').innerText="";
	document.getElementById('checkHpAuthMsg').innerText="";
	clearInterval(timer_duration);
	
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if (phone == null || phone == '') {
		document.getElementById('hpMsg').innerText = "휴대폰 번호를 입력해주세요";
		return;
	}
	else if (regPhone.test(phone) === false) {
		document.getElementById('hpMsg').innerText = "휴대전화번호를 확인해주세요.";
		return;
	}
					
	var $d = {"to_phone": phone , "cust_kind_cd" : "person"};
	axios.post('/api/cert/sendAuthNum', $d)
	.then(function(response) {
		const data = response.data;
		let success = data.success;
			
		if (success) {
			if (data["data"].AUTH_EXISTS) {
					document.getElementById('hpMsg').innerText = "이미 등록된 휴대폰 번호 입니다. 다른 번호를 입력해 주세요.";
					//This number is already authorized.\n" + "Please log-in again with the first authenticated ID and start bidding.						
			} else {
				var auth_num_send_status = data.data.SEND_STATUS;
				auth_end_time = moment(new Date()).add(120, 'seconds');
				if(auth_num_send_status){
					timer_duration = setInterval(setAuthDuration, 1000);
					console.log("======> set timer");
				}
				
				document.getElementById('hpMsg').innerText = "";
				document.getElementById('hpAuthArea').style.display="flex"; //인증번호 입력 필드 show
				$("#authNumMsg").html("인증번호 재전송");
			}
		}
	})
	.catch(function(error) {
		console.log(error);
	});
}

//남은시간 timer
function setAuthDuration() {
	var f = 'm:s';
	var s = moment(auth_end_time).diff(moment(new Date()), 'seconds');
	if(s > 0) {
		document.getElementById('checkHpAuthMsg').innerText = "남은시간 : " + moment.duration(s, "seconds").format(f);
	}
	else if (s == 0) {
		//$scope.duraionEnd();
		document.getElementById('checkHpAuthMsg').innerText = "0";
		clearInterval(timer_duration);
		console.log("======> cancel timer");
		axios.post('/api/cert/clearAuthNum', {})
			.then(function(response) {
				document.getElementById('hpMsg').innerText="";
				document.getElementById('checkHpAuthMsg').innerText="인증 시간이 초과되었습니다. 다시 요청 하세요.";
			})
			.catch(function(error) {
				console.log(error);
			});
	}
}

//인증번호 확인
function authNumConfirm() {
	var hpAuth = $("#hp_auth").val();
	if(hpAuth == null || hpAuth == '') {
		document.getElementById('hpMsg').innerText = "인증번호를 넣으세요.";
		return;
	}
	$d = {"auth_num":hpAuth};
	axios.post('/api/cert/confirmAuthNumCheck', $d)
		.then(function(response) {
			const data = response.data;
			let success = data.success;
			if(success) {
				clearInterval(timer_duration);
				document.getElementById('hpMsg').innerText ="인증에 성공 하였습니다.";
				document.getElementById('checkHpAuthMsg').innerText = "";
				
				//인증 완료시, 인증번호 입력 영역 disabled 처리
				document.querySelectorAll('.authNum').forEach(function(ele){ele.disabled=true});
				
				hpValid  = true;
				buttonActive();
			}else {
				document.getElementById('hpMsg').innerText ="인증에 실패 하였습니다. 다시 요청 하세요.";
			}
	})
	.catch(function(error) {
		console.log(error);
	})
}

//이메일 validation
function emailValidCheck() {
	emailValid = false;
	var email = $("#email").val();
	
	if(undefCheck(email)){
		$("#emailMsg").html("이메일을 입력해주세요.");
	}else{
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	    if (!regEmail.test(email)) {
	    	if (langType == 'ko') {
				$("#emailMsg").html("형식에 맞지 않습니다.");
			} else {
				$("#emailMsg").html("The email you entered is not available.");
			}
	    }else{
			$("#emailMsg").html("");
			if(langType == 'ko'){ //외국인은 이메일중복체크필요
				emailValid = true;
			}
		}
	}
	buttonActive();
}

//해외회원 이메일 validation (api호출)
function emailDuplCheck() {
	emailValid = false;
	var email = $("#email").val();
	
	if(oldEmail == email){
		$("#emailMsg").html('It is the same as the registered email address.');
		return;
	}
		
	//외국 가입자 이메일 중복체크필요
	let data = {};
    data['email'] = email;
	axios.post('/api/login/isEmailExist' , data)
    .then(function(response) {
        const result = response.data;
        if(result && result.length > 0){
			$("#emailMsg").html("The email you entered is already in use.");
			emailValid = false;
        }else{
			$("#emailMsg").html("The email you entered is available.");
			emailValid = true;
		}
		buttonActive();
    })
    .catch(function(error){
        console.log(error);
    });
}

function changeNation(){
	if($("#nation_cd").val() != ''){
		countryValid = true;
		var sn = $("#nation_cd").val().split("|");
		$("#hp").val("+" + sn[1]);
	}else{
		countryValid = false;
	}
}
	
var address_search1 = $(".js-address_search1").trpLayerFixedPopup("#address_search1-wrap")
function addressSearch(addrType){
    address_search1.open(this); // or false   
    popup_fixation("#address_search1-wrap");
    $("#addr_word").val('');
    $("#addrListBody").html('<tr><td colspan="2"><div class="data-empty_mem tb1">검색결과가 없습니다.</div></td></tr>');
    document.getElementById("findAddr").setAttribute( "onClick", "javascript: findAddrNewForm('" + addrType + "');" );
}
	
$("body").on("click", "#address_search1-wrap .js-closepop, #address_search1-wrap .popup-dim", function($e) {
    $e.preventDefault();
    address_search1.close();
});

function addrDtlValidCheck(){
	addrValid = false;
	var addrDtl = $("#addr_dtl").val();
	if(!undefCheck(addrDtl)){
		addrValid = true;
	}else{
		$("#addrMsg").html('상세주소를 등록해주세요.');	
	}
	buttonActive();
}

function findAddrNewForm(addrType){
	if($("#addr_word").val() == ''){
		alert("주소를 입력해주세요.");
		return;
	}
	let data = {};
    data['find_word'] = $("#addr_word").val();
    axios.post('/api/mypage/address' , data)
        .then(function(response) {
            const result = response.data;

            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
				$("#addrScroll").scrollTop(0)
				var addressList = result.data.addresses;
				if(addressList.length > 0){
					$("#addrListBody").html('');
					addressList.forEach(function(ele){
						$("#addrListBody").append("<tr onclick='setAddr(\"" + addrType + "\", " + JSON.stringify(ele) + ");'><td>" + ele.postcd + "</td><td class='tal'>" + ele.address + "</td></tr>");
						
					});	
				}else{
					$("#addrListBody").html('<tr><td colspan="2"><div class="data-empty_mem tb1">검색결과가 없습니다.</div></td></tr>');
				}
            }
        })
        .catch(function(error){
            console.log(error);
        });
}

function setAddr(addrType, addr){
	if(addrType == 'addr'){
		$("#addr_old_yn").val("N");
		$("#zipno").val(addr.postcd);
		$("#addr").html(addr.address);
		$("#addr_dtl").val('');
		$("#addr_dtl").focus();
		$("#addrMsg").html("상세주소를 입력해주세요.");
	}else if(addrType == 'deli'){
		$("#deli_addr_old_yn").val("N");
		$("#deli_zipno").val(addr.postcd);
		$("#deli_addr").html(addr.address);
		$("#deli_addr_dtl").val('');
		$("#deli_addr_dtl").focus();
	}
	
	address_search1.close();
};

function copyAddr(){
	if($("#copyAddrChk").is(":checked")){
		$("#deli_addr_old_yn").val($("#addr_old_yn").val());
		$("#deli_zipno").val($("#zipno").val());
		if(langType == 'ko'){
			$("#deli_addr").html($("#addr").html());
		}else{
			$("#deli_addr").val($("#addr").val());
		}
		$("#deli_addr_dtl").val($("#addr_dtl").val());
	}else{
		$("#deli_zipno, #deli_addr_dtl").val('');
		if(langType == 'ko'){
			$("#deli_addr").html('');
		}else{
			$("#deli_addr").val('');
		}
	}
}

//해외고객 주소 validation
function addrValidBlur(){
	if($("#zipno").val() != '' && $("#zipno").val() != undefined
		&& $("#addr").val() != '' && $("#addr").val() != undefined
		&& $("#addr_dtl").val() != '' && $("#addr_dtl").val() != undefined){
		addrValid = true;		
	}else{
		addrValid = false;
	}
	buttonActive();
}

var staff_search1 = $(".js-writer_search1").trpLayerFixedPopup("#writer_search1-wrap");
function artistSearch(){
	staff_search1.open(this); // or false   
	popup_fixation("#writer_search1-wrap");
	$("#artist_word").val($("#writer").val());
	if($("#writer").val() != ''){
	    findArtistNewForm()
	}
	if (langType == 'ko') {
		$("#artistListBody").html('<tr><td colspan="3"><div class="data-empty_mem tb1">검색결과가 없습니다.</div></td></tr>');
	}else{
		$("#artistListBody").html('<tr><td colspan="3"><div class="data-empty_mem tb1">No results were found for your search.</div></td></tr>');
	}
}
	
$("body").on("click", "#writer_search1-wrap .js-closepop, #writer_search1-wrap .popup-dim, #writerClose", function($e) {
    $e.preventDefault();
    staff_search1.close();
});

function findArtistNewForm(){
	let data = {};
	var findWord = $("#artist_word").val();
	
	if(findWord == ''){
		alert("작가명을 입력해주세요.");
		return;
	}
    data['find_word'] = findWord;
    data['langType'] = langType;
    axios.post('/api/mypage/artists' , data)
        .then(function(response) {
            const result = response.data;

            let success = result.success;
            if(!success){
                alert(result.data.msg);
            } else {
				var resultList = result.data;

				$("#artistCnt").html(resultList.length);
				if(resultList.length > 0){
					
					console.log(resultList)
					$("#artistListBody").html("");
					resultList.forEach(function(ele){
						if(langType == 'ko'){
							$("#artistListBody").append("<tr><td><span class='trp checkbox-box'><input onclick='setArtist(\"" + ele.ARTIST_NO + "|" + ele.ARTIST_NM_KO + "\")' value='" +  ele.ARTIST_NO + "|" + ele.ARTIST_NM_KO + "' name='artistChk' type='checkbox' id='artistChk" + ele.ARTIST_NO + "' name=''><i></i><label for='checkbox_1'></label></span></td><td class='left_item'>" + replaceAll(ele.ARTIST_NM_KO, findWord, "<em>" + findWord + "</em>") + "</td><td>" + (ele.BORN_YEAR == undefined ? '' : ele.BORN_YEAR) + " ~ " + (ele.DIE_YEAR == undefined ? '' : ele.DIE_YEAR) + "</td></tr>");
						}else{
							$("#artistListBody").append("<tr><td><span class='trp checkbox-box'><input onclick='setArtist(\"" + ele.ARTIST_NO + "|" + ele.ARTIST_NM_EN + "\")' value='" +  ele.ARTIST_NO + "|" + ele.ARTIST_NM_EN + "' name='artistChk' type='checkbox' id='artistChk" + ele.ARTIST_NO + "' name=''><i></i><label for='checkbox_1'></label></span></td><td class='left_item'>" + replaceAll(ele.ARTIST_NM_EN, findWord, "<em>" + findWord + "</em>") + "</td><td>" + (ele.BORN_YEAR == undefined ? '' : ele.BORN_YEAR) + " ~ " + (ele.DIE_YEAR == undefined ? '' : ele.DIE_YEAR) + "</td></tr>");
						}
					});	
					
					inteArtistList.forEach(function(ele){
						$("#artistChk" + ele).prop("checked", true);
					});	
					tmpArtistList = inteArtistList;
					tmpArtistJson = inteArtistJson;
	
				}else{
					if (langType == 'ko') {
						$("#artistListBody").html('<tr><td colspan="3"><div class="data-empty_mem tb1">검색결과가 없습니다.</div></td></tr>');
					}else{
						$("#artistListBody").html('<tr><td colspan="3"><div class="data-empty_mem tb1">No results were found for your search.</div></td></tr>');
					}
				}
            }
        })
        .catch(function(error){
            console.log(error);
        });
}


let tmpArtistList = [];
let tmpArtistJson = {};
function setArtist(val){
	val = val.split("|");
		
	if($('#artistChk' + val[0]).prop("checked")){
		tmpArtistList.push(Number(val[0]));
		tmpArtistJson[val[0]] = val[1];
	}else{
		tmpArtistList = tmpArtistList.filter((ele) => ele != val[0]);
	}
};

function setArtists(){
	if($('input:checkbox[name=artistChk]:checked').length + inteArtistList.length > 10){
		alert("관심작가는 최대 10명까지 등록가능합니다.");
		return;
	}

	inteArtistList = tmpArtistList;
	inteArtistJson = tmpArtistJson;
	
	$("#artistList").html('');
	inteArtistList.forEach(function(ele){
		var artistName = inteArtistJson[ele];
		$("#artistList").append('<li id="artist' + ele + '"><span>' + artistName + '</span><button><i class="icon-filter_del" onclick="deleteArtist(' + ele + ')"></i></button></li>');
	});		
	
	$("#writer").val('');
    staff_search1.close();
};

function deleteArtist(artistNo){
	inteArtistList = inteArtistList.filter((ele) => ele != artistNo);
	$("#artist" + artistNo).remove();
}

//사업자용 validation
function compNoValidCheck(){
	compNoValid = false;
	var compNo = $("#comp_no").val();
	compNo = replaceAll(compNo, "-", "");
	$("#comp_no").val(compNo);
	
	if(undefCheck(compNo)){
		$("#compNoMsg").html("사업자 번호를 입력해주세요.");
	}else{
		if(compNo.length == 10) {
			compNo = compNo.substring(0, 3) + "-" + compNo.substring(3, 5) + "-" + compNo.substring(5);
			$("#comp_no").val(compNo);
		}
		$("#compNoMsg").html("사업자 번호 중복확인이 필요합니다.");
	}

	buttonActive();
}

function compNoExistCheck(){
	var compNo = $("#comp_no").val();
	compNo = replaceAll(compNo, "-", "");
	if(oldCompNo == compNo){
		$("#compNoMsg").html("등록된 사업자 등록번호와 동일합니다.");
		compNoValid = true;
		return;
	}
	//사업자 등록번호 중복체크
	let data = {};
    data['comp_no'] = compNo;
	axios.post('/api/login/isCompNoExist' , data)
    .then(function(response) {
        const result = response.data;
        if(result && result.length > 0){
			$("#compNoMsg").html("사용할 수 없는 사업자 등록번호 입니다.");
			compNoValid = false;
        }else{
			$("#compNoMsg").html("");
			compNoValid = true;
		}
		buttonActive();
    })
    .catch(function(error){
        console.log(error);
    });
}

function compManNameValidCheck(){
	var compManName = $("#comp_man_name").val();
	if(undefCheck(compManName)){
		compManNameValid = false;
		$("#compManNameMsg").html("업무 담당자 이름을 입력해주세요.");
	}else{
		compManNameValid = true;
	}
	buttonActive();
}

function custModify(){
//	console.log(bornDtValid ? '생일통과' : '생일실패');	console.log(sexCdValid ? '성별통과' : '성별실패');	console.log(hpValid ? '폰통과' : '폰실패');	console.log(emailValid ? '이메일통과' : '이메일실패');	console.log(addrValid ? '주소통과' : '주소실패');
//	console.log(compNoValid ? '사업자번호통과' : '사업자번호실패');	console.log(compManNameValid ? '업무 담당자통과' : '업무 담당자실패');
	
	if($('#modifyButton').attr('disabled') == "disabled"){
		if(userKind == 'person'){ //개인 소셜
			if(langType == 'ko'){ //국내
				if(!bornDtValid || !sexCdValid || !hpValid || !emailValid || !addrValid){
					alert("필수항목을 모두 입력해 주세요.");
					return;
				}
			}else{
				if(!bornDtValid || !sexCdValid || !emailValid || !countryValid || !addrValid){
					alert("Fill additional information below.");
					return;
				}
			}
		}else { //사업자
			if(!hpValid || !emailValid || !addrValid || !compNoValid || !compManNameValid){
				alert("필수항목을 모두 입력해 주세요.");
				return;
			}
		}
	}
	let form = document.querySelector('#modifyForm');
	var formData = new FormData(form);
	formData.set("user_kind", userKind);
	formData.set("born_dt", formData.getAll('born_dt').join('-'));
	if(langType == 'ko'){
		formData.set("local_kind_cd", "korean");
		formData.set("addr", $("#addr").html());
		formData.set("deli_addr", $("#deli_addr").html());
	}else{
		var sn = $("#nation_cd").val().split("|");
		formData.set("nation_cd", sn[0]);
		formData.set("local_kind_cd", "foreigner");
	}
	if(userKind != 'person'){
		formData.set("comp_no", replaceAll($("#comp_no").val(), "-", ""));
	}
	
	var ways = formData.getAll('push_way').join('|');
	if(!undefCheck(ways)){
		formData.set("push_way", ways);
	}
	var areas = formData.getAll('inte_area').join('|');
	if(!undefCheck(areas)){
		formData.set("inte_area", areas);
	}
	var artists = inteArtistList.join('|');
	if(!undefCheck(artists)){
		formData.set("inte_artist", artists);
	}
	
	// Display the key/value pairs
	for (var pair of formData.entries()) {
	    console.log(pair[0]+ ', ' + pair[1]); 
	}
	
	var data = {};
	formData.forEach((value, key) => (data[key] = value));
	axios.post("/api/mypage/custs/" + userNo , data)
		.then(function(response) {
			var result = response.data;
			if(result.success){
				alert("회원정보가 수정되었습니다.");
				$('#modifyButton').attr('disabled', 'disabled');
			}else{
				alert(result.data.msg)	
			}
		})	
		.catch(function(error){
		    console.log(error);
		    
		});
}

function custLeave(){
	location.href = "/mypage/custLeave";
}
