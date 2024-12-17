<?php
//連資料庫
require_once('./connection/furnitureshop_db_example.php');
//如果session沒有啟動則啟動，跨頁面存取變數
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// 載入共用PHP函數庫
require_once("./php_lib.php");  //分頁功能

//檢查是否完成登入驗證
if (!isset($_SESSION['login'])) {
    $sPath = "login.php?sPath=myaccount";
    header(sprintf("location: %s", $sPath));
}
?>

<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入head -->
    <?php require_once('./headfile.php'); ?>
    <style>
        .myAccountTitle {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            font-size: 24px;
        }

        .registerInfo {
            font-size: 18px;
            font-weight: bold;
        }

        .remark {
            font-size: 12px;
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

        .captcha {
            display: flex;
            flex-direction: column;
        }

        .captcha input[name="recaptcha"] {
            width: 50%;
        }

        .accountInfo a {
            text-decoration: none;
            color: #aaa;
        }

        a.accountInfo {
            text-decoration: none;
            color: #aaa;
            font-weight: bold;
            width: fit-content;
        }

        a.accountInfo.selected {
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }

        a.accountInfo:hover {
            text-decoration: 1px solid #333;
            color: #333;
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
        <?php require_once('./navbar.php'); ?>
    </section>
    <section id="seccontent">
        <div class="container">

            <div class="row col-md-10 mx-auto mt-5">
                <div class="col-md-2 d-flex flex-column gap-4 mt-5">
                    <a href="./myaccount.php" class="accountInfo selected">個人資料</a>
                    <a href="./orderlist.php" class="accountInfo">所有訂單</a>
                </div>
                <div class="col-md-8" id="modify" name="modify">
                    <?php require_once('./changeinfo_content.php'); ?>
                </div>
            </div>
        </div>
    </section>
    <section id="footer">
        <?php require_once('./footer.php'); ?>
    </section>
    <!-- js file -->
    <?php require_once('./jsfile.php'); ?>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./commlib.js"></script>
    <script src="./jquery.validate.js"></script>
    <script type="text/javascript" src="https://unpkg.com/vue@3"></script>
    <script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="./bootstrap5.3.3-dist/js/bootstrap.min.js"></script>
    <script>
        const Vue3 = Vue.createApp({
            data() {
                return {
                    emailid: <?php echo $_SESSION['emailid']; ?>, //取得會員emailid
                    member: [], //會員資料更新陣列
                    captcha: '', //存認證碼變數
                    readonly: true, //資料讀取模式或是編輯模式
                    PWOld: '', //儲存舊密碼變數
                    PWNew1: '', //變更密碼儲存變數1
                    PWNew2: '', //變更密碼儲存變數2
                    pwValidator: null,
                    showValidation: false
                }
            },
            methods: { //使用第三方ajax的API，取得使用者資料
                //開啟編輯模式
                editMember() {
                    this.readonly = false;
                },
                async savePW() {
                    if ($('#changePW').valid()) {
                        try {
                            const response = await axios.get('reqchangePW.php', {
                                params: {
                                    emailid: this.emailid,
                                    PWNew1: this.PWNew1,
                                }
                            });
                            if (response.data.c === true) {
                                $('#changePW')[0].reset();
                                this.PWOld = '';
                                this.PWNew1 = '';
                                this.PWNew2 = '';
                                const closeModal = document.getElementById('exampleModal');
                                const modalInstance = bootstrap.Modal.getInstance(closeModal);
                                modalInstance.hide();
                                alert(response.data.m);
                            } else {
                                alert(response.data.m || '密碼更新失敗');
                            }
                        } catch (error) {
                            console.error(`密碼更新錯誤: ${error}`);
                            alert('系統錯誤請稍後在試');
                        }
                    }
                },
                async saveMember() {
                    if (this.validator && this.validator.form()) {
                        try {
                            const response = await axios.get('reqMember.php', {
                                params: {
                                    emailid: this.member.emailid,
                                    cname: this.member.cname,
                                    birthday: this.member.birthday,
                                }
                            });
                            const data = response.data;
                            if (data.c === true) {
                                alert(data.m);
                                location.reload();
                            }
                        } catch (error) {
                            alert(`Error: ${error.messages}`)
                        }

                    }
                },
                getMemberInfo() {
                    axios.get('memberinfo.php', {
                            params: {
                                emailid: this.emailid,
                            }
                        })
                        .then((res) => {
                            let data = res.data;
                            if (data.c == true) {
                                this.member = data.d[0];
                            } else {
                                alert(data.m);
                            }
                        })
                        .catch((error) => {
                            alert('系統統目前無法連接到後台資料庫');
                        });
                },

                getCaptcha() { //驗證碼
                    //can為canvas的ID名稱
                    //150=影像寬，50=影像高，blue=影像背景顏色
                    //white=文字顏色，28px=文字大小，5=認證碼長度
                    this.captcha = captchaCode("can", 150, 50, "blue", "white", "28px", 5)
                },
            },
            mounted() {
                this.getCaptcha();
                this.getMemberInfo();

                this.$nextTick(() => {
                    //手機驗證格式
                    jQuery.validator.addMethod("checkphone", function(value, element, param) {
                        var checkphone = /^09[0-9]{8}$/;
                        return this.optional(element) || (checkphone.test(value));
                    });

                    this.validator = $("#reg").validate({ //個人資料表單資料驗證
                        rules: {
                            cname: {
                                required: true,
                            },
                            birthday: {
                                required: true,
                            },
                            recaptcha: {
                                required: true,
                                equalTo: "#captcha"
                            },
                        },
                        messages: {
                            cname: {
                                required: "姓名不得為空白",
                            },
                            birthday: {
                                required: "生日不得為空白",
                            },
                            recaptcha: {
                                required: "驗證碼不得為空白",
                                equalTo: "驗證碼錯誤"
                            }
                        },
                    });
                    this.pwValidator = $("#changePW").validate({
                        rules: {
                            PWOld: {
                                required: true,
                                remote: 'checkPW.php?emailid=<?php echo $_SESSION['emailid']; ?>',
                            },
                            PWNew1: {
                                required: true,
                                maxlength: 20,
                                minlength: 6,
                            },
                            PWNew2: {
                                required: true,
                                equalTo: "#PWNew1"
                            }
                        },
                        messages: {
                            PWOld: {
                                required: '舊密碼不可空白',
                                remote: '舊密碼錯誤，請重新輸入',
                            },
                            PWNew1: {
                                required: '新密碼不可空白',
                                maxlength: '密碼最大長度為20位(4-20位英文字母與數字的組合)',
                                minlength: '密碼最小長度為6位(6-20位英文字母與數字的組合)',
                            },
                            PWNew2: {
                                required: '再次輸入新密碼不可空白',
                                equalTo: "與新密碼不一致"
                            }
                        }
                    });
                    const modal = document.getElementById('exampleModal');
                    modal.addEventListener('hidden.bs.modal', () => {
                        $('#changePW')[0].reset();
                        this.PWOld = '';
                        this.PWNew1 = '';
                        this.PWNew2 = '';
                        if (this.pwValidator) {
                            this.pwValidator.resetForm();
                        }
                    });
                });
            }
        });
        Vue3.mount('#modify');
    </script>

</body>

</html>