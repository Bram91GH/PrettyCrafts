<?php
/**
 * Start output buffering.
 * 
 * Output buffering allows you to capture the output of your script and manipulate it before sending it to the browser.
 * It's often used to prevent "headers already sent" errors or to modify output before it is sent to the client.
 * For example, you can use output buffering to store the output in a variable, or to compress it before sending it to the browser.
 */
ob_start();

/**
 * Start a new session or resume the existing session.
 * 
 * Sessions are used to store user data across multiple pages or requests.
 * When you start a session with session_start(), PHP will send a session cookie to the client (if it's not already sent),
 * and it will also start or resume a session on the server. 
 * You can then use the $_SESSION superglobal array to store and retrieve session data throughout the user's interaction with your website.
 */
session_start();

/*
 * Establish a database connection using PDO.
 * 
 * @param string $host The hostname of the database server.
 * @param string $db_name The name of the database.
 * @param string $user The username to connect to the database.
 * @param string $password The password to connect to the database.
 * @return PDO The PDO instance representing the database connection.
 */

function db_connect($host, $db_name, $user, $password) {
    // Data Source Name (DSN) specifying the database type, host, database name, and charset.
    $dsn = "mysql:host={$host};dbname={$db_name};charset=utf8mb4";

    // Create a new PDO instance and set error mode to exception.
    return new PDO($dsn, $user, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
}

// Establis a database connection get the credentials from external file.
$conn = db_connect("localhost", "ecom_db", "root", "");

// Include utility files for form validation, session management, and cart operations.
require_once("src/form_validation_utils.php");
require_once("src/message_utils.php");
require_once("src/cart_utils.php");
require_once("src/product_data_utils.php");
require_once("src/data_table_utils.php");

?>