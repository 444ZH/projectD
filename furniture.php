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
    <section id="seccontent">
        <div class="container">
            <div class="row col-12 mx-auto d-flex justify-content-center mt-5">
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