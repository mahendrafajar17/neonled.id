/*
 Navicat Premium Data Transfer

 Source Server         : Mobile_Lanjut
 Source Server Type    : MySQL
 Source Server Version : 100413
 Source Host           : localhost:3306
 Source Schema         : tokopekita

 Target Server Type    : MySQL
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 21/10/2021 11:40:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Cart',
  PRIMARY KEY (`idcart`) USING BTREE,
  UNIQUE INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `orderid_2`(`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (10, '15wKVT0nej25Y', 2, '2020-03-16 19:10:42', 'Selesai');
INSERT INTO `cart` VALUES (11, '15Swf8Ye0Fm.M', 2, '2020-03-16 19:17:34', 'Cart');
INSERT INTO `cart` VALUES (12, '15PzF03ejd8W2', 1, '2020-05-13 09:40:48', 'Confirmed');
INSERT INTO `cart` VALUES (13, '16ARUxuNL4Xnw', 3, '2021-10-06 14:13:57', 'Confirmed');
INSERT INTO `cart` VALUES (14, '167/TLXy00bEQ', 3, '2021-10-07 11:03:57', 'Cart');

-- ----------------------------
-- Table structure for detailorder
-- ----------------------------
DROP TABLE IF EXISTS `detailorder`;
CREATE TABLE `detailorder`  (
  `detailid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`detailid`) USING BTREE,
  INDEX `orderid`(`orderid`) USING BTREE,
  INDEX `idproduk`(`idproduk`) USING BTREE,
  CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detailorder
-- ----------------------------
INSERT INTO `detailorder` VALUES (13, '15wKVT0nej25Y', 1, 100);
INSERT INTO `detailorder` VALUES (14, '15PzF03ejd8W2', 2, 1);
INSERT INTO `detailorder` VALUES (15, '16ARUxuNL4Xnw', 1, 1);
INSERT INTO `detailorder` VALUES (16, '167/TLXy00bEQ', 1, 1);

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `idkategori` int(11) NOT NULL AUTO_INCREMENT,
  `namakategori` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgldibuat` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`idkategori`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (1, 'LED Sign Dibawah 1M', '2019-12-20 14:28:34');
INSERT INTO `kategori` VALUES (2, 'Dekorasi Meja', '2019-12-20 14:34:17');
INSERT INTO `kategori` VALUES (3, 'LED Sign 1M Keatas', '2020-03-16 19:15:40');

-- ----------------------------
-- Table structure for konfirmasi
-- ----------------------------
DROP TABLE IF EXISTS `konfirmasi`;
CREATE TABLE `konfirmasi`  (
  `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namarekening` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`idkonfirmasi`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfirmasi
-- ----------------------------
INSERT INTO `konfirmasi` VALUES (1, '15PzF03ejd8W2', 1, 'Bank BCA', 'Admin', '2020-05-16', '2020-05-13 09:41:51');
INSERT INTO `konfirmasi` VALUES (2, '16ARUxuNL4Xnw', 3, 'Bank BCA', 'Alex', '2021-10-06', '2021-10-06 14:16:03');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `namalengkap` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notelp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgljoin` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `role` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, 'Admin', 'admin123@gmail.com', '$2y$10$HHTt65JSXjjDyUsmfJIrPOUHzkR7s5/Zsyfb.SwjdB20aMrFnvJJ.', '01234567890', 'Indonesia', '2020-03-16 18:31:17', 'Admin', NULL);
INSERT INTO `login` VALUES (2, 'Guest', 'guest', '$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K', '01234567890', 'Indonesia', '2020-03-16 18:30:40', 'Member', NULL);
INSERT INTO `login` VALUES (3, 'Alex', 'alex123@gmail.com', '$2y$10$HHTt65JSXjjDyUsmfJIrPOUHzkR7s5/Zsyfb.SwjdB20aMrFnvJJ.', '0987654321', 'Jl. Antang', '2021-10-06 14:13:18', 'Member', NULL);

-- ----------------------------
-- Table structure for pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE `pembayaran`  (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `metode` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `norek` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `an` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pembayaran
-- ----------------------------
INSERT INTO `pembayaran` VALUES (1, 'Bank BRI', '13131231231', 'images/bri.png', 'Rahmat Hidayat');
INSERT INTO `pembayaran` VALUES (2, 'Bank BNI', '943248844843', 'images/bni.png', 'Muhammad Redy Hermaw');
INSERT INTO `pembayaran` VALUES (3, 'DANA', '0882313132123', 'images/dana.png', 'Rahmat Hidayat');

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `idproduk` int(11) NOT NULL AUTO_INCREMENT,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gambar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`idproduk`) USING BTREE,
  INDEX `idkategori`(`idkategori`) USING BTREE,
  CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 1, 'LED Sign', 'produk/p3.jpg', 'Ukuran 60x20 (8 Huruf)', 5, 700000, 600000, '2019-12-20 16:10:26');
INSERT INTO `produk` VALUES (2, 1, 'LED Sign', 'produk/p2.jpg', 'Ukuran 60x40 (10 Huruf + 1 Logo)', 4, 800000, 700000, '2019-12-20 16:24:13');
INSERT INTO `produk` VALUES (3, 3, 'LED Sign', 'produk/p1.jpg', 'Ukuran 1x50 (2 warna)', 5, 1200000, 1000000, '2020-03-16 19:16:53');
INSERT INTO `produk` VALUES (4, 3, 'LED Sign', 'produk/166a2CgkAfIns.jpg', 'Ukuran 100x40 (12 Huruf + Logo)', 4, 1200000, 1000000, '2021-10-08 21:27:32');

SET FOREIGN_KEY_CHECKS = 1;
