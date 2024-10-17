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
                <div class="col-md-2">
                    <!-- sidebar -->
                    <?php require_once('./sidebar.php') ?>
                </div>
                <div class="col-md-10">
                    <?php
                    $level1Open = "";
                    $level2Open = "";
                    if (isset($_GET['level']) && isset($_GET['classid'])) {
                        //選擇第一層類別
                        $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=%d AND classid=%d", $_GET['level'], $_GET['classid']);
                        $classid_rs = $link->query($SQLstring);
                        $data = $classid_rs->fetch();
                        $level1Cname = $data['cname'];
                        $level1Open = '<li class="breadcrumb-item active" aria-current="page">' . $level1Cname . '</li>';
                    } elseif (isset($_GET['classid'])) {
                        //選擇第二層類別
                        $SQLstring = sprintf("SELECT * FROM pyclass where level=2 and classid=%d", $_GET['classid']);
                        $classid_rs = $link->query($SQLstring);
                        $data = $classid_rs->fetch();
                        $level2Cname = $data['cname'];
                        $level2Uplink = $data['uplink'];
                        $level2Open = '<li class="breadcrumb-item active" aria-current="page">' . $level2Cname . '</li>';
                        //需加處理上一層
                        $SQLstring = sprintf("SELECT * FROM pyclass where level=1 and classid=%d", $level2Uplink);
                        $classid_rs = $link->query($SQLstring);
                        $data = $classid_rs->fetch();
                        $level1Cname = $data['cname'];
                        $level1 = $data['level'];
                        $level1Open = '<li class="breadcrumb-item"><a href="furniture.php?classid=' . $level2Uplink . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
                    }
                    ?>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./furniture.php">所有商品</a></li>
                            <?php echo $level1Open . $level2Open; ?>
                        </ol>
                    </nav>
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