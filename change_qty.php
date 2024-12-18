<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json;charset=utf-8');

require_once('./connection/furnitureshop_db_example.php');

if (isset($_POST['cartid']) && isset($_POST['qty'])) {
    $cartid = $_POST['cartid'];
    $qty = $_POST['qty'];
    $query = sprintf(
        "UPDATE cart 
        SET qty = %d 
        WHERE cart.cartid = %d",
        $qty,
        $cartid
    );
    $result = $link->query($query);
    if ($result) {
        $retcode = ["c" => "1", "m" => "商品數量已更新"];
    } else {
        $retcode = ["c" => "0", "m" => "抱歉，資料無法寫入後台資料庫，請聯絡管理人員"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
