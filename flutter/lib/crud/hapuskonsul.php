<?php
include 'conn.php';
$idKonsul=$_POST['idKonsul'];
$connect->query("DELETE FROM konsul WHERE idKonsul=".$idKonsul);

?>