/*뉴스레터 신청 관련*/
$(document).ready(function(){

    let subscript = false;
    let newsAgree = false;

    $('#subscript_check').click(function(){
        subscript = $('#subscript_check').prop('checked');
    });

    $('#news_sub_label').click(function(){
        $('.newsletter-blackBg').fadeIn();
        $('.newsletter-terms').fadeIn();
        return false;
    });

    $('.newsAgree-close').click(function(){
        $('.newsletter-blackBg').fadeOut('fast');
        $('.newsletter-terms').fadeOut('fast');
    });



    $('.subscriptBtn').click(function(){

        //이메일 정규식.
        let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

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

        if(!regEmail.test(email)){
            alert('이메일 형식이 아닙니다.');
            return;
        }

        if(!subscript){
            alert("개인 정보 수집에 동의해주세요.")
            return;
        }

        axios.post('/api/main/newsletters' , data)
            .then(function(response) {
                const result = response.data;

                let success = result.success;
                if(!success){
                    alert(result.data.msg);
                } else {
                    $('.newsletter-blackBg').fadeIn();
                    $('.newsletter-comfirmbox').fadeIn();
                    $('#newsEmail').val('');
                    $('#newsName').val('');
                    $('#subscript_check').prop('checked',false);
                }
            })
            .catch(function(error){
                console.log(error);
            });

    });
    $('.newsAgree-comfirmbtn').click(function(){
        $('.newsletter-blackBg').fadeOut('fast');
        $('.newsletter-comfirmbox').fadeOut('fast');
    });
});