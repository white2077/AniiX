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
                                <a href="/" class="header__nav-link">Home</a>
                            </li>
                            <!-- end dropdown -->

                            <!-- dropdown -->
                            <li class="header__nav-item">
                                <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuCatalog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Category</a>

                                <ul class="dropdown-menu header__dropdown-menu" style="display: grid;grid-template-columns: repeat(3,1fr);column-gap: 40px;width: fit-content" aria-labelledby="dropdownMenuCatalog">
                                        <li ng-repeat = "x in responseData"><a href={{"/flim/category/"+x.id+"/1"}} >{{x.name}}</a></li>
                                </ul>
                            </li>
                            <!-- end dropdown -->

                            <li class="header__nav-item">
                                <a href="/flim/all-flim/page/1" class="header__nav-link">All Films</a>
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
                                      <li><a href="/user/${user.username}/favourite-list">My favourite</a></li>
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
    <form action="/flim/searching" method="get" class="header__search">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header__search-content">
                        <input type="text" name="keyword" placeholder="Search for a movie, TV Series that you are looking for">
                        <input hidden="hidden" value="1" name="page">
                        <button type="submit">search</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- end header search -->
</header>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.3/angular.min.js" integrity="sha512-KZmyTq3PLx9EZl0RHShHQuXtrvdJ+m35tuOiwlcZfs/rE7NZv29ygNA8SFCkMXTnYZQK2OX0Gm2qKGfvWEtRXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

