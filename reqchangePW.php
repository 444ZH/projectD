<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json;charset=utf-8");

require_once('./connection/furnitureshop_db.php');

if(isset($_GET['emailid']) && $_GET['emailid'] != ''){
    $emailid = $_GET['emailid'];
    $PWNew1 = password_hash($_GET['PWNew1'], PASSWORD_DEFAULT);
    $query = sprintf(
        "UPDATE member 
        SET pw1 = '%s' 
        WHERE member.emailid = %d",
        $PWNew1, $emailid
    );
    $result = $link->query($query);
    if($result){
        $retcode = ["c" => "1", "m" => "密碼已更新，下次請使用新密碼登入"];
    }else{
        $retcode = ["c" => "0", "m" => "變更密碼失敗，請聯絡管理員"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>