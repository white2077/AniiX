<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 17/1/2024
  Time: 8:03 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../decorator/head/head.jsp"%>
  <body class="body">
  <!-- page 404 -->
  <div class="page-404 section--bg" data-bg="img/section/section.jpg">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <div class="page-404__wrap">
                      <div class="page-404__content">
                          <h1 class="page-404__title">404</h1>
                          <p class="page-404__text">The page you are looking for not available!</p>
                          <a href="" class="page-404__btn">go back</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- end page 404 -->

  <!-- JS -->
  <%@include file="../decorator/scrpit/scrpit.jsp"%>
  </body>
</html>
