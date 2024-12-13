<?php
try {
    $db_host = getenv('DB_HOST');
    $db_name = getenv('DB_NAME');
    $db_user = getenv('DB_USERNAME');
    $db_password = getenv('DB_PASSWORD');
    $db_port = getenv('DB_PORT');

    $dsn = "mysql:host={$db_host};dbname={$db_name};charset=utf8mb4";

    // 建立PDO連線
    $link = new PDO($dsn, $db_user, $db_password);

    //設置錯誤模式為異常
    $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //設置時區
    date_default_timezone_set("Asia/Taipei");
} catch (PDOException $e) {
    error_log("連線錯誤: " . $e->getMessage());
    exit("資料庫連線失敗");
}
