/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*************************************************************************!*\
  !*** ./platform/plugins/real-estate/resources/assets/js/bulk-import.js ***!
  \*************************************************************************/
function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == _typeof(i) ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != _typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != _typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
var BulkImport = /*#__PURE__*/function () {
  function BulkImport() {
    var _this = this;
    _classCallCheck(this, BulkImport);
    _defineProperty(this, "isDownloading", false);
    _defineProperty(this, "$wrapper", $('.bulk-import'));
    this.$wrapper.on('submit', '#bulk-import-form', function (event) {
      _this.submit(event);
    }).on('click', '.download-template', function (event) {
      _this.download(event);
    });
  }
  return _createClass(BulkImport, [{
    key: "submit",
    value: function submit(event) {
      event.preventDefault();
      var $form = $(event.currentTarget);
      var formData = new FormData($form.get(0));
      var $button = $form.find('button[type=submit]');
      var $failuresList = this.$wrapper.find('#failures-list');
      var $alert = this.$wrapper.find('.alert');
      $.ajax({
        url: $form.attr('action'),
        type: $form.attr('method'),
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        beforeSend: function beforeSend() {
          $button.prop('disabled', true).addClass('button-loading');
          $alert.hide();
          $failuresList.hide();
          $failuresList.find('tbody').html('');
        },
        success: function success(data) {
          $alert.show();
          if (data.error) {
            Botble.showError(data.message);
            var result = '';
            _.map(data.data, function (item) {
              result += "<tr>\n                            <td>".concat(item.row, "</td>\n                            <td>").concat(item.attribute, "</td>\n                            <td>").concat(item.errors.join(', '), "</td>\n                        </tr>");
            });
            $failuresList.show();
            $failuresList.find('tbody').html(result);
            $alert.removeClass('alert-success').addClass('alert-danger').html(data.message);
          } else {
            $alert.removeClass('alert-danger').addClass('alert-success').html(data.data.message);
            Botble.showSuccess(data.message);
          }
          $form.get(0).reset();
        },
        error: function error(data) {
          Botble.handleError(data);
        },
        complete: function complete() {
          $button.prop('disabled', false);
          $button.removeClass('button-loading');
        }
      });
    }
  }, {
    key: "download",
    value: function download(event) {
      var _this2 = this;
      event.preventDefault();
      if (this.isDownloading) {
        return;
      }
      var $this = $(event.currentTarget);
      var extension = $this.data('extension');
      var $content = $this.html();
      $.ajax({
        url: $this.data('url'),
        method: 'POST',
        data: {
          extension: extension
        },
        xhrFields: {
          responseType: 'blob'
        },
        beforeSend: function beforeSend() {
          $this.html($this.data('downloading'));
          $this.addClass('text-secondary');
          _this2.isDownloading = true;
        },
        success: function success(data) {
          var anchor = document.createElement('a');
          var url = window.URL.createObjectURL(data);
          anchor.href = url;
          anchor.download = $this.data('filename');
          document.body.append(anchor);
          anchor.click();
          anchor.remove();
          window.URL.revokeObjectURL(url);
        },
        error: function error(data) {
          Botble.handleError(data);
        },
        complete: function complete() {
          setTimeout(function () {
            $this.html($content);
            $this.removeClass('text-secondary');
            _this2.isDownloading = false;
          }, 500);
        }
      });
    }
  }]);
}();
$(function () {
  return new BulkImport();
});
/******/ })()
;