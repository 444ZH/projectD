<?php
//PDO SQL連線指令
try {
    $dsn = "mysql:host=localhost;dbname=furnitureshop;charset=utf8mb4";
    $user = "sales";
    $password = "Gsca6-NezQgELoox";
    $link = new PDO($dsn, $user, $password);

    //設置錯誤模式為異常
    $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //設置預設時區
    date_default_timezone_set("Asia/Taipei");
    // echo "連線成功";
} catch (PDOException $e) {
    // echo "連線失敗" . $e->getMessage();
}
