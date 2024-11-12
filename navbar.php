<nav class="navbar navbar-expand-lg bg-white fixed-top">
    <div class="container-fluid">
        <div class="navbarLOGO col-md-3"><a class="navbar-brand" href="./index_hp.php"><img src="./images/logo-removebg.png" alt="LOGO" class="img-fluid"></a></div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <?php
        //讀取後台購物車內產品數量
        $SQLstring = "SELECT * FROM cart WHERE orderid IS NULL AND ip = '" . $_SERVER['REMOTE_ADDR'] . "'";
        $cart_rs = $link->query($SQLstring);
        // 列出產品類別第一層
        $SQLstring = "SELECT * FROM pyclass WHERE level = 1 ORDER BY sort";
        $pyclass01 = $link->query($SQLstring);
        ?>
        <div class="collapse navbar-collapse col-md-6" id="navbarNavDropdown">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        產品
                    </a>
                    <ul class="dropdown-menu">
                        <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                            <li class="nav-item dropend">
                                <a class="dropdown-item dropdown-toggle" href="#"><?php echo $pyclass01_Rows['cname']; ?></a>
                                <?php
                                //列出產品類別對應的第二層資料
                                $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $pyclass01_Rows['classid']);
                                $pyclass02 = $link->query($SQLstring);
                                ?>
                                <ul class="dropdown-menu dropSecond">
                                    <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                        <li><a class="dropdown-item" href="furniture.php?classid=<?php echo $pyclass02_Rows['classid'] ?>"><?php echo $pyclass02_Rows['cname']; ?></a></li>
                                    <?php } ?>
                                </ul>
                            </li>
                        <?php
                        } ?>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">優惠專區</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">品牌獨家</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        服務與支援
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">顧客服務</a></li>
                        <li><a class="dropdown-item" href="#">FAQ常見問題</a></li>
                        <li><a class="dropdown-item" href="#">關於我們</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse col-md-3">
            <ul class="navbar-nav ms-auto d-flex align-items-center">
                <form action="./furniture.php" method="get" name="search" id="search">
                    <div class="input-group d-flex align-items-center">
                        <input type="text" name="search_name" class="form-control" placeholder="Search" value="<?php echo (isset($_GET['search_name'])) ? $_GET['search_name'] : ''; ?>" required>
                        <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa-solid fa-magnifying-glass fa-lg"></i></button></span>
                    </div>
                </form>
                <li class="nav-item">
                    <a class="nav-link" href="./cart.php"><i class="fa-solid fa-cart-shopping fa-lg"></i><span class="badge rounded-pill text-bg-dark"><?php echo ($cart_rs) ? $cart_rs->rowCount() : ''; ?></span></a>
                </li>
                <?php if (isset($_SESSION['login'])) { ?>
                    <li class="nav-item dropdown userDropdown">
                    <a class="nav-link" href=""><i class="fa-regular fa-user fa-lg"></i></a>
                    <div class="dropdown-menu userDropdown">
                        <a href="./orderlist.php" class="dropdown-item">所有訂單</a>
                        <a href="./myaccount.php" class="dropdown-item">修改個人資料</a>
                        <a href="#" class="dropdown-item" onclick="btn_confirmLink('確認是否登出', 'logout.php')">登出</a>
                    </div>
                    </li>
                <?php } else { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="./login.php"><i class="fa-regular fa-user fa-lg"></i></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</nav>