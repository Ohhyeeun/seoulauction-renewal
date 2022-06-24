function Request(){
    this.getParameter = function(param){
        var requestParam ="";
        var url = decodeURI(location.href);
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
}

function recommandSearch(contents){

    $(".searchContent").val(contents);
    goSearch('searchContent', true);
}

function enterSearch(elementId, bIsKorean){
    if(window.event.keyCode == 13){
        goSearch(elementId, bIsKorean);
    }
}

function goSearch(elementId, bIsKorean) {

    var sSearchContent = $("." + elementId).val();
    if(sSearchContent) {
        location.href = bIsKorean ? "/sale/search?searchContent=" + sSearchContent : "/eng/sale/search?searchContent=" + sSearchContent;
        $("#topSearchContent").val(sSearchContent);
    }
    else {
        alert(bIsKorean ? "검색어를 입력해주세요." : "Please write search keyword.");
    }
}

function dotSubString(str,len){
    let result ='';
    if(str.length > len){
        result = str.substring(0,len)+'...';
    }else{
        result = str;
    }
    return result;
}

function addCookie(id, cookieName) {

    var items = getCookie(cookieName); // 이미 저장된 값을 쿠키에서 가져오기
    var maxItemNum = 10; // 최대 저장 가능한 아이템개수
    var expire = 1; // 쿠키값을 저장할 기간
    if (items) {
        var itemArray = items.split(',');
        if (itemArray.indexOf(id) != -1) {
            // 이미 존재하는 경우 종료
            console.log('Already exists.');
        }
        else {
            // 새로운 값 저장 및 최대 개수 유지하기

            itemArray.unshift(id);
            if (itemArray.length > maxItemNum ) itemArray.length = 10;
            items = itemArray.join(',');
            setCookie(cookieName, items, expire);
        }
    }
    else {
        // 신규 id값 저장하기
        setCookie(cookieName, id, expire);
    }
}

function size_text_cm(src, $filter){
    var returnValue = "";
    var cmSize = "";

    cmSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1, 1) : "";
    cmSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2, 1) : "";
    cmSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3, 1) +
        "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
    cmSize += cmSize != "" ? src.UNIT_CD : "";
    cmSize += cmSize != "" &&  src.CANVAS != 0 ? " (" + (src.CANVAS_EXT_YN == "Y" ? "변형" : "") + src.CANVAS + ")" : "";

    returnValue = src.PREFIX;
    returnValue += (src.DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
    returnValue += (src.SUFFIX ? " (" + src.SUFFIX + ") " : "");

    return returnValue;
}

function size_text(src, $filter){
    var returnValue = "";
    var cmSize = "";
    var inchSize = "";

    cmSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1, 1) : "";
    cmSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2, 1) : "";
    cmSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3, 1) +
        "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
    cmSize += cmSize != "" ? src.UNIT_CD : "";
    cmSize += cmSize != "" &&  src.CANVAS != 0 ? " (" + (src.CANVAS_EXT_YN == "Y" ? "변형" : "") + src.CANVAS + ")" : "";

    inchSize = src.SIZE1 != 0 ? $filter('number')(src.SIZE1 * 0.393701, 1) : "";
    inchSize += src.SIZE2 != 0 ? "☓" + $filter('number')(src.SIZE2 * 0.393701, 1) : "";
    inchSize += src.SIZE3 != 0 ? "☓" + $filter('number')(src.SIZE3 * 0.393701, 1) + "(" + (src.MIX_CD == "depth" ? "d" : "h")  + ")": "";
    inchSize += inchSize != "" ? "in" : "";

    returnValue = src.PREFIX;
    returnValue += (src.DIAMETER_YN == "Y" ? "Φ " : "") + cmSize;
    returnValue += (src.SUFFIX ? " (" + src.SUFFIX + ") " : "") + (inchSize != "" ?  ", " + inchSize : "");

    return returnValue;
}

var getLoginInfo = $("#accountBtn").next().text();
if( getLoginInfo != "LOGOUT" ){ $(document).on('click', 'a[href="#"]', function(e){
    e.preventDefault();
});	}



function inteSave(saleNo, lotNo, locale) {
    let api = "/api/auction/addCustInteLot";

    let data = {};
    data['sale_no'] = saleNo;
    data['lot_no'] = lotNo;

    axios.post(api , data)
        .then(function(response) {
            console.log(response);
            const result = response.data;
            let success = result.success;

            if(!success){
                alert("관심작품 추가 실패");
            } else {
                if(result.data > 0) {
                    if(locale == 'ko') {
                        alert("관심작품 추가가 완료되었습니다.\n추가된 관심작품은 ACCOUNT페이지에서 확인하실 수 있습니다.");
                        window.location.reload(true);
                    }else {
                        alert("A favorite work has been added.\nYou can find your favorite works on your account page.");
                        window.location.reload(true);
                    }
                    return true;
                }
            }
        })
        .catch(function(error){
            console.log(error);
        });

};

function inteDel(saleNo, lotNo, locale) {

    $api = "/api/auction/delCustInteLot";

    let data = {};
    data['sale_no'] = saleNo;
    data['lot_no'] = lotNo;

    axios.post($api , data)
        .then(function(response) {
            console.log(response);
            const result = response.data;
            let success = result.success;

            if(!success){
                alert("관심작품 삭제 실패");
            } else {
                if(result.data > 0) {
                    if(locale == 'ko') {
                        alert("관심작품이 삭제되었습니다.");
                        window.location.reload(true);
                    }else {
                        alert("A favorite work has been deleted.");
                        window.location.reload(true);
                    }
                    return true;
                }
            }
        })
        .catch(function(error){
            console.log(error);
        });

};

