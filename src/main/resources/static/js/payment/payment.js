function nicepayStart() {
    if(!rcptCheck()) return;

    isNativeApp().then(nativeApp => {
        if (nativeApp || checkPlatform(window.navigator.userAgent) == "mobile"){//모바일 결제창 진입


            // let method = $("form[name=payForm] #inputPayMethod").val();
            // if(method === 'CARD'){
            //     document.payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
            // } else {
            document.payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
            //}
            document.payForm.acceptCharset="euc-kr";
            document.payForm.submit();
        } else {//PC 결제창 진입
            goPay(document.payForm);
        }
    });
}

//[PC 결제창 전용]결제 최종 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
function nicepaySubmit(){
    document.payForm.submit();
}

//[PC 결제창 전용]결제창 종료 함수 <<'nicepayClose()' 이름 수정 불가능>>
function nicepayClose(){
    alert("결제가 취소 되었습니다");
}

// 신용 / 가상계좌 선택 스크립트
function changePayMethod(obj) {
    let btn = $(obj).siblings().add(obj);
    btn.removeClass("btn_black").addClass("btn_default");
    $(obj).removeClass("btn_default").addClass("btn_black");
    $("form[name=payForm] #inputPayMethod").val($(obj).attr("data"));

    if($(obj).attr("data") === "VBANK") {
        $(".receipts, .text_wrap").show();
    } else {
        $(".receipts, .text_wrap").hide();
    }
}

$(function() {
    <!-- 개인소득공제 방법선택 -->
    $(".js-selt_choice select").change(function() {
        var _num = $(this).find("option:selected").index();
        var _markWrap = $(this).parents(".js-selt_choice");
        var _targetCon = _markWrap.next().find(".form-wrap");
        _targetCon.eq(_num).show().siblings().hide();
    });

    <!-- [0614]개인/사업자 선택 -->
    $(".js-selt_division input:radio").change(function() {
        var _markWrap = $(".js-selt_division");
        var _num = $(this).parent(".trp.radio-box").index();
        var _targetCon = _markWrap.siblings(".form-area");
        _targetCon.hide();
        _targetCon.eq(_num).show();
    });

    // 개인소득공제 신청/안함
    $(".personal .radio-wrap input:radio").change(function () {
        var _markWrap = $(".personal .radio-wrap");
        var _num = $(this).parent(".trp.radio-box").index();
        var _targetCon = _markWrap.siblings(".con-wrap");
        _targetCon.hide();
        _targetCon.eq(_num).show();
    });
});

function rcptCheck() {
    if($("form[name=payForm] #inputPayMethod").val() !== "VBANK") {
        // 데이터 초기화 적용
        return true;
    }

    let tmpReqReserved = $("form[name=payForm] input[name=tmpReqReserved]").val();
    let rcptNo;


    switch ($("input:radio[name=rcpt_type]:checked").val()) {
        case '1':
            rcptNo = $("#rcpt_type_no1").val();
            if(!rcptNo) {
                alert("현금영수증 번호를 입력해주세요.");
                $("#rcpt_type_no1").focus();
                return false;
            }

            // 휴대폰번호 유효성 체크
            if (!/(\d{2,3})-?(\d{3,4})-?(\d{4})/.test(rcptNo)){
                alert("유효하지 않은 휴대폰 번호입니다.");
                $("#rcpt_type_no1").focus();
                return false;
            }

            tmpReqReserved += ",rcpt_type=1";
            break;

        case '2':
            rcptNo = $("#rcpt_type_no2").val();
            if(!rcptNo) {
                alert("현금영수증 번호를 입력해주세요.");
                $("#rcpt_type_no2").focus();
                return false;
            }

            // 사업자번호 유효성 체크
            if (!/(\d{3})-?(\d{2})-?(\d{5})/.test(rcptNo)){
                alert("유효하지 않은 사업자등록번호입니다.");
                $("#rcpt_type_no2").focus();
                return false;
            }

            tmpReqReserved += ",rcpt_type=2";
            break;
    }

    tmpReqReserved += ",rcpt_type_no="+rcptNo.replace(/-/g, '');
    $("form[name=payForm] input[name=ReqReserved]").val(tmpReqReserved);
    return true;
}