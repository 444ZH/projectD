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
    $sPath = "login.php ? sPath=checkout";
    header(sprintf("location: %s", $sPath));
}
?>

<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入head -->
    <?php require_once('./headfile.php') ?>
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
        span.three {
            background-color: #ddd;
        }

        .stepArrow {
            font-size: 20px;
            color: #999;
        }

        .orderStep li {
            width: fit-content;
        }

        .orderStepTitle {
            border-top: 2px solid #ddd;
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            font-size: 30px;
        }

        .chosePay,
        .recipient {
            border-top: 1px solid #ddd;
            margin-top: 20px;
            padding-top: 20px;
        }

        .subtotal {
            color: red !important;
        }


        td.productCenter {
            text-align: center;
        }

        td.total {
            text-align: center;
        }

        .totalPrice {
            color: red !important;
        }

        .CheckoutBtn {
            padding: 10px 30px;
            background-color: #000;
            color: #fff;
            font-weight: bold;
        }

        .CheckoutBtn:hover {
            background-color: #333;
        }

        .table thead tr td,
        .table tbody tr td {
            border: 1px solid #e2e3e5;
        }

        .paymentDetail {
            display: none;
        }

        .paymentDetail table {
            width: 50%;
        }

        .paymentDetail table tbody img {
            width: 100px;
        }
    </style>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php') ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <!-- goods_content -->
            <?php //require_once('./cart_content.php') 
            ?>

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

            <h4 class="orderStepTitle">訂單詳情</h4>
            <div class="row col-md-10 mx-auto chosePay">
                <h5>選擇付款方式</h5>
                <div>
                    <input type="radio" id="payment1" name="payment" value="">
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
                    <input type="radio">
                    <label>
                        李XX&nbsp;
                        <span>0933333333</span>&nbsp;
                        <span>402&nbsp;台中市</span><span>南區</span><span>OOOOOOO</span>
                    </label>
                </div>
                <a href="">選擇其他收件人</a>
            </div>

            <div class="table-responsive col-md-10 mx-auto my-4">
                <table class="table text-center">
                    <thead>
                        <tr class="table-secondary">
                            <td width="30%">商品訊息</td>
                            <td width="15%">售價</td>
                            <td width="15%">數量</td>
                            <td width="20%">合計</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="align-middle productCenter">
                                <img src="./images/product/p19-1.webp" alt="" style="width: 100px;">
                                <span>白色餐椅</span>
                            </td>
                            <td class="align-middle fw-bold fs-5">$124</td>
                            <td class="align-middle fw-bold fs-5" style="min-width: 100px;">10</td>
                            <td class="align-middle fw-bold fs-5 subtotal">$1234</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" class="fw-bold total border-0"></td>
                            <td colspan="1" class="fw-bold total border-0">累計金額:<span class="totalPrice">NT$1234</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="fw-bold total border-0"></td>
                            <td colspan="1" class="fw-bold total border-0">運費:<span class="totalPrice">NT$100</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="fw-bold total border-0"></td>
                            <td colspan="1" class="fw-bold total border-0">總金額:<span class="totalPrice">NT$1234</span></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="fw-bold total border-0"></td>
                            <td class="border-0" colspan="1"><button type="button" id="btn01" name="btn01" class="CheckoutBtn" onclick="window.history.go(-1)">回上一頁</button></td>
                            <td class="border-0" colspan="1"><button type="button" id="btn02" name="btn02" class="CheckoutBtn" onclick="location.href='./checkout.php'">確認訂單</button></td>
                        </tr>
                    </tfoot>
                </table>
            </div>

        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php') ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php') ?>
    <script>
        document.querySelectorAll("input[name='payment']").forEach((element) => {
            element.addEventListener('change', function() {
                //隱藏詳細付款資訊
                document.querySelectorAll(".paymentDetail").forEach((payDetail) => {
                    payDetail.style.display = "none";
                });

                //顯示選定付款方式
                const selectPayment = document.getElementById("payDetail" + this.id.slice(-1));
                if (selectPayment) {
                    selectPayment.style.display = "block";
                }
            });
        });
    </script>

</body>

</html>