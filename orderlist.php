<?php
//連資料庫
require_once('./connection/furnitureshop_db_example.php');
//如果session沒有啟動則啟動，跨頁面存取變數
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// 載入共用PHP函數庫
require_once("./php_lib.php");  //分頁功能

//檢查是否完成登入驗證
if (!isset($_SESSION['login'])) {
    $sPath = "login.php ? sPath = orderlist1";
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
            padding-top: 20px;
            font-size: 24px;
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

        .accountInfo a {
            text-decoration: none;
            color: #aaa;
        }

        a.accountInfo {
            text-decoration: none;
            color: #aaa;
            font-weight: bold;
            width: fit-content;
        }

        a.accountInfo.selected {
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }

        a.accountInfo:hover {
            text-decoration: 1px solid #333;
            color: #333;
        }
    </style>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <div class="row col-md-10 mx-auto mt-5">
                <div class="col-md-2 d-flex flex-column gap-4 mt-5">
                    <a href="./myaccount.php" class="accountInfo">個人資料</a>
                    <a href="./orderlist.php" class="accountInfo selected">所有訂單</a>
                </div>
                <div class="col-md-10">
                    <?php require_once('./orderlist_content.php'); ?>
                </div>
            </div>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>
    <script src="./commlib.js"></script>
    <script src="./jquery.validate.js"></script>
    <script>
        document.querySelectorAll('.accountInfo').forEach(function(link) {
            link.addEventListener('click', function() {
                document.querySelectorAll('.accountInfo').forEach(function(link) {
                    link.classList.remove('selected')
                });
                this.classList.add('selected');
                window.location.href = this.getAttribute('href');
            });
        });
    </script>
</body>

</html>