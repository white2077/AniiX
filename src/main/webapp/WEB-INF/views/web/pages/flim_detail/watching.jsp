<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 18/1/2024
  Time: 8:12 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title></title>
</head>
<html>
<body>
<!-- details -->
<section class="section details">
    <!-- details background -->
<%--    /img/home/home__bg.jpg--%>
    <div class="details__bg" data-bg="${flim.thumbnail}"></div>
    <!-- end details background -->

    <!-- details content -->
    <div class="container">
        <div class="embed-responsive embed-responsive-16by9" style="margin-bottom: 50px">
            <iframe class="embed-responsive-item" width="100%" height="500vh" src="https://embed.api.video/vod/${episode.linkFlim}" frameborder="0" scrolling="0" allowfullscreen></iframe>
        </div>

        <div class="row">
            <!-- title -->
            <div class="col-12">
                <h1 class="details__title">${flim.name}</h1>
            </div>
            <!-- end title -->
            <!-- content -->
            <div class="col-12 col-xl-6">
                <div class="card card--details">
                    <div class="row">
                        <!-- card cover -->
                        <div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-5">
                            <div class="card__cover">
                                <img src="/flim-image/${flim.thumbnail}" alt="">
                            </div>
                        </div>
                        <!-- end card cover -->

                        <!-- card content -->
                        <div class="col-12 col-sm-8 col-md-8 col-lg-9 col-xl-7">
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
                                        <c:forEach items="${flim.categories}" var="category">
                                            <a href="/flim/category/${category.id}/1">${category.name}</a>
                                        </c:forEach>
                                    </li>
                                    <li><span>Release year:</span>${flim.releaseYear}</li>
                                    <li><span>Seasons:</span>${flim.seasons.size()}</li>
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
                <div class="accordion" id="accordion">
                    <div class="accordion__card">
                        <c:forEach items="${flim.seasons}" var="season">
                            <div class="card-header" id="headingOne">
                                <button type="button" data-toggle="collapse" data-target="#collapse${season.id}" aria-expanded="true" aria-controls="collapseOne">
                                    <span>${season.seasonName}</span>
<%--                                    <span>22 Episodes from Nov, 2004 until May, 2005</span>--%>
                                </button>
                            </div>

                            <div id="collapse${season.id}" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    <table class="accordion__list">
                                        <thead>
                                        <tr>
                                            <th>Episodes</th>
                                            <th>Title</th>
                                            <th>Upload date</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${season.episodes}" var="flimEp" varStatus="loop">
                                            <tr>
                                                <th>${loop.count}</th>
                                                <td><a href="/flim/${flim.id}/watch/${flimEp.id}">${season.seasonName}</a></td>
                                                <td>${flimEp.uploadDate}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- end player -->

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
</body>
</html>
