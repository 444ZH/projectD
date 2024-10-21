<?php
//建立購物車查詢
$SQLstring =
    "SELECT * 
 FROM cart
 JOIN product ON cart.p_id = product.p_id
 JOIN product_img ON cart.p_id = product_img.p_id
 WHERE ip = '" . $_SERVER['REMOTE_ADDR'] . "'
 AND orderid IS NULL
 AND product_img.sort = 1
 ORDER BY cartid DESC";
$cart_rs = $link->query($SQLstring);
$ptotal = 0;    //設定累計總金額，初始為0
?>
<?php if ($cart_rs->rowCount() != 0) { ?>
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
    <div class="table-responsive mt-2">
        <table class="table table-hover text-center">
            <thead>
                <tr class="table-secondary">
                    <td width="30%">商品訊息</td>
                    <td width="15%">售價</td>
                    <td width="15%">數量</td>
                    <td width="20%">合計</td>
                    <td width="20%">訂單操作</td>
                </tr>
            </thead>
            <tbody>
                <?php while ($cart_data = $cart_rs->fetch()) { ?>
                    <tr>
                        <td class="align-middle productLeft">
                            <img src="./images/product/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" style="width: 150px;">
                            <span><?php echo $cart_data['p_name']; ?></span>
                        </td>
                        <td class="align-middle fw-bold fs-5">$<?php echo number_format($cart_data['p_price']); ?></td>
                        <td class="align-middle fw-bold fs-5" style="min-width: 100px;">
                            <div class="input-group mx-auto w-50">
                                <input type="number" class="form-control" id="qty[]" name="qty[]" value="<?php echo $cart_data['qty']; ?>" min="1" max="49" cartid="<?php echo $cart_data['cartid']; ?>" required>
                            </div>
                        </td>
                        <td class="align-middle fw-bold fs-5 subtotal">$<?php echo number_format($cart_data['p_price'] * $cart_data['qty']); ?></td>
                        <td class="align-middle"><button type="button" id="btn[]" name="btn[]" class="cancelBtn" onclick="btn_confirmLink('確定刪除本項產品?','shopcart_del.php?mode=1&cartid=<?php echo $cart_data['cartid']; ?>')">刪除</button></td>
                    </tr>
                <?php $ptotal += $cart_data['p_price'] * $cart_data['qty'];
                } ?>
            </tbody>
            <tfoot>
                <tr class="table-secondary">
                    <td><button type="button" id="btn01" name="btn01" class="clearCartBtn" onclick="btn_confirmLink('確定清空購物車?','shopcart_del.php?mode=2')">清空購物車</button></td>
                    <td colspan="3" class="fw-bold total">總金額(不含運費):<span class="totalPrice">NT$<?php echo number_format($ptotal); ?></span></td>
                    <td><button type="button" id="btn02" name="btn02" class="CheckoutBtn" onclick="location.href='./checkout.php'">結帳</button></td>
                </tr>
            </tfoot>
        </table>
    </div>
<?php } else { ?>
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
    <div class="table-responsive mt-2">
        <table class="table text-center">
            <thead>
                <tr class="table-secondary">
                    <td width="30%">商品訊息</td>
                    <td width="15%">售價</td>
                    <td width="15%">數量</td>
                    <td width="20%">合計</td>
                    <td width="20%">訂單操作</td>
                </tr>
            </thead>
            <tbody>

                <tr class="">
                    <td colspan="5">
                        <div class="alert alert-warning my-4" role="alert">
                            您目前沒有選購任何商品
                        </div>
                        <button type="button" class="mb-4 buyNowBtn" onclick="location.href='./furniture.php'">立刻選購</button>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr class="table-secondary">
                    <td><button type="button" id="btn01" name="btn01" class="clearCartBtn">清空購物車</button></td>
                    <td colspan="3" class="fw-bold total">總金額(不含運費):<span class="totalPrice">NT$</span></td>
                    <td><button type="button" id="btn02" name="btn02" class="CheckoutBtn">結帳</button></td>
                </tr>
            </tfoot>
        </table>
    </div>
<?php } ?>