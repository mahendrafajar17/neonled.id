<?php
include 'dbconnect.php';
// menyimpan data id kedalam variabel
$id   = $_GET['idproduk'];
// query SQL untuk insert data
$query="DELETE from produk where idproduk='$id'";
mysqli_query($conn, $query);
// mengalihkan ke halaman index.php
header("location:index.php");
?>