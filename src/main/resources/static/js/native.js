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
* 앱 버전정보 조회
* @return {Promise<Object>}
* @example
* // Return Data Example
* { "X-Custom-Webview-Name": "sa_app", "X-Custom-App-Version": "3.0.0" }
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
 * [Webview -> Native]
 * 기기 ID 및 버전 정보 저장
 */
async function saveDeviceInfo() {
  try {
    // result = { "os": "ios", "version": "device_version", "device_id": "id..." }
    const result = await window.flutter_inappwebview.callHandler('getDeviceInfo', '');
    console.log(JSON.stringify(result));

    // if (!result.os || !['ios', 'android'].includes(result.os)) return;
    // if (!result.version || !result.device_id) return;
    // const url = `https://seoulauction.com/api/app/insert-app-info`;
    // const url = `https://stage.seoulauction.com/api/app/insert-app-info`;
    // const url = `https://re-dev.seoulauction.com/api/app/insert-app-info`;
    // const body = { os, version, deviceId };
    // await window.axios.post(url, body);
    return;
  } catch (error) {
    return;
  }
}
