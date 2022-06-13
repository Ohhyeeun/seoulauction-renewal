function goExhibit(){
    window.location.href = '/privatesale/exhibit/';
}

function goExhibitFirst(){
    window.location.href = '/privatesale/exhibit/first';
}

$('.js-maintab_list a').on('click', function(e) {
    e.preventDefault();
    var tar = $(this).position().left;
    var scrollX = tar - ($(".js-maintab_list").parents(".tab-area").width() / 2) + $(this).width() / 2;


    if ($(this).parents('li').hasClass('active')) return false;
    var id = $(this).attr('href');
    if ($(id).length > 0) {
        ///$('.tab-cont').removeClass('active');
        ///$(id).addClass('active');
        $(this).parents('li').siblings('li').removeClass('active').end().addClass('active');

        $(".js-maintab_list").parents(".tab-area").scrollLeft(scrollX);
    }

    return false;
});