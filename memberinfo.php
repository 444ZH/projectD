<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json;charset=utf-8");

require_once('./connection/furnitureshop_db_example.php');


if (isset($_GET['emailid']) && $_GET['emailid'] != '') {
    $emailid = $_GET['emailid'];
    $query = sprintf(
        "SELECT member.emailid, member.cname, member.email, member.birthday, mobile
        FROM member
        JOIN addbook ON member.emailid = addbook.emailid AND member.cname = addbook.cname
        WHERE member.emailid = %d",
        $emailid
    );
    $result = $link->query($query);
    if ($result) {
        $data = $result->fetchAll(PDO::FETCH_ASSOC);
        $retcode = [
            "c" => "1",
            "m" => "",
            "d" => $data
        ];
    } else {
        $retcode = ["c" => "0", "m" => "資料無法寫入，請聯絡管理員"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
