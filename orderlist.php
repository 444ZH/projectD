<?php
//連資料庫
require_once('connection/furnitureshop_db.php');
//如果session沒有啟動則啟動，跨頁面存取變數
if (!isset($_SESSION)) {
    session_start();
}
// 載入共用PHP函數庫
require_once("./php_lib.php");  //分頁功能
if (!isset($_SESSION['login'])) {
    $sPath = "login.php ? sPath=orderlist";
    header(sprintf("location: %s", $sPath));
}
?>

<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入head -->
    <?php require_once('./headfile.php'); ?>
    <style>
        .orderListTitle {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
            padding-top: 20px;
            font-size: 30px;
        }

        .color_red {
            color: red !important;
        }

        table tfoot tr {
            border-bottom: 1px solid #ddd;
        }

        .orderListBtn {
            background-color: #f4f4f4;
            border: 2px solid #ddd;
        }

        #accordion_order a {
            text-decoration: none;
        }

        #accordion_order a table tr {
            border-bottom: 1px solid #fff;
        }

        #accordion_order a table td {
            background: none;
        }
    </style>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <!-- goods_content -->
            <?php require_once('./orderlist_content.php'); ?>

        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>

    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>



</body>

</html>