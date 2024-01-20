<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="user"/>
</sec:authorize>


<header class="header" ng-app="category" ng-controller="categoryController">
    <div class="header__wrap">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header__content">
                        <!-- header logo -->
                        <a href="/" class="header__logo">
                            <img src="/img/aniix.svg" alt="">
                        </a>
                        <!-- end header logo -->

                        <!-- header nav -->
                        <ul class="header__nav">
                            <!-- dropdown -->
                            <li class="header__nav-item">
                                <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuHome" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home</a>

                                <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuHome">
                                    <li><a href="index2.html">Home static bg</a></li>
                                </ul>
                            </li>
                            <!-- end dropdown -->

                            <!-- dropdown -->
                            <li class="header__nav-item">
                                <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuCatalog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Category</a>

                                <ul class="dropdown-menu header__dropdown-menu" style="display: grid;grid-template-columns: repeat(3,1fr);column-gap: 20px;width: fit-content" aria-labelledby="dropdownMenuCatalog">
                                        <li ng-repeat = "x in responseData"><a href={{"/category/"+x.id}} >{{x.name}}</a></li>
                                </ul>
                            </li>
                            <!-- end dropdown -->

                            <li class="header__nav-item">
                                <a href="faq.html" class="header__nav-link">Help</a>
                            </li>
                            <sec:authorize access="hasAnyAuthority('ADMIN')">
                                <li class="header__nav-item">
                                    <a href="/admin/admin-page" class="header__nav-link">Go to admin page</a>
                                </li>
                            </sec:authorize>
                            <!-- dropdown -->
                            <li class="dropdown header__nav-item">
                                <a class="dropdown-toggle header__nav-link header__nav-link--more" href="#" role="button" id="dropdownMenuMore" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon ion-ios-more"></i></a>

                                <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuMore">
                                       <c:choose>
                                           <c:when test="${user != null}">
                                               <li><a href="/logout">Logout</a></li>
                                           </c:when>
                                           <c:otherwise>
                                               <li><a href="/login">Sign In</a></li>
                                               <li><a href="/register">Sign Up</a></li>
                                           </c:otherwise>
                                       </c:choose>
                                            <li><a href="about.html">About</a></li>
                                            <li><a href="404.html">404 Page</a></li>
                                </ul>
                            </li>
                            <!-- end dropdown -->
                        </ul>
                        <!-- end header nav -->

                        <!-- header auth -->
                        <div class="header__auth">
                            <button class="header__search-btn" type="button">
                                <i class="icon ion-ios-search"></i>
                            </button>

                      <c:choose>
                          <c:when test="${user != null}">
                              <li class="dropdown header__nav-item">
                                  <a class="dropdown-toggle header__nav-link" style="margin-left: 40px" href="#" role="button" id="dropdownUser" data-toggle="dropdown"><i class="fa-solid fa-user" style="color: #ffffff;margin-right: 10px"></i>${user.username}</a>

                                  <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownUser">
                                      <li><a href="#">View profile</a></li>
                                      <li><a href="#">My favourite</a></li>
                                      <li><a href="/logout">Logout</a></li>
                                  </ul>
                              </li>
                          </c:when>
                          <c:otherwise>
                              <a href="/login" class="header__sign-in">
                                  <i class="icon ion-ios-log-in"></i>
                                  <span>sign in</span>
                              </a>
                          </c:otherwise>
                      </c:choose>
                        </div>
                        <!-- end header auth -->

                        <!-- header menu btn -->
                        <button class="header__btn" type="button">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                        <!-- end header menu btn -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- header search -->
    <form action="#" class="header__search">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header__search-content">
                        <input type="text" placeholder="Search for a movie, TV Series that you are looking for">

                        <button type="button">search</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- end header search -->
</header>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.3/angular.min.js" integrity="sha512-KZmyTq3PLx9EZl0RHShHQuXtrvdJ+m35tuOiwlcZfs/rE7NZv29ygNA8SFCkMXTnYZQK2OX0Gm2qKGfvWEtRXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    let myApp = angular.module("category",[]);
    myApp.controller('categoryController', function($scope, $http) {
        // Gọi API
        $http.get('http://localhost:8080/api/v1/category-api/get-all-category')
            .then(function(response) {
                $scope.responseData = response.data;
                console.log(response)
            })
            .catch(function(error) {
                // Xử lý lỗi
                console.error('Error:', error);
            });
    });
</script>
