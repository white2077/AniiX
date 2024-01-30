<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 19/1/2024
  Time: 6:36 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard - SB Admin</title>
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Dashboard</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">All User</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-warning text-white mb-4">
                        <div class="card-body">Top Category</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-success text-white mb-4">
                        <div class="card-body">Top Anime</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-danger text-white mb-4">
                        <div class="card-body">Recycle Bin</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">View Details</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    All Anime
                    <a class="btn btn-primary align-content-lg-start" href="/admin/add-new">Add new</a>

                </div>
                <div class="card-body table-responsive">
                    <table class="table table-hover table-bordered" id="datatablesSimple">
                        <thead class="table-dark">
                        <tr>
                            <th>Thumbnail</th>
                            <th>Name</th>
                            <th>Seasons</th>
                            <th>Country</th>
                            <th>Categories</th>
                            <th>Tags</th>
                            <th>Release year</th>
                            <th>Upload date</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Thumbnail</th>
                            <th>Name</th>
                            <th>Seasons</th>
                            <th>Country</th>
                            <th>Categories</th>
                            <th>Tags</th>
                            <th>Release year</th>
                            <th>Upload date</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach items="${flim}" var="x">
                            <tr>
                                <td><img src="/flim-image/${x.thumbnail}" width="50vh" alt="" srcset=""></td>
                                <td>${x.name}</td>
                                <td>${x.seasons.size()}</td>
                                <td>${x.country.name}</td>
                                <td>
                                    <c:forEach items="${x.categories}" var="category">
                                        ${category.name},
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach items="${x.tags}" var="tag">
                                        ${tag.tag},
                                    </c:forEach>
                                </td>
                                <td>${x.releaseYear}</td>
                                <td>${x.uploadDate}</td>
                                <td><a href="/admin/update-flim/${x.id}" class="btn btn-primary">Edit</a></td>
                                <td>
                                    <form:form action="/admin/delete-flim/${x.id}" method="delete">
                                        <input hidden="hidden" name="thumbnail" value="${x.thumbnail}">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form:form></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>

