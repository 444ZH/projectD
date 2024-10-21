<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json;charset=utf-8');


require_once('./connection/furnitureshop_db.php');

if(isset($_GET['p_id']) && isset($_GET['qty'])){
    $p_id = $_GET['p_id'];
    $qty = $_GET['qty'];
    $u_ip = $_SERVER['REMOTE_ADDR'];
    //查詢是否有相同產品編號
    $query = "SELECT * FROM cart WHERE p_id = " . $p_id . " AND ip = '".$u_ip."' AND orderid IS NULL";
    $result = $link -> query($query);
    if($result){
        if($result -> rowCount() == 0){
            $query = "INSERT INTO cart (p_id, qty, ip) VALUES (".$p_id.", ".$qty.", '".$u_ip."')";
        }else{
            $cart_data = $result ->fetch();
            if($cart_data['qty'] + $qty > 49){
                $qty = 49;  //設定產品數量上限
            }else{
                $qty = $qty + $cart_data['qty'];
            }
            $query = "UPDATE cart SET qty = ". $qty ." WHERE cart.cartid = " . $cart_data['cartid'];
        }
        $result = $link -> query($query);
        $retcode = ['c' => "1", "m" => "產品已加入購物車"];
    }else{
        $retcode = ['c' => "0", "m" => "抱歉!資料無法寫入後台資料庫，請聯絡管理人員"];
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return ;
?>