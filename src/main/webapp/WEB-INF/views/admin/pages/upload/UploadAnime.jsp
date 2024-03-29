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
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav_content">
    <main ng-app="app">
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
                            <form:checkboxes path="categories" items="${categories}" itemLabel="name"
                                             itemValue="id"/>
                        </div>
                        <form:errors path="categories"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tags:</label>
                        <div class="form-check d-flex">
                            <form:checkboxes path="tags" items="${tagsList}" itemLabel="tag" itemValue="id"/>
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
                        <input class="form-control" type="file" accept=".png, .jpg, .jpeg, .bmp"
                               name="thumbnail" id="formFile">
                    </div>
                    <div class="d-flex justify-content-lg-end">
                        <button type="submit" class="btn btn-success align-items-end me-2">Submit</button>
                        <button type="button" class="btn btn-danger">Cancel</button>
                    </div>
                </form:form>
            </c:when>
            <c:when test="${!check}">
            <input id="filmId" hidden="hidden" value="${filmId}">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="anime-tab" data-bs-toggle="tab"
                            data-bs-target="#anime" type="button"
                            role="tab" aria-controls="home" aria-selected="true">${title}</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="seasons-tab" data-bs-toggle="tab" data-bs-target="#seasons"
                            type="button"
                            role="tab" aria-controls="profile" aria-selected="false">Add Season
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="anime" role="tabpanel"
                     aria-labelledby="home-tab">
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
                                <form:checkboxes path="categories" items="${categories}" itemLabel="name"
                                                 itemValue="id"/>
                            </div>
                            <form:errors path="categories"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tags:</label>
                            <div class="form-check d-flex">
                                <form:checkboxes path="tags" items="${tagsList}" itemLabel="tag"
                                                 itemValue="id"/>
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
                            <input class="form-control" type="file" accept=".png, .jpg, .jpeg, .bmp"
                                   name="thumbnail" id="formFile">
                        </div>
                        <img src="/flim-image/${flim.thumbnail}" width="200px" height="18vh"
                             class="img-thumbnail" alt="...">

                        <div class="d-flex justify-content-lg-end">
                            <button type="submit" class="btn btn-success align-items-end me-2">Submit
                            </button>
                            <button type="button" class="btn btn-danger">Cancel</button>
                        </div>
                    </form:form>
                </div>
                <div class="tab-pane fade show" id="seasons" role="tabpanel" aria-labelledby="seasons-tab">
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Add Season</li>
                    </ol>
                    <br>
                    <div class="table-responsive" ng-controller="SeasonController">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#add">
                            Add season
                        </button>
                        <div class="modal fade" id="add" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="label">Add new a season</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <form ng-submit="insert()">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Season name</label>
                                                <input type="text" class="form-control" ng-model="seasonName">
                                                <span style="color: red">{{seasonNameStatus}}</span>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Release year:</label>
                                                <input type="number" class="form-control"
                                                       ng-model="releaseYear">
                                                <span style="color: red">{{releaseYearStatus}}</span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary">Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Save
                                                changes
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                            <tr>
                                <th>Thumbnail</th>
                                <th>Season name</th>
                                <th>All episode</th>
                                <th>Release Year</th>
                                <th>Upload Date</th>
                                <th>Episode manager</th>
                                <th>Edit Name</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="x in allData">
                                <td><img width="50vh" src="/flim-image/${flim.thumbnail}" alt=""></td>
                                <td >
                                    <a ng-click="setSeasonId(x.id)" data-bs-target="#episode" data-bs-toggle="modal">                                    {{x.seasonName}}
                                    </a>
                                </td>
                                <td>{{x.episodes.length}}</td>
                                <td>{{x.releaseYear}}</td>
                                <td>{{x.uploadDate}}</td>
                                <td><a href="/admin/episode/season/{{x.id}}" class="btn btn-success">Click
                                    :)</a></td>
                                <td>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#update" ng-click="setId(x.id)">
                                        Edit
                                    </button>
                                </td>
                                <td>
                                    <button ng-click="delete(x.id)" type="button" class="btn btn-danger">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="modal fade" id="update" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit season</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close" ng-click="clear()"></button>
                                    </div>
                                    <form ng-submit="update(updateId)">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label class="form-label">Season name</label>
                                                <input type="text" class="form-control" ng-model="seasonName">
                                                <span style="color: red">{{seasonNameStatus}}</span>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Release year:</label>
                                                <input type="number" class="form-control"
                                                       ng-model="releaseYear">
                                                <span style="color: red">{{releaseYearStatus}}</span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                   ng-click="clear()" data-bs-dismiss="modal">Close
                                            </button>
                                            <button type="submit"  class="btn btn-primary">Save
                                                changes
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="episode" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="">All episode in season</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="accordion" id="eps">
                                            <div class="accordion-item" ng-repeat="x in allEpisodesBySeasonId">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#collapse{{x.id}}"
                                                            aria-expanded="true" aria-controls="collapseOne">
                                                        Episode: {{$index + 1}}
                                                    </button>
                                                </h2>
                                                <div id="collapse{{x.id}}" class="accordion-collapse collapse show"
                                                     data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <iframe class="embed-responsive-item" width="100%" src="{{x.linkFlim}}"
                                                                height="300vh" frameborder="0" scrolling="0"
                                                                allowfullscreen></iframe>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        </c:when>
        </c:choose>
    </main>
    <%@include file="../../layouts/footer/AdminFooter.jsp" %>
