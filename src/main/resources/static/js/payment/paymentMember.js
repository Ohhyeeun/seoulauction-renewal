$(function(){


    //약관 동의 체크 박스 관련 스크립트
    $("#checkboxall").on('click' , function(){
        const checked = $(this).is(':checked');
        $('input:checkbox[name="agree_checkbox"]').prop('checked',checked);
    });


});