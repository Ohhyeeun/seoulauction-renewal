<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<%--Axios--%>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.js"></script>
<script defer src="https://unpkg.com/axios-extensions/dist/axios-extensions.js"></script>
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
<%--<script src="/js/native.js" defer></script>--%>
<script id="native">
  /**
   * Native 연동 인터페이스
   */
  $(function(){
    // 네이티브 웹뷰 초기화
    window.isFlutterInAppWebViewReady = false;
    window.addEventListener('flutterInAppWebViewPlatformReady', function(e) {
      window.isFlutterInAppWebViewReady = true;
    });
  });

  /**
   * [Native -> Webview]
   * 웹뷰 메뉴 토글
   * @param {boolean?} state
   */
  function nativeToggleMenu(state) {
    const bgElement = document.querySelector('.gnb_submenuBg');
    const menugElement = document.querySelector('.submenuBg');

    if (bgElement.classList.contains('on') && menugElement.classList.contains('on')) {
      document.querySelector('.submenuBg-closeBtn').click();
    } else {
      document.querySelector('.m-gnbmenu').click();
    }
  }

  /**
   * [Webview -> Native]
   * 접속한 정보가 앱이 맞는지 정보
   * @return {Promise<Object>}
   */
  async function isNativeApp() {
    try {
      const result = await window.flutter_inappwebview.callHandler('getAppHeader', '');
      console.log(JSON.stringify(result));
      console.log("remember-me cookie : " + getCookie('remember-me'));
      return !!result;
    } catch (error) {
      return false;
    }
  }

  /**
   * 앱의 버전 정보 조회
   * @example
   * // Return Data Example
   * { "X-Custom-Webview-Name": "sa_app", "X-Custom-App-Version": "3.0.0" }
   */
  async function getNativeAppHeader() {
    try {
      const result = await window.flutter_inappwebview.callHandler('getAppHeader', '');
      return result;
    } catch (error) {
      return null;
    }
  }

  /**
   * [Webview -> Native]
   * 기기 ID 및 버전 정보 저장
   */
  async function saveDeviceInfo() {
    try {
      // result = { "os": "ios", "version": "device_version", "device_id": "id..." }
      // const result = await window.flutter_inappwebview.callHandler('getDeviceInfo', '');
      const result = { os: 'ios', version: 'ios 15', device_id: 'asdasdasdqwdwdwqdasdsads' };
      console.log(JSON.stringify(result));

      if (!result.os || !['ios', 'android'].includes(result.os)) return;
      if (!result.version || !result.device_id) return;

      // const url = `https://seoulauction.com/api/app/insert-app-info`;
      // const url = `https://stage.seoulauction.com/api/app/insert-app-info`;
      const url = `https://re-dev.seoulauction.com/api/app/insert-app-info`;
      const body = { os: result.os, app_version: result.version, device_id: result.device_id };
      await window.axios.post(url, body);
      return;
    } catch (error) {
      return;
    }
  }
</script>
