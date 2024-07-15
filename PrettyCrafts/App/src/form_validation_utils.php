<?php
/**
 * Logs in a user by validating credentials and setting session variables.
 *
 * @param PDO $conn The PDO database connection object.
 * @return void
 */
function login_user($conn) {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve form data (login request)
        $username = $_POST['username'];
        $password = $_POST['password'];

        $sql = "SELECT UserId, Username, Password FROM users WHERE Username = :username";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();

        // Fetch the user record
        if ($stmt->rowCount() > 0) {
            $user = fetch_array($stmt);
            $user_id = $user['UserId'];
            $hashed_password = $user['Password'];

            // Verify that the password entered by the user matches the hash value in the database.
            if (password_verify($password, $hashed_password)) {
                // Debugging: Password verification successful
                echo "Password verification successful.<br>";

                // Set session variables
                session_start();
                $_SESSION['user_id'] = $user_id;
                $_SESSION['username'] = $username;

                // Redirect to home page.
                header("Location: /index.php");
                exit();
            } else {
                set_message("Incorrect password.");
                redirect("login.php");
            }
        } else {

            set_message("Your username or password is not correct.");
            redirect("login.php");
        }
    }
}

/**
 * Logs out the user by destroying all session data and redirecting to the login page.
 *
 * @return void
 */
function logout_user() {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Destroy all session data
        session_start();
        session_unset();
        session_destroy();

        // Redirect to login page
        header("Location: login.php");
        exit();
    }
}

/**
 * Registers a new user by validating inputs and inserting the user into the database.
 *
 * @param PDO $conn The PDO database connection object.
 * @return void
 */
function register_user($conn) {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Retrieve form data after post request.
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $confirm_password = $_POST['confirm_password'];

        // Validate form data before submitting
        $firstname = sanitize_input($firstname);
        $lastname = sanitize_input($lastname);
        $username = sanitize_input($username);
        
        $password = sanitize_input($password);
        $confirm_password = sanitize_input($confirm_password);

        // Allow special char @ to store the email correctly.
        $email = filter_var($email, FILTER_SANITIZE_EMAIL);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo "Invalid email address.";
            return;
        }

        // Check if username is not taken.
        if (username_exists($conn, $username)) {
            echo "That username is already taken";
            return;
        }

        // Validate passwords
        if (!validate_passwords($password, $confirm_password)) {
            echo "Passwords do not match!";
            return;
        }

        // Hash the password
        $hashed_password = hash_password($password);

        // Insert user into database using prepared statement
        $sql = "INSERT INTO users (Firstname, Lastname, Username, Email, Password) VALUES (:firstname, :lastname, :username, :email, :password)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':firstname', $firstname);
        $stmt->bindParam(':lastname', $lastname);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $hashed_password);

        try {
            if ($stmt->execute()) {
                echo "User registered successfully!";
            } else {
                echo "Error registering user.";
            }
        } catch (PDOException $e) {
            // Log error or handle it as needed
            echo "Error: " . $e->getMessage();
        }
    }
}

/**
 * Checks if a username already exists in the database.
 *
 * @param PDO $conn The PDO database connection object.
 * @param string $username The username to check for it's existence.
 * @return bool True if the username exists, false otherwise.
 */
function username_exists($conn, $username) {
    // Query to check if the username exists in the users table
    $query = "SELECT COUNT(*) FROM users WHERE Username = :username";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);

    try {
        $stmt->execute();
        // Fetch the count of rows where the username matches
        $count = $stmt->fetchColumn();
        // If the count is greater than 0, the username exists
        return $count > 0;
    } catch (PDOException $e) {
        // Log the error or handle it as needed
        error_log($e->getMessage());
        return false;
    }
}

/**
 * Sanitizes user input by trimming whitespace checking for illegal characters, removing slashes and converting allowed special characters to HTML entities.
 *
 * @param string $data The input data to sanitize.
 * @return string The sanitized input data.
 * @return string message invalid characters, if invalid characters where used.
 */
function sanitize_input($data) {
    $new_value = preg_replace("/[^\w]+/", "", $data);
    if ($new_value !== $data)
    {
        echo "invalid characters used.";
    } else {
    return htmlspecialchars(trim($data));
    }
}

/**
 * Validates if the given passwords match.
 *
 * @param string $password The password to validate.
 * @param string $confirm_password The confirmation password to validate against.
 * @return bool True if the passwords match, false otherwise.
 */
function validate_passwords($password, $confirm_password) {
    return $password === $confirm_password;
}

/**
 * Hashes a password using the bcrypt algorithm.
 *
 * @param string $password The password to hash.
 * @return string The hashed password.
 */
function hash_password($password) {
    return password_hash($password, PASSWORD_BCRYPT);
}

/**
 * Inserts a new user into the database.
 *
 * @param PDO $conn The PDO database connection object.
 * @param string $firstname The first name of the user.
 * @param string $lastname The last name of the user.
 * @param string $username The username of the user.
 * @param string $email The email address of the user.
 * @param string $hashed_password The hashed password of the user.
 * @return bool True on successful insertion, false otherwise.
 */
function insert_user($conn, $firstname, $lastname, $username, $email, $hashed_password) {
    // Use PDO prepare statement and bind parameters between form data and database columns to prevent SQL injection.
    $sql = "INSERT INTO users (Firstname, Lastname, Username, Email, Password) VALUES (:firstname, :lastname, :username, :email, :password)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':firstname', $firstname);
    $stmt->bindParam(':lastname', $lastname);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':password', $hashed_password);

    try {
        return $stmt->execute();
    } catch (PDOException $e) {
        // Log error or handle it as needed
        error_log($e->getMessage());
        return false;
    }
}

?>