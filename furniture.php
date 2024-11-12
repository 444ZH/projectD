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
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <div class="row col-12 mx-auto d-flex justify-content-center mt-5">
                <div class="col-md-2">
                    <!-- sidebar -->
                    <?php require_once('./sidebar.php'); ?>
                </div>
                <div class="col-md-10">
                    <!-- breadcrumb -->
                    <?php require_once('./breadcrumb.php'); ?>
                    <!-- product_list -->
                    <?php require_once('./product_list.php'); ?>
                </div>
                <!-- 頁數功能 -->
                <?php
                //取得目前頁數
                if (isset($_GET['totalRows_rs'])) {
                    $totalRows_rs = $_GET['totalRows_rs'];
                } else {
                    $all_rs = $link->query($queryFirst);
                    $totalRows_rs = $all_rs->rowCount();
                }
                $totalRows_rs = ceil($totalRows_rs / $maxRows_rs) - 1;
                //呼叫分頁功能函數
                $prev_rs = "&laquo;";
                $next_rs = "&raquo;";
                $separator = "|";
                $max_links = 20;
                $pages_rs = buildNavigation($pageNum_rs, $totalRows_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "rs");
                ?>
                <nav aria-label="Page navigation example">
                    <ul class="newpagination justify-content-center my-4">
                        <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php') ?>
</body>

</html>