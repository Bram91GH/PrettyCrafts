<?php 
/**
 * Sets a message in the session.
 *
 * @param string $message The message to be stored in the session.
 */
function set_message($message) {
    $_SESSION['message'] = $message;
}

/**
 * Displays the message stored in the session and then removes it.
 *
 * If there is no message set in the session, this function does nothing.
 */
function display_message() {
    if (isset($_SESSION['message'])) {
        echo $_SESSION['message'];
        unset($_SESSION['message']);
    }
}

/**
 * Redirects the browser to a specified URL and terminates the script.
 *
 * @param string $url The URL to redirect to.
 */
function redirect($url) {
    header("Location: " . $url);
    exit();
}

?>