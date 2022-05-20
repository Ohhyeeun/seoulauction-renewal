/*뉴스레터 신청 관련*/
$(document).ready(function(){

    let subscript = false;
    let newsAgree = false;

    $('#subscript_check').click(function(){
        subscript = $('#subscript_check').prop('checked');
    });

    $('.subscriptBtn').click(function(){

        console.log('asdfasdfasdf');

        if(subscript) {

            let email = $('#newsEmail').val();
            let name = $('#newsName').val();

            let data = {};
            data['email'] = email;
            data['name'] = name;
            data['lang'] = document.documentElement.lang;
            if(!email || !name){
                alert('이메일 혹은 이름이 올바르지 않습니다.');
                return;
            }

            axios.post('/api/main/newsletters' , data)
                .then(function(response) {
                    const result = response.data;

                    let success = result.success;
                    if(!success){
                        alert(result.data.msg);
                    } else {
                        $('.newsletter-comfirmbox').fadeIn();
                        $('.newsletter-blackBg').fadeIn('fast');
                        $('#newsEmail').val('');
                        $('#newsName').val('');
                    }
                })
                .catch(function(error){
                    console.log(error);
                });


        } else {
            alert("개인 정보 수집에 동의해주세요.");
        }
    });
    $('.newsAgree-comfirmbtn').click(function(){
        $('.newsletter-blackBg').fadeOut('fast');
    });
});