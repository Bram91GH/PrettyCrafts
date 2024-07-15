# PHP Web Application.

## Overview

This repository contains a PHP-based web application that serves as an online store. It includes various scripts and configurations to manage user authentication, product browsing, shopping cart functionalities, and more.

### Executing program

* from public directory run

```
php -S localhost:5000
``` 
* or add to htdocs in xampp and navigate to public from localhost.

## Files and Descriptions

### `.htaccess`

This file configures Apache web server settings at the directory level, including URL rewriting rules.

### `config.php`

Initializes application configurations such as database connections, output buffering, session management, and inclusion of utility files.

### `style.css`

Contains all CSS styles for the website, ensuring consistent visual presentation.

### `layout.php`

Defines the basic structure and layout template for web pages, including HTML structure, meta tags, and navigation bar.

### `index.php`

Main page displaying product categories and products, utilizing database interactions and session management for user-specific actions.

### `product_details.php`

Displays detailed information about a selected product, fetched dynamically from the database based on URL parameters.

### `cart.php`

Displays the contents of the shopping cart, allowing users to manage items, calculate totals, and proceed to checkout.

### `cart_utils.php`

Contains functions for managing shopping cart operations, including adding, removing, and updating items, as well as handling checkout processes.

### `login.php` and `register.php`

Pages for user authentication and registration, utilizing PHP functions for form handling, input validation, and user session management.

### `profile.php`

User profile page showing order history and ordered items, with functionalities for logging out and utilizing JavaScript for enhanced table presentation.

### `data_table_utils.php`

Contains PHP functions for generating HTML tables based on database queries, facilitating dynamic data presentation.

### `form_validation.php`

Functions for validating user inputs, handling login and registration processes securely using PHP Data Objects (PDO) for database interactions.

## Security Considerations

- Utilizes prepared statements with PDO to prevent SQL injection attacks.
- Passwords are hashed using bcrypt before storing in the database.
- Session management ensures secure user interactions and data persistence.

## Development Notes

- Debugging statements like `echo` are included for development purposes and should be removed in production.
- Error handling and user feedback mechanisms can be further improved for a more robust user experience.