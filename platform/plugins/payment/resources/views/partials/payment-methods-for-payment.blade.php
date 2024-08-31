<div class="checkout-wrapper">
    <input type="hidden" name="name" value="{{ $name }}">
    <input type="hidden" name="amount" value="{{ $amount }}">
    <input type="hidden" name="currency" value="{{ $currency }}">
    @if (isset($returnUrl))
        <input type="hidden" name="return_url" value="{{ $returnUrl }}">
    @endif
    @if (isset($callbackUrl))
        <input type="hidden" name="callback_url" value="{{ $callbackUrl }}">
    @endif
    {!! apply_filters(PAYMENT_FILTER_PAYMENT_PARAMETERS, null) !!}
    @include('plugins/payment::partials.payment-methods')
</div>
