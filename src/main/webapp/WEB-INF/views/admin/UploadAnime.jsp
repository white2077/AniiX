<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h1 class="mt-4">${title}</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">${title}</li>
                </ol>
                <c:choose>
                    <c:when test="${uploadStatus==3}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                    <c:when test="${uploadStatus==2}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>Congrats!</strong> Upload complete :).
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${check}">
                        <form:form action="/admin/upload-flim" method="post"
                                   modelAttribute="flim" class="form-control"
                                   enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name:</label>
                                <form:input path="name" class="form-control"/>
                                <form:errors path="name" element="li" delimiter=";"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Release year:</label>
                                <form:input path="releaseYear" class="form-control"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Categories:</label>
                                <div class="form-check">
                                    <form:checkboxes path="categories" items="${categories}" itemLabel="name" itemValue="id" />
                                </div>
                                <form:errors path="categories"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tags:</label>
                                <div class="form-check d-flex">
                                    <form:checkboxes path="tags" items="${tagsList}" itemLabel="tag" itemValue="id" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="desc" class="form-label">Desc:</label>
                                <form:textarea class="form-control" id="desc" rows="3" path="description"/>
                            </div>
                            <div class="mb-3">
                                <form:select path="country" cssClass="form-select">
                                    <form:options items="${countryList}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <label for="formFile" class="form-label">Default file input example</label>
                                <input class="form-control" type="file" accept=".png, .jpg, .jpeg, .bmp" name="thumbnail" id="formFile">
                            </div>
                            <div class="d-flex justify-content-lg-end">
                                <button type="submit" class="btn btn-success align-items-end me-2">Submit</button>
                                <button type="button" class="btn btn-danger">Cancel</button>
                            </div>
                        </form:form>
                    </c:when>
                    <c:otherwise>
                        <form:form action="/admin/update-flim" method="put"
                                   modelAttribute="flim" class="form-control"
                                   enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name:</label>
                                <form:input path="name" class="form-control"/>
                                <form:errors path="name" element="li" delimiter=";"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Release year:</label>
                                <form:input path="releaseYear" class="form-control"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Categories:</label>
                                <div class="form-check">
                                    <form:checkboxes path="categories" items="${categories}" itemLabel="name" itemValue="id" />
                                </div>
                                <form:errors path="categories"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tags:</label>
                                <div class="form-check d-flex">
                                    <form:checkboxes path="tags" items="${tagsList}" itemLabel="tag" itemValue="id" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="desc" class="form-label">Desc:</label>
                                <form:textarea class="form-control" id="desc" rows="3" path="description"/>
                            </div>
                            <div class="mb-3">
                                <form:select path="country" cssClass="form-select">
                                    <form:options items="${countryList}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <label for="formFile" class="form-label">Upload thumbnail</label>
                                <input class="form-control" type="file" accept=".png, .jpg, .jpeg, .bmp" name="thumbnail" id="formFile">
                            </div>
                            <img src="/flim-image/${flim.thumbnail}" width="200px" height="18vh" class="img-thumbnail" alt="...">

                            <div class="d-flex justify-content-lg-end">
                                <button type="submit" class="btn btn-success align-items-end me-2">Submit</button>
                                <button type="button" class="btn btn-danger">Cancel</button>
                            </div>
                        </form:form>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>

        <%@include file="../decorator/footer/AdminFooter.jsp"%>
    </div>
</div>




<%@include file="../decorator/scrpit/AdminScprit.jsp"%>
</body>

</html>
