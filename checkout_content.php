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
<h4 class="checkoutTitle">訂單詳情</h4>
<div class="row col-md-10 mx-auto chosePay">
    <h5>選擇付款方式</h5>
    <div>
        <input type="radio" id="payment1" name="payment" value="" checked>
        <label for="">貨到付款</label>
        <!-- <div class="paymentDetail" id="payDetail1">
                        <p>貨到付款</p>
                    </div> -->
    </div>
    <div>
        <input type="radio" id="payment2" name="payment" value="">
        <label for="">銀行轉帳</label>
        <div class="paymentDetail mx-auto my-2" id="payDetail2">
            <div class="card col-5">
                <img src="./images/taishin.jpg" class="img-fluid" alt="...">
                <div class="card-body">
                    <h5 class="card-title">ATM匯款資訊</h5>
                    <p class="card-text">匯款銀行:台新國際商業銀行</p>
                    <p class="card-text">姓名:OOO</p>
                    <p class="card-text">匯款帳號:1234-5678-9012-1234</p>
                    <p class="card-text">備註:匯款完成後，需要1-2個工作天，待系統入款完成後，將以簡訊通知訂單完成付款</p>
                </div>
            </div>
        </div>
    </div>
    <div>
        <input type="radio" id="payment3" name="payment" value="">
        <label for="">電子支付</label>
        <div class="paymentDetail my-2 epay" id="payDetail3" aria-labelledby="epay-tab">
            <table class="table caption-top text-center">
                <caption>選擇欲使用的電子支付</caption>
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">電子支付系統</th>
                        <th scope="col">電子支付公司</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row" class="align-middle"><input type="radio" name="epay" id="epay[]" checked></th>
                        <td class="align-middle"><img src="./images/payment/Apple Pay Card.svg" alt="Visa"></td>
                        <td class="align-middle">Apple Pay</td>
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle"><input type="radio" name="epay" id="epay[]"></th>
                        <td class="align-middle"><img src="./images/payment/linepay.png" alt="Mastercard"></td>
                        <td class="align-middle">Line Pay</td>
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle"><input type="radio" name="epay" id="epay[]"></th>
                        <td class="align-middle"><img src="./images/payment/JKOPAY.png" alt="Mastercard"></td>
                        <td class="align-middle">JKOPAY</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div>
        <input type="radio" id="payment4" name="payment" value="">
        <label for="">信用卡付款</label>
        <div class="paymentDetail" id="payDetail4">
            <table class="table caption-top text-center">
                <caption>選擇付款信用卡</caption>
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">信用卡系統</th>
                        <th scope="col">發卡銀行</th>
                        <th scope="col">帳號</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row" class="align-middle"><input type="radio" name="creditCard" id="creditCard[]" checked></th>
                        <td class="align-middle"><img src="./images/payment/Visa Payment Card.svg" alt="Visa"></td>
                        <td class="align-middle">OO銀行</td>
                        <td class="align-middle">1234 ****</td>
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle"><input type="radio" name="creditCard" id="creditCard[]"></th>
                        <td class="align-middle"><img src="./images/payment/Mastercard New.jpg" alt="Mastercard"></td>
                        <td class="align-middle">OO銀行</td>
                        <td class="align-middle">1234 ****</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="row col-md-10 mx-auto recipient">
    <h5>收件人</h5>
    <div>
        <?php
        //取得所有收件人資料
        $SQLstring = sprintf(
            "SELECT *, city.Name AS ctName, town.Name AS toName 
                        FROM addbook 
                        JOIN town ON addbook.myzip = town.Post
                        JOIN city ON town.AutoNo = city.AutoNo
                        WHERE emailid = %d",
            $_SESSION['emailid']
        );
        $addbook_rs = $link->query($SQLstring);
        ?>
        <?php if ($addbook_rs->rowCount() > 0) { ?>
            <?php while ($addbook_rows = $addbook_rs->fetch()) { ?>
                <input type="radio" name="recipientRadios" id="recipientRadios" value="<?php echo $addbook_rows['addressid'] ?>" <?php echo $addbook_rows['setdefault'] ? "checked" : ''; ?>>
                <label>
                    <?php echo $addbook_rows['cname']; ?>&nbsp;
                    <span><?php echo $addbook_rows['mobile']; ?></span>&nbsp;
                    <span><?php echo $addbook_rows['myzip']; ?>&nbsp;<?php echo $addbook_rows['ctName']; ?></span><span><?php echo $addbook_rows['toName']; ?></span><span><?php echo $addbook_rows['address']; ?></span>
                </label><br>
            <?php }  ?>
        <?php } else { ?>
            <button type="button" class="modalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                新增收件人
            </button>
        <?php } ?>
    </div>
</div>
<div class="table-responsive col-md-10 mx-auto my-4">
    <table class="table text-center">
        <thead>
            <tr class="table-secondary">
                <td width="35%">商品訊息</td>
                <td width="15%">售價</td>
                <td width="15%">數量</td>
                <td width="15%">合計</td>
            </tr>
        </thead>
        <tbody>
            <?php
            $SQLstring =
                "SELECT *
                        FROM cart
                        JOIN product ON cart.p_id = product.p_id
                        JOIN product_img ON cart.p_id = product_img.p_id
                        WHERE ip = '" . $_SERVER['REMOTE_ADDR'] . "' 
                        AND orderid is NULL
                        AND product_img.sort = 1
                        ORDER BY cartid DESC";
            $cart_rs = $link->query($SQLstring);
            $pTotal = 0;    //設定累計金額
            ?>
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
                </tr>
            <?php  } ?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3" class="fw-bold total border-0"></td>
                <td colspan="1" class="fw-bold total border-0">累計金額:<span class="color_red">NT$<?php echo number_format($pTotal); ?></span></td>
            </tr>
            <tr>
                <td colspan="3" class="fw-bold total border-0"></td>
                <td colspan="1" class="fw-bold total border-0">運費:<span class="color_red">NT$<?php echo number_format(100); ?></span></td>
            </tr>
            <tr>
                <td colspan="3" class="fw-bold total border-0"></td>
                <td colspan="1" class="fw-bold total border-0">總金額:<span class="color_red">NT$<?php echo number_format($pTotal + 100); ?></span></td>
            </tr>
            <tr>
                <td colspan="2" class="fw-bold total border-0"></td>
                <td class="border-0" colspan="1"><button type="button" id="btn01" name="btn01" class="CheckoutBtn" onclick="window.history.go(-1)">回上一頁</button></td>
                <td class="border-0" colspan="1"><button type="button" id="btn02" name="btn02" class="CheckoutBtn">確認訂單</button></td>
            </tr>
        </tfoot>
    </table>
</div>