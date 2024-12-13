<?php
include_once('./connection/furnitureshop_db_example.php');

if (isset($_GET['emailid'])) {
    $emailid = $_GET['emailid'];
    $PWOld = $_GET['PWOld'];
    $query = sprintf(
        "SELECT pw1 
        FROM member 
        WHERE emailid = %d",
        $emailid
    );
    $result = $link->query($query);

    if ($result && $result->rowCount() > 0) {
        $row = $result->fetch(PDO::FETCH_ASSOC);
        $pw1 = $row['pw1'];

        if (password_verify($PWOld, $pw1)) {
            echo 'true';
            return;
        }
    }
}
echo 'false';
return;
