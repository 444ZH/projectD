<?php
//建立product商品查詢
$maxRows_rs = 12;   //分頁設定數量
$pageNum_rs = 0;    //起始頁=0
if (isset($_GET['pageNum_rs'])) {
    $pageNum_rs = $_GET['pageNum_rs'];
}
$startRow_rs = $pageNum_rs * $maxRows_rs;   //計算目前頁面開始的行數

if (isset($_GET['search_name'])) {
    //使用關鍵字查詢
    $queryFirst = sprintf("SELECT * FROM product, product_img, pyclass WHERE p_open = 1 AND product_img.sort = 1 AND product.p_id = product_img.p_id AND product.classid = pyclass.classid AND product.p_name LIKE '%s' ORDER BY product.p_id DESC", '%' . $_GET['search_name'] . '%');
} elseif (isset($_GET['level']) && $_GET['level'] == 1) {
    //使用第一層類別查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img,pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid = pyclass.classid AND pyclass.uplink=%d ORDER BY product.p_id DESC", $_GET['classid']);
} elseif (isset($_GET['classid'])) {
    //使用產品類別查詢
    $queryFirst = sprintf("SELECT * FROM product, product_img WHERE p_open = 1 AND product_img.sort = 1 AND product.p_id = product_img.p_id AND product.classid = %d ORDER BY product.p_id DESC", $_GET['classid']);
} else {
    //列出product資料查詢
    $queryFirst = sprintf("SELECT * FROM product, product_img WHERE p_open = 1 AND product_img.sort = 1 AND product.p_id = product_img.p_id ORDER BY product.p_id DESC");
}

$query = sprintf("%s LIMIT %d, %d", $queryFirst, $startRow_rs, $maxRows_rs);
$pList01 = $link->query($query);
$i = 1; //控制每列row產生
?>
<?php if ($pList01->rowCount() != 0) { ?>
    <?php while ($pList01_Rows = $pList01->fetch()) { ?>
        <?php if ($i % 3 == 1) { ?>
            <div class="row text-center d-flex gap-1 flex-nowrap mb-1">
            <?php } ?>
            <div class="card" style="border-radius: 0; width: 33.3%">
                <a href="goods.php?p_id=<?php echo $pList01_Rows['p_id']; ?>"><img src="./images/product/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>"></a>
                <div class="card-body">
                    <p class="card-text fs-6"><?php echo $pList01_Rows['p_type']; ?></p>
                    <h5 class="card-title fw-bold"><?php echo $pList01_Rows['p_name']; ?></h5>
                    <p class="card-text fw-bold fs-4"><span class="fs-6">NT$</span><?php echo $pList01_Rows['p_price']; ?></p>
                </div>
            </div>
            <?php if ($i % 3 == 0 || $i == $pList01->rowCount()) { ?>
            </div>
        <?php } ?>
    <?php $i++;
    } ?>
<?php } else { ?>
    <div class="alert alert-danger" role="alert">
        抱歉!目前沒有相關產品
    </div>
<?php } ?>