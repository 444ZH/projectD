<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=utf-8");

require_once('./connection/furnitureshop_db_example.php');

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (isset($_GET['emailid']) && $_GET['emailid'] != '') {
    $emailid = $_GET['emailid'];
    $cname = $_GET['cname'];
    $birthday = $_GET['birthday'];
    $query = sprintf(
        "SELECT MIN(create_date) AS min_create_date
            FROM addbook
            WHERE emailid = %d",
        $emailid
    );
    $result = $link->query($query);
    if ($result && $result->rowCount() > 0) {
        $row = $result->fetch(PDO::FETCH_ASSOC);
        $min_create_date = $row['min_create_date'];
        if ($min_create_date) {
            $updateQuery = sprintf(
                "UPDATE member
                JOIN addbook ON member.emailid = addbook.emailid
                SET member.cname = '%s', 
                    addbook.cname = '%s', 
                    member.birthday = '%s'
                WHERE member.emailid = %d
                AND addbook.create_date = '%s'",
                $cname,
                $cname,
                $birthday,
                $emailid,
                $min_create_date
            );
            $updateResult = $link->query($updateQuery);
            if ($updateResult) {
                $retcode = ["c" => true, "m" => "個人資料已更新"];
            } else {
                $retcode = ["c" => false, "m" => "資料無法寫入資料庫，請聯絡管理員"];
            }
        } else {
            $retcode = ["c" => false, "m" => "找不到對應的創建時間"];
        }
    } else {
        $retcode = ["c" => false, "m" => "無法查詢最早的創建時間"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
