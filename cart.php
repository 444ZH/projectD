<?php
//連資料庫
require_once('./connection/furnitureshop_db_example.php');
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

        span.two,
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

        .subtotal {
            color: red !important;
        }

        .cancelBtn {
            background: none;
            border: none;
        }

        .cancelBtn:hover {
            text-decoration-line: underline;
            color: red;
        }

        td.productLeft {
            text-align: left;
        }

        td.total {
            text-align: right;
        }

        .totalPrice {
            color: red !important;
        }

        .clearCartBtn {
            padding: 10px 30px;
            background-color: #333;
            color: #fff;
            font-weight: bold;
        }

        .clearCartBtn:hover {
            background-color: #999;
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

        .buyNowBtn {
            background-color: red;
            color: #fff;
            padding: 10px 30px;
            border: none;
            font-weight: bold;
        }

        .buyNowBtn:hover {
            background-color: #ff6c6c;
        }

        table input:invalid {
            border: 3px solid red;
        }
    </style>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container" style="height: 70vh;">
            <!-- goods_content -->
            <?php require_once('./cart_content.php'); ?>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>
    <script>
        document.querySelector('#btn02').addEventListener("click", function() {
            window.location.href = 'checkout.php';
        });

        //將商品變更數量寫進資料庫
        $('input').change(function() {
            var qty = $(this).val();
            const cartid = $(this).attr("cartid");
            if (qty <= 0 || qty >= 50) {
                alert("請更改商品數量，需大於0及小於50");
                return false;
            }
            $.ajax({
                url: 'change_qty.php',
                type: 'post',
                dataType: 'json',
                data: {
                    cartid: cartid,
                    qty: qty,
                },
                success: function(data) {
                    if (data.c == true) {
                        window.location.reload();
                    } else {
                        alert(data.m);
                    }
                },
                error: function(data) {
                    alert("系統目前無法連接到後台資料庫");
                }
            });
        });
    </script>
</body>

</html>