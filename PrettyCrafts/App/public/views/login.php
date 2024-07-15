<?php 
require_once("../../config.php");
include("../shared/layout.php");
?>

<!-- Login form. login_user handled by form_validation_utils.php -->
<div id="card">
    <div id="card-content">
      <div id="card-title">
          <h2>LOGIN</h2>
          <div class="underline-title"></div>
        </div>
        <form method="post" class="form">
        <?php login_user($conn); ?>
        <?php display_message(); ?>
          <label for="username" style="padding-top:13px">
              Username
            </label>
          <input id="username" class="form-content" type="text" name="username" autocomplete="on" required />
          <div class="form-border"></div>
          <label for="password" style="padding-top:22px">
              Password
            </label>
          <input id="password" class="form-content" type="password" name="password" required />
          <div class="form-border"></div>
          <a href="#">
            <legend id="forgot-pass">Forgot password?</legend>
          </a>
          <input id="submit-btn" type="submit" name="submit" value="LOGIN"/>
          <a href="/views/register.php" id="signup">not an account yet?</a>
        </form>
    </div>
  </div>
</div>
