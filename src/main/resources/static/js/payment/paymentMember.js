$(function(){

    //약관 동의 확인
    $("#paymentStartBtn").on('click',function (){

        let checked = true;
        $('input:checkbox[name="agree_checkbox"]').each(function (){

            let checkBoxChecked = $(this).is(":checked");

            if(!checkBoxChecked){
                checked = false;
                return false;
            }
        });

        if(!checked){
            alert('약관동의를 확인 후 모두 체크해주세요.');
            return;
        }

        nicepayStart();

    });


    //약관 동의 체크 박스 관련 스크립트
    $("#checkboxall").on('click' , function(){
        const checked = $(this).is(':checked');
        $('input:checkbox[name="agree_checkbox"]').prop('checked',checked);
    });

    //모두 체크하거나 모두 해제된 이벤트 처리.
    $('input:checkbox[name="agree_checkbox"]').on('click' , function (){

        if( $('input:checkbox[name="agree_checkbox"]:checkbox:checked').length === 4 ) {
            $("#checkboxall").prop('checked' , true );
        } else {
            $("#checkboxall").prop('checked' , false );
        }
    });





});