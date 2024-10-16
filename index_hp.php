<?php
//連資料庫
require_once('connection/furnitureshop_db.php');
//如果session沒有啟動則啟動，跨頁面存取變數
if (!isset($_SESSION)) {
    session_start();
}
?>



<!doctype html>
<html lang="zh-TW">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>練習</title>
    <link rel="stylesheet" href="./index_hp.css">
    <link rel="stylesheet" href="./bootstrap5.3.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@200..900&display=swap" rel="stylesheet">
</head>

<body>
    <section id="header">

        <nav class="navbar navbar-expand-lg bg-white fixed-top">
            <div class="container-fluid">
                <div class="navbarLOGO col-md-2"><a class="navbar-brand" href="#"><img src="./images/logo-removebg.png" alt="LOGO" class="img-fluid"></a></div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <?php
                // 列出產品類別第一層
                $SQLstring = "SELECT * FROM pyclass WHERE level = 1 ORDER BY sort";
                $pyclass01 = $link->query($SQLstring);
                ?>
                <div class="collapse navbar-collapse col-md-8" id="navbarNavDropdown">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                產品
                            </a>
                            <ul class="dropdown-menu">
                                <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                                    <li class="nav-item dropend">
                                        <a class="dropdown-item dropdown-toggle" href="#"><?php echo $pyclass01_Rows['cname']; ?></a>
                                        <?php
                                        //列出產品類別對應的第二層資料
                                        $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $pyclass01_Rows['classid']);
                                        $pyclass02 = $link->query($SQLstring);
                                        ?>
                                        <ul class="dropdown-menu dropSecond">
                                            <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                                <li><a class="dropdown-item" href="#"><?php echo $pyclass02_Rows['cname']; ?></a></li>
                                            <?php } ?>
                                        </ul>
                                    </li>
                                <?php
                                } ?>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">優惠專區</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">品牌獨家</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                服務與支援
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">顧客服務</a></li>
                                <li><a class="dropdown-item" href="#">FAQ常見問題</a></li>
                                <li><a class="dropdown-item" href="#">關於我們</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse col-md-2">
                    <ul class="navbar-nav ms-auto d-flex align-items-center">
                        <form action="" method="get">
                            <div class="input-group d-flex align-items-center">
                                <input type="text" name="search_name" class="form-control" placeholder="Search...">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa-solid fa-magnifying-glass fa-lg"></i></button></span>
                            </div>
                        </form>

                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa-solid fa-cart-shopping fa-lg"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa-regular fa-user fa-lg"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </section>

    <section id="content">
        <div class="container-fluid bgset">
            <div class="filter"></div>
            <div class="row">
                <div class="col-lg-12 homepage">
                    <div class="card col-md-4 transparent-card">
                        <div class="card-body centerBox">
                            <h5 class="card-title text-white text-end">用心裝飾</h5>
                            <span class="centerLine"></span>
                            <h5 class="card-title text-white text-start">每一個細節都值得被珍惜<br>讓生活變得更有質感</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
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
        </div>
    </section>
    <section id="seccontent">
        <div class="container">
            <div class="row col-12 mx-auto d-flex justify-content-center">
                <h2 class="allProduct">所有商品</h2>
                <div class="col-md-2">
                    <div class="sidebar">

                        <?php
                        //列出產品類別第一層
                        $SQLstring = "SELECT * FROM pyclass WHERE level = 1 ORDER BY sort";
                        $pyclass01 = $link->query($SQLstring);
                        $i = 1;     //控制編號順序，排版用
                        ?>
                        <div class="accordion accordion-flush border border-1" id="accordionFlushExample">
                            <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-headingOne<?php echo $i; ?>">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne<?php echo $i; ?>" aria-expanded="false" aria-controls="flush-collapseOne<?php echo $i; ?>">
                                            <?php echo $pyclass01_Rows['cname']; ?>
                                        </button>
                                    </h2>
                                    <?php
                                    // 列出產品類別第二層
                                    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level = 2 AND uplink = %d ORDER BY sort", $pyclass01_Rows['classid']);
                                    $pyclass02 = $link->query($SQLstring);
                                    ?>

                                    <div id="flush-collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == 1) ? 'show' : ''; ?>" aria-labelledby="flush-headingOne<?php echo $i; ?>" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">
                                            <table class="table">
                                                <tbody>
                                                    <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                                        <tr>
                                                            <td><a href=""><?php echo $pyclass02_Rows['cname'] ?></a></td>
                                                        </tr>
                                                    <?php } ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            <?php $i++;
                            } ?>


                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="row text-center d-flex gap-1 flex-nowrap mb-1">
                        <div class="card" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product/chair//p31-1.webp" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                    </div>
                    <div class="row text-center d-flex gap-1 flex-nowrap mb-1">
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                    </div>
                    <div class="row text-center d-flex gap-1 flex-nowrap mb-1">
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                    </div>
                    <div class="row text-center d-flex gap-1 flex-nowrap mb-1">
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                        <div class="card col-sm-1" style="border-radius: 0; width: 33.3%">
                            <a href="#"><img src="./images//product//decorations//decorations.jpg" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <span class="card-text fs-6">各類擺飾</span>
                                <h5 class="card-title fw-bold">裝飾碟,<sapn class="fs-6">30公分</sapn>
                                </h5>
                                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span>500</p>
                                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
                            </div>
                        </div>
                    </div>

                </div>
                <nav aria-label="Page navigation example">
                    <ul class="newpagination justify-content-center my-4">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <section id="footer">
        <div class="container">
            <div id="aboutme" class="row col-md-12">
                <div class="card col-md-3 border-0 my-2" style="background-color: #333;">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item" style="background-color: #333; border: none;">
                            <a href="./index.html" class="footerLogo"><img src="./images/logo-removebg.png" alt=""></a>
                        </li>
                        <li class="list-group-item" style="background-color: #333; border: none;">
                            <h3 class="footerTitle">OOOO公司</h3>
                        </li>
                        <li class="list-group-item" style="background-color: #333; border: none;">
                            <a href="#" class="contactInfo"><span>E-mail</span>&emsp; sales@test.com.tw</a><br>
                            <a href="#" class="contactInfo"><span>Address</span>&emsp;402台中市OOXXOOXX</a>
                        </li>
                        <li class="list-group-item communityIcon" style="background-color: #333; border: none;">
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            <a href="#"><i class="fa-brands fa-line"></i></a>
                            <a href="#"><i class="fa-brands fa-youtube"></i></a>
                        </li>
                        <li class="list-group-item" style="background-color: #333; border: none;">
                            <button class="servicebtn"><i class="fa-solid fa-phone"></i>聯絡我們</button><br>
                            <button class="servicebtn"><i class="fa-solid fa-headphones"></i>服務洽詢</button>
                        </li>
                    </ul>
                </div>
                <div class="card col-md-9 border-0" style="background-color: #333;">
                    <div class="d-flex justify-content-end gap-4">

                        <div class="card border-0 col-md-3 text-light mt-5" style="background-color: #333;">
                            <div class="card-header">
                                <h5>關於我們</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text"><a href="#" class="footerItem">最新公告</a></p>
                                <p class="card-text"><a href="#" class="footerItem">招商專區</a></p>
                                <p class="card-text"><a href="#" class="footerItem">人才招募</a></p>
                                <p class="card-text"><a href="#" class="footerItem">合作廠商</a></p>
                                <p class="card-text"><a href="#" class="footerItem">APP會員募集中</a></p>
                            </div>
                        </div>
                        <div class="card border-0 col-md-3 text-light mt-5" style="background-color: #333;">
                            <div class="card-header">
                                <h5>客戶服務</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text"><a href="#" class="footerItem">訂單查詢</a></p>
                                <p class="card-text"><a href="#" class="footerItem">退/換貨申請</a></p>
                                <p class="card-text"><a href="#" class="footerItem">訂閱電子報</a></p>
                            </div>
                        </div>
                        <div class="card border-0 col-md-3 text-light mt-5" style="background-color: #333;">
                            <div class="card-header">
                                <h5>FAQ 常見問題</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text"><a href="#" class="footerItem">防詐騙提醒</a></p>
                                <p class="card-text"><a href="#" class="footerItem">隱私權保護</a></p>
                                <p class="card-text"><a href="#" class="footerItem">網路購物權益</a></p>
                                <p class="card-text"><a href="#" class="footerItem">會員服務條款</a></p>
                                <p class="card-text"><a href="#" class="footerItem">會員點數說明</a></p>
                                <p class="card-text"><a href="#" class="footerItem">重要權益須知</a></p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="border-top: 1px solid #777;">
            <div id="copyright" class="row text-center text-light py-3">
                <div class="col-md-12">
                    <h6 id="copyright">版權所有｜© Copyright <span id="copyrightYear"></span> OOO CO., LTD. All Rights Reserved</h6>
                </div>
            </div>
        </div>
    </section>

    <!-- js file -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./bootstrap5.3.3-dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Copyright年分
        const currentYear = new Date().getFullYear();
        document.querySelector('#copyrightYear').textContent = currentYear;
    </script>
</body>

</html>