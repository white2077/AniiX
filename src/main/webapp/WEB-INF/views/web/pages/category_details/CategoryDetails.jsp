<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 17/1/2024
  Time: 6:55 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>${category}</title>
</head>
<html>
<body>
<!-- page title -->
<section class="section section--first section--bg" data-bg="/img/section/section.jpg">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section__wrap">
                    <!-- section title -->
                    <h2 class="section__title">${category}</h2>
                    <!-- end section title -->

                    <!-- breadcrumb -->
                    <ul class="breadcrumb">
                        <li class="breadcrumb__item"><a href="/">Home</a></li>
                        <li class="breadcrumb__item breadcrumb__item--active">${category}</li>
                    </ul>
                    <!-- end breadcrumb -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end page title -->

<!-- filter -->
<div class="filter">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="filter__content">
                    <div class="filter__items">
                        <!-- filter item -->
                        <div class="filter__item" id="filter__genre">
                            <span class="filter__item-label">GENRE:</span>

                            <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-genre" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <input type="button" value="${allCategory.get(0).name}">
                                <span></span>
                            </div>

                            <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-genre">
                                <c:forEach items="${allCategory}" var="x">
                                    <li>${x.name}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- end filter item -->

                        <!-- filter item -->
                        <div class="filter__item" id="filter__quality">
                            <span class="filter__item-label">QUALITY:</span>

                            <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-quality" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <input type="button" value="HD 1080">
                                <span></span>
                            </div>

                            <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-quality">
                                <li>HD 1080</li>
                                <li>HD 720</li>
                                <li>DVD</li>
                                <li>TS</li>
                            </ul>
                        </div>
                        <!-- end filter item -->

                        <!-- filter item -->
                        <div class="filter__item" id="filter__rate">
                            <span class="filter__item-label">IMBd:</span>

                            <div class="filter__item-btn dropdown-toggle" role="button" id="filter-rate" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="filter__range">
                                    <div id="filter__imbd-start"></div>
                                    <div id="filter__imbd-end"></div>
                                </div>
                                <span></span>
                            </div>

                            <div class="filter__item-menu filter__item-menu--range dropdown-menu" aria-labelledby="filter-rate">
                                <div id="filter__imbd"></div>
                            </div>
                        </div>
                        <!-- end filter item -->

                        <!-- filter item -->
                        <div class="filter__item" id="filter__year">
                            <span class="filter__item-label">RELEASE YEAR:</span>

                            <div class="filter__item-btn dropdown-toggle" role="button" id="filter-year" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="filter__range">
                                    <div id="filter__years-start"></div>
                                    <div id="filter__years-end"></div>
                                </div>
                                <span></span>
                            </div>

                            <div class="filter__item-menu filter__item-menu--range dropdown-menu" aria-labelledby="filter-year">
                                <div id="filter__years"></div>
                            </div>
                        </div>
                        <!-- end filter item -->
                    </div>

                    <!-- filter btn -->
                    <button class="filter__btn" type="button">apply filter</button>
                    <!-- end filter btn -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end filter -->

<!-- catalog -->
<div class="catalog">
    <div class="container">
        <div class="row">
            <!-- card -->
          <c:choose>
              <c:when test="${flims.size()>0}">
                  <c:forEach var="x" items="${flims}">
                      <div class="col-6 col-sm-12 col-lg-6">
                          <div class="card card--list">
                              <div class="row">
                                  <div class="col-12 col-sm-4">
                                      <div class="card__cover">
                                          <img src="/flim-image/${x.thumbnail}" alt="">
                                          <a href="/flim/${x.id}" class="card__play">
                                              <i class="icon ion-ios-play"></i>
                                          </a>
                                      </div>
                                  </div>

                                  <div class="col-12 col-sm-8">
                                      <div class="card__content">
                                          <h3 class="card__title"><a href="/flim/${x.id}">${x.name}</a></h3>
                                          <span class="card__category">
										<c:forEach items="${x.categories}" var="category">
                                            <a href="/flim/category/${category.id}/1">${category.name}</a>
                                        </c:forEach>
									</span>

                                          <div class="card__wrap">
                                              <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>

                                              <ul class="card__list">
                                                  <c:forEach items="${x.tags}" var="tag">
                                                      <li>${tag.tag}</li>
                                                  </c:forEach>
                                              </ul>
                                          </div>

                                          <div class="card__description">
                                              <p>
                                                      ${x.description}
                                              </p>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </c:forEach>

              </c:when>
              <c:otherwise>
                  <h1 class="home__title">No result :(</h1>
              </c:otherwise>
          </c:choose>
            <!-- end card -->

            <!-- paginator -->
            <c:if test="${allPage!=0}">
                <c:if test="${allPage !=1}">
                    <c:choose>
                        <c:when test="${pagingType}">
                            <div class="col-12">
                                <ul class="paginator paginator--list">
                                    <li class="paginator__item paginator__item--prev">
                                        <c:if test="${currentPage!=1}">
                                            <a href="/flim/all-flim/page/${currentPage-1}" style="display: flex;align-items: center"><i class="icon ion-ios-arrow-back"></i></a>
                                        </c:if>
                                    </li>
                                    <c:forEach var="page" begin="1" end="${allPage}">
                                        <c:choose>
                                            <c:when test="${page == currentPage}">
                                                <li class="paginator__item paginator__item--active"><a href="#">${page}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="paginator__item"><a href="/flim/all-flim/page/${page}">${page}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <li class="paginator__item paginator__item--next">
                                        <c:if test="${allPage!=currentPage}">
                                            <a href="/flim/all-flim/page/${currentPage+1}" style="display: flex;align-items: center;justify-content: end; "><i class="icon ion-ios-arrow-forward"></i></a>
                                        </c:if>
                                    </li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12">
                                <ul class="paginator paginator--list">
                                    <li class="paginator__item paginator__item--prev">
                                        <c:if test="${currentPage!=1}">
                                            <a href="/flim/searching?${keyword}=yo&page=${currentPage-1}" style="display: flex;align-items: center"><i class="icon ion-ios-arrow-back"></i></a>
                                        </c:if>
                                    </li>
                                    <c:forEach var="page" begin="1" end="${allPage}">
                                        <c:choose>
                                            <c:when test="${page == currentPage}">
                                                <li class="paginator__item paginator__item--active"><a href="#">${page}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="paginator__item"><a href="/flim/searching?keyword=${keyword}&page=${page}">${page}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <li class="paginator__item paginator__item--next">
                                        <c:if test="${allPage!=currentPage}">
                                            <a href="/flim/searching?keyword=${keyword}&page=${currentPage+1}" style="display: flex;align-items: center;justify-content: end;"><i class="icon ion-ios-arrow-forward"></i></a>
                                        </c:if>
                                    </li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </c:if>
            <!-- end paginator -->
        </div>
    </div>
</div>
<!-- end catalog -->
</body>
</html>
