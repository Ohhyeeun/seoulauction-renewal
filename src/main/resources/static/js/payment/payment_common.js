$(function() {

   let func = async function(){
      let result = await isNativeApp();

      //네이티브 앱으로 판단되면 헤더 푸터 제거 작업.
      if (result) {
         $('.main-header').hide();
         $('.footer').hide();
      }
   }
   func();

});