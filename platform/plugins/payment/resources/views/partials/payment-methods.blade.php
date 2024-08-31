<ul class="list-group list_payment_method">
    {!! apply_filters(PAYMENT_FILTER_PAYMENT_FORM, null, [
        'name' => $name,
        'amount' => $amount,
        'currency' => $currency,
        'selected' => PaymentMethods::getSelectedMethod(),
        'default' => PaymentMethods::getDefaultMethod(),
        'selecting' => PaymentMethods::getSelectingMethod(),
     ]) !!}

    {!! PaymentMethods::render() !!}
</ul>

