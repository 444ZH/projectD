<?php
//連資料庫
require_once('connection/furnitureshop_db.php');
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
        .registerTitle {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            font-size: 30px;
        }

        .registerInfo {
            font-size: 18px;
            font-weight: bold;
        }

        .remark {
            font-size: 12px;
        }

        .togglePass {
            float: right;
        }

        .regSubmitBtn {
            display: block;
            margin: 30px auto 0;
            padding: 10px 60px;
            background-color: #000;
            color: #fff;
            font-weight: bold;
        }

        .regSubmitBtn:hover {
            background-color: #333;
        }

        /* 驗證樣式 */
        span.error-tips,
        span.error-tips::before {
            font-family: "Font Awesome 5 Free";
            color: red;
            font-weight: 900;
            content: "\f00d";
            margin-left: 10px;
        }

        span.valid-tips,
        span.valid-tips::before {
            font-family: "Font Awesome 5 Free";
            color: green;
            font-weight: 900;
            content: "\f00c";
            margin-left: 10px;
        }

        .clearfix {
            clear: both;
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
            <?php //require_once('./.php') 
            ?>
            <h4 class="registerTitle">註冊會員</h4>
            <div class="row col-md-5 mx-auto mt-5">


            <?php 
if (isset($_POST['formctl']) && $_POST['formctl'] == "reg"){
    $email = $_POST['email'];
    $cname = $_POST['cname'];
    $mobile = $_POST['mobile'];
    $pw1 = password_hash($_POST['pw1'], PASSWORD_DEFAULT);
    $insertsql = "INSERT INTO member (email, pw1, cname) VALUES ('".$email."', '".$pw1."', '".$cname."')";
    $result = $link -> query($insertsql);
    $emailid = $link -> lastInsertId(); //新增會員編號
    if($result){
        //將會員資料寫入addbook
        $insertsql = "INSERT INTO addbook (emailid, setdefault, cname, mobile) VALUES ('".$emailid."', '1','".$cname."', '".$mobile."')";
        $result = $link -> query($insertsql);
        $_SESSION['login'] = true;  //設定會員註冊成功直接登入
        $_SESSION['emailid'] = $emailid;
        $_SESSION['email'] = $email;
        $_SESSION['cname'] = $cname;
        echo "<script>alert('會員註冊成功'); location.href='index_hp.php';</script>";
    }

}
?>



                <form action="./register.php" id="reg" name="reg" method="post">
                    <span class="registerInfo ms-1">電子郵件地址</span><br>
                    <span class="remark ms-1">※電子郵件地址將作為登入帳號使用，請填寫正確資訊，以免喪失會員權益</span>
                    <div class="input-group mb-4 mx-auto d-flex flex-column">
                        <input type="email" name="email" id="email" class="form-control w-100" placeholder="電子郵件地址">
                    </div>
                    <span class="registerInfo ms-1">姓名</span><br>
                    <div class="input-group mb-4 mx-auto d-flex flex-column">
                        <input type="text" name="cname" id="cname" class="form-control w-100" placeholder="請輸入姓名">
                    </div>
                    <span class="registerInfo ms-1">手機號碼</span><br>
                    <span class="remark ms-1">※為保護您的個人資料，手機一旦綁定無法變更或連結其他電子郵件</span>
                    <div class="input-group mb-4 mx-auto d-flex flex-column">
                        <input type="text" name="mobile" id="mobile" class="form-control w-100" placeholder="手機號碼">
                    </div>
                    <span class="registerInfo ms-1 password">密碼</span><label class="togglePass"><input type="checkbox" id="togglePass">顯示密碼</label>
                    <div class="input-group mb-4 mx-auto d-flex flex-column gap-2 clearfix">
                        <input type="password" name="pw1" id="pw1" class="form-control w-100" placeholder="密碼">

                    </div>
                    <span class="registerInfo ms-1">確認密碼</span>
                    <div class="input-group mb-4 mx-auto d-flex flex-column">
                        <input type="password" name="pw2" id="pw2" class="form-control w-100" placeholder="">
                    </div>
                    <div class="input-group mb-4 mx-auto d-flex align-items-center">
                        <input type="hidden" name="captcha" id="captcha" value="">
                        <input type="text" name="recaptcha" id="recaptcha" class="form-control me-2 w-40" placeholder="請輸入驗證碼">
                        <a href="javascript:void(0);" title="按我更新認證" onclick="getCaptcha();">
                            <canvas id="can"></canvas>
                        </a>
                    </div>
                    <input type="hidden" name="formctl" id="formctl" value="reg">
                    <div class="input-group mb-5">
                        <button type="submit" class="regSubmitBtn">送出</button>
                    </div>
                </form>
            </div>


        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php') ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php') ?>
    <script src="./commlib.js"></script>
    <script src="./jquery.validate.js"></script>
    <script>
        getCaptcha();

        //手機驗證格式
        jQuery.validator.addMethod("checkphone", function(value, element, param) {
            var checkphone = /^09[0-9]{8}$/;
            return this.optional(element) || (checkphone.test(value));
        });

        //表單資料驗證
        $("#reg").validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                    remote: "checkemail.php"
                },
                cname: {
                    required: true,
                },
                mobile: {
                    required: true,
                    checkphone: true,
                },
                pw1: {
                    required: true,
                    maxlength: 20,
                    minlength: 6,
                },
                pw2: {
                    required: true,
                    equalTo: "#pw1"
                },
                recaptcha: {
                    required: true,
                    equalTo: "#captcha"
                },
            },
            messages: {
                email: {
                    required: "email信箱不得為空白",
                    eamil: "email信箱格式有誤",
                    remote: "email已被註冊"
                },
                cname: {
                    required: "姓名不得為空白",
                },
                mobile: {
                    required: "手機號碼不得為空白",
                    checkphone: "手機號碼格式有誤",
                },
                pw1: {
                    required: "密碼不得為空白",
                    maxlength: "密碼最大長度為20位(6-20位英文字母與數字的組合)",
                    minlength: "密碼最小長度為6位(6-20位英文字母與數字的組合)",
                },
                pw2: {
                    required: "確認密碼不得為空白",
                    equalTo: "兩次輸入密碼須一致"
                },
                recaptcha: {
                    required: "驗證碼不得為空白",
                    equalTo: "驗證碼錯誤"
                },
            },
        });

        //顯示密碼
        const togglePass = document.querySelector("#togglePass");
        const pw1 = document.querySelector("#pw1");
        togglePass.addEventListener("click", function() {
            const type = pw1.getAttribute("type") === "password" ? "text" : "password";
            pw1.setAttribute("type", type);
            this.textContent = type === "password" ? "顯示" : "隱藏";
        });

        //驗證碼
        function getCaptcha() {
            var inputTxt = document.getElementById("captcha");
            //can為canvas的ID名稱
            //150=影像寬，50=影像高，blue=影像背景顏色
            //white=文字顏色，28px=文字大小，5=認證碼長度
            inputTxt.value = captchaCode("can", 150, 50, "blue", "white", "28px", 5)
        }
    </script>

</body>

</html>