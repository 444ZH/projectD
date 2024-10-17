<?php
//建立product商品查詢
$maxRowS_rs = 12;   //分頁設定數量
$pageNum_rs = 0;    //起始頁=0
if (isset($_GET['pageNum_rs'])) {
    $pageNum_rs = $_GET['pageNum_rs'];
}
$startRow_rs = $pageNum_rs * $maxRowS_rs;   //計算目前頁面開始的行數

//列出product資料查詢
$queryFirst = sprintf("SELECT * FROM product, product_img WHERE p_open = 1 AND product_img.sort = 1 AND product.p_id = product_img.p_id ORDER BY product.p_id DESC");
$query = sprintf("%s LIMIT %d, %d", $queryFirst, $startRow_rs, $maxRowS_rs);
$pList01 = $link->query($query);
$i = 1; //控制每列row產生
?>

<?php while ($pList01_Rows = $pList01->fetch()) { ?>
    <?php if ($i % 3 == 1) { ?>
        <div class="row text-center d-flex gap-1 flex-nowrap mb-1">
        <?php } ?>
        <div class="card" style="border-radius: 0; width: 33.3%">
            <a href="#"><img src="./images/product/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>"></a>
            <div class="card-body">
                <p class="card-text fs-6"><?php echo $pList01_Rows['p_intro']; ?></p>
                <h5 class="card-title fw-bold"><?php echo $pList01_Rows['p_name']; ?></h5>
                <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span><?php echo $pList01_Rows['p_price']; ?></p>
                <!-- <a href="#" class="btn"><i class="fa-solid fa-cart-shopping fa-lg"></i></a> -->
            </div>
        </div>
        <?php if ($i % 3 == 0 || $i == $pList01->rowCount()) { ?>
        </div>
    <?php } ?>
<?php $i++;
} ?>