</div>
<script>
    let myApp = angular.module('app', [])
    myApp.config(function($sceProvider) {
        $sceProvider.enabled(false);
    });
    myApp.controller('SeasonController', ($scope, $http) => {
        let filmId = document.getElementById('filmId').value
        let API_GET_ALL = 'https://aniix.vn/api/v1/season/' + filmId + '/all-season'
        let API_DELETE = 'https://aniix.vn/api/v1/season/delete-season/'
        let API_UPDATE = 'https://aniix.vn/api/v1/season/update-season/'
        let API_POST = 'https://aniix.vn/api/v1/season/' + filmId + '/add-season'
        let API_GET_EPISODES = 'https://aniix.vn/api/v1/season/'
        let API_GET_BY_ID ='https://aniix.vn/api/v1/season/'
       //all variable
        $scope.allData = []
        $scope.releaseYear = 0;
        $scope.updateId = 0;
        $scope.seasonNameStatus = '';
        $scope.releaseYearStatus = ''
        $scope.allEpisodesBySeasonId = [];
        //function
        function validateForm() {
            if ($scope.seasonName === '' && $scope.releaseYear <= 0) {
                $scope.releaseYearStatus = 'Year invalid'
                $scope.seasonNameStatus = 'Name invalid'
                return false
            } else if ($scope.seasonName === '') {
                $scope.seasonNameStatus = 'Name invalid'
                return false
            } else if ($scope.releaseYear <= 0) {
                $scope.releaseYearStatus = 'Year invalid'
                return false
            } else {
                $scope.seasonNameStatus = '';
                $scope.releaseYearStatus = ''
                return true
            }
        }
        function fillForm(id){
            $http.get(API_GET_BY_ID+id)
                .then((res)=>{
                    $scope.seasonName = res.data.seasonName
                    $scope.releaseYear = res.data.releaseYear
                })
        }


        function getAll() {
            $http.get(API_GET_ALL).then((res) => {
                $scope.allData = res.data.data
        $scope.seasonName ='Season '+($scope.allData.length+1)+': '+'${flim.name}'
                console.log($scope.allData.length)
            })
        }

        $scope.setId = (id) => {
            fillForm(id);
            $scope.updateId = id;
        }
        getAll();
        $scope.delete = (id) => {
            $http.delete(API_DELETE + id)
                .then(() => {
                    getAll()
                })
                .catch((err) => {
                    console.log(err)
                })
        }
        $scope.update = (id) => {

            let season = {
                seasonName: $scope.seasonName,
                releaseYear: $scope.releaseYear
            }
            console.log(validateForm())
            if (validateForm()) {
                $http.patch(API_UPDATE + $scope.updateId, season)
                    .then(() => {
                        getAll();
                        $scope.clear()
                    })
                    .catch((err) => {
                        console.log(err)
                    })
            }
        }
        $scope.insert = () => {
            if (validateForm()) {
                let season = {
                    seasonName: $scope.seasonName,
                    releaseYear: $scope.releaseYear
                }
                $http.post(API_POST, season).then(() => {
                    getAll()
                    $scope.clear()
                })
            }
        }

        $scope.clear =()=> {
            $scope.seasonName ='Season '+countSeason+': '+'${flim.name} '
            $scope.releaseYear = 0;
        }

        $scope.setSeasonId = (id) => {
            $http.get(API_GET_EPISODES + id)
                .then((res) => {

                    res.data.episodes.forEach(x =>{
                        x.linkFlim = 'https://embed.api.video/vod/'+x.linkFlim
                    })
                    console.log(res.data.episodes)
                    $scope.allEpisodesBySeasonId =res.data.episodes
                })
        }
    })
</script>
</body>

</html>
