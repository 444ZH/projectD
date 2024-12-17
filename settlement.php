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
    $sPath = "login.php?sPath=checkout";
    header(sprintf("location: %s", $sPath));
}
?>

<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入head -->
    <?php require_once('./headfile.php'); ?>
    <style>
        .stepNum {
            height: 30px;
            width: 30px;
            border-radius: 50%;
            color: #fff;
            font-weight: bold;
            background-color: #000;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        span.one,
        span.two {
            background-color: #ddd;
        }

        .stepArrow {
            font-size: 20px;
            color: #999;
        }

        .orderStep li {
            width: fit-content;
        }

        .checkoutTitle {
            border-top: 2px solid #ddd;
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            font-size: 30px;
        }

        .color_red {
            color: red !important;
        }

        td.productCenter {
            text-align: center;
        }

        tr.status {
            font-size: 12px;
        }

        td.total {
            text-align: center;
        }

        .homeBtn {
            background-color: red;
            color: #fff;
            padding: 10px 30px;
            border: none;
            font-weight: bold;
        }

        .homeBtn:hover {
            background-color: #ff6c6c;
        }
    </style>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <div class="row col-md-12 mt-5 orderStep ">
                <ul class="d-flex justify-content-center gap-5 orderStep">
                    <li class="col-md-2 d-flex align-items-center gap-3">
                        <span class="stepNum one">1</span>
                        <span>查看購物車</span>
                    </li>
                    <li class="col-md-1 d-flex align-items-center stepArrow">
                        <span>></span>
                    </li>
                    <li class="col-md-2 d-flex align-items-center gap-3">
                        <span class="stepNum two">2</span>
                        <span>確認訂單</span>
                    </li>
                    <li class="col-md-1 d-flex align-items-center stepArrow">
                        <span>></span>
                    </li>
                    <li class="col-md-2 d-flex align-items-center gap-3">
                        <span class="stepNum three">3</span>
                        <span>訂單結算</span>
                    </li>
                </ul>
            </div>
            <h4 class="checkoutTitle">訂單完成</h4>
            <div class="table-responsive col-md-10 mx-auto my-4">
                <table class="table table-borderless text-center">
                    <thead>
                        <tr class="table-light">
                            <td width="40%">商品訊息</td>
                            <td width="10%">售價</td>
                            <td width="10%">數量</td>
                            <td width="15%">訂單總額</td>
                            <td width="10%">交易狀態</td>
                            <td width="15%">訂單操作</td>
                        </tr>
                    </thead>
                </table>
                <table class="table text-center">
                    <tbody>
                        <?php
                        $SQLstring = sprintf(
                            "SELECT uorder.orderid,
                                    uorder.create_date AS orderTime,
                                    ms1.msname AS howpay,
                                    ms2.msname AS status,
                                    addbook.*
                            FROM uorder
                            JOIN addbook ON uorder.addressid = addbook.addressid
                            JOIN multiselect AS ms1 ON ms1.msid = uorder.howpay
                            JOIN multiselect AS ms2 ON ms2.msid = uorder.status
                            WHERE uorder.emailid = %d
                            ORDER BY uorder.create_date DESC
                            LIMIT 1",
                            $_SESSION['emailid']
                        );
                        $order_rs = $link->query($SQLstring);
                        ?>
                        <?php if ($order_rs->rowCount() === 1) { ?>
                            <?php while ($status = $order_rs->fetch()) { ?>
                                <tr class="table-light status" style="border: 1px solid #ddd;">
                                    <td colspan="3">
                                        訂單編號&nbsp;<?php echo $status['orderid']; ?>
                                    </td>
                                    <td colspan="3">
                                        訂單日期&nbsp;<?php echo $status['orderTime']; ?>
                                    </td>
                                </tr>

                                <?php
                                $SQLstring = sprintf(
                                    "SELECT *, ms1.msname AS status
                                    FROM cart
                                    JOIN product ON cart.p_id = product.p_id
                                    JOIN product_img ON cart.p_id = product_img.p_id
                                    JOIN multiselect AS ms1 ON ms1.msid = cart.status
                                    WHERE cart.orderid = '%s'
                                    AND product_img.sort = 1 
                                    ORDER BY cart.create_date DESC",
                                    $status['orderid']
                                );
                                $cart_rs = $link->query($SQLstring);
                                $pTotal = 0;
                                ?>

                                <?php while ($cart_data = $cart_rs->fetch()) { ?>
                                    <tr style="border: 1px solid #ddd;">
                                        <td width="40%" class="align-middle productCenter">
                                            <img src="./images/product/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" style="width: 100px;">
                                            <span><?php echo $cart_data['p_name']; ?></span>
                                        </td>
                                        <td width="10%" class="align-middle fw-bold fs-5">$<?php echo number_format($cart_data['p_price']); ?></td>
                                        <td width="10%" class="align-middle fw-bold fs-5" style="min-width: 100px;"><?php echo $cart_data['qty']; ?></td>
                                        <?php $pTotal += $cart_data['p_price'] * $cart_data['qty']; ?>
                                        <td width="15%" class="align-middle fw-bold fs-5 color_red">$<?php echo number_format($cart_data['p_price'] * $cart_data['qty']); ?></td>
                                        <td width="10%" class="align-middle fw-bold fs-5"><?php echo $cart_data['status'] ?></td>
                                        <td width="15%" class="align-middle">
                                            <a href="">取消訂單</a><br>
                                            <a href="">修改訂單</a>
                                        </td>
                                    </tr>
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" class="fw-bold total border-0"></td>
                            <td class="fw-bold total border-0 fs-5" colspan="2">
                                總金額(含運費):<span class="color_red">NT$<?php echo number_format($pTotal + 100); ?></span>
                            </td>
                            <td class="border-0" colspan="1">
                                <button type="button" id="btn02" name="btn02" class="homeBtn">回首頁</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>
    <script>
        document.querySelector('#btn02').addEventListener("click", function() {
            window.location.href = 'index_hp.php';
        });
    </script>
</body>

</html>