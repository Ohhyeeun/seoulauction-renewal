/**
 * Native 연동 인터페이스
 */
$(function() {
  console.log('load native.js');

  // 네이티브 웹뷰 초기화
  window.isFlutterInAppWebViewReady = false;
  window.addEventListener('flutterInAppWebViewPlatformReady', function(e) {
    window.isFlutterInAppWebViewReady = true;
  });

  // 모바일
  if (window.innerWidth < 576) {
    const footerContainer = document.querySelector('footer .innerfooter');
    if (!footerContainer) return;

    const button1 = makeButton('getAppHeader', () => {
      getAppHeader().then(result => {
        console.log(JSON.stringify(result));
      });
    });

    const button2 = makeButton('getDeviceInfo', () => {
      getDeviceInfo().then(result => {
        console.log(JSON.stringify(result));
      });
    });

    const button3 = makeButton('setWebviewData(sample-data)', () => {
      setWebviewData('sample-data', Date.now() + '').then(result => {
        console.log(JSON.stringify(result));
      });
    });

    const button4 = makeButton('getWebviewData(sample-data)', () => {
      getWebviewData('sample-data').then(result => {
        console.log(JSON.stringify(result));
      });
    });

    const button5 = makeButton('deleteWebviewData(sample-data)', () => {
      deleteWebviewData('sample-data').then(result => {
        console.log(JSON.stringify(result));
      });
    });

    const button6 = makeButton('openWebBrowser::seoulauction.com', () => {
      openWebBrowser('https://seoulauction.com').then(result => {
        console.log(JSON.stringify(result));
      });
    });

    const button7 = makeButton('saveDeviceInfo', () => {
      saveDeviceInfo().then(result => {
        console.log(JSON.stringify(result));
      });
    });

    const button8 = makeButton('isNativeApp', () => {
      isNativeApp().then(result => {
        console.log(JSON.stringify(result));
      });
    });

    footerContainer.appendChild(button1);
    footerContainer.appendChild(button2);
    footerContainer.appendChild(button3);
    footerContainer.appendChild(button4);
    footerContainer.appendChild(button5);
    footerContainer.appendChild(button6);
    footerContainer.appendChild(button7);
    footerContainer.appendChild(button8);

    function makeButton(text, onClickHandler) {
      const button = document.createElement('button');
      button.style.marginTop = '0.5rem';
      button.style.color = '#fff';
      button.style.display = 'block';
      button.style.width = '100%';
      button.style.fontSize = '13px';
      button.textContent = text;

      button.addEventListener('click', e => {
        e.preventDefault();
        onClickHandler();
      }, { passive: false });
      return button;
    }
  }
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
  console.log("remember-me cookie : " + getCookie('remember-me'));
  try {
    const result = await window.flutter_inappwebview.callHandler('getAppHeader', '');
    console.log(JSON.stringify(result));
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
    const result = await window.flutter_inappwebview.callHandler('getDeviceInfo', '');
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

// -------------------------------------------------------------------
// Native 호출 함수
// -------------------------------------------------------------------

/**
 * [Webview -> Native]
 * 앱의 헤더 조회
 */
async function getAppHeader() {
  try {
    return await window.flutter_inappwebview.callHandler('getAppHeader');
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 기기 ID 및 버전 정보 조회
 */
async function getDeviceInfo() {
  try {
    return await window.flutter_inappwebview.callHandler('getDeviceInfo');
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 앱에 데이터를 저장
 */
async function setWebviewData(key, value) {
  try {
    return await window.flutter_inappwebview.callHandler('setWebviewData', key, value);
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 앱에 저장된 데이터를 조회
 */
async function getWebviewData(key) {
  try {
    return await window.flutter_inappwebview.callHandler('getWebviewData', key);
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 앱에서 데이터를 삭제
 */
async function deleteWebviewData(key) {
  try {
    return await window.flutter_inappwebview.callHandler('deleteWebviewData', key);
  } catch (error) {
    return null;
  }
}

/**
 * [Webview -> Native]
 * 기본 브라우저로 열기
 */
async function openWebBrowser(url) {
  try {
    return await window.flutter_inappwebview.callHandler('openWebBrowser', url);
  } catch (error) {
    return null;
  }
}
