class Dependent {
    constructor($block) {
        this.$block = $block;
        this.documentField = $('#quiz_manager_id');
        this.models = null;
        this.init();
    }

    init() {
        this.documentField.on('change', (e) => {
            e.preventDefault();
            let ele = $(e.currentTarget);
            let val = ele.val();
            if (!val) return;

            const $button = $(e.currentTarget).closest('form').find('button[type=submit], input[type=submit]');
            let callBack = ele.data('callBack');
            let dependent = ele.data('dependent');

            $.ajax({
                url: ele.data('url'),
                data: { id: val },
                type: 'GET',
                beforeSend: () => {
                    if ($button) $button.prop('disabled', true);
                },
                success: (res) => {
                    if (res.error) {
                        Botble.showError(res.message);
                    } else {
                        this.models = res.data;
                        if (!callBack) {
                            let options = '<option value="">Select</option>';
                            $.each(res.data, (index, item) => {
                                options += `<option value="${item.id}">${item.name}</option>`;
                            });
                            $('#' + dependent).empty().html(options).trigger('change');
                        }
                    }
                },
                complete: () => {
                    if ($button) $button.prop('disabled', false);
                },
            });
        });
    }
}

$(document).ready(function () {
    new Dependent($('.dependent'));
});
