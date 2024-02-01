<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 31/1/2024
  Time: 3:32 am
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Tag Category Country</title>
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Category, Tag, Country</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Management</li>
            </ol>

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                            data-bs-target="#category-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
                            aria-selected="true">Category
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#tag-tab-pane"
                            type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Country
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#country-tab-pane"
                            type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Tag
                    </button>
                </li>

            </ul>
            <div class="tab-content" id="myTabContent" ng-app="app">
                <%--                category--%>
                <div class="tab-pane fade show active" id="category-tab-pane" role="tabpanel"
                     aria-labelledby="category-tab" tabindex="0">

                    <%--                    table--%>
                    <div class="table-responsive" ng-controller="CategoryController">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
                            Add new category
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add category</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <form ng-submit="insertCategory()">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Category name</label>
                                                <input type="text" class="form-control" id="name"
                                                       ng-model="categoryName">
                                                <span style="color: red">{{categoryValidate}}</span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                            <tr>
                                <th>Category name</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="x in category">
                                <td data-bs-toggle="modal"
                                    data-bs-target="#detailsModal" ng-click="allFilm(x.id)">{{x.name}}
                                </td>
                                <td>
                                    <a class="btn btn-success" ng-click="getId(x.id)" data-bs-toggle="modal"
                                       data-bs-target="#editModal">
                                        Edit
                                    </a>
                                </td>
                                <td><a class="btn btn-danger" ng-click="deleteById(x.id)">Delete</a></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">Add category</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close" ng-click="clearForm()"></button>
                                    </div>
                                    <form ng-submit="updateCategory()">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Category name</label>
                                                <input type="text" class="form-control" ng-model="categoryName">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button ng-click="clearForm()" type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="detailsModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5">List films in category</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <ul class="list-group" ng-repeat="x in listFilm">
                                            <li class="list-group-item"><a
                                                    href="/admin/update-flim/{{x.id}}">{{x.name}}</a></li>
                                        </ul>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


                <div class="tab-pane fade" id="tag-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0"
                     ng-controller="CountryController">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#addCountryModal">
                        Add new
                    </button>

                    <table class="table table-bordered table-hover">
                        <div class="modal fade" id="addCountryModal" tabindex="-1"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="addCountryModalLabel">Add new country</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <form ng-submit="postData()">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Category name</label>
                                                <input type="text" class="form-control" ng-model="country.name">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="editCountryModal" tabindex="-1"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="editCountryModalLabel">Edit country name</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <form ng-submit="putData()">
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Country name</label>
                                                <input type="text" class="form-control" ng-model="country.name">
                                                <span style="color: red">{{nameValidator}}</span>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>


                        <thead class="table-dark">
                        <tr>
                            <th>Category name</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="x in allData">
                            <td data-bs-toggle="modal">{{x.name}}
                            </td>
                            <td>
                                <button data-bs-toggle="modal"
                                        data-bs-target="#editCountryModal" ng-click="getCountryId(x.id)"
                                        class="btn btn-success">Edit
                                </button>
                            </td>
                            <td><a class="btn btn-danger" ng-click="deleteCountry(x.id)">Delete</a></td>
                        </tr>
                        </tbody>
                    </table>

                </div>

                <div class="tab-pane fade" id="country-tab-pane" role="tabpanel" aria-labelledby="contact-tab"
                     tabindex="0">...
                </div>

            </div>
        </div>
    </main>
    <%@include file="../../layouts/footer/AdminFooter.jsp" %>
