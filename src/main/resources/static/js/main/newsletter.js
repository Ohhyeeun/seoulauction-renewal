/*뉴스레터 신청 관련*/
$(document).ready(function(){

    let subscript = false;
    let newsAgree = false;

    $('#subscript_check').click(function(){
        subscript = $('#subscript_check').prop('checked');
    });

    $('.subscriptBtn').click(function(){

        if(subscript) {
            $('.newsletter-blackBg').fadeIn('fast');
            $('#terms').show();
            $('#termsResult').hide();
            $('.newsAgree-close').click(function () {  /*닫기 버튼 */
                $('.newsletter-blackBg').fadeOut('fast');
            });
        } else {
            alert("개인 정보 수집에 동의해주세요.");
        }
    });

    /* 뉴스레터 개인정보 동의 팝업 */
    $('#newsAgree').click(function(){
        newsAgree = $('#newsAgree').prop('checked');
    });

    $('.newsAgree-btn').click(function(){

        if(newsAgree){

            let email = $('#newsEmail').val();
            let name = $('#newsName').val();

            let data = {};
            data['email'] = email;
            data['name'] = name;
            data['lang'] = document.documentElement.lang;
            if(!email || !name){
                alert('이메일 혹은 이름이 올바르지않습니다.');
                return;
            }

            axios.post('/api/main/newsletters' , data)
                .then(function(response) {
                    const result = response.data;

                    let success = result.success;
                    if(!success){
                        alert(result.data.msg);
                    } else {
                        $('#terms').hide();
                        $('#termsResult').fadeIn(400);
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