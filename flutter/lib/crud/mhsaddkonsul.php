<?php

include 'conn.php';

$nim = $_POST['nim'];
$nidn = $_POST['nidn'];
$topik = $_POST['topik'];
$hari = $_POST['hari'];
$tgl = $_POST['tgl'];
$jam = $_POST['jam'];
$status_konsul = $_POST['status_konsul'];
$connect->query("INSERT INTO konsul (nim, nidn, topik, hari, tgl, jam, status_konsuk) VALUES
('".$nim."','".$nidn."','".$topik."','".$hari."','".$tgl."','".$jam."','".$status_konsul."')")

?>