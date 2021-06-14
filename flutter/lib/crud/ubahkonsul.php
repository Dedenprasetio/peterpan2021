<?php
include 'conn.php';

$idKonsul = $_POST["idKonsul"];
$nim = $_POST['nim'];
$nidn = $_POST['nidn'];
$topik = $_POST['topik'];
$hari = $_POST['hari'];
$tgl = $_POST['tgl'];
$jam = $_POST['jam'];
$status_konsul = $_POST['status_konsul'];

$connect->query("UPDATE konsul SET nim='".$nim."', nidn='".$nidn."',
 topik='".$topik."', hari='".$hari."', tgl='".$tgl."', jam='".$jam."',
 status_konsul='".$status_konsul."' WHERE idKonsul=".$idKonsul);
?>