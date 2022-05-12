$(function(){

    $("#payCard").removeClass('btn_default');
    $("#payCard").addClass('btn_black');
    $('#inputPayMethod').val('CARD');
    let buttons = $("#payMethod").children('.btn');

    buttons.on('click',function (){

        //버튼들을 기본으로 다만듬.;
        buttons.each(function(){
            $(this).addClass('btn_default');
            $(this).removeClass('btn_black');
        })

        //클릭한 버튼만 블랙처리.
        $(this).addClass('btn_black');
        $(this).removeClass('btn_default');
        let id = $(this).attr('id');
        if(id === 'payCard'){
            $('#inputPayMethod').val('CARD');
        } else if (id === 'payVBank'){
            $('#inputPayMethod').val('VBANK');
        }
    });
});
