<?php
/**
 * Generates an HTML table from a database query.
 *
 * @param PDO $conn The database connection object.
 * @param array $query_info An associative array containing the query string and parameters.
 * @param bool $orders_table Indicates if the table is for orders and should include additional columns.
 *
 * @throws Exception If the query_info array is invalid.
 */
function to_data_table($conn, $query_info, $orders_table=FALSE) {
    try {
        if (!is_array($query_info) || !isset($query_info['query']) || !isset($query_info['params'])) {
            throw new Exception("Query info must be an array with 'query' and 'params' keys.");
        }
        
        $input_query = $query_info['query'];
        $params = $query_info['params'];

        $stmt = prepare_statement($conn, $input_query, $params);
        $rows = fetch_rows($stmt);

        if (!empty($rows)) {
            generate_table_header($stmt, $orders_table);
            generate_table_rows($rows, $orders_table);
        }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}

/**
 * Prepares a PDO statement and binds parameters.
 *
 * @param PDO $conn The database connection object.
 * @param string $query The SQL query string.
 * @param array $params An associative array of query parameters.
 * @return PDOStatement The prepared statement.
 */
function prepare_statement($conn, $query, $params) {
    $stmt = $conn->prepare($query);
    foreach ($params as $key => $val) {
        $stmt->bindValue($key, $val);
    }
    return $stmt;
}

/**
 * Executes a PDO statement and fetches all rows.
 *
 * @param PDOStatement $stmt The prepared PDO statement.
 * @return array An array of fetched rows.
 */
function fetch_rows($stmt) {
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

/**
 * Generates the header for an HTML table.
 *
 * @param PDOStatement $stmt The prepared PDO statement.
 * @param bool $orders_table Indicates if the table is for orders and should include additional columns.
 */
function generate_table_header($stmt, $orders_table) {
    echo "<thead><tr>";
    for ($i = 0; $i < $stmt->columnCount(); $i++) {
        $meta = $stmt->getColumnMeta($i);
        $column_name = $meta['name'];
        if (strpos($column_name, "Id") === false) {
            echo "<th>{$column_name}</th>";
        }
    }
    if ($orders_table) {
        echo "<th>Item list</th>";
    }
    echo "</tr></thead><tbody>";
}

/**
 * Generates the rows for an HTML table.
 *
 * @param array $rows: An array of fetched rows.
 * @param bool $orders_table: Indicates if the table is for orders and should include additional columns if this is the case.
 */
function generate_table_rows($rows, $orders_table) {
    foreach ($rows as $row) {
        $order_id = $row['OrderId'];
        $_SESSION['OrderId'][$order_id] = $order_id;
        
        echo "<tr>";
        foreach ($row as $key => $column) {
            if (strpos($key, "Id") === false) {
                echo "<td>{$column}</td>";
            }
        }
        if ($orders_table) {
            echo "<td><a href='profile.php?order_id={$order_id}'>Load Ordered Items</a></td>";
        }
        echo "</tr>";
    }
    echo "</tbody>";
}

/**
 * Constructs the query info array for fetching orders.
 *
 * @param PDO $conn The database connection object.
 * @param int $pk_col The primary key column value for the orders.
 * @return array The query info array containing the query string and parameters.
 */
function orders($conn, $pk_col) {
    $query = "SELECT * FROM orders WHERE UserId = :user_id";
    $params = [':user_id' => $_SESSION['user_id']];

    return ['query' => $query, 'params' => $params];
}

/**
 * Constructs the query info array for fetching ordered items.
 *
 * @param PDO $conn The database connection object.
 * @param int $order_id_val The order ID value for fetching ordered items.
 * @return array The query info array containing the query string and parameters.
 */
function ordered_items($conn, $order_id_val) { 
    $query = "SELECT 
        ordered_products.OrderId,
        products.Title,
        products.Price,
        ordered_products.ItemQuantity,
        ordered_products.TotalAmount
    FROM ordered_products
    LEFT JOIN orders ON ordered_products.OrderId = orders.OrderId
    LEFT JOIN products ON ordered_products.ProductId = products.ProductId
    WHERE orders.OrderId = :order_id";

    $params = [':order_id' => $order_id_val];

    return ['query' => $query, 'params' => $params];
}

?>