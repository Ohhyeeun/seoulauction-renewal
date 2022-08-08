<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>--%>

<%--Axios--%>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
<script defer src="/js/common/axios.js" type="text/javascript"></script>

<!--[if lt IE 9]>
<script src="/js/plugin/html5shiv.js"></script> <![endif]-->
<script src="/js/plugin/prefixfree.min.js"></script>
<script src="/js/plugin/swiper.min.js" type="text/javascript"></script>
<%--<script src="https://code.angularjs.org/1.5.8/angular.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-duration-format/1.3.0/moment-duration-format.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ng-dialog/0.5.6/js/ngDialog.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="/js/native.js"></script>
<script src="/js/plugin/qs.min.js"></script>
<script>
$(() => {
  /**
   * 페이지 내 앵커태그 네이티브 호환 되도록 변경
   */
  const anchors = [...document.querySelectorAll('a[target="_blank"]')];
  anchors.forEach(tag => {
    tag.addEventListener('click', e => {
      e.preventDefault();
      if (e.currentTarget.href) {
        openWebBrowser(e.currentTarget.href);
      }
    });
  });
});
</script>
