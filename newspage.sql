-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2022 at 06:45 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newspage`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_cate` int(11) NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_cate`, `label`, `url`, `type`, `sort`, `parent_id`, `date_created`) VALUES
(1, 'Mobile', 'mobile', 1, 1, 0, '2022-10-10 16:03:31'),
(2, 'Tin ICT', 'tin-ict', 1, 1, 0, '2022-10-10 16:39:24'),
(3, 'Internet', 'internet', 1, 1, 0, '2022-10-10 16:39:51'),
(4, 'Khám phá', 'kham-pha', 1, 2, 0, '2022-10-10 16:41:02'),
(5, 'Xem-mua-luôn', 'xem-mua-luon', 1, 2, 0, '2022-10-10 16:41:35'),
(6, 'Điện thoại', 'dien-thoai', 2, 1, 1, '2022-10-10 16:45:27'),
(7, 'Máy tính bảng', 'may-tinh-bang', 2, 2, 1, '2022-10-10 16:45:42'),
(8, 'Digital Marketing', 'digital-marketing', 2, 1, 3, '2022-10-10 16:46:59'),
(9, 'Media', 'media', 2, 2, 3, '2022-10-10 16:47:37'),
(10, 'Lịch sử', 'lich-su', 2, 1, 4, '2022-10-10 16:49:43'),
(11, 'Tri thức', 'tri-thuc', 2, 2, 4, '2022-10-10 16:51:28'),
(12, 'Di động', 'di-dong', 2, 1, 5, '2022-10-10 16:52:23'),
(13, 'Yêu bếp', 'yeu-bep', 2, 2, 5, '2022-10-10 16:52:39'),
(14, 'Phụ kiện', 'phu-kien', 2, 3, 5, '2022-10-10 16:54:14'),
(15, 'Máy tính', 'may-tinh', 2, 3, 5, '2022-10-10 16:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_acc` int(11) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` text CHARACTER SET utf8 NOT NULL,
  `position` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `facebook` text CHARACTER SET utf8 NOT NULL,
  `google` text CHARACTER SET utf8 NOT NULL,
  `twitter` text CHARACTER SET utf8 NOT NULL,
  `phone` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `url_avatar` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_acc`, `username`, `password`, `display_name`, `email`, `position`, `status`, `date_created`, `facebook`, `google`, `twitter`, `phone`, `description`, `url_avatar`) VALUES
(1, 'manhhung', 'manhhung', 'manh hung', 'nguyenxuanmanhhung@gmail.com', 0, 0, '2022-10-10 08:58:09', 'a', 'b', 'c', 912707558, 'manh hung nguyen xuan', 'https://anhdephd.vn/wp-content/uploads/2022/05/anh-gai-xinh-de-thuong.jpg'),
(2, 'manhcuong', 'manhcuong', 'Manh Cuong', 'manhcuong@gmail.com', 1, 0, '2022-10-10 10:57:54', 'fb', 'gg', 'tw', 52222020, 't là admin', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_cate`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_acc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_cate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_acc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
