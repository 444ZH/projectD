<?php
try {
    $dsn = "mysql:host=localhost;dbname=furnitureshop;charset=utf8mb4";
    $user = "";
    $password = "";

    //建立PDO
    $link = new PDO($dsn, $user, $password);

    //設置錯誤模式為異常
    $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //設置時區
    date_default_timezone_set("Asia/Taipei");
} catch (PDOException $e) {
    error_log("連線錯誤: " . $e->getMessage());
    exit("資料庫連線失敗");
}
?>