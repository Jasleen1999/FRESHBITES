document.write(`<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close"></span>
    <form id="loginform" class="lgf" method="post">
      <h1>LOG IN</h1>
      <div class="wrapper"><i class="fas fa-envelope lgicon"></i><input style="margin-bottom: 15px;" type="email" id="mail" name="email" placeholder="EMAIL">
      <i class="fas fa-lock lgicon"></i><input style="margin-bottom: 5px;" type="password" id="password" name="pwd" placeholder="PASSWORD">
      <a href="javascript:fpwd()" style="font-weight: 500;">Forgot Password?</a>
      <button type="submit" class="lgin" formaction="login.jsp">Log In</button></div>
      <p style="text-align: center; font-weight: 500;">OR LOG IN WITH</p>
      <div id="lgoogle-btn" class="lgoogle-btn">
          <span><i class="fab fa-google glgicon"></i></span>
          <span>Google</span>
      </div>
      <script>startApp();</script>
      <p style="text-align: center; font-weight: 500;">Don't have an account? <a href="signup.html" style="font-weight:700;">Sign Up Now</a></p>
    </form>
  </div>
</div>`)
