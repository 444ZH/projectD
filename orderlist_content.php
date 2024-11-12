<h4 class="orderListTitle">所有訂單</h4>
<?php
//建立訂單查詢
$maxRows_rs = 5;   //分頁設定數量
$pageNum_rs = 0;    //起始頁=0
if (isset($_GET['pageNum_order_rs'])) {
    $pageNum_rs = $_GET['pageNum_order_rs'];
}
$startRow_rs = $pageNum_rs * $maxRows_rs;   //計算目前頁面開始的行數
//列出uorder資料查詢
$queryFirst = sprintf(
    "SELECT uorder.orderid, 
                uorder.remark, 
                uorder.create_date AS orderTime, 
                ms1.msname AS howpay, 
                ms2.msname AS status,
                addbook.* 
        FROM uorder
        JOIN addbook ON uorder.addressid = addbook.addressid 
        JOIN multiselect AS ms1 ON ms1.msid = uorder.howpay 
        JOIN multiselect AS ms2 ON ms2.msid = uorder.status 
        WHERE uorder.emailid = %d 
        ORDER BY uorder.create_date DESC",
    $_SESSION['emailid']
);
$query = sprintf("%s LIMIT %d, %d", $queryFirst, $startRow_rs, $maxRows_rs);
$order_rs = $link->query($query);
$i = 21;    //控制第一筆訂單開啟
?>
<?php if ($order_rs->rowCount() != 0) { ?>
    <div class="accordion" id="accordion_order">
        <?php while ($data01 = $order_rs->fetch()) { ?>
            <div class="accordion-item mb-4">
                <h2 class="accordion-header" id="headingOne<?php echo $i; ?>">
                    <a class="accordion-button orderListBtn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
                        <div class="table-responsive-md w-100">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <td width="10%">訂單編號</td>
                                        <td width="20%">下訂日期</td>
                                        <td width="15%">付款方式</td>
                                        <td width="15%">訂單狀態</td>
                                        <td width="10%">收件人</td>
                                        <td width="20%">收件地址</td>
                                        <td width="10%">備註</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><?php echo $data01['orderid']; ?></td>
                                        <td><?php echo $data01['orderTime']; ?></td>
                                        <td><?php echo $data01['howpay']; ?></td>
                                        <td><?php echo $data01['status']; ?></td>
                                        <td><?php echo $data01['cname']; ?></td>
                                        <td><?php echo $data01['address']; ?></td>
                                        <td><?php echo $data01['remark']; ?></td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </a>
                </h2>
                <div id="collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == 21) ? 'show' : ''; ?>" aria-labelledby="headingOne<?php echo $i; ?>" data-bs-parent="#accordion_order">
                    <div class="accordion-body">
                        <?php
                        //處理訂單詳細商品資料
                        $SQLstring = sprintf(
                            "SELECT *, ms1.msname AS status 
                                     FROM cart 
                                     JOIN product ON cart.p_id = product.p_id 
                                     JOIN product_img ON cart.p_id = product_img.p_id 
                                     JOIN multiselect AS ms1 ON ms1.msid = cart.status 
                                     WHERE cart.orderid = '%s' 
                                     AND product_img.sort = 1 ORDER BY cart.create_date DESC",
                            $data01['orderid']
                        );
                        $cart_rs = $link->query($SQLstring);
                        $pTotal = 0;    //設定累計金額
                        ?>
                        <div class="table-responsive-md w-100">
                            <table class="table text-center table-responsive-md">
                                <thead>
                                    <tr class="table-secondary">
                                        <td width="50%">商品訊息</td>
                                        <td width="15%">售價</td>
                                        <td width="5%">數量</td>
                                        <td width="15%">合計</td>
                                        <td width="15%">狀態</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php while ($cart_data = $cart_rs->fetch()) { ?>
                                        <tr>
                                            <td class="align-middle productCenter">
                                                <img src="./images/product/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" style="width: 100px;">
                                                <span><?php echo $cart_data['p_name']; ?></span>
                                            </td>
                                            <td class="align-middle fw-bold fs-5">$<?php echo number_format($cart_data['p_price']); ?></td>
                                            <td class="align-middle fw-bold fs-5" style="min-width: 100px;"><?php echo $cart_data['qty']; ?></td>
                                            <?php $pTotal += $cart_data['p_price'] * $cart_data['qty']; ?>
                                            <td class="align-middle fw-bold fs-5 color_red">$<?php echo number_format($cart_data['p_price'] * $cart_data['qty']); ?></td>
                                            <td class="align-middle fw-bold fs-5"><?php echo $data01['status']; ?></td>
                                        </tr>
                                    <?php  } ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5" class="fw-bold total border-0">累計金額:<span class="color_red">NT$<?php echo number_format($pTotal); ?></span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" class="fw-bold total border-0">運費:<span class="color_red">NT$<?php echo number_format(100); ?></span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" class="fw-bold total border-0">總金額:<span class="color_red">NT$<?php echo number_format($pTotal + 100); ?></span></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <?php $i++;
        } ?>
    </div>
<?php } else { ?>
    <div class="alert alert-warning my-4" role="alert">
        沒有任何訂單
    </div>
<?php } ?>
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
$pages_rs = buildNavigation($pageNum_rs, $totalRows_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "order_rs");
?>
<nav aria-label="Page navigation example">
    <ul class="newpagination justify-content-center my-4">
        <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
    </ul>
</nav>