</div>
<script>
    let myApp = angular.module('app', [])
    myApp.controller('CategoryController', function ($scope, $http) {
        const API_GET_ALL_CATEGORY = "https://aniix.vn/api/v1/category-api/get-all-category"
        const API_PUT_CATEGORY = 'https://aniix.vn/api/v1/category-api/update-category'
        let API_DELETE_BY_ID = "https://aniix.vn/api/v1/category-api/delete-category/"
        const API_POST_CATEGORY = "https://aniix.vn/api/v1/category-api/add-new-category"
        let API_GET_FILM_BY_CATEGORY_ID = 'https://aniix.vn/api/v1.film-api/film/category/'
        let API_GET_BY_ID = 'https://aniix.vn/api/v1/category-api/category/'

        $scope.category = []
        $scope.categoryName = ''
        $scope.categoryValidate = ''
        $scope.listFilm = [];
        $scope.categoryId = 0
        let categoryId = 0;

        function getData() {
            $http.get(API_GET_ALL_CATEGORY).then(
                function (response) {
                    $scope.category = response.data;
                }
            ).catch(function (error) {
                console.log(error)
            })
        }

        $scope.fillForm = () => {
            $http.get(API_GET_BY_ID + categoryId)
                .then((res) => {
                    $scope.categoryName = res.data.name
                })
                .catch((err) => console.log(err))
        }
        $scope.allFilm = (id) => {
            $http.get(API_GET_FILM_BY_CATEGORY_ID + id)
                .then((res) => {
                    $scope.listFilm = res.data
                    console.log($scope.listFilm)
                })
        }

        function validate() {
            if ($scope.categoryName === '') {
                $scope.categoryValidate = 'invalid name'
                console.log(123)
                return false;
            } else {
                $scope.categoryValidate = ''
                return true
            }

        }

        $scope.clearForm = () => {
            $scope.categoryName = ''
        }

        getData()
        $scope.getId = (id) => {
            categoryId = id
            $scope.fillForm()
        }
        $scope.deleteById = (id) => {
            $http.delete(API_DELETE_BY_ID + id)
                .then(function (response) {
                    console.log(response.data)
                    getData()
                })
                .catch(function (error) {
                    console.log(error)
                })
        }
        $scope.insertCategory = () => {
            if (validate()) {
                let category = {
                    "name": $scope.categoryName
                }
                $http.post(API_POST_CATEGORY, category).then(
                    function (response) {
                        $scope.categoryName = ""
                        getData()
                        $scope.clearForm()
                    }
                ).catch(
                    function (error) {
                        console.log(error)
                    }
                )
            }
        }
        $scope.updateCategory = () => {
            if (validate()) {
                $http.put(API_PUT_CATEGORY,
                    {
                        "id": categoryId,
                        "name": $scope.categoryName
                    })
                    .then(() => {
                        $scope.clearForm()
                    })
                    .catch(() => {
                        getData();

                    })
            }
        }
    })

    myApp.controller('CountryController', ($scope, $http) => {
        const API_GET_APP = 'https://aniix.vn/api/v1/country/all-country'
        const API_POST = 'https://aniix.vn/api/v1/country/add-country'
        const API_DELETE = 'https://aniix.vn/api/v1/country/delete-country/'
        const API_PUT = 'https://aniix.vn/api/v1/country/update-country/12'
        $scope.allData = []

        $scope.country = {
            "name": ''
        }
        $scope.id = 0

        function getAll() {
            $http.get(API_GET_APP)
                .then((res) => {
                    $scope.allData = res.data
                })
        }

        getAll();
        $scope.postData = () => {
            if (validateForm()) {
                $http.post(API_POST, $scope.country)
                    .then((res) => {
                        getAll();
                        console.log(res.data)
                    })
                    .catch((err) => {
                        console.log(err)
                    })
            }
        }
        $scope.deleteCountry = (id) => {
            $http.delete(API_DELETE + id)
                .then((res) => {
                    console.log(res.data)
                    getAll()
                })
                .catch((err) => {
                    console.log(err)
                })
        }

        function validateForm() {
            let err = 0;
            if ($scope.country.name === '') {
                $scope.nameValidator = 'Invalid name'
                err++
            } else $scope.nameValidator = ''
            return err === 0 ? true : false
        }

        $scope.getCountryId = (id) => {
            $scope.id = id;
            console.log($scope.id)
        }
        $scope.putData = () => {
            if (validateForm()) {
                $http.put(API_PUT, $scope.country)
                    .then((res) => {
                        console.log(res)
                        getAll()
                    })
                    .catch((err) => console.log(err))
            }
        }

    })
</script>
</body>
</html>
