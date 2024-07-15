<?php 
require_once("../../config.php");
include("../shared/layout.php");
?>

<div class="container-checkout">
    <div class="row">
        <h1>Your Items</h1>
        <form action="">
            <table class="table-checkout">
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Sub-total</th>
                    <th class="quantity-exceed-msg"><?php display_message(); ?></th>
                </tr>
                </thead>
                <tbody>
                    <?php cart_content($conn); ?>
                </tbody>
            </table>
        </form>

        <!-- Cart Totals -->
        <div class="col-xs-4 pull-right cart-totals">
            <h2>Cart Totals</h2>
            <table class="table-checkout" cellspacing="0">
                <tbody>
                <tr class="cart-subtotal">
                    <th>Items:</th>
                    <td><span class="amount"><?php echo isset($_SESSION['total_items']) ? $_SESSION['total_items'] : '0'; ?></span></td>
                </tr>
                <tr class="shipping">
                    <th>Shipping and Handling</th>
                    <td>Free Shipping</td>
                </tr>
                <tr class="order-total">
                    <th>Order Total</th>
                    <td><strong><span class="amount"><?php echo isset($_SESSION['order_total']) ? $_SESSION['order_total'] : '0'; ?></span></strong></td>
                </tr>
                </tbody>
            </table>
        </div><!-- Cart Totals -->

        <form action="/views/checkout.php" method="post">
            <button type="submit" class="checkout-btn">Proceed to Checkout</button>
        </form>

    </div><!-- Main Content -->
</div>