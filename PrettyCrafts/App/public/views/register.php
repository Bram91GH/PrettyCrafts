<?php 
require_once("../../config.php");
include("../shared/layout.php");
?>

<div class="background-overlay">

</div>
<div class="container">

    <div class="title">
        <p>Registration</p>
    </div>

    <form action="register.php" method="POST">
        <?php register_user($conn); ?>
        <div class="user_details">
            <div class="input_box">
                <label for="firstname">Firstname</label>
                <input type="text" name="firstname" id="firstname" placeholder="Enter your name" required>
            </div>
            <div class="input_box">
                <label for="lastname">Lastname</label>
                <input type="text" name="lastname"  id="lastname" placeholder="Enter your name" required>
            </div>
            <div class="input_box">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" placeholder="Enter your username" required>
            </div>
            <div class="input_box">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required>
            </div>
            <div class="input_box">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter your password" required>
            </div>
            <div class="input_box">
                <label for="confirm_password">Confirm Password</label>
                <input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm your password" required>
            </div>
        </div>
        <div class="reg_btn">
            <input type="submit" value="Register">
        </div>
    </form>
</div>
