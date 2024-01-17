<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="code" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 17/1/2024
  Time: 11:18 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../decorator/head/head.jsp"%>
<body>
<%@include file="../decorator/header/header.jsp"%>

<section class="section details">
    <!-- details background -->
    <div class="details__bg" data-bg="img/home/home__bg.jpg"></div>
    <!-- end details background -->

    <!-- details content -->
    <div class="container">
        <div class="row">
            <!-- title -->
            <div class="col-12">
                <h1 class="details__title">${flim.name}</h1>
            </div>
            <!-- end title -->

            <!-- content -->
            <div class="col-10">
                <div class="card card--details card--series">
                    <div class="row">
                        <!-- card cover -->
                        <div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-3">
                            <div class="card__cover">
                                <img src="${flim.thumbnail}" alt="">
                            </div>
                        </div>
                        <!-- end card cover -->

                        <!-- card content -->
                        <div class="col-12 col-sm-8 col-md-8 col-lg-9 col-xl-9">
                            <div class="card__content">
                                <div class="card__wrap">
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>

                                    <ul class="card__list">
                                        <c:forEach items="${flim.tags}" var="tag">
                                            <li>${tag.tag}</li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <ul class="card__meta">
                                    <li><span>Genre:</span>
                                        <code:forEach items="${flim.categories}" var="category">
                                            <a href="/category/${category.id}">${category.name}</a>
                                        </code:forEach>
                                    </li>
                                    <li><span>Release year:</span> ${flim.releaseYear}</li>
                                    <li><span>Seasons:</span> ${flim.seasons.size()} seasons</li>
                                    <li><span>Country:</span> <a href="#">${flim.country.name}</a> </li>
                                </ul>

                                <div class="card__description card__description--details">
                                    ${flim.description}
                                </div>
                            </div>
                        </div>
                        <!-- end card content -->
                    </div>
                </div>
            </div>
            <!-- end content -->

            <!-- player -->
            <div class="col-12 col-xl-6">
                <iframe width="100%" height="100%" src="https://short.ink/qyhJbUwNR" frameborder="0" scrolling="0" allowfullscreen></iframe>
            </div>
            <!-- end player -->

            <!-- accordion -->
            <div class="col-12 col-xl-6">
                <div class="accordion" id="accordion">
                    <c:forEach items="${flim.seasons}" var="season">

                        <div class="accordion__card">
                            <div class="card-header" id="headingOne">
                                <button type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <span>${season.seasonName}</span>
<%--                                    <span>22 Episodes from Nov, 2004 until May, 2005</span>--%>
                                </button>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    <table class="accordion__list">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Title</th>
                                            <th>Upload date</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${season.episodes}" var="episode">
                                            <tr>
                                                <th>${episode.id}</th>
                                                <td>${season.seasonName} Ep.${episode.episode}</td>
                                                <td>${episode.uploadDate}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>
            </div>
            <!-- end accordion -->

            <div class="col-12">
                <div class="details__wrap">
                    <!-- availables -->
                    <div class="details__devices">
                        <span class="details__devices-title">Available on devices:</span>
                        <ul class="details__devices-list">
                            <li><i class="icon ion-logo-apple"></i><span>IOS</span></li>
                            <li><i class="icon ion-logo-android"></i><span>Android</span></li>
                            <li><i class="icon ion-logo-windows"></i><span>Windows</span></li>
                            <li><i class="icon ion-md-tv"></i><span>Smart TV</span></li>
                        </ul>
                    </div>
                    <!-- end availables -->

                    <!-- share -->
                    <div class="details__share">
                        <span class="details__share-title">Share with friends:</span>

                        <ul class="details__share-list">
                            <li class="facebook"><a href="#"><i class="icon ion-logo-facebook"></i></a></li>
                            <li class="instagram"><a href="#"><i class="icon ion-logo-instagram"></i></a></li>
                            <li class="twitter"><a href="#"><i class="icon ion-logo-twitter"></i></a></li>
                            <li class="vk"><a href="#"><i class="icon ion-logo-vk"></i></a></li>
                        </ul>
                    </div>
                    <!-- end share -->
                </div>
            </div>
        </div>
    </div>
    <!-- end details content -->
