-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2023 at 09:23 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `servis`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenismerk`
--

DROP TABLE IF EXISTS `jenismerk`;
CREATE TABLE IF NOT EXISTS `jenismerk` (
  `idjenismerk` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` text NOT NULL,
  `idmerk` int(11) NOT NULL,
  `gambar` text NOT NULL,
  PRIMARY KEY (`idjenismerk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenismerk`
--

INSERT INTO `jenismerk` (`idjenismerk`, `keterangan`, `idmerk`, `gambar`) VALUES
(1, 'Honda Beat', 1, 'background.jpg'),
(2, 'Honda Vario', 1, 'icon.png'),
(4, 'mio', 3, 'icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `merk`
--

DROP TABLE IF EXISTS `merk`;
CREATE TABLE IF NOT EXISTS `merk` (
  `idmerk` int(4) NOT NULL AUTO_INCREMENT,
  `jenismerk` text NOT NULL,
  PRIMARY KEY (`idmerk`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merk`
--

INSERT INTO `merk` (`idmerk`, `jenismerk`) VALUES
(1, 'Honda'),
(2, 'Suzuki'),
(3, 'Yamaha');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `motor`
--

DROP TABLE IF EXISTS `motor`;
CREATE TABLE IF NOT EXISTS `motor` (
  `idmotor` int(10) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `nopolisi` varchar(10) NOT NULL,
  `idmerk` int(4) NOT NULL,
  `idjenismerk` int(11) NOT NULL,
  PRIMARY KEY (`idmotor`),
  KEY `iduser` (`iduser`),
  KEY `idmerk` (`idmerk`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motor`
--

INSERT INTO `motor` (`idmotor`, `iduser`, `nopolisi`, `idmerk`, `idjenismerk`) VALUES
(6, 131, 'aaa', 2, 1),
(7, 131, 'aaaas', 1, 2),
(8, 131, 'ab23234', 1, 1),
(9, 131, 'aaa 12234', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('enoyat@gmail.com', '$2y$10$GwgTxsD7YCWGKf11JW0KKeOmadlNSHzF8UrSNoZ93ZSvikRAeRumu', '2023-07-02 12:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `pelayanan`
--

DROP TABLE IF EXISTS `pelayanan`;
CREATE TABLE IF NOT EXISTS `pelayanan` (
  `idpelayanan` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idmotor` int(11) NOT NULL,
  `pelayanan1` tinyint(1) DEFAULT 0,
  `pelayanan2` tinyint(1) DEFAULT 0,
  `pelayanan3` tinyint(1) NOT NULL DEFAULT 0,
  `pelayanan4` tinyint(1) NOT NULL DEFAULT 0,
  `pelayanan5` tinyint(1) DEFAULT 0,
  `pelayanan6` tinyint(1) NOT NULL DEFAULT 0,
  `pelayanan7` tinyint(1) NOT NULL DEFAULT 0,
  `pelayananlain` text DEFAULT NULL,
  `statuspelayanan` varchar(10) DEFAULT 'baru',
  PRIMARY KEY (`idpelayanan`),
  KEY `iduser` (`iduser`),
  KEY `idmotor` (`idmotor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelayanan`
--

INSERT INTO `pelayanan` (`idpelayanan`, `iduser`, `idmotor`, `pelayanan1`, `pelayanan2`, `pelayanan3`, `pelayanan4`, `pelayanan5`, `pelayanan6`, `pelayanan7`, `pelayananlain`, `statuspelayanan`) VALUES
(10, 131, 8, 1, 0, 0, 1, 0, 1, 1, 'dsdsd', 'baru'),
(11, 131, 9, 1, 1, 0, 0, 0, 0, 1, 'sdasdsad', 'baru');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

DROP TABLE IF EXISTS `reservasi`;
CREATE TABLE IF NOT EXISTS `reservasi` (
  `idreservasi` int(11) NOT NULL AUTO_INCREMENT,
  `idpelayanan` int(11) NOT NULL,
  `idmekanik` int(11) NOT NULL,
  `tglreservasi` date NOT NULL,
  `jam` varchar(5) DEFAULT NULL,
  `statusreservasi` varchar(10) NOT NULL DEFAULT 'baru',
  PRIMARY KEY (`idreservasi`),
  KEY `idpelayanan` (`idpelayanan`),
  KEY `idmekanik` (`idmekanik`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`idreservasi`, `idpelayanan`, `idmekanik`, `tglreservasi`, `jam`, `statusreservasi`) VALUES
(4, 11, 133, '2021-09-09', '00:10', 'baru'),
(5, 11, 133, '2021-09-09', '00:10', 'baru');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', '2020-12-22 02:12:09', '2020-12-22 02:12:09'),
(2, 'mekanik', '2020-12-22 02:12:09', '2020-12-22 02:12:09'),
(3, 'customer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `nohp` text DEFAULT NULL,
  `roles_id` int(2) NOT NULL,
  `access_token` text DEFAULT NULL,
  `remember_token` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `roles_id` (`roles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `alamat`, `nohp`, `roles_id`, `access_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$BDC0RyJgj7izd3Fs4.8b5.f1No7tnLVRzEwtWVzb9Y2H9ckKYLFka', NULL, NULL, 1, NULL, NULL, '2023-07-18 08:21:03', '2023-07-18 08:21:03'),
(130, 'member', 'member@gmail.com', '$2y$10$BDC0RyJgj7izd3Fs4.8b5.f1No7tnLVRzEwtWVzb9Y2H9ckKYLFka', NULL, NULL, 3, NULL, NULL, '2023-07-18 08:21:03', '2023-07-18 08:21:03'),
(131, 'paijo', 'paijo@gmail.com', '$2y$10$gT5.TNui4x6pzlCc5jZuSudnkGEI6dxT7WTcsXQXfdWbOA.Nb3qVm', 'alamatnya', '02822226', 3, NULL, NULL, '2023-12-21 23:07:26', '2023-12-21 23:07:26'),
(132, 'Mekanik', 'mekanik@gmail.com', '$2y$10$gT5.TNui4x6pzlCc5jZuSudnkGEI6dxT7WTcsXQXfdWbOA.Nb3qVm', 'alamatnya', '02822226', 2, NULL, NULL, '2023-12-21 23:07:26', '2023-12-21 23:07:26'),
(133, 'Mekanik 2', 'mekanik2@gmail.com', '$2y$10$gT5.TNui4x6pzlCc5jZuSudnkGEI6dxT7WTcsXQXfdWbOA.Nb3qVm', 'alamatnya', '02822226', 2, NULL, NULL, '2023-12-21 23:07:26', '2023-12-21 23:07:26');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `motor`
--
ALTER TABLE `motor`
  ADD CONSTRAINT `motor_ibfk_1` FOREIGN KEY (`idmerk`) REFERENCES `merk` (`idmerk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pelayanan`
--
ALTER TABLE `pelayanan`
  ADD CONSTRAINT `pelayanan_ibfk_2` FOREIGN KEY (`idmotor`) REFERENCES `motor` (`idmotor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pelayanan_ibfk_3` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
