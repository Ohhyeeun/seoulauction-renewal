

$(function(){
const locale = document.documentElement.lang;
const sleep = (ms) => new Promise(resolve => { setTimeout(resolve, ms) });

    console.log(window.innerWidth);

    //진행중 경매리스트
    loadIngAuctionList();

    //gnb메뉴 now표시
    setGnbNowBadge();

    //gnb메뉴 now표시
    setMyMenuBadge();


    function loadIngAuctionList(){

        axios.get('api/main/ingAuctions')
        .then(function(response){
            const success =  response.data.success;
            if (success) {
                const ingAuctionList = response.data.data;
                ingAuctionList.map(item => {
                    const titleJSON = JSON.parse(item.TITLE_BLOB);
                    const returnDom = `<a href="/auction/${item.SALE_NO}" class="Ingbanner" target="_blank">
                                            <figure class="border-txt-darkg Ingbanner-img">
                                                <img src="https://www.seoulauction.com/nas_img/${item.FILE_PATH}/thum/${item.FILE_NAME}" alt="ing_auction01">
                                            </figure>
                                            <div class="Ingbanner-txt text-over">
                                                <span class="auctionKind-box Ingkind-auction ${item.SALE_KIND === 'LIVE' ? 'on' : ''}">${item.SALE_KIND}</span>
                                                  <p class="text-over">${titleJSON[locale]}</p>
                                                <span class="Ingbanner-arrow"></span>
                                            </div>
                                        </a>`;

                    document.querySelector(".Ingbanner-box").insertAdjacentHTML('beforeend', returnDom);
                });

            }
        })
        .catch(function(error){
            console.log(error);
        });
    }

    function setGnbNowBadge(){


        axios.get('api/main/ingMenuCount')
        .then(function(response){
            const success =  response.data.success;
            if (success) {
                const menuCount = response.data.data[0];
                const badgeHtml = '<span class="currentIng">NOW</span>';
                if(menuCount.AuctionCount > 0)
                    document.querySelector('#menu_auction').insertAdjacentHTML('beforeend', badgeHtml);
                if(menuCount.UpcomingCount > 0)
                    document.querySelector('#menu_upcoming').insertAdjacentHTML('beforeend', badgeHtml);
                if(menuCount.ExhibitionCount > 0)
                    document.querySelector('#menu_exhibit').insertAdjacentHTML('beforeend', badgeHtml);
                if(menuCount.AcademyCount > 0)
                    document.querySelector('#menu_academy').insertAdjacentHTML('beforeend', badgeHtml);
            }
        })
        .catch(function(error){
            console.log(error);
        });
    }

    function setMyMenuBadge(){

        axios.get('api/main/isHaveToPayWorkExist')
            .then(function(response){
                const success =  response.data.success;
                if (success) {
                    const isExist = response.data.data.isExist;
                    const badgeHtml = '<i class="utility-icon on"></i>';
                    console.log(isExist)
                    if(isExist)
                        document.querySelector('#MyMenuOnlineBadge a').insertAdjacentHTML('beforeend', badgeHtml);
                }
            })
            .catch(function(error){
                console.log(error);
            });
    }

    window.addEventListener('resize', (e) => {
        const width = e.target.innerWidth;
        if (width > 1280) {
            console.log(76767);
            //$('.topsearch>input').attr('placeholder','작가 또는 작품명 검색');
        } else if (width > 720) {
            console.log(35256);
            //$('.topsearch>input').attr('placeholder','검색');
        } else {
            //$('.topsearch>input').attr('placeholder','검색을 입력하세요.');
        }
    });

    /* pc 다크모드 */
    $('.darkmodeBg').click(function(){
        console.log(32423);
        $('*').toggleClass('dark');

        $('.auctionTab-btn').click(function(){
            const darkIngTab = $(this).index();
            $('.auctionTab-btn').removeClass('dark');
            $('.auctionTab-contents').removeClass('dark');

            $(this).addClass('dark');
            $(".auctionTab-contents").eq(darkIngTab).addClass('dark');
        });

        $('.darktxt').text('다크모드로 보기');
        $('.darktxt.dark').text('라이트모드로 보기');
        $('.darktxt-en').text('Dark Mode');
        $('.darktxt-en.dark').text('Ligth Mode');
    });

    /* mobile 다크모드 */
    $('.modebox').click(function(){
        if($('.mode-toggle>input').is(":checked")){
            $('*').addClass('dark');
        } else {
            $('*').removeClass('dark');
        }
    });

    /* 띠배너 */
    $('.beltclose-btn').click(function(){
        $('.header_beltbox').slideUp(400);
    });

    /*gnb menu */
    let gnb = $(this).index();
    if(matchMedia("all and (min-width: 1024px)").matches) {
        $('.submenuBg').show(function(){
            $('.main-contents').click(function(){
                $('.submenuBg').slideUp();
            });
        });

        $('.header_gnbmenu>li>a').mouseenter(function(){
            $('.header_gnbmenu>li>a').removeClass('on');
            $(".submenuBg").stop().slideDown();
            $(this).eq(gnb).addClass('on');
        });
        $(".submenuBg").mouseleave(function(){
            $(".submenuBg").stop().slideUp();
            $('.header_gnbmenu>li>a').removeClass('on');
        });
        $(".submenuBg").hide();

        /* main gnb fixed */
        $('.header').show(function(){
            $('.main-header').show(function(){
                /*$('.main-contents').css('top','118px'); */
                $('.main-contents').css('margin-top','120px');
            });
            $(this).hasClass('main-header');
        });

        // /* 띠배너 beltbanner */
        // $('.header_beltbox.on').show(function(){
        //     $('.main-contents').css('margin-top','180px');
        // });
        // $('.beltclose-btn').click(function(){
        //     $('.main-contents').css('margin-top','120px');
        // });
    } else { /* 테블릿 */
        /* 모바일 gnb */
        $('.header_gnbmenu>li>a').mouseenter(function(){
            return false;
        });
        $(".submenuBg").mouseleave(function(){
            return false;
        });
        /* mobile gnb bg */
        $('.m-gnbmenu').click(function(){
            $('.gnb_submenuBg').show();
            $('.submenuBg').animate({'right':'0','transition':'ease .5s','display':'block'});
        });
        $('.submenuBg-closeBtn').click(function(){
            $('.gnb_submenuBg').hide();
            $('.submenuBg').animate({'right':'-100%','transition':'ease .3s'});
        });

        /*$('.submenuBg').click(function(){
            $('.gnb_submenuBg').animate({'right':'-100%','transition':'ease .5s'});
            $('.submenuBg').animate({'right':'-100%','transition':'ease .3s'});
        }); */

        $('.subGnbmenu-tit').click(function(){
            let Mobilegnb = $(this).index();

            $('.gnbmenu_arrow>span').removeClass('on');
            $('.gnbmenu_arrow').removeClass('on');
            $('.submenu').stop().slideUp();


            $('.gnbmenu_arrow>span').eq(Mobilegnb).toggleClass('on');
            $('.gnbmenu_arrow').eq(Mobilegnb).addClass('on');
            $('.submenu').eq(Mobilegnb).stop().slideDown();

            $('.modebox').removeClass('on');
        });
        /* main gnb fixed */
        $('.header').show(function(){
            $('.main-header').show(function(){
                /*$('.main-contents').css('top','56px'); */
                $('.main-contents').css('margin-top','56px');
            });
            $(this).hasClass('main-header');
        });

        // /* 띠배너 beltbanner */
        // $('.header_beltbox.on').show(function(){
        //     /*$('.main-contents').css('top','99px');*/
        //     $('.main-contents').css('margin-top','101px');
        // });
        //
        // $('.beltclose-btn').click(function(){
        //     /*$('.main-contents').css('top','56px');*/
        //     $('.main-contents').css('margin-top','58px');
        // });
    }

    /* utility menu */
    /*$('.utility-join').hide();
    $('.utility-login').hide();
    $('.gnb_join').hide();
    $('.gnb_login').hide();*/

    /* 모바일 gnb 유틸리티 */
    $('.gnb_logout').click(function(){
        $('.gnb_join').show();
        $('.gnb_member').hide();
        $('.gnb_login').show();
        $(this).hide();
    });

    /*pc 유틸리티 */
    /*$('.utility-logout').click(function(){
        $('.utility-join').show();
        $('.utility-account').hide();
        $('.utility-login').show();
        $(this).hide();
    });*/
    let utilityMenu = $(this).index();
    $('.utility-tab').mouseenter(function(){
        $(this).children('a').addClass('on');
        $('.bubble-box').removeClass('on');
        $(this).children('.bubble-box').eq(utilityMenu).addClass('on');
    });
    $('.bubble-box').mouseleave(function(){
        $(this).removeClass('on');
        $('.utility-lang>a').removeClass('on');
    });
    $('.utility-tab').mouseleave(function(){
        $(this).children('a').removeClass('on');
        $('.bubble-box').removeClass('on');
    });
    /* 최근검색 키워드 삭제 */
    $('.keyword-del').click(function(){
        $(this).parent('.recent-keyword').hide();
    });
    /* 최근검색 전체삭제 */
    $('.keyword-all-del').click(function(){
        $('.recent-keyword').hide();
    });
    /* 모바일 gnb 서치*/
    $('.m-top-search').click(function(){
        $('.topsearch-box>form').animate({'right':'0','transition':'ease .5s'});
        //$('.topsearch-box>form').show();
        $('.topsearch>input').show();
        $('.topsearch-btn').show();
        $('.search-bubble-box').show();
    });
    $('.top-search-closeBtn').click(function(){
        $('.topsearch-box>form').animate({'right':'-100%','transition':'ease .5s'});
    });

    /*top search placeholder */
    const inWidth = window.innerWidth;
    if(inWidth > 1279) {
        $('.topsearch>input').attr('placeholder','작가 또는 작품명 검색');
        $('.topsearch-en>input').attr('placeholder','Search by artist or work name');
        $('.darkmodeBg').hover(function(){
            $('.darkmode').toggleClass('active');
        }, function(){
            $('.darkmode').toggleClass('active');
        });
        $('.darkmodeBg.dark').hover(function(){
            $('.darkmode.dark').toggleClass('active');
        }, function(){
            $('.darkmode.dark').toggleClass('active');
        });
    } else if(inWidth > 720) {
        $('.topsearch>input').attr('placeholder','검색');
        $('.topsearch-en>input').attr('placeholder','Search');
    } else {
        $('.topsearch>input').attr('placeholder','검색을 입력하세요');
        $('.topsearch-en>input').attr('placeholder','Search');
    };

    /* footer family site */
    $('.Familysite').click(function(){
        let familyH = $(this).index();
        $(this).removeClass('on');
        $('.Familysite').eq(familyH).addClass('on');
        $('.familyselect').toggle();
    });

    $('.familyselect>li>a').click(function(){
        $('.Familysite').removeClass('on');
        $('.familyselect').hide();
    });


});

