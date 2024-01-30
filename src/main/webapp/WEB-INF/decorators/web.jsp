<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@include file="../views/web/layouts/header/header.jsp"%>

<sitemesh:write property="body"/>

<%@include file="../views/web/layouts/footer/footer.jsp"%>



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
<script>
    let myApp = angular.module("category", []);
    myApp.controller('categoryController', function ($scope, $http) {
        // Gọi API
        $http.get('https://aniix.vn/api/v1/category-api/get-all-category')
            .then(function (response) {
                $scope.responseData = response.data;
                console.log(response)
            })
            .catch(function (error) {
                // Xử lý lỗi
                console.error('Error:', error);
            });
    });
</script>
</body>
</html>