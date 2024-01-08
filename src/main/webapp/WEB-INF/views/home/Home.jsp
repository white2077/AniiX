<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>AniiX</title>
</head>

<body style="background-color: rgb(38, 50, 56);">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Aniix</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Dạng phim
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Ova</a></li>
                            <li><a class="dropdown-item" href="#">Lẻ</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Thể loại
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Ova</a></li>
                            <li><a class="dropdown-item" href="#">Lẻ</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Top
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Ngày</a></li>
                            <li><a class="dropdown-item" href="#">Tháng</a></li>
                            <li><a class="dropdown-item" href="#">Năm</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>



<div class="container">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://s199.imacdn.com/vg/2023/10/15/864d8df1112ef262_371d215a8d1d0379_150454216973679299118684.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://s199.imacdn.com/vg/2023/10/15/864d8df1112ef262_371d215a8d1d0379_150454216973679299118684.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://s199.imacdn.com/vg/2023/10/15/864d8df1112ef262_371d215a8d1d0379_150454216973679299118684.jpg"
                     class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="mt-3">
        <div class="alert bg-dark" style="color: white;" role="alert">
            Mới cập nhật
        </div>
        <div class="row">
            <div class="col-md-2 mb-3">
                <div class="card " style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx151807-m1gX3iwfIsLu.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Ore dake Level Up na..
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx166240-2XbSZkWX6Dqe.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kimetsu no Yaiba:
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx141821-lkVTjKqL4BU2.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Mato Seihei no Slave
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx136804-IJ6tbQ0tRxv4.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kono Subarashii
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx102976-WcNjDFdQbdCv.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kono Subarashii
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx166240-2XbSZkWX6Dqe.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kimetsu no Yaiba:
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt-3">
        <div class="alert bg-dark" style="color: white;" role="alert">
            Top Tuần
        </div>
        <div class="row ps-5">
            <div class="col-md-4">
                <div class="card " style="width: 21rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx151807-m1gX3iwfIsLu.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Ore dake Level Up na..
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card " style="width: 21rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/manga/cover/large/nx105011-DxP8LvUSfRiJ.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Ore dake Level Up na..
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card " style="width: 21rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx151807-m1gX3iwfIsLu.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Ore dake Level Up na..
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="mt-3">
        <div class="alert bg-dark" style="color: white;" role="alert">
            Toàn bộ
        </div>
        <div class="row">
            <div class="col-md-2 mb-3">
                <div class="card " style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx151807-m1gX3iwfIsLu.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Ore dake Level Up na..
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx166240-2XbSZkWX6Dqe.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kimetsu no Yaiba:
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx141821-lkVTjKqL4BU2.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Mato Seihei no Slave
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx136804-IJ6tbQ0tRxv4.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kono Subarashii
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx102976-WcNjDFdQbdCv.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kono Subarashii
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx166240-2XbSZkWX6Dqe.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kimetsu no Yaiba:
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card " style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx151807-m1gX3iwfIsLu.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Ore dake Level Up na..
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx166240-2XbSZkWX6Dqe.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kimetsu no Yaiba:
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx141821-lkVTjKqL4BU2.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Mato Seihei no Slave
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx136804-IJ6tbQ0tRxv4.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kono Subarashii
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx102976-WcNjDFdQbdCv.png"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kono Subarashii
                    </div>
                </div>
            </div>
            <div class="col-md-2 mb-3">
                <div class="card" style="width: 12rem;">
                    <img src="https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx166240-2XbSZkWX6Dqe.jpg"
                         class="card-img-top" alt="...">
                    <div class="card-footer bg-secondary">
                        Kimetsu no Yaiba:
                    </div>
                </div>
            </div>
        </div>
        <button type="button align-middle" class="btn btn-dark">Xem thêm...</button>

    </div>

</div>




<footer class="mt-lg-5">
    <div class="bg-dark alert" style="color: white;">
        @Bùi Hoàng Dũng - AniiX-2077
        <br>
        @White2077 - Anixx
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
-->

</body>

</html>