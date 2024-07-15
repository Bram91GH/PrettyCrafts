<?php 
// Include the configuration file to establish a database connection
require_once("../config.php");

// Include the shared layout file for consistent page layout and structure
include("shared/layout.php");

?>
<div class="dashboard-header">
    <div class="dashboard-link">
<?php 
// Fetch the categories from the database
$stmt_categories = get_categories($conn);

// Loop through each category and create a link for it
while($row = fetch_array($stmt_categories)) :
?>

<!-- Create anchor tag for each category with the category ID as a URL parameter -->
<a href='index.php?id=<?php echo $row['CategoryId']; ?>'><?php echo $row['CategoryTitle']; ?></a>
<?php endwhile ?>
    </div>
</div>

<!-- Container for displaying items -->
<div class="Items">
    <?php 
    // Fetch products based on the selected category from the database
    $stmt_products = products_by_category($conn);

    // Loop through each product and display its details
    while ($row = fetch_array($stmt_products)) :
    ?>

    <!-- Display individual product details within a container -->
    <div class="Item">
        <!-- Link to the product details page with the product ID as a URL parameter -->
        <a href="/views/product_details.php?id=<?php echo $row['ProductId']; ?>" class="Item__link">

            <!-- Container for the product image -->
            <div class="ImageContainer">
                <img src='<?php echo $row['ProductImage']; ?>' class="Image">
            </div>

            <!-- Display product properties -->
            <div class="Item__title"><?php echo $row['Title']; ?></div>
            <div class="Item__price">€<?php echo $row['Price']; ?></div>
            
            <!-- Link to add the product to the cart with the product ID as a URL parameter -->
            <div class="Item__price"><a href="/views/cart.php?add=<?php echo $row['ProductId']; ?>">Add to Cart</a></div>
        </a>
    </div>

    <?php endwhile ?>
</div>