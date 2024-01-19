<%--
  Created by IntelliJ IDEA.
  User: buidu
  Date: 19/1/2024
  Time: 6:50 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Anime</div>
                <a class="nav-link" href="index.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    All Anime
                </a>
                <div class="sb-sidenav-menu-heading">Details</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Details anime
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="layout-static.html">Seasons</a>
                        <a class="nav-link" href="layout-sidenav-light.html">Episodes</a>
                        <a class="nav-link" href="layout-sidenav-light.html">Categories</a>
                        <a class="nav-link" href="layout-sidenav-light.html">Tags</a>
                    </nav>
                </div>

                <div class="sb-sidenav-menu-heading">Account</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts1">
                    <div class="sb-nav-link-icon"><i class="fas fa-user fa-fw"></i></div>
                    Account manager
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts1" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="layout-static.html">All Account</a>
                        <a class="nav-link" href="layout-sidenav-light.html">My Account</a>
                        <a class="nav-link" href="layout-sidenav-light.html">Add an admin :)</a>
                    </nav>
                </div>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            Start Bootstrap
        </div>
    </nav>
</div>
