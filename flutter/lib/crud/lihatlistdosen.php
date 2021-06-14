<?php
include 'conn.php';
$queryResult=$connect->query("SELECT * FROM lengkap WHERE nim = '0'");
$result=array();
while($fetchData=$queryResult->fetch_assoc()){
$result[]=$fetchData;
}
echo json_encode($result);

?>