</section>
<!-- end details -->

<!-- content -->
<section class="section section--bg" data-bg="/img/section/section.jpg">
    <div class="container">
        <div class="row">
            <!-- section title -->
            <div class="col-12">
                <h2 class="section__title">You may also like...</h2>
            </div>
            <!-- end section title -->

            <!-- card -->
            <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                <div class="card">
                    <div class="card__cover">
                        <img src="img/covers/cover.jpg" alt="">
                        <a href="#" class="card__play">
                            <i class="icon ion-ios-play"></i>
                        </a>
                    </div>
                    <div class="card__content">
                        <h3 class="card__title"><a href="#">I Dream in Another Language</a></h3>
                        <span class="card__category">
								<a href="#">Action</a>
								<a href="#">Triler</a>
							</span>
                        <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
                    </div>
                </div>
            </div>
            <!-- end card -->

            <!-- card -->
            <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                <div class="card">
                    <div class="card__cover">
                        <img src="img/covers/cover3.jpg" alt="">
                        <a href="#" class="card__play">
                            <i class="icon ion-ios-play"></i>
                        </a>
                    </div>
                    <div class="card__content">
                        <h3 class="card__title"><a href="#">Benched</a></h3>
                        <span class="card__category">
								<a href="#">Comedy</a>
							</span>
                        <span class="card__rate"><i class="icon ion-ios-star"></i>7.1</span>
                    </div>
                </div>
            </div>
            <!-- end card -->

            <!-- card -->
            <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                <div class="card">
                    <div class="card__cover">
                        <img src="img/covers/cover2.jpg" alt="">
                        <a href="#" class="card__play">
                            <i class="icon ion-ios-play"></i>
                        </a>
                    </div>
                    <div class="card__content">
                        <h3 class="card__title"><a href="#">Whitney</a></h3>
                        <span class="card__category">
								<a href="#">Romance</a>
								<a href="#">Drama</a>
								<a href="#">Music</a>
							</span>
                        <span class="card__rate"><i class="icon ion-ios-star"></i>6.3</span>
                    </div>
                </div>
            </div>
            <!-- end card -->

            <!-- card -->
            <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                <div class="card">
                    <div class="card__cover">
                        <img src="img/covers/cover6.jpg" alt="">
                        <a href="#" class="card__play">
                            <i class="icon ion-ios-play"></i>
                        </a>
                    </div>
                    <div class="card__content">
                        <h3 class="card__title"><a href="#">Blindspotting</a></h3>
                        <span class="card__category">
								<a href="#">Comedy</a>
								<a href="#">Drama</a>
							</span>
                        <span class="card__rate"><i class="icon ion-ios-star"></i>7.9</span>
                    </div>
                </div>
            </div>
            <!-- end card -->

            <!-- card -->
            <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                <div class="card">
                    <div class="card__cover">
                        <img src="img/covers/cover4.jpg" alt="">
                        <a href="#" class="card__play">
                            <i class="icon ion-ios-play"></i>
                        </a>
                    </div>
                    <div class="card__content">
                        <h3 class="card__title"><a href="#">I Dream in Another Language</a></h3>
                        <span class="card__category">
								<a href="#">Action</a>
								<a href="#">Triler</a>
							</span>
                        <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
                    </div>
                </div>
            </div>
            <!-- end card -->

            <!-- card -->
            <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                <div class="card">
                    <div class="card__cover">
                        <img src="img/covers/cover5.jpg" alt="">
                        <a href="#" class="card__play">
                            <i class="icon ion-ios-play"></i>
                        </a>
                    </div>
                    <div class="card__content">
                        <h3 class="card__title"><a href="#">Benched</a></h3>
                        <span class="card__category">
								<a href="#">Comedy</a>
							</span>
                        <span class="card__rate"><i class="icon ion-ios-star"></i>7.1</span>
                    </div>
                </div>
            </div>
            <!-- end card -->
        </div>
    </div>
</section>
<%@include file="../decorator/footer/footer.jsp"%>
<%@include file="../decorator/scrpit/scrpit.jsp"%>
</body>
</html>
