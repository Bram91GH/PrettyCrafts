<?php

/**
 * Fetches the next row from the provided PDO statement as an associative array.
 *
 * @param PDOStatement $send_query The PDO statement from which to fetch the row.
 * @return array|false The next row from the result set as an associative array, or false if there are no more rows.
 */
function fetch_array($send_query) {
    return $send_query->fetch(PDO::FETCH_ASSOC);
}

/**
 * Retrieves all products for a specified category from the database.
 *
 * If no category ID is provided via the 'id' GET parameter, it defaults to 1.
 *
 * @param PDO $conn The PDO connection object.
 * @return PDOStatement The PDO statement containing the products for the specified category.
 */
function products_by_category($conn) {
    $category_id = isset($_GET['id']) ? $_GET['id'] : 1;

    $query = "SELECT * FROM products 
                    INNER JOIN product_categories ON products.ProductId = product_categories.ProductId 
                    WHERE product_categories.CategoryId = :category_id";

    $stmt = $conn->prepare($query);
    $stmt->bindParam(':category_id', $category_id);
    $stmt->execute();

    return $stmt;
}

/**
 * Retrieves a product from the database by its ID.
 *
 * @param PDO $conn The PDO connection object.
 * @param int $id The ID of the product to retrieve.
 * @return PDOStatement The PDO statement containing the product information.
 */
function product_by_id($conn, $id) {
    $query = "SELECT * FROM products WHERE ProductId = :id";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->execute();

    return $stmt;
}

/**
 * Retrieves all categories from the database.
 *
 * @param PDO $conn The PDO connection object.
 * @return PDOStatement The PDO statement containing all categories.
 */
function get_categories($conn) {
    $query = "SELECT * FROM categories";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    return $stmt;
}

?>