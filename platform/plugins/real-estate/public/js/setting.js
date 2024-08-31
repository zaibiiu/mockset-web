/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*********************************************************************!*\
  !*** ./platform/plugins/real-estate/resources/assets/js/setting.js ***!
  \*********************************************************************/
$(document).ready(function () {
  $('input.setting-selection-option').each(function (index, el) {
    var $settingContentContainer = $($(el).data('target'));
    $(el).on('change', function () {
      if ($(el).val() === '1') {
        $settingContentContainer.removeClass('d-none');
        Botble.initResources();
      } else {
        $settingContentContainer.addClass('d-none');
      }
    });
  });
});
/******/ })()
;