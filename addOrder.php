<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json;charset=utf-8");

require_once('./connection/furnitureshop_db.php');

if(session_status() == PHP_SESSION_NONE){
    session_start();
}

if(isset($_SESSION['emailid']) && $_SESSION['emailid'] != ''){
    $emailid = $_SESSION['emailid'];
    $addressid = $_POST['addressid'];
    $ip = $_SERVER['REMOTE_ADDR'];
    $orderid = date('YmdHis') . rand(10000, 99999); 
    $query = sprintf("INSERT INTO uorder (orderid, emailid, addressid, howpay, paystatus, status) VALUES ('%s', %d, %d, '3', '35', '7')", $orderid, $emailid, $addressid);
    $result = $link -> query($query);
    if($result){
        $query = sprintf("UPDATE cart SET orderid = '%s', emailid = %d, status = '8' WHERE ip = '%s' AND orderid is NULL", $orderid, $emailid, $ip);
        $result = $link -> query($query);
        $retcode = ["c" => "1", "m" => "訂單已確認，請在首頁查閱訂單處理狀態"];
    }else{
        $retcode = ["c" => "0", "m" => "資料處理失敗，請聯絡管理員"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?> 