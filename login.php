<?php
//連資料庫
require_once('./connection/furnitureshop_db_example.php');
//如果session沒有啟動則啟動，跨頁面存取變數
if (!isset($_SESSION)) {
    session_start();
}
// 載入共用PHP函數庫
require_once("./php_lib.php");  //分頁功能
//登入路徑設定
if (isset($_GET['sPath'])) {
    $sPath = $_GET['sPath'] . ".php";
} else {
    //預設登入完進首頁
    $sPath = "index_hp.php";
}
//檢查是否完成登入驗證
if (isset($_SESSION['login'])) {
    header(sprintf("location: %s", $sPath));
}
?>

<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入head -->
    <?php require_once('./headfile.php') ?>
    <style>
        .loginTitle {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            font-size: 30px;
        }

        .loginInfo {
            background-color: #fff;
            font-weight: bold;
        }

        div.card.col-md-4 {
            border: none;
            padding: 0;
        }

        .necessary {
            color: red;
        }

        .forgotPassword {
            /* border: 1px solid #000; */
            float: right;
        }

        .signInButton,
        .registerButton {
            display: block;
            margin: 30px auto 0;
            padding: 10px 60px;
            background-color: #000;
            color: #fff;
            font-weight: bold;
        }

        .signInButton:hover,
        .registerButton:hover {
            background-color: #333;
        }

        .centerLine {
            width: 0;
            height: 30vh;
            padding: 0;
            border: 1px solid #ddd;
        }

        .clearfix {
            clear: both;
        }
    </style>
</head>

<body>
    <section id="header">
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">
            <h4 class="loginTitle">會員登入</h4>
            <div class="row col-md-10 mx-auto mt-5 d-flex justify-content-around">

                <div class="card col-md-4 mb-4">
                    <div class="card-header text-center loginInfo" style="border-radius: 0;">登入資訊</div>
                    <div class="card-body">
                        <form action="" method="post" class="form-signin" id="form1">
                            <p class="card-text">電子郵件<span class="necessary">※</span>
                                <input type="email" id="inputAccount" name="inputAccount" class="form-control mt-2" placeholder="E-mail" required autofocus>
                            </p>
                            <p class="card-text">密碼<span class="necessary">※</span>
                                <input type="password" id="inputPassword" name="inputPassword" class="form-control mt-2" placeholder="Password" required autofocus>
                                <a href="#" class="forgotPassword">忘記密碼</a>
                            </p>
                            <button type="submit" class="signInButton clearfix">登入</button>
                        </form>
                    </div>
                </div>
                <div class="centerLine"></div>
                <div class="card col-md-4">
                    <div class="card-body ">
                        <h4 class="card-title text-center fw-bold">加入會員</h4>
                        <p class="card-text">訂購商品、商品評論或使用特定功能時，請先註冊會員。</p>
                        <button type="button" class="registerButton" onclick="location.href='./register.php'">註冊會員</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>
    <!-- login -->
    <div id="loading" name="loading" style="display: none; position: fixed; top: 50%; left: 50%; z-index: 9999;" class="spinner-border" role="status">
        <span class="visually-hidden fs-2" style="position: absolute; top: 50%; left: 50%;">Loading...</span>
    </div>
    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>
    <script>
        $(function() {
            $("#form1").submit(function(event) {
                event.preventDefault();

                const inputAccount = $("#inputAccount").val();
                const inputPassword = $("#inputPassword").val();

                if (!inputAccount) {
                    alert('請輸入電子信箱');
                    return false;
                }

                if (!inputPassword) {
                    alert('請輸入密碼');
                    return false;
                }

                $("#loading").show();

                //利用$ajax函數呼叫後台auth_user.php驗證帳號密碼
                $.ajax({
                    url: "auth_user.php",
                    type: "post",
                    dataType: "json",
                    data: {
                        inputAccount: inputAccount,
                        inputPassword: inputPassword,
                    },
                    success: function(data) {
                        $("#loading").hide();
                        if (data.c == true) {
                            alert(data.m);
                            window.location.href = "<?php echo $sPath; ?>";
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
    </script>

</body>

</html>