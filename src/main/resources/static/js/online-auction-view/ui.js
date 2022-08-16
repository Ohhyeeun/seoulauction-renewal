
let _hold_info = $(".js-product_detail-article").trpScrollSyncTopView({
  topStart: 172,
  topMagin: 172,
  bottomStop: 1065
});

$(window).on("scroll resize", function($e) {
  renewalFn();
});

function renewalFn() {
  let _headerH = $("header.header").height();
  let _footerH = $("footer.footer").height();
  let _bottomH = $(".type_panel-product_view > .panel-footer").height();
  let _tem = 110 + _bottomH + 120 + _footerH;
  _hold_info.setTopStart(_headerH + 56);
  _hold_info.setBottomStop(_tem);
}
