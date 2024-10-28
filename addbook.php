<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json;charset=utf-8");

require_once('./connection/furnitureshop_db.php');
(!isset($_SESSION)) ? session_start() : '';

if(isset($_SESSION['emailid']) && $_SESSION['emailid'] != ''){
    $emailid = $_SESSION['emailid'];
    $cname = $_POST['cname'];
    $mobile = $_POST['mobile'];
    $myZip = $_POST['myZip'];
    $address = $_POST['address'];
    $query = sprintf("UPDATE addbook SET setdefault = '0' WHERE emailid = %d AND setdefault = '1'", $emailid);
    $result = $link ->query($query);
    $query = "INSERT INTO addbook (setdefault, emailid, cname, mobile, myZip, address) VALUES ('1', '".$emailid."', '".$cname."', '".$mobile."', '".$myZip."', '".$address."')";
    $result = $link -> query($query);
    if($result){
        $retcode = ["c" => "1", "m" => "已經新增收件人"];
    }else{
        $retcode = ["c" => "0", "m" => "資料無法寫入資料庫，請聯絡管理員"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>