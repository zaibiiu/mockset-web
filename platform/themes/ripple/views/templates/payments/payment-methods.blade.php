<div class="container mt-5 mb-5">
    <div class="row">
        <!-- Payment Method Section -->
        <div class="col-md-6 col-12 border-end">
            <h4 class="mb-4" style="font-weight: 600; color: #333;">Select Payment Method</h4>

            <form action="{{ route('public.paper.make-payment', $paper->id) }}" method="post">
                @csrf

                @php
                    Theme::asset()->container('footer')->add('payment', 'vendor/core/plugins/payment/js/payment.js');
                @endphp

                <link rel="stylesheet" href="{{ asset('vendor/core/plugins/payment/css/payment.css') }}?v=1.1.0">

                <!-- Payment Methods Section -->
                @include('plugins/payment::partials.payment-methods-for-payment', [
                    'action' => route('public.paper.make-payment', $paper->id),
                    'currency' => cms_currency()->getDefaultCurrency()->title,
                    'amount' => $amount,
                    'name' => $name,
                    'returnUrl' => route('public.paper.payment', $paper->id),
                    'callbackUrl' => route('public.paper.cancel', $paper->id),
                ])

                <!-- Pay Now Button -->
                <button type="submit" class="btn btn-primary btn-lg w-100 mt-4" style="padding: 12px 20px;">
                    <i class="fas fa-credit-card me-2"></i> Pay Now
                </button>
            </form>
        </div>

        <!-- Paper Details Section -->
        <div class="col-md-6 col-12 mt-4 mt-md-0 d-flex align-items-center">
            <div class="card shadow-lg w-100 p-4 rounded-3">
                <h5 class="mb-3" style="font-weight: 600; color: #333;">Paper Details</h5>

                <ul class="list-unstyled mb-3" style="line-height: 1.8; font-size: 16px;">
                    <li><strong>Paper Name:</strong> {{ $paper->name }}</li>
                    <li><strong>Price:</strong> {{ format_price($amount) }}</li>
                    <li>
                        <strong>Allowed Attempts:</strong>
                        {{ $paper->allowed_attempts }} per payment
                    </li>
                </ul>

                <div class="alert alert-info" role="alert" style="font-size: 15px;">
                    <i class="fas fa-info-circle me-2"></i>
                    Each payment grants you <strong>{{ $paper->allowed_attempts }}</strong> attempt(s) to complete the paper.
                    Ensure you utilize all attempts within the allocated time.
                </div>

                <hr class="my-3">

                <div class="alert alert-danger mt-3" role="alert" style="font-size: 14px;">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Please review the paper details carefully before proceeding with payment. If you encounter any issues, feel free to contact support.
                </div>

            </div>
        </div>
    </div>
</div>
