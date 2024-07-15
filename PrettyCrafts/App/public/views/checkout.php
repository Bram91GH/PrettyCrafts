<?php 
require_once("../../config.php");
include("../shared/layout.php");

$message_only = false;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_SESSION['user_id'])) { 
        process_checkout($conn);
    } else { 
        set_message("Please create an account or log in to checkout.");
        $message_only = true;
    }
} else {
    set_message("Please place an order before accessing the checkout page.");
    $message_only = true;
}
?>

<div class="container-wrapper">
    <?php if ($message_only): ?>
        <div class="message-container">
            <p><?php display_message(); ?></p>
        </div>
    <?php else: ?>
        <div class="confirmation-container">
            <h1>Thank You for Shopping with <span class="highlight">Pretty Crafts</span></h1>
            <p>Your order has been received, processed and is on its way!</p>
            <p class="order-status">Order Status: Shipped</p>
        </div>
    <?php endif; ?>
</div>