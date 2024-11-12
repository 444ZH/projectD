<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json;charset=utf-8");

require_once('./connection/furnitureshop_db.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_SESSION['emailid']) && $_SESSION['emailid'] != '') {
    $emailid = $_SESSION['emailid'];
    $addressid = $_POST['addressid'];
    //先將預設收件人取消
    $query = sprintf(
        "UPDATE addbook 
        SET setdefault='0'
        WHERE emailid = %d 
        AND setdefault = '1'",
        $emailid
    );
    $result = $link->query($query);
    //將選定收件人定為預設收件人
    $query = sprintf("UPDATE addbook SET setdefault = '1' WHERE addressid = %d", $addressid);
    $result = $link->query($query);
    if ($result) {
        $retcode = ["c" => "1", "m" => "收件人已變更"];
    } else {
        $retcode = ["c" => "0", "m" => "資料變更失敗，請聯絡管理員"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
