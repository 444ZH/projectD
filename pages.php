<?php
//取得目前頁數
if (isset($_GET['totalRows_rs'])) {
    $totalRows_rs = $_GET['totalRows_rs'];
} else {
    $all_rs = $link->query($queryFirst);
    $totalRows_rs = $all_rs->rowCount();
}
$totalRows_rs = ceil($totalRows_rs / $maxRowS_rs) - 1;
//呼叫分頁功能函數
$prev_rs = "&laquo;";
$next_rs = "&raquo;";
$separator = "|";
$max_links = 20;
$pages_rs = buildNavigation($pageNum_rs, $totalRows_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "rs");
?>
<nav aria-label="Page navigation example">
    <ul class="newpagination justify-content-center my-4">
        <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
    </ul>
</nav>