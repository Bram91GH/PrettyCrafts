<?php 
require_once("../../config.php");
include("../shared/layout.php");

?>

<?php
// Retrieve product details from the database using the ProductId from the URL parameter
$stmt = product_by_id($conn, $_GET['id']);

// Fetch and display the product details
while($row = fetch_array($stmt)) :

?>

<div class="container-details">
    <div class="product-image">
        <img src='<?php echo $row['ProductImage']; ?>' alt="Ripcurl 3D Icon Tee Tapestry Marle">
    </div>
    <div class="product-details">
        <h1 class="title"><?php echo $row['Title']; ?></h1>
        <ul class="description">
            <p class="price"><?php echo $row['Price']; ?></p>
            <li><?php echo $row['Description']; ?> </li>
        </ul>
        <a href="cart.php?add=<?php echo $row['ProductId']; ?>" > Add to Cart</a>
    </div>
</div>

<?php endwhile ?>