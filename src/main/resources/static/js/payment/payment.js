function nicepayStart(){

    if(checkPlatform(window.navigator.userAgent) == "mobile"){//모바일 결제창 진입

        document.payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
        document.payForm.acceptCharset="euc-kr";
        document.payForm.submit();
    }else{//PC 결제창 진입
        goPay(document.payForm);
    }
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
}

// 신용 / 가상계좌 스크립트
// $(function(){
//
//     $("#payCard").removeClass('btn_default');
//     $("#payCard").addClass('btn_black');
//     $('#inputPayMethod').val('CARD');
//     let buttons = $("#payMethod").children('.btn');
//
//     buttons.on('click',function (){
//
//         //버튼들을 기본으로 다만듬.;
//         buttons.each(function(){
//             $(this).addClass('btn_default');
//             $(this).removeClass('btn_black');
//         })
//
//         //클릭한 버튼만 블랙처리.
//         $(this).addClass('btn_black');
//         $(this).removeClass('btn_default');
//         let id = $(this).attr('id');
//         if(id === 'payCard'){
//             $('#inputPayMethod').val('CARD');
//         } else if (id === 'payVBank'){
//             $('#inputPayMethod').val('VBANK');
//         }
//     });
// });
