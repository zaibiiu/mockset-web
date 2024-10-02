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

$(document).ready(function() {
    $('select[data-toggle-target]').each(function() {
        var $select = $(this);
        var targetSelector = $select.data('toggle-target');
        var visibleStatuses = $select.data('visible-statuses') ? $select.data('visible-statuses').split(' ') : [];

        var $target = $(targetSelector).closest('.form-group');

        function toggleTarget() {
            var selectedValue = $select.val();
            if (visibleStatuses.includes(selectedValue)) {
                $target.removeClass('hidden');
            } else {
                $target.addClass('hidden');
                $(targetSelector).val('');
            }
        }

        toggleTarget();

        $select.on('change', function() {
            toggleTarget();
        });
    });
});

$(document).ready(function() {
    $('select[data-toggle-targets]').each(function() {
        var $select = $(this);
        var targetSelectors = $select.data('toggle-targets').split(','); // Split into an array
        var visibleStatuses = $select.data('visible-statuses') ? $select.data('visible-statuses').split(' ') : [];

        function toggleTargets() {
            var selectedValue = $select.val();
            targetSelectors.forEach(function(targetSelector) {
                var $target = $(targetSelector).closest('.form-group');
                if (visibleStatuses.includes(selectedValue)) {
                    $target.removeClass('hidden');
                } else {
                    $target.addClass('hidden');
                    $(targetSelector).val(''); // Reset the value if hiding
                }
            });
        }

        // Initial check
        toggleTargets();

        // Event handler for changes
        $select.on('change', function() {
            toggleTargets();
        });
    });
});
