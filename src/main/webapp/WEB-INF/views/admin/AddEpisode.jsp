<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
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
    <%@include file="../decorator/head/AdminHead.jsp" %>
    >
</head>
<body class="sb-nav-fixed">
<%@include file="../decorator/header/AdminHeader.jsp" %>

<div id="layoutSidenav">
    <%@include file="../decorator/SideBar/SideBar.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">${title}</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">${title}</li>
                </ol>
                <div class="row">
                    <form:form action="/admin/add-episode/season/add-episode" class="form-control" method="post" enctype="multipart/form-data" modelAttribute="episode">
                        <div class="mb-3">
                            <div class="mb-3">
                                <label for="formFile" class="form-label">Upload an episode :)</label>
                                <input name="episodeVideo" class="form-control" type="file" id="formFile">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </form:form>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        DataTable Example
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-hover table-bordered" id="datatablesSimple">
                            <thead class="table-dark">
                            <tr>
                                <th>Thumbnail</th>
                                <th>Name</th>
                                <th>Episode</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Thumbnail</th>
                                <th>Name</th>
                                <th>Episode</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </tfoot>
                            <tbody>
                             <c:forEach items="${allEpisode}" var="x" varStatus="loop">
                                 <tr>
                                     <td><img src="/flim-image/${thumbnail}" width="50vh" alt="" srcset=""></td>
                                     <td>${x.season.seasonName}</td>
                                     <td>${loop.count}</td>
                                     <td><a class="btn btn-success">Edit</a></td>
                                     <td><a class="btn btn-danger">Delete</a></td>
                                 </tr>
                             </c:forEach>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </main>

        <%@include file="../decorator/footer/AdminFooter.jsp" %>
    </div>
</div>


<%@include file="../decorator/scrpit/AdminScprit.jsp" %>
</body>

</html>
