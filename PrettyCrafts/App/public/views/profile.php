<?php 
require_once("../../config.php");
include("../shared/layout.php");

// Check if the user is logged in
if(!isset($_SESSION['user_id']) || !isset($_SESSION['username'])) {
    redirect("login.php");
    exit();
}

// Handle logout form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    logout_user();
}
?>

<?php 

// Retrieve the order ID from the URL parameter, default to 0 if not set.
$order_id = isset($_GET['order_id']) ? $_GET['order_id'] : 0;

// Fetch the orders and ordered items using the given connection and order ID.
$orders = orders($conn, $order_id);
$ordered_items = ordered_items($conn, $order_id);

?>

<!-- Dashboard Header Section -->
<div class="dashboard-header">
    <!-- Display the welcome message with the username -->
    <h1>Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?></h1>
    <!-- Logout form -->
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" style="display: inline;">
        <button type="submit" class="logout-button">Logout</button>
    </form>
</div>

<!-- Main Dashboard Container -->
<div class="dashboard-container">
    <!-- Order History Section -->
    <div class="dashboard-section">
        <h2>Order History</h2>
        <table id="order_history" class="display">
            <!-- Convert the orders data into a table format -->
            <?php to_data_table($conn, $orders, $orders_table=TRUE); ?>
        </table>
    </div>

    <!-- Ordered Items Section -->
    <div class="dashboard-section">
        <h2>Ordered Items</h2>
        <table id="order_items" class="display">
            <!-- Convert the ordered items data into a table format -->
            <?php to_data_table($conn, $ordered_items); ?>
        </table>
    </div>
</div>

<!-- DataTables Initialization Script -->
<script>
    $(document).ready(function() {
        // Initialize DataTable for order history with paging, searching, and info features
        $('#order_history').DataTable({
            "paging": true,
            "searching": true,
            "info": true
        });
        // Initialize DataTable for ordered items without ordering, paging, and info features
        $('#order_items').DataTable({
            "ordering": false,
            "paging": false,
            "info": false
        });
    });
</script>