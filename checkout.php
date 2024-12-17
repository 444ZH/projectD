<?php
//連資料庫
require_once('./connection/furnitureshop_db_example.php');
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

        .checkoutTitle {
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

        .color_red {
            color: red !important;
        }


        td.productCenter {
            text-align: center;
        }

        td.total {
            text-align: center;
        }

        .modalBtn {
            width: fit-content;
            background: none;
            border: none;
            text-decoration: underline;
            color: blue;
        }

        .modalBtn:hover {
            color: purple;
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

        #newRecipient {
            padding: 10px 30px;
            background-color: #000;
            color: #fff;
            font-weight: bold;
        }

        .modalCloseBtn {
            background-color: #646464;
            padding: 5px 20px;
            color: #fff;
        }

        .modalSaveBtn {
            background-color: #000;
            padding: 5px 20px;
            color: #fff;
        }

        /* 驗證樣式 */
        span.error-tips,
        span.error-tips::before {
            font-family: "Font Awesome 5 Free";
            color: red;
            font-weight: 900;
            content: "\f00d";
            margin-left: 5px;
        }

        span.valid-tips,
        span.valid-tips::before {
            font-family: "Font Awesome 5 Free";
            color: green;
            font-weight: 900;
            content: "\f00c";
            margin-left: 5px;
        }
    </style>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <!-- goods_content -->
            <?php require_once('./checkout_content.php'); ?>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>

    <!-- Modal -->
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
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">收件人資訊</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="reg" name="reg" method="post">
                        <div class="row">
                            <div class="col">
                                <input type="text" name="cname" id="cname" class="form-control" placeholder="姓名">
                            </div>
                            <div class="col">
                                <input type="text" name="mobile" id="mobile" class="form-control" placeholder="手機號碼" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                            </div>
                            <div class="col">
                                <select name="myCity" id="myCity" class="form-control">
                                    <option value="">請選擇城市</option>
                                    <?php
                                    $city = "SELECT * FROM city WHERE State = 0";
                                    $city_rs = $link->query($city);
                                    while ($city_rows = $city_rs->fetch()) {
                                    ?>
                                        <option value="<?php echo $city_rows['AutoNo']; ?>"><?php echo $city_rows['Name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="col">
                                <select name="myTown" id="myTown" class="form-control">
                                    <option value="">請選擇地區</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col">
                                <input type="hidden" name="myZip" id="myZip" value="">
                                <label for="address" id="add_label" name="add_label">郵遞區號:</label>
                                <input type="text" name="address" id="address" class="form-control">
                            </div>
                        </div>
                        <div class="row mt-4 justify-content-center">
                            <div class="col-auto">
                                <button type="button" id="newRecipient" name="newRecipient">新增收件人</button>
                            </div>
                        </div>
                        <input type="hidden" name="formctl" id="formctl" value="reg">
                    </form>
                    <hr>
                    <table class="table text-center">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">收件人姓名</th>
                                <th scope="col">手機號碼</th>
                                <th scope="col">收件地址</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($addbook_rs->rowCount() > 0) { ?>
                                <?php while ($addbook_rows = $addbook_rs->fetch()) { ?>
                                    <tr>
                                        <td><?php echo $addbook_rows['cname']; ?></td>
                                        <td><?php echo $addbook_rows['mobile']; ?></td>
                                        <td><?php echo $addbook_rows['myzip'] . $addbook_rows['ctName'] . $addbook_rows['toName'] . $addbook_rows['address']; ?></td>
                                    </tr>
                                <?php }  ?>
                            <?php } else { ?>
                                <tr>
                                    <th colspan="4">
                                        <div class="alert alert-warning" role="alert">
                                            請新增收件人
                                        </div>
                                    </th>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="modalCloseBtn" data-bs-dismiss="modal">關閉</button>
                </div>
            </div>
        </div>
    </div>
    <!-- login -->
    <div id="loading" name="loading" style="display: none; position: fixed; top: 50%; left: 50%; z-index: 9999;" class="spinner-border" role="status">
        <span class="visually-hidden fs-2" style="position: absolute; top: 50%; left: 50%;">Loading...</span>
    </div>
    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>
    <script src="./commlib.js"></script>
    <script src="./jquery.validate.js"></script>
    <script>
        $('#btn02').click(function() { //結帳處理
            let selectedRecipient = $("input[name=recipientRadios]:checked").val();

            let hasRecipient = $("input[name=recipientRadios]").length > 0;
            if (!hasRecipient) {
                alert('請先新增收件人!');
                $("#exampleModal").modal('show');
                return false;
            }

            let msg = "請確認結帳金額及收件人是否正確";
            if (!confirm(msg)) {
                return false;
            }
            $("#loaging").show();
            let addressid = $("input[name=recipientRadios]:checked").val();
            $.ajax({
                url: "addOrder.php",
                type: "post",
                dataType: "json",
                data: {
                    addressid: addressid,
                },
                success: function(data) {
                    if (data.c == true) {
                        alert(data.m)
                        window.location.href = 'settlement.php';
                    } else {
                        alert(`Database response error:${data.m}`);
                    }
                },
                error: function(data) {
                    alert("ajax response error");
                }
            });
        });

        $("input[name=recipientRadios]").change(function() { //更改地址
            var addressid = $(this).val();
            $.ajax({
                url: "changeAddr.php",
                type: "post",
                dataType: "json",
                data: {
                    addressid: addressid,
                },
                success: function(data) {
                    if (data.c == true) {
                        alert(data.m);
                    } else {
                        alert(`Database response error : ${data.m}`);
                    }
                },
                error: function(data) {
                    alert("ajax request error");
                }
            });
        });

        //手機驗證格式
        jQuery.validator.addMethod("checkphone", function(value, element, param) {
            var checkphone = /^09[0-9]{8}$/;
            return this.optional(element) || (checkphone.test(value));
        });

        //新增收件人驗證
        $("#reg").validate({
            rules: {
                cname: {
                    required: true,
                },
                mobile: {
                    required: true,
                    checkphone: true,
                },
                myCity: {
                    required: true,
                },
                myTown: {
                    required: true,
                },
                address: {
                    required: true,
                },
            },
            messages: {
                cname: {
                    required: "姓名不得為空白",
                },
                mobile: {
                    required: "手機號碼不得為空白",
                    checkphone: "手機號碼格式有誤",
                },
                myCity: {
                    required: "必須選擇城市",
                },
                myTown: {
                    required: "必須選擇地區",
                },
                address: {
                    required: "請輸入詳細收件地址",
                },
            },
        });

        $(function() { //新增收件人
            $("#newRecipient").click(function() {
                let validate = 0;
                msg = "";
                let cname = $("#cname").val();
                let mobile = $("#mobile").val();
                let myZip = $("#myZip").val();
                let address = $("#address").val();
                if (cname == "") {
                    msg = `${msg}收件人不得為空白!!\n`;
                    validate = 1;
                }
                if (mobile == "") {
                    msg = `${msg}手機號碼不得為空白!!\n`;
                    validate = 1;
                }
                if (myZip == "") {
                    msg = `${msg}需選擇市區及地區!!\n`;
                    validate = 1;
                }
                if (address == "") {
                    msg = `${msg}地址不得為空白!!\n`;
                    validate = 1;
                }
                if (validate) {
                    alert(msg);
                    return false;
                }
                $.ajax({
                    url: "addbook.php",
                    type: "post",
                    dataType: "json",
                    data: {
                        cname: cname,
                        mobile: mobile,
                        myZip: myZip,
                        address: address,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert(`Database response error ${data.m}`);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接到後台資料庫")
                    }
                });
            });
            //取得縣市代碼後查鄉鎮市名稱
            $("#myCity").change(function() {
                var CNo = $("#myCity").val();
                if (CNo == '') {
                    $("#myTown").html("<option value=''>請選擇地區</option>");
                    $("#myZip").val("");
                    $("#add_label").html("郵遞區號:");
                    return false;
                }
                $.ajax({
                    url: "Town_ajax.php",
                    type: "post",
                    dataType: "json",
                    data: {
                        CNo: CNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $("#myTown").html(data.m);
                            $("#myZip").val("");
                            $("#add_label").html("郵遞區號:");
                        } else {
                            alert(data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接後台資料庫");
                    }
                });
            });
            $("#myTown").change(function() {
                var AutoNo = $("#myTown").val();
                if (AutoNo == "") {
                    $("myZip").val("");
                    $("#add_label").html("");
                    return false;
                }
                $.ajax({
                    url: "Zip_ajax.php",
                    type: "get",
                    dataType: "json",
                    data: {
                        AutoNo: AutoNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $("#myZip").val(data.Post);
                            $("#add_label").html(`郵遞區號: ${data.Post}${data.Cityname}${data.Name}`);
                        } else {
                            alert(data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接到後台資料庫");
                    }
                });
            });
        });

        //付款設定
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