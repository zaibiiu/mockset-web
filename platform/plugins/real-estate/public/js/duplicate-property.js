/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
var __webpack_exports__ = {};
/*!********************************************************************************!*\
  !*** ./platform/plugins/real-estate/resources/assets/js/duplicate-property.js ***!
  \********************************************************************************/


$(document).ready(function () {
  $(document).on('click', '.btn-duplicate-property', function (event) {
    var _this = this;
    event.preventDefault();
    var action = $(this).data('action');
    $.ajax({
      url: action,
      method: 'POST',
      beforeSend: function beforeSend() {
        $(_this).prop('disabled', true).addClass('button-loading');
      },
      success: function success(response) {
        if (!response.error) {
          Botble.showSuccess(response.message);
          setTimeout(function () {
            window.location.href = response.data.url;
          }, 500);
        } else {
          Botble.showError(response.message);
        }
      },
      error: function error(data) {
        Botble.handleError(data);
      },
      complete: function complete() {
        $(_this).prop('disabled', false);
        $(_this).removeClass('button-loading');
      }
    });
  });
});
/******/ })()
;