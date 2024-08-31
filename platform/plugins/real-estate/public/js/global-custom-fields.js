/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!**********************************************************************************!*\
  !*** ./platform/plugins/real-estate/resources/assets/js/global-custom-fields.js ***!
  \**********************************************************************************/
function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == _typeof(i) ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != _typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != _typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
$(document).ready(function () {
  var CustomField = /*#__PURE__*/function () {
    function CustomField() {
      _classCallCheck(this, CustomField);
      _defineProperty(this, "$customFieldOptions", $('#custom-field-options'));
      _defineProperty(this, "$customFieldsBox", $('#custom_fields_box'));
    }
    return _createClass(CustomField, [{
      key: "init",
      value: function init() {
        this.sortable();
        this.handleType();
        this.addNewRow();
        this.removeRow();
      }
    }, {
      key: "handleType",
      value: function handleType() {
        var $customFieldsBox = this.$customFieldsBox;
        var $type = $('.custom-field-type');
        if ($type.val() === 'dropdown') {
          this.$customFieldsBox.show();
        } else {
          this.$customFieldsBox.hide();
        }
        $type.change(function () {
          if ($(this).val() === 'dropdown') {
            $customFieldsBox.show();
            return;
          }
          $customFieldsBox.hide();
        });
      }
    }, {
      key: "sortable",
      value: function sortable() {
        $('.option-sortable').sortable({
          stop: function stop() {
            $('.option-sortable').sortable('toArray', {
              attribute: 'data-index'
            }).map(function (id, index) {
              $('.option-row[data-index="' + id + '"]').find('.option-order').val(index);
            });
          }
        });
      }
    }, {
      key: "addNewRow",
      value: function addNewRow() {
        this.$customFieldOptions.on('click', '#add-new-row', function () {
          var table = $(this).parent().find('table tbody');
          var tr = table.find('tr').last().clone();
          var label = 'options[' + table.find('tr').length + '][label]';
          var value = 'options[' + table.find('tr').length + '][value]';
          tr.find('.option-label').val('').attr('name', label);
          tr.find('.option-value').val('').attr('name', value);
          table.append(tr);
        });
      }
    }, {
      key: "removeRow",
      value: function removeRow() {
        this.$customFieldOptions.on('click', '.remove-row', function () {
          var self = $(this).parent().parent();
          var parent = self.parent();
          var tr = parent.find('tr');
          if (tr.length <= 1) {
            tr.find('.option-label').val('');
            tr.find('.option-value').val('');
            return;
          }
          self.remove();
        });
      }
    }]);
  }();
  new CustomField().init();
});
/******/ })()
;