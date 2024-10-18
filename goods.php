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
    <link rel="stylesheet" href="./fancybox-2.1.7/source/jquery.fancybox.css">
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php') ?>
    </section>
    <section id="seccontent">
        <div class="container">



            <div class="card mb-3 mt-5 border-0">
                <!-- breadcrumb -->
                <?php require_once('./breadcrumb.php') ?>
                <div class="row g-0 mt-3">
                    <div class="col-md-6 text-center">
                        <?php
                        $SQLstring = sprintf("SELECT * FROM product_img WHERE product_img.p_id = %d ORDER BY sort", $_GET['p_id']);
                        $img_rs = $link->query($SQLstring);
                        $imgList = $img_rs->fetch();
                        ?>
                        <img src="./images/product/<?php echo $imgList['img_file']; ?>" class="img-fluid rounded justify-content-center" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>" id="showGoods" name="showGoods" style="border: 1px solid #ddd;">
                        <div class="row mt-2 d-flex justify-content-center">
                            <?php do { ?>
                                <div class="col-md-2">
                                    <a href="./images/product/<?php echo $imgList['img_file']; ?>" title="<?php echo $data['p_name']; ?>" rel="group" class="fancybox">
                                        <img src="./images/product/<?php echo $imgList['img_file']; ?>" class="img-fluid" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>"></a>
                                </div>
                            <?php } while ($imgList = $img_rs->fetch()); ?>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card-body mt-5">
                            <h5 class="card-title fw-bold fs-3"><?php echo $data['p_name']; ?></h5>
                            <p class="card-text mt-4"><?php echo $data['p_intro']; ?></p>
                            <h2 class="color_333 col-md-6 fw-bold ">NT$<?php echo $data['p_price']; ?></h2>
                            <div class="row mt-5 col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text" id="inputGroup-sizing-default">數量</span>
                                    <input type="number" id="qty" name="qty" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-md-6">
                                    <button name="button01" id="button01" type="button">直接購買</button>
                                </div>
                                <div class="col-md-6">
                                    <button name="button02" id="button02" type="button">加入購物車</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row col-10 mx-auto">
                <?php echo $data['p_content']; ?>
            </div>





        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php') ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php') ?>
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