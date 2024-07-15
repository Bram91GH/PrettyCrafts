<?php
/**
 * Handles adding, decrementing, and deleting items in the shopping cart based on URL parameters.
 
 * functions: item_to_cart, decrement_item, and delete_cart_item. Each function interacts with the session
 * variables to modify the cart's contents accordingly.
 *
 * - item_to_cart: Adds an item to the cart or updates the quantity if the item already exists.
 * - decrement_item: Decrements the quantity of an item in the cart.
 * - delete_cart_item: Removes an item from the cart completely.
 *
 * @param PDO $conn The PDO database connection object.
 */

if (isset($_GET['add'])) {
    item_to_cart($conn, $_GET['add']);
}

if (isset($_GET['decrement'])) {
    decrement_item($conn, $_GET['decrement']);
}

if (isset($_GET['delete'])) {
    delete_cart_item($conn, $_GET['delete']);
}

/**
 * Adds an item to the cart or increments the quantity if the item already exists in the cart.
 *
 * @param PDO $conn The PDO database connection object.
 * @param int $add The ID of the product to be added to the cart.
 * 
 * @return void
 */
function item_to_cart($conn, $add) {
    if (isset($add)) {
        $add_item = $add;

        $query = "SELECT * FROM Products WHERE ProductId = :add_item";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':add_item', $add_item, PDO::PARAM_INT);
        $stmt->execute();

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            if ($row['ProductQuantity'] != $_SESSION['product_' . $add]) {
                $_SESSION['product_' . $add] += 1;
                redirect("cart.php");
            } else {
                set_message("We only have " . $row['ProductQuantity'] . " available.");
                redirect("cart.php");
            }
        }
    }
}

/**
 * Decrements the quantity of an item in the cart. If the quantity drops below 1, the item is removed from the cart.
 *
 * @param PDO $conn The PDO database connection object.
 * @param int $decrement The ID of the product to be decremented.
 * 
 * @return void
 */
function decrement_item($conn, $decrement) {
    if (isset($decrement)) {
        $_SESSION['product_' . $_GET['decrement']]--;
        if ($_SESSION['product_' . $_GET['decrement']] < 1) {
            redirect("cart.php");
        } else {
            redirect("cart.php");
        }
    }
}

/**
 * Removes an item from the cart by setting its quantity to 0.
 *
 * @param PDO $conn The PDO database connection object.
 * @param int $delete The ID of the product to be removed from the cart.
 * 
 * @return void
 */
function delete_cart_item($conn, $delete) {
    if (isset($delete)) {
        $_SESSION['product_' . $_GET['delete']] = '0';
        redirect("cart.php");
    }
}

/**
 * Generates the content of the shopping cart, calculates the order total and item quantity
 * and displays the cart items in an HTML table format.
 *
 * This function iterates over the session variables to find cart items, retrieves product 
 * information from the database, calculates the subtotal for each product, and generates 
 * the HTML to display the cart items. It also updates the session variables for the total 
 * order price and the total number of items in the cart.
 *
 * @param PDO $conn The PDO database connection object.
 * 
 * @return void
 */
function cart_content($conn) {
    $order_total = 0;
    $item_quantity = 0;

    foreach ($_SESSION as $product_id => $quantity) {
        if (substr($product_id, 0, 8) == "product_" && $quantity > 0) {
            
            $session_product_id = substr($product_id, 8);
            $stmt = product_by_id($conn, $session_product_id);

            while ($row = fetch_array($stmt)) {

                $sub_total = $row['Price'] * $quantity;
                $item_quantity += $quantity;

                $product = <<<DELIMETER
                <tr>
                    <td>{$row['Title']}</td>
                    <td>{$row['Price']}</td>
                    <td>{$quantity}</td>
                    <td>{$sub_total}</td>
                    <td>
                        <a class="add-icon" href="cart.php?add={$row['ProductId']}">
                            <i class="fas fa-plus-circle"></i>
                        </a> 
                        <a class="decrement-icon" href="cart.php?decrement={$row['ProductId']}">
                            <i class="fas fa-minus-circle"></i>
                        </a> 
                        <a class="delete-icon" href="cart.php?delete={$row['ProductId']}">
                            <i class="fas fa-trash"></i>
                        </a>
                    </td>
                </tr>
                DELIMETER;

                echo $product;
                $order_total += $sub_total;
            }
        }
    }
    
    // create session variables for the total amount of items and the total price of the cart items. 
    $_SESSION['order_total'] = $order_total;
    $_SESSION['total_items'] = $item_quantity;
}

/**
 * Process the checkout for the current session's cart.
 *
 * Checks if the cart is not empty, inserts an order into the database,
 * inserts ordered products into the database, and clears the cart session.
 *
 * @param PDO $conn The PDO connection object.
 */
function process_checkout($conn) {
    if (cart_not_empty($_SESSION)) {
        $user_id = get_user_id($_SESSION);
        $order_datetime = get_current_datetime();
        $order_status = 'Shipped';
        $payment_method = 'Credit Card';

        // Insert order into the orders table
        $order_id = insert_order($conn, $user_id, $order_status, $order_datetime, $payment_method);

        if ($order_id !== false) {
            insert_ordered_products($conn, $order_id, $_SESSION);
            clear_cart_session($_SESSION);
        } else {
            echo "Failed to process the order. Please try again.";
        }
    } else {
        echo "Your cart is empty!";
    }
}

/**
 * Insert an order into the orders table.
 *
 * @param PDO $conn The PDO connection object.
 * @param int $user_id The user ID associated with the order.
 * @param string $order_status The status of the order.
 * @param string $order_datetime The date and time of the order.
 * @param string $payment_method The payment method used for the order.
 * @return int|false The ID of the inserted order, or false on failure.
 */
function insert_order($conn, $user_id, $order_status, $order_datetime, $payment_method) {
    $query = "INSERT INTO orders (UserId, OrderStatus, OrderDatetime, PaymentMethod) 
              VALUES (:user_id, :order_status, :order_datetime, :payment_method)";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':order_status', $order_status);
    $stmt->bindParam(':order_datetime', $order_datetime);
    $stmt->bindParam(':payment_method', $payment_method);
    
    if ($stmt->execute()) {
        return $conn->lastInsertId();
    } else {
        return false;
    }
}

/**
 * Insert ordered products into the ordered_products table.
 *
 * Iterates through the session's cart items, retrieves product data,
 * calculates total amounts, and inserts each product into the database.
 *
 * @param PDO $conn The PDO connection object.
 * @param int $order_id The ID of the order to which products are associated.
 * @param array $session The session containing cart items.
 */
function insert_ordered_products($conn, $order_id, $session) {
    $query = "INSERT INTO ordered_products (OrderId, ProductId, ItemQuantity, TotalAmount) 
              VALUES (:order_id, :product_id, :item_quantity, :total_amount)";
    $stmt = $conn->prepare($query);

    foreach ($session as $session_key => $item_quantity) {
        if (substr($session_key, 0, 8) == "product_" && $item_quantity > 0) {
            $product_id = substr($session_key, 8);
            $product_data = product_by_id($conn, $product_id);

            while ($row = fetch_array($product_data)) {
                if ($row) {
                    $total_amount = $item_quantity * $row['Price'];

                    $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
                    $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);
                    $stmt->bindParam(':item_quantity', $item_quantity, PDO::PARAM_INT);
                    $stmt->bindParam(':total_amount', $total_amount);

                    $stmt->execute();
                }
            }
        }
    }
}

/**
 * Check if the cart in the session is not empty.
 *
 * @param array $session The session containing cart items.
 * @return bool True if the cart is not empty, false otherwise.
 */
function cart_not_empty($session) {
    return isset($session['total_items']) && $session['total_items'] > 0;
}

/**
 * Retrieve the user ID from the session.
 *
 * @param array $session The session containing user information.
 * @return int The user ID.
 */
function get_user_id($session) {
    return intval($session['user_id']);
}

/**
 * Get the current date and time formatted as 'Y-m-d H:i:s'.
 *
 * @return string The current date and time.
 */
function get_current_datetime() {
    return (new DateTime())->format('Y-m-d H:i:s');
}

/**
 * Clear the cart-related session variables.
 *
 * Removes 'total_items', 'order_total', and 'product_' prefixed keys from the session.
 *
 * @param array $session The session to clear.
 */
function clear_cart_session(&$session) {
    unset($session['total_items']);
    unset($session['order_total']);
    foreach ($session as $key => $value) {
        if (substr($key, 0, 8) == "product_") {
            unset($session[$key]);
        }
    }
}

?>