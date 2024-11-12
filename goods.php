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
    <?php require_once('./headfile.php'); ?>
    <link rel="stylesheet" href="./fancybox-2.1.7/source/jquery.fancybox.css">
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <!-- goods_content -->
            <?php require_once('./goods_content.php'); ?>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>
    <script src="./fancybox-2.1.7/source/jquery.fancybox.pack.js"></script>
    <script>
        //定義滑鼠滑過圖片檔名填入主圖src中
        $(function() {
            $(".card .row.mt-2 .col-md-2 a").mouseover(function() {
                var imgsrc = $(this).children("img").attr("src");
                $("#showGoods").attr({
                    "src": imgsrc
                });
            });
        });

        //fancybox展示
        $(function() {
            $(".fancybox").fancybox();
        });
    </script>
</body>

</html>