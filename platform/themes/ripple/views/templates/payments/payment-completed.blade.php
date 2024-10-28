<div class="payment-completed-card">
    <div class="icon-container">
        <div class="check-icon"></div>
    </div>
    <h2>Payment Completed Successfully</h2>
    <div class="payment-details">
        <p><strong>Charge ID:</strong> {{ $paymentCompleted['chargeId'] }}</p>
        <p><strong>Amount:</strong> {{ number_format($paymentCompleted['amount'], 2) }} {{ $paymentCompleted['paper']->currency }}</p>
        <p><strong>Paper Name:</strong> {{ $paymentCompleted['paper']->name }}</p>
    </div>
    <a href="/" class="btn">Return Home to Access Your Purchased Paper</a>
</div>


<style>
    .payment-completed-card {
        background-color: #f1f3f4;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        max-width: 500px; /* Set max width for better presentation */
        margin: 40px auto; /* Center card horizontally */
        font-family: 'Arial', sans-serif; /* Change font for better readability */
        text-align: center; /* Center text for better presentation */
    }

    .icon-container {
        margin-bottom: 20px;
    }

    .check-icon {
        width: 50px; /* Set width for the check icon */
        height: 50px; /* Set height for the check icon */
        background-color: dodgerblue; /* Dodger Blue background */
        border-radius: 50%; /* Circle shape */
        display: flex;
        align-items: center;
        justify-content: center;
        color: white; /* Icon color */
        font-size: 24px; /* Icon size */
        font-weight: bold;
    }

    .check-icon::before {
        content: '✔'; /* Checkmark character */
    }

    .payment-completed-card h2 {
        color: black; /* Change heading color to black */
        font-size: 26px;
        margin-bottom: 20px;
    }

    .payment-details {
        margin-top: 20px;
    }

    .payment-details p {
        font-size: 18px;
        margin: 8px 0;
        color: black; /* Change text color to black */
    }

    .btn {
        display: inline-block;
        margin-top: 30px;
        padding: 12px 20px;
        color: white;
        background-color: dodgerblue; /* Dodger Blue background */
        border: none;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s, transform 0.3s; /* Add transition for hover effect */
    }

    .btn:hover {
        background-color: #1e90ff; /* Darker blue on hover */
        transform: translateY(-2px); /* Slight lift effect on hover */
    }

</style>
