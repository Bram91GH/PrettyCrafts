<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pretty Crafts</title>
    <link rel="stylesheet" href="../shared/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-......" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
</head>

<body>
    <!-- Background image container -->
    <div class="background-image">
        <!-- Overlay for the background image -->
        <div class="overlay">
        </div>
    </div>

    <!-- Navigation bar container -->
    <div class="navbar">
        <a href="/index.php" class="navbar-brand">
            <img src="../shared/img/needle threat.png" alt="Logo"> Pretty Crafts
        </a>
        <!-- Navigation links container -->
        <div class="navbar-links">
            <a href="/index.php">Home</a>
            <a href="/views/login.php">Login</a>
            <a href="/views/register.php">Register</a>

            <?php
            // Check if the user is logged in by verifying session variables.
            // Only display the cart and profile links if the user is logged in.
            if(isset($_SESSION['user_id']) && isset($_SESSION['username'])): ?>     

                <!-- Cart link with icon -->
                <a href="/views/cart.php" class="icon-circle"><i class="fas fa-shopping-cart"></i></a>
                <!-- Profile link with icon -->
                <a href="/views/profile.php" class="icon-circle"><i class="fas fa-user"></i></a>
                
            <?php endif; ?>
        </div>
    </div>
    <!-- Underline for the navigation bar -->
    <div class="underline-navbar"></div>
</body>

</html>
