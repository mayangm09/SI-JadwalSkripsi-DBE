/*
 Navicat MySQL Dump SQL

 Source Server         : koneksi
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : penjadwalan_sidang

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 05/03/2025 10:19:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen`  (
  `nidn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_dosen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jurusan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`nidn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES ('1001001001', 'Hendra Saputra', 'Jurusan Komputer dan Bisnis', 'hendra.saputra@gmail.com');
INSERT INTO `dosen` VALUES ('1001001002', 'Laras Wulandari', 'Jurusan Rekayasa Elektro dan Mekatronika', 'laras.wulandari@gmail.com');
INSERT INTO `dosen` VALUES ('1001001003', 'Bambang Wijaya', 'Jurusan Rekayasa Mesin dan Industri Pertanian', 'bambang.wijaya@gmail.com');
INSERT INTO `dosen` VALUES ('1001001004', 'Siti Nurhaliza', 'Jurusan Komputer dan Bisnis', 'siti.nurhaliza@gmail.com');
INSERT INTO `dosen` VALUES ('1001001005', 'Santika Dewi', 'Jurusan Rekayasa Mesin dan Industri Pertanian', 'santika.dewi@gmail.com');
INSERT INTO `dosen` VALUES ('1001001006', 'Yoga Prasetyo', 'Jurusan Rekayasa Elektro dan Mekatronika', 'yoga.prasetyo@gmail.com');

-- ----------------------------
-- Table structure for jadwal_sidang
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_sidang`;
CREATE TABLE `jadwal_sidang`  (
  `id_jadwal` int NOT NULL AUTO_INCREMENT,
  `npm` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_ruangan` int NOT NULL,
  `waktu_sidang` timestamp NOT NULL,
  PRIMARY KEY (`id_jadwal`) USING BTREE,
  INDEX `npm`(`npm` ASC) USING BTREE,
  INDEX `id_ruangan`(`id_ruangan` ASC) USING BTREE,
  CONSTRAINT `jadwal_sidang_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jadwal_sidang_ibfk_2` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal_sidang
-- ----------------------------
INSERT INTO `jadwal_sidang` VALUES (1, '230102050', 1, '2024-03-05 09:00:00');
INSERT INTO `jadwal_sidang` VALUES (2, '230102053', 2, '2024-03-12 10:30:00');
INSERT INTO `jadwal_sidang` VALUES (3, '230102063', 3, '2024-03-19 13:00:00');
INSERT INTO `jadwal_sidang` VALUES (4, '230102064', 4, '2024-03-26 08:30:00');
INSERT INTO `jadwal_sidang` VALUES (5, '230102065', 5, '2024-04-02 14:00:00');
INSERT INTO `jadwal_sidang` VALUES (6, '230102067', 6, '2024-04-09 10:00:00');

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `npm` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_mahasiswa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jurusan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `program_studi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `judul_skripsi` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`npm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES ('230102050', 'Fikri Ramadhan', 'Jurusan Komputer dan Bisnis', 'D3 Teknik Informatika', 'Optimasi Algoritma K-Means dalam Clustering Data Besar', 'fikri.ramadhan@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102053', 'Dina Ayu', 'Jurusan Rekayasa Elektro dan Mekatronika', 'D3 Teknik Listrik', 'Desain dan Implementasi Smart Grid Berbasis Energi Terbarukan', 'dina.ayu@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102063', 'Dimas Pratama', 'Jurusan Rekayasa Mesin dan Industri Pertanian', 'D3 Teknik Mesin', 'Perancangan Sistem Pendingin Otomatis pada Mesin CNC', 'dimas.pratama@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102064', 'Aulia Zahra', 'Jurusan Rekayasa Elektro dan Mekatronika', 'D3 Teknik Elektronika', 'Implementasi IoT dalam Pemantauan Konsumsi Daya Listrik Rumah Tangga', 'aulia.zahra@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102065', 'Nadia Putri', 'Jurusan Komputer dan Bisnis', 'D4 Cyber Security', 'Analisis Keamanan Jaringan Menggunakan Intrusion Detection System (IDS)', 'nadia.putri@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102067', 'Rafi Akbar', 'Jurusan Komputer dan Bisnis', 'D3 Teknik Informatika', 'Penerapan Machine Learning untuk Prediksi Harga Saham', 'rafi.akbar@gmail.com');

-- ----------------------------
-- Table structure for penguji_sidang
-- ----------------------------
DROP TABLE IF EXISTS `penguji_sidang`;
CREATE TABLE `penguji_sidang`  (
  `id_penguji` int NOT NULL AUTO_INCREMENT,
  `id_jadwal` int NOT NULL,
  `nidn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `peran` enum('Penguji 1','Penguji 2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_penguji`) USING BTREE,
  UNIQUE INDEX `unique_penguji`(`id_jadwal` ASC, `nidn` ASC) USING BTREE,
  INDEX `nidn`(`nidn` ASC) USING BTREE,
  CONSTRAINT `penguji_sidang_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_sidang` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penguji_sidang_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penguji_sidang
-- ----------------------------
INSERT INTO `penguji_sidang` VALUES (1, 1, '1001001001', 'Penguji 1');
INSERT INTO `penguji_sidang` VALUES (2, 1, '1001001004', 'Penguji 2');
INSERT INTO `penguji_sidang` VALUES (3, 2, '1001001002', 'Penguji 1');
INSERT INTO `penguji_sidang` VALUES (4, 2, '1001001006', 'Penguji 2');
INSERT INTO `penguji_sidang` VALUES (5, 3, '1001001003', 'Penguji 1');
INSERT INTO `penguji_sidang` VALUES (6, 3, '1001001005', 'Penguji 2');

-- ----------------------------
-- Table structure for ruangan
-- ----------------------------
DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan`  (
  `id_ruangan` int NOT NULL AUTO_INCREMENT,
  `nama_ruangan` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lokasi` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_ruangan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ruangan
-- ----------------------------
INSERT INTO `ruangan` VALUES (1, 'Ruang J.5.3', 'Gedung GTIL, Lantai 5');
INSERT INTO `ruangan` VALUES (2, 'Ruang 1.3', 'Gedung GKB, Lantai 1');
INSERT INTO `ruangan` VALUES (3, 'Ruang 3.5', 'Gedung GKB, Lantai 3');
INSERT INTO `ruangan` VALUES (4, 'Ruang J.4.1', 'Gedung GTIL, Lantai 4');
INSERT INTO `ruangan` VALUES (5, 'Ruang 4.2', 'Gedung GKB, Lantai 4');
INSERT INTO `ruangan` VALUES (6, 'Ruang J.5.5', 'Gedung GTIL, Lantai 5');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('mahasiswa','dosen','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '230102050', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (2, '230102053', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (3, '230102063', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (4, '230102064', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (5, '230102065', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (6, '230102067', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (7, '1001001001', '4321', 'dosen');
INSERT INTO `user` VALUES (8, '1001001002', '4321', 'dosen');
INSERT INTO `user` VALUES (9, '1001001003', '4321', 'dosen');
INSERT INTO `user` VALUES (10, '1001001004', '4321', 'dosen');
INSERT INTO `user` VALUES (11, '1001001005', '4321', 'dosen');
INSERT INTO `user` VALUES (12, '1001001006', '4321', 'dosen');
INSERT INTO `user` VALUES (13, 'admin', '5678', 'admin');

-- ----------------------------
-- Triggers structure for table dosen
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_user_dosen`;
delimiter ;;
CREATE TRIGGER `insert_user_dosen` AFTER INSERT ON `dosen` FOR EACH ROW INSERT INTO User (username, password, role)
VALUES (NEW.nidn, '4321', 'dosen')
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dosen
-- ----------------------------
DROP TRIGGER IF EXISTS `update_user_dosen`;
delimiter ;;
CREATE TRIGGER `update_user_dosen` AFTER UPDATE ON `dosen` FOR EACH ROW IF OLD.nidn != NEW.nidn THEN
    UPDATE user
    SET username = NEW.nidn
    WHERE username = OLD.nidn;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dosen
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_user_dosen`;
delimiter ;;
CREATE TRIGGER `delete_user_dosen` AFTER DELETE ON `dosen` FOR EACH ROW DELETE FROM User WHERE username = OLD.nidn
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mahasiswa
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_user_mahasiswa`;
delimiter ;;
CREATE TRIGGER `insert_user_mahasiswa` AFTER INSERT ON `mahasiswa` FOR EACH ROW INSERT INTO User (username, password, role)
VALUES (NEW.npm, '1234', 'mahasiswa')
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mahasiswa
-- ----------------------------
DROP TRIGGER IF EXISTS `update_user_mahasiswa`;
delimiter ;;
CREATE TRIGGER `update_user_mahasiswa` AFTER UPDATE ON `mahasiswa` FOR EACH ROW IF OLD.npm != NEW.npm THEN
    UPDATE User
    SET username = NEW.npm
    WHERE username = OLD.npm;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mahasiswa
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_user_mahasiswa`;
delimiter ;;
CREATE TRIGGER `delete_user_mahasiswa` AFTER DELETE ON `mahasiswa` FOR EACH ROW DELETE FROM User WHERE username = OLD.npm
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
