<?php
//連資料庫
require_once('connection/furnitureshop_db.php');
//如果session沒有啟動則啟動，跨頁面存取變數
if (!isset($_SESSION)) {
    session_start();
}
// 載入共用PHP函數庫
require_once("./php_lib.php");  //分頁功能
?>



<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入head -->
    <?php require_once('./headfile.php') ?>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php') ?>
    </section>
    <section id="content">
        <?php require_once('./homepage_BG.php') ?>
        <!-- <div class="container-fluid">
            <div class="row p-5">
                <div class="col-12">
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row d-flex justify-content-center my-3">
                                    <div class="col-md-3 scale mx-1 my-2">
                                        <a href="#">
                                            <div class="card border-0">
                                                <img src="./images//product//chair//isu.jpg" class="card-img-top img-fluid" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">椅子</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-3 scale mx-1 my-2">
                                        <a href="#">
                                            <div class="card border-0">
                                                <img src="./images//product//table//tsukue.jpg" class="card-img-top img-fluid" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">桌子|茶几</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-3 scale mx-1 my-2">
                                        <a href="#">
                                            <div class="card border-0">
                                                <img src="./images//product//sofa//sofa.jpg" class="card-img-top img-fluid" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">沙發</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row d-flex justify-content-center my-3">
                                    <div class="col-md-3 scale mx-1 my-2">
                                        <a href="#">
                                            <div class="card border-0">
                                                <img src="./images//product//storage//bookshelf.jpg" class="card-img-top img-fluid" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">收納</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-3 scale mx-1 my-2">
                                        <a href="#">
                                            <div class="card border-0">
                                                <img src="./images//product//tableware//tableware.jpg" class="card-img-top img-fluid" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">餐具</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-3 scale mx-1 my-2">
                                        <a href="#">
                                            <div class="card border-0">
                                                <img src="./images//product//decorations//decorations.jpg" class="card-img-top img-fluid" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">裝飾</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"><i class="fa-solid fa-chevron-left text-dark fa-2x"></i></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"><i class="fa-solid fa-chevron-right text-dark fa-2x"></i></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div> -->
    </section>
    <section id="seccontent">
        <div class="container">
            <div class="row col-12 mx-auto d-flex justify-content-center">
                <h2 class="allProduct">所有商品</h2>
                <div class="col-md-2">
                    <!-- sidebar -->
                    <?php require_once('./sidebar.php') ?>
                </div>
                <div class="col-md-10">
                    <!-- product_list -->
                    <?php require_once('./product_list.php') ?>
                </div>
                <!-- 頁數功能 -->
                <?php require_once('./pages.php') ?>
            </div>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php') ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php') ?>
</body>

</html>