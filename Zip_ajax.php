<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json;charset=utf-8");

require_once('./connection/furnitureshop_db_example.php');

$Zip = sprintf(
    "SELECT town.Name, town.Post, city.Name AS Cityname
    FROM town
    JOIN city ON town.AutoNO = city.AutoNo 
    WHERE town.townNo = %d",
    $_GET['AutoNo']
);
$Zip_rs = $link->query($Zip);
$Zip_num = $Zip_rs->rowCount();
if ($Zip_num > 0) {
    $Town_rows = $Zip_rs->fetch();
    $retcode = [
        "c" => "1",
        "Post" => $Town_rows['Post'],
        "Name" => $Town_rows['Name'],
        "Cityname" => $Town_rows['Cityname']
    ];
} else {
    $retcode = ["c" => "0", "m" => "找不到相關資料"];
}
echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
return;