/* scroll top */
$('.scroll-top').click(function(){
    $('html, body').animate({scrollTop: '0'}, 700);
});

/* top search 클릭 할 때 filter 기능 */
function searchDown() {
    $('.topsearch-text').click(function(){
        $('.search-bubble-box').addClass('on');
    });
}

/* top search filter 기능 */
function searchFilter() {
    if(window.Event.keyCode == 13){
        $('.topsearch-btn').trigger("click");
        $('.search-bubble-box').removeClass('on');
    } else if($('.topsearch-text').val().length == 0) {
        $('.search-bubble-box').removeClass('on');
    } else {
        $('.search-bubble-box').addClass('on');
    };
}


function closeToday(cookieName){
    setCookie(cookieName, 'done', 1);
}

// 쿠키 가져오기
function getCookie(name) {
    var nameOfCookie = name + "=";
    var x = 0;
    while (x <= document.cookie.length) {
        var y = (x + nameOfCookie.length);
        if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }
        x = document.cookie.indexOf(" ", x) + 1;
        if (x == 0)
            break;
    }
    return "";
}


// 만료 후 클릭한 시간까지 쿠키 설정
function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}


//숫자를 천단위마다 콤마 해줌.
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}



function phoneNumber(obj){
    let mobile_len=obj.value.length;
    
    if(event.keyCode==8){
        obj.value=obj.value.slice(0,mobile_len); 
        return 0; 
    }else if (mobile_len==3 || mobile_len==8){
        obj.value += '-';
    }
}









