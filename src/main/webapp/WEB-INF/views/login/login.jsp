<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 19/1/2024
  Time: 6:46 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet">

    <!-- CSS -->

    <link rel="stylesheet" href="/css/bootstrap-reboot.min.css" type="text/css">
    <link rel="stylesheet" href="/css/bootstrap-grid.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery.mCustomScrollbar.min.css" type="text/css">
    <link rel="stylesheet" href="/css/nouislider.min.css" type="text/css">
    <link rel="stylesheet" href="/css/ionicons.min.css" type="text/css">
    <link rel="stylesheet" href="/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/css/photoswipe.css" type="text/css">
    <link rel="stylesheet" href="/css/default-skin.css" type="text/css">
    <link rel="stylesheet" href="/css/main.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" /><!-- Favicons -->
    <link rel="icon" type="image/png" href="/icon/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="/icon/favicon-32x32.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/icon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/icon/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/icon/apple-touch-icon-114x114.png">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Dmitry Volkov">
    <title>Aniix – Online Anime Movies, Anime TV Shows <sitemesh:write property="title"/></title>
</head>
<body>

<div class="sign section--bg" data-bg="/img/section/section.jpg">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="sign__content">
                    <!-- authorization form -->
                    <form:form class="sign__form">
                        <a href="/" class="sign__logo">
                            <img width="100%" src="img/aniix.svg" alt="">
                        </a>

                        <div class="sign__group">
                            <input type="text" class="sign__input" placeholder="Username" id="username" name="username"
                                   required>
                        </div>

                        <div class="sign__group">
                            <input type="password" class="sign__input" placeholder="Password" id="password"
                                   name="password" required>
                        </div>
                        <%--                        <div class="sign__group sign__group--checkbox">--%>
                        <%--                            <input id="remember" name="remember" type="checkbox" checked="checked">--%>
                        <%--                            <label for="remember">Remember Me</label>--%>
                        <%--                        </div>--%>
                        <h5 style="color: #ff5860;"> ${error}</h5>
                        <input class="sign__btn" type="submit" value="Sign in"></input>
                        <span class="sign__text">Don't have an account? <a href="/register">Sign up!</a></span>

                        <span class="sign__text"><a href="#">Forgot password?</a></span>
                    </form:form>
                    <!-- end authorization form -->
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.3/angular.min.js"
        integrity="sha512-KZmyTq3PLx9EZl0RHShHQuXtrvdJ+m35tuOiwlcZfs/rE7NZv29ygNA8SFCkMXTnYZQK2OX0Gm2qKGfvWEtRXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/jquery-3.3.1.min.js" type="application/javascript"></script>
<script src="/js/bootstrap.bundle.min.js" type="application/javascript"></script>
<script src="/js/owl.carousel.min.js" type="application/javascript"></script>
<script src="/js/jquery.mousewheel.min.js" type="application/javascript"></script>
<script src="/js/jquery.mCustomScrollbar.min.js" type="application/javascript"></script>
<script src="/js/wNumb.js" type="application/javascript"></script>
<script src="/js/nouislider.min.js" type="application/javascript"></script>
<script src="/js/plyr.min.js" type="application/javascript"></script>
<script src="/js/jquery.morelines.min.js" type="application/javascript"></script>
<script src="/js/photoswipe.min.js" type="application/javascript"></script>
<script src="/js/photoswipe-ui-default.min.js" type="application/javascript"></script>
<script src="/js/main.js" type="application/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"
        integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
