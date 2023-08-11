-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 08, 2023 lúc 12:55 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shoplaptop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `isSell` int(11) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `user`, `pass`, `isSell`, `isAdmin`) VALUES
(1, 'jmfine', '1', 1, 0),
(2, 'admin', '1', 1, 1),
(3, 'a', '1', 0, 0),
(4, 'as', '1', 0, 0),
(6, 'asss', '1', 0, 0),
(7, 'aasss', '1', 0, 0),
(8, '21a', '1', 0, 0),
(9, '221a', '1', 0, 0),
(10, 'jmfinea', '1', 0, 0),
(11, '1', '12', 0, 0),
(12, 'jmfineawa', '123', 0, 0),
(13, 'jmfine21', '123', 0, 0),
(14, 'jmfine12', '1', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Laptop Gaming'),
(2, 'Laptop Văn Phòng'),
(3, 'Phụ Kiện'),
(4, 'Laptop Đồ Họa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `CategoryId` int(11) NOT NULL,
  `sellId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `title`, `description`, `CategoryId`, `sellId`) VALUES
(3, 'Laptop LG 502', 'https://cdn.discordapp.com/attachments/714478883159670906/1137323807422566460/product04.png', 999, 'Khám Phá Dòng Laptop Mới với Cấu Hình Cực Mạnh', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 2, 3),
(4, 'Laptop ASUS', 'https://media.discordapp.net/attachments/714478883159670906/1137323807686803466/product06.png', 666, 'Khám Phá Dòng Laptop Mới với Cấu Hình Cực Mạnh', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 4, 4),
(5, 'Laptop MX', 'https://cdn.discordapp.com/attachments/714478883159670906/1137323807992975531/shop01.png', 554, 'Khám Phá Dòng Laptop Mới với Cấu Hình Cực Mạnh', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 4, 5),
(6, 'Laptop Mtrix', 'https://cdn.discordapp.com/attachments/714478883159670906/1137323806743085107/product01.png', 545, 'Khám Phá Dòng Laptop Mới với Cấu Hình Cực Mạnh', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 1, 1),
(7, 'Laptop Lenovo', 'https://cdn.discordapp.com/attachments/714478883159670906/1137323808555012116/50065_LaptopHP15s-du0059TU6ZF65PAn5000bac08.png', 231, 'Khám Phá Dòng Laptop Mới với Cấu Hình Cực Mạnh', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 1, 2),
(8, 'Laptop TUF', 'https://cdn.discordapp.com/attachments/714478883159670906/1137323808840237137/images.jpg', 213, 'Khám Phá Dòng Laptop Mới với Cấu Hình Cực Mạnh', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 2, 3),
(9, 'Laptop Gaming', 'https://cdn.discordapp.com/attachments/714478883159670906/1137323806743085107/product01.png', 42, 'Khám Phá Dòng Laptop Mới với Cấu Hình Cực Mạnh', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 4, 4),
(10, 'Tai nghe', 'https://cdn.discordapp.com/attachments/714478883159670906/1137338226009448458/637955569082653401_HASP-TAINGHE-SOUNDMAX-AH335-AVT.jpg', 342, 'Tai Nghe Vượt Trội: Trải Nghiệm Âm Thanh Cực Phê và Cảm Giác Siêu Nhẹ', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 3, 1),
(11, 'Tai nghe ASUS', 'https://cdn.discordapp.com/attachments/714478883159670906/1137338226605031484/edifier_w820nb_5.png', 243, 'Tai Nghe Vượt Trội: Trải Nghiệm Âm Thanh Cực Phê và Cảm Giác Siêu Nhẹ', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 3, 2),
(12, 'Tai nghe Không dây', 'https://cdn.discordapp.com/attachments/714478883159670906/1137338226823143454/tai_xuong.jpg', 423, 'Tai Nghe Vượt Trội: Trải Nghiệm Âm Thanh Cực Phê và Cảm Giác Siêu Nhẹ', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 3, 3),
(13, 'Tai nghe Bluetooth', 'https://cdn.discordapp.com/attachments/714478883159670906/1137338226332405770/co-day-dareu-ek87-thumb-600x600.jpeg', 123, 'Tai Nghe Vượt Trội: Trải Nghiệm Âm Thanh Cực Phê và Cảm Giác Siêu Nhẹ', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 3, 1),
(14, 'Bàn phím Lenovo', 'https://cdn.discordapp.com/attachments/714478883159670906/1137323807992975531/shop01.png', 323, 'Bàn phím chất lượng cao với thiết kế tiện ích và hiệu suất vượt trội', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 3, 2),
(15, 'Chuột TUF', 'https://cdn.discordapp.com/attachments/714478883159670906/1137338225694867567/1445263856_chuot-may-tinh.jpg', 121, 'Chuột chất lượng cao với thiết kế tiện ích và hiệu suất vượt trội', 'Laptop này được trang bị bộ vi xử lý mạnh mẽ và bộ nhớ RAM rộng lớn giúp bạn xử lý mọi tác vụ mượt mà và nhanh chóng. Thưởng thức những hình ảnh tuyệt đẹp trên màn hình cực đỉnh với độ phân giải cao, cùng công nghệ màu sắc sống động mang lại trải nghiệm giải trí chưa từng có', 3, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
