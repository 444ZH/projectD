<div class="sidebar">
    <?php
    //列出產品類別第一層
    $SQLstring = "SELECT * FROM pyclass WHERE level = 1 ORDER BY sort";
    $pyclass01 = $link->query($SQLstring);
    $i = 1;     //控制編號順序，排版用
    ?>
    <div class="accordion accordion-flush border border-1" id="accordionFlushExample">
        <?php while ($pyclass01_Rows = $pyclass01->fetch()) {
            $i = $pyclass01_Rows['classid']; ?>
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne<?php echo $i; ?>">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne<?php echo $i; ?>" aria-expanded="false" aria-controls="flush-collapseOne<?php echo $i; ?>">
                        <?php echo $pyclass01_Rows['cname']; ?>
                    </button>
                </h2>
                <?php
                if (isset($_GET['level']) && $_GET['level'] == 1) {
                    //使用第一層類別查詢
                    $ladder = $_GET['classid'];
                } elseif (isset($_GET['classid'])) {    //如果使用類別查詢需取得上一層類別
                    $SQLstring = sprintf("SELECT uplink FROM pyclass WHERE level = 2 AND classid = %d", $_GET['classid']);
                    $classid_rs = $link->query($SQLstring);
                    $data = $classid_rs->fetch();
                    $ladder = $data['uplink'];
                } else {
                    $ladder = 1;
                }
                // 列出產品類別第二層
                $SQLstring = sprintf("SELECT * FROM pyclass WHERE level = 2 AND uplink = %d ORDER BY sort", $pyclass01_Rows['classid']);
                $pyclass02 = $link->query($SQLstring);
                ?>
                <div id="flush-collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == $ladder) ? 'show' : ''; ?>" aria-labelledby="flush-headingOne<?php echo $i; ?>" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                        <table class="table">
                            <tbody>
                                <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                    <tr>
                                        <td><a href="furniture.php?classid=<?php echo $pyclass02_Rows['classid'] ?>"><?php echo $pyclass02_Rows['cname'] ?></a></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <?php $i++;
        } ?>
    </div>
</div>