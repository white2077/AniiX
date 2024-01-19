<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 20/1/2024
  Time: 4:04 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../decorator/head/head.jsp"%>

<body class="body">

<div class="sign section--bg" data-bg="img/section/section.jpg">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="sign__content">
          <!-- registration form -->
          <form action="/create-account" method="post" class="sign__form">
            <a href="index.html" class="sign__logo">
              <img width="100%" src="/img/aniix.svg" alt="">
            </a>

            <div class="sign__group">
              <input type="text" class="sign__input" placeholder="Username" name="username">
            </div>

            <div class="sign__group">
              <input type="email" class="sign__input" placeholder="Email" name="email">
            </div>

            <div class="sign__group">
              <input type="password" class="sign__input" placeholder="Password" name="password">
            </div>

            <div class="sign__group sign__group--checkbox">
              <input id="remember" name="remember" type="checkbox" checked="checked">
              <label for="remember">I agree to the <a href="#">Privacy Policy</a></label>
            </div>

            <button class="sign__btn" type="submit">Sign up</button>

            <span class="sign__text">Already have an account? <a href="/login">Sign in!</a></span>
          </form>
          <!-- registration form -->
        </div>
      </div>
    </div>
  </div>
</div>

<!-- JS -->
<%@include file="../decorator/scrpit/scrpit.jsp"%>

</body>
</html>
