-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2022 at 10:07 AM
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
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id_img` int(11) NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `date_uploaded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id_post` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `url_thumb` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `cate_1_id` int(11) NOT NULL,
  `cate_2_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id_post`, `title`, `descr`, `url_thumb`, `slug`, `keywords`, `body`, `cate_1_id`, `cate_2_id`, `author_id`, `status`, `view`, `date_posted`) VALUES
(1, 'Iphone 14 serie cháy hàng trong ngày mở đặt trước', '', '', 'iphone-14-serie-chay-hang-trong-ngay-mo-dat-truoc', '', '', 0, 0, 2, 0, 0, '2022-10-11 13:55:24'),
(2, 'Kẻ trộm Bitcoin từ tay FBI', '', '', 'ke-trom-bitcoin-tu-tay-fbi', '', '', 0, 0, 2, 0, 0, '2022-10-11 14:15:13'),
(3, '4 tuần với Galaxy Z Flip4 Trải nghiệm gói gọn trong chữ “Gập”', 'Điện thoại gập rõ ràng là để “gập”. Đặc biệt khi Galaxy Z Flip4 đã được tinh chỉnh lại nhiều khía cạnh để mang lại trải nghiệm hoàn thiện hơn.', 'https://genk.vn/4-tuan-voi-galaxy-z-flip4-trai-nghiem-goi-gon-trong-chu-gap-20221006120515284.chn', '4-tuan-voi-galaxy-z-flip4-trai-nghiem-goi-gon-trong-chu-“gap”', 'gập', '&lt;p&gt;Điện thoại gập rõ ràng là để &amp;ldquo;gập&amp;rdquo;. Đặc biệt khi Galaxy Z Flip4 đã được tinh chỉnh lại nhiều khía cạnh để mang lại trải nghiệm hoàn thiện hơn.&lt;/p&gt;', 1, 6, 1, 0, 0, '2022-10-11 14:15:39'),
(4, 'Đánh giá nhanh ổ cứng SSD NVMe WD_BLACK SN850 dành cho PS5', 'đánh giá ổ cứng', 'https://genk.vn/danh-gia-nhanh-o-cung-ssd-nvme-wdblack-sn850-danh-cho-ps5-van-thuoc-hang-dau-bang-nhung-duoc-dan-them-logo-playstation-tren-hop-20221006153626673.chn', 'danh-gia-nhanh-o-cung-ssd-nvme-wdblack-sn850-danh-cho-ps5', 'ổ cứng', '&lt;p&gt;Dù đã ra mắt được gần hai năm với khe cắm mở rộng NVMe PCIe 4.0 sẵn sàng, chỉ đến cuối tháng 05/2022, Sony mới chính thức ra mắt bản cập nhật phần mềm hệ thống hỗ trợ thêm ổ SSD NVMe gắn trong. Điều này cũng đồng thời mở ra một thị trường mới cho các nhà sản xuất thiết bị lưu trữ.&lt;/p&gt;', 2, 0, 1, 0, 0, '2022-10-11 14:15:50'),
(8, 'test', 'test', 'https://www.w3schools.com', 'test', 'test', '&lt;p&gt;test&lt;/p&gt;', 1, 6, 2, 0, 0, '2022-10-11 14:30:05'),
(9, 'test2', 'aaaa', 'https://genk.vn/danh-gia-nhanh-o-cung-ssd-nvme-wdblack-sn850-danh-cho-ps5-van-thuoc-hang-dau-bang-nhung-duoc-dan-them-logo-playstation-tren-hop-20221006153626673.chn', 'test2', 'a', '&lt;p&gt;aaaaaaaaaaaaaa&lt;/p&gt;', 5, 14, 2, 0, 0, '2022-10-11 14:30:10'),
(10, 'test3', 'mo tả', 'https://genk.vn/danh-gia-nhanh-o-cung-ssd-nvme-wdblack-sn850-danh-cho-ps5-van-thuoc-hang-dau-bang-nhung-duoc-dan-them-logo-playstation-tren-hop-20221006153626673.chn', 'test3', 'a', '&lt;p&gt;a&lt;/p&gt;', 4, 11, 2, 0, 0, '2022-10-11 14:30:19'),
(11, 'test4', 'mô tả', 'https://genk.vn/danh-gia-nhanh-o-cung-ssd-nvme-wdblack-sn850-danh-cho-ps5-van-thuoc-hang-dau-bang-nhung-duoc-dan-them-logo-playstation-tren-hop-20221006153626673.chn', 'test4', 'mô tả', '&lt;p&gt;dfnjdnglangnalwgnlkaw&lt;/p&gt;', 3, 8, 2, 0, 0, '2022-10-11 14:30:25');

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
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_img`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id_post`);

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
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id_img` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_acc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
