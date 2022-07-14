window.addEventListener('load', () => {
  /**
   * [Native -> Webview]
   * 웹뷰 메뉴 토글
   * @param {boolean} state
   *
   * @example
   * evaluateJavascript("webviewToggleMenu(true)")
   */
  function webviewToggleMenu2(state) {
    const bgElement = document.querySelector('.gnb_submenuBg');
    const menugElement = document.querySelector('.submenuBg');

    if (bgElement.classList.contains('on') && menugElement.classList.contains('on')) {
      window.alert(document.querySelector('.submenuBg-closeBtn').innerHTML);
      // document.querySelector('.submenuBg-closeBtn').click();
    } else {
      window.alert(document.querySelector('.m-gnbmenu').innerHTML);
      // document.querySelector('.m-gnbmenu').click();
    }
  }

  /**
   * [Native -> Webview]
   * 토큰으로 로그인
   * @param {string} token
   *
   * @requires
   * controller.addJavaScriptHandler(handlerName: 'webviewSignin', callback: (args) {
   *   // args = [true | false]
   * }
   *
   * @example
   * evaluateJavascript("webviewSignin()")
   *
   */
  function webviewSignin(token) {
    if (!token) return;

    // async/await 불가할 수도 있어서 추가
    const loginAction = async (token) => {
      if (typeof window.flutter_inappwebview === 'undefined') return;

      try {
        const url = `https://re-dev.seoulauction.com/api/app/login-by-token`;
        const body = { token };

        const result = await window.axios.post(url, body);
        window.flutter_inappwebview.callHandler('webviewSignin', result.success);
      } catch (error) {
        window.flutter_inappwebview.callHandler('webviewSignin', false);
      }
    }
    loginAction();
  }

  /**
   * [Native -> Webview]
   * 기기 ID 및 버전 정보 저장
   * @param {'ios' | 'android'} os
   * @param {string} version
   * @param {string} deviceId
   *
   * @requires
   * controller.addJavaScriptHandler(handlerName: 'webviewSaveDeviceInfo', callback: (args) {
   *   // args = [true | false]
   * }
   *
   * @example
   * evaluateJavascript("webviewSaveDeviceInfo('ios', 'v3.0.0', '...')")
   */
  function webviewSaveDeviceInfo(os, version, deviceId) {
    if (!os || !['ios', 'android'].includes(os)) {
      return;
    }

    if (!version || !deviceId) {
      return;
    }

    // async/await 불가할 수도 있어서 추가
    const saveDeviceInfo = async (os, version, deviceId) => {
      if (typeof window.flutter_inappwebview === 'undefined') return;

      try {
        const url = `https://re-dev.seoulauction.com/api/app/insert-app-info`;
        const body = { os, version, deviceId };

        const result = await window.axios.post(url, body);
        window.flutter_inappwebview.callHandler('webviewSaveDeviceInfo', result.success);
      } catch (error) {
        window.flutter_inappwebview.callHandler('webviewSaveDeviceInfo', false);
      }
    }
    saveDeviceInfo();
  }

  /**
   * [Webview -> Native]
   * 토큰 저장
   * @param {string} token
   * @param {string} expriedAt
   * @param {number} custNo
   *
   * @requires
   * controller.addJavaScriptHandler(handlerName: 'setToken', callback: (args) {
   *   // args = ["toke nvalue...", "2022-01-01T23:59:59Z", 15000]
   * }
   */
  function nativeSetToken(token, expriedAt, custNo) {
    if (typeof window.flutter_inappwebview === 'undefined') return;

    const data = [
      token, // 토큰 값
      expriedAt, // 만료시간(UTC)
      custNo, // 회원 ID (CUST.CUST_NO)
    ];

    window.flutter_inappwebview.callHandler('setToken', ...data);
  }

  /**
   * [Webview -> Native]
   * 토큰 삭제
   *
   * @requires
   * controller.addJavaScriptHandler(handlerName: 'removeToken', callback: (args) {
   *   // args = [null]
   * }
   */
  function nativeRemoveToken() {
    if (typeof window.flutter_inappwebview === 'undefined') return;

    const data = [null];
    window.flutter_inappwebview.callHandler('removeToken', ...data);
  }
});