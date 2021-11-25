<?php
include 'dbconnect.php';
$brgs=mysqli_query($conn,"SELECT * from kategori k, produk p where k.idkategori=p.idkategori order by idproduk ASC");
$p        = mysqli_fetch_array($brgs);
$p        = mysqli_fetch_array($brgs);
$p        = mysqli_fetch_array($brgs);
$p        = mysqli_fetch_array($brgs);
$p        = mysqli_fetch_array($brgs);
$p        = mysqli_fetch_array($brgs);
$p        = mysqli_fetch_array($brgs);

?>
<!DOCTYPE html>
<html>
    <head>
        <title>Ajax Jquery - Belajarphp.net</title>
    </head>
    <body>
        <form method="post" action="update.php">
            <input type="hidden" value="<?php echo $p['idproduk'];?>" name="idproduk">
            <table>
                <tr><td>Nama Produk</td><td><input type="text" value="<?php echo $p['namaproduk'];?>" name="namaproduk"></td></tr>
                <tr><td>Nama Kategori</td><td><input type="text" value="<?php echo $p['namakategori'];?>" name="namakategori"></td></tr>
                <tr><td>Harga Diskon</td><td><input type="text" value="<?php echo $p['hargaafter'];?>" name="hargaafter"></td></tr>
                <tr><td>Deskripsi</td><td><input type="text" value="<?php echo $p['deskripsi'];?>" name="deskripsi"></td></tr>
                <tr><td>Rate</td><td><input type="text" value="<?php echo $p['rate'];?>" name="rate"></td></tr>
                <tr><td>Harga Awal</td><td><input type="text" value="<?php echo $p['hargabefore'];?>" name="hargabefore"></td></tr>
                <tr><td colspan="2"><button type="submit" value="simpan">SIMPAN PERUBAHAN</button>
                        <a href="index.php">Kembali</a></td></tr>
            </table>
        </form>
    </body>
</html>