<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 20/1/2024
  Time: 11:57 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../decorator/head/AdminHead.jsp"%>>
</head>
<body class="sb-nav-fixed">
<%@include file="../decorator/header/AdminHeader.jsp"%>

<div id="layoutSidenav">
    <%@include file="../decorator/SideBar/SideBar.jsp"%>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Add Anime</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Upload an anime</li>
                </ol>
                <form action="#" method="" class="form-control">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name:</label>
                        <input type="text" class="form-control" id="name" placeholder="anime name">
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Categories:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="ngu vcl" id="category">
                            <label class="form-check-label" for="category">
                                Fantasy
                            </label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="tag" class="form-label">Tags:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="ngu vcl" id="tag">
                            <label class="form-check-label" for="tag">
                                Fantasy
                            </label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="desc" class="form-label">Desc:</label>
                        <textarea class="form-control" id="desc" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Country</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="formFile" class="form-label">Default file input example</label>
                        <input class="form-control" type="file" id="formFile">
                    </div>
                    <div class="d-flex justify-content-lg-end">
                        <button type="button" class="btn btn-success align-items-end me-2">Submit</button>
                        <button type="button" class="btn btn-danger">Cancel</button>
                    </div>
                </form>
            </div>
        </main>

        <%@include file="../decorator/footer/AdminFooter.jsp"%>
    </div>
</div>




<%@include file="../decorator/scrpit/AdminScprit.jsp"%>
</body>
</html>
