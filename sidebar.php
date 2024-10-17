<div class="sidebar">

    <?php
    //列出產品類別第一層
    $SQLstring = "SELECT * FROM pyclass WHERE level = 1 ORDER BY sort";
    $pyclass01 = $link->query($SQLstring);
    $i = 1;     //控制編號順序，排版用
    ?>
    <div class="accordion accordion-flush border border-1" id="accordionFlushExample">
        <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne<?php echo $i; ?>">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne<?php echo $i; ?>" aria-expanded="false" aria-controls="flush-collapseOne<?php echo $i; ?>">
                        <?php echo $pyclass01_Rows['cname']; ?>
                    </button>
                </h2>
                <?php
                // 列出產品類別第二層
                $SQLstring = sprintf("SELECT * FROM pyclass WHERE level = 2 AND uplink = %d ORDER BY sort", $pyclass01_Rows['classid']);
                $pyclass02 = $link->query($SQLstring);
                ?>
                <div id="flush-collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == 1) ? 'show' : ''; ?>" aria-labelledby="flush-headingOne<?php echo $i; ?>" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                        <table class="table">
                            <tbody>
                                <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                    <tr>
                                        <td><a href=""><?php echo $pyclass02_Rows['cname'] ?></a></td>
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