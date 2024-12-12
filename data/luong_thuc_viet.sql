/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : luong_thuc_viet

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 18/07/2024 20:37:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `addressId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userPhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `districts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `wards` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `isDefault` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`addressId`) USING BTREE,
  INDEX `fk_address_users`(`userId` ASC) USING BTREE,
  CONSTRAINT `fk_address_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES (1, 4, 'Chúc Ngân123', '0463632573', 'Tỉnh Tuyên Quang', 'Huyện Sơn Dương', 'Xã Phúc Ứng', '456', 0);
INSERT INTO `addresses` VALUES (2, 4, 'Quang Minh', '0747532573', 'Tỉnh Bắc Kạn', 'Huyện Ngân Sơn', 'Xã Vân Tùng', '123', 0);
INSERT INTO `addresses` VALUES (5, 2, 'Thành Minh', '0869824533', 'Tỉnh Bắc Kạn', 'Huyện Ngân Sơn', 'Thị trấn Nà Phặc', '123', 1);
INSERT INTO `addresses` VALUES (9, 4, 'Nguyễn Thị Chúc Ngân 123', '0869769142', 'Tỉnh Bắc Kạn', 'Huyện Ngân Sơn', 'Xã Cốc Đán', '780', 1);

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `blogId` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createdAt` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`blogId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES (1, 'Sản phẩm tốt', '2024-01-04 20:14:49', '2024-01-26 20:14:53');
INSERT INTO `blogs` VALUES (2, 'Hạt gạo tròn, đều đặn, cơm dẻo ngọt, thơm nhẹ. Gạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg cho cơm dẻo nhiều, mềm, vị ngọt đậm đà và mùi thơm tự nhiên. Đặc biệt, cơm vẫn dẻo và ngon ngay cả khi để nguội. Gạo Vinh Hiển là giống gạo Japonica chứa nhiều chất oxy hóa, giàu khoáng chất như Manesium, selenium', '2024-01-26 20:16:20', '2024-01-26 20:16:20');
INSERT INTO `blogs` VALUES (3, 'Gạo Hạt Ngọc Trời Tiên Nữ  với hạt thon dài, thơm nhẹ nhàng đặc trưng, khi nấu, gạo cho hạt cơm mềm, dẻo, ngọt. Gạo Hạt Ngọc Trời Tiên Nữ túi 5kg thuộc hãng Gạo Hạt Ngọc Trời, đảm bảo chất lượng và an toàn cho người sử dụng. Mang đến bữa cơm ngon, đảm bảo dĩnh dưỡng cho gia đình bạn', '2024-01-26 20:17:19', '2024-01-26 20:17:19');
INSERT INTO `blogs` VALUES (4, 'Gao lài sữa Đồng Việt túi 5kg là loại gạo lài sữa thơm ngon, hạt gạo trắng, hương lài thơm dịu hấp dẫn. Gạo Đồng Việt đảm bảo hạt gạo không chứa chất bảo quản, chất tạo mùi và không chứa dư lượng thuốc bảo vệ thực vật nên đảm bảo an toàn cho sức khỏe người dùng.\r\nGao lài sữa Đồng Việt túi 5kg là loại gạo lài sữa thơm ngon, hạt gạo trắng, hương lài thơm dịu hấp dẫn. Gạo Đồng Việt đảm bảo hạt gạo không chứa chất bảo quản, chất tạo mùi và không chứa dư lượng thuốc bảo vệ thực vật nên đảm bảo an toàn cho sức khỏe người dùng.\r\nGao lài sữa Đồng Việt túi 5kg là loại gạo lài sữa thơm ngon, hạt gạo trắng, hương lài thơm dịu hấp dẫn. Gạo Đồng Việt đảm bảo hạt gạo không chứa chất bảo quản, chất tạo mùi và không chứa dư lượng thuốc bảo vệ thực vật nên đảm bảo an toàn cho sức khỏe người dùng.\r\nGao lài sữa Đồng Việt túi 5kg là loại gạo lài sữa thơm ngon, hạt gạo trắng, hương lài thơm dịu hấp dẫn. Gạo Đồng Việt đảm bảo hạt gạo không chứa chất bảo quản, chất tạo mùi và không chứa dư lượng thuốc bảo vệ thực vật nên đảm bảo an toàn cho sức khỏe người dùng.\r\n', '2024-01-26 20:17:58', '2024-01-26 20:17:58');
INSERT INTO `blogs` VALUES (5, 'Gạo ST25 Thượng hạng Đồng Việt túi 5kg là loại gạo thơm được thu hoạch từ giống lúa ST25. Gạo Đồng Việt là thương hiệu nổi tiếng với các sản phẩm gạo chất lượng, không chứa chất bảo quản, chất tạo mùi và không để lại dư lượng thuốc bảo vệ thực vật khác.', '2024-01-26 20:18:28', '2024-01-26 20:18:28');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carouselId` int NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`carouselId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'images\\slider\\snapedit_1700070059821.png', 'Vũ điệu của hương vị và màu sắc', 'Một bữa sáng đầy màu sắc và ngon miệng với ngũ cốc, sữa, và\r\nMột lựa chọn tuyệt vời cho bữa sáng, bữa trưa, hoặc bữa tối.\r\n							');
INSERT INTO `carousel` VALUES (2, 'images/slider/snapedit_1700070244749.png', 'Bữa sáng trong mơ và đẹp.', '																								Một bữa sáng đầy màu sắc và ngon miệng với ngũ cốc, sữa, và trái cây.');
INSERT INTO `carousel` VALUES (3, 'images/slider/zyro-image.png', 'Kho báu của lương thực lành mạnh', 'Một bữa sáng đầy màu sắc và ngon miệng với ngũ cốc, sữa, và\r\nMột lựa chọn tuyệt vời cho bữa sáng, bữa trưa, hoặc bữa tối.');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `userId` int NOT NULL,
  `cartItems` json NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (2, '[{\"quantity\": 10, \"productId\": 2}, {\"quantity\": 12, \"productId\": 3}, {\"quantity\": 8, \"productId\": 5}, {\"quantity\": 8, \"productId\": 6}, {\"quantity\": 1, \"productId\": 7}, {\"quantity\": 1, \"productId\": 10}, {\"quantity\": 7, \"productId\": 11}]');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `parentCategoryId` int NULL DEFAULT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 0, 'Gạo các loại', b'1');
INSERT INTO `categories` VALUES (2, 1, 'Gạo đặc sản', b'1');
INSERT INTO `categories` VALUES (3, 1, 'Gạo dẻo, mềm thơm', b'1');
INSERT INTO `categories` VALUES (4, 1, 'Gạo Nở - Xốp Mềm', b'1');
INSERT INTO `categories` VALUES (5, 1, 'Gạo Tấm', b'1');
INSERT INTO `categories` VALUES (6, 1, 'Gạo Nếp', b'1');
INSERT INTO `categories` VALUES (7, 0, 'Củ, Quả', b'1');
INSERT INTO `categories` VALUES (8, 0, 'Ngũ cốc, yến mạch', b'1');
INSERT INTO `categories` VALUES (9, 0, 'Hạt', b'1');
INSERT INTO `categories` VALUES (10, 0, 'Sản phẩm khác', b'1');
INSERT INTO `categories` VALUES (11, 0, 'Đậu', b'1');
INSERT INTO `categories` VALUES (12, 10, 'Chế biến sẵn', b'1');
INSERT INTO `categories` VALUES (13, 0, 'Bột', b'1');
INSERT INTO `categories` VALUES (14, 1, 'Gạo lức', b'1');

-- ----------------------------
-- Table structure for discounts
-- ----------------------------
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts`  (
  `discountId` int NOT NULL AUTO_INCREMENT,
  `amount` float NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `conditions` double NULL DEFAULT NULL,
  `expDate` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `categoryId` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`discountId`) USING BTREE,
  INDEX `fk_category`(`categoryId` ASC) USING BTREE,
  CONSTRAINT `fk_category` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discounts
-- ----------------------------
INSERT INTO `discounts` VALUES (1, 10000, 'FREESHIP', 'FREESHIP', 'Miễn phí vận chuyển 10K', 50000, '2024-08-13 00:41:14', 1, 20);
INSERT INTO `discounts` VALUES (2, 20, 'LTV10PT', 'percentage', 'Giảm 20% giá trị đơn hàng', 400000, '2024-07-17 18:35:46', 2, 24);
INSERT INTO `discounts` VALUES (3, 10000, 'LTV10K', 'fixed', 'Giảm 10.000đ giá trị đơn hàng', 20000, '2024-09-13 00:41:34', 6, 38);
INSERT INTO `discounts` VALUES (4, 50000, 'LTV50K', 'fixed', 'Giảm 50.000đ giá trị đơn hàng', 100000, '2024-10-06 00:41:36', 7, 30);
INSERT INTO `discounts` VALUES (5, 30, 'LTV30PT', 'percentage', 'Giảm 30% giá trị đơn hàng', 500000, '2024-08-13 00:41:41', 9, 35);
INSERT INTO `discounts` VALUES (6, 30000, 'FREESHIP30', 'FREESHIP', 'Miễn phí vận chuyển 30K', 300000, '2024-07-17 14:20:47', NULL, 7);

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `imageId` int NOT NULL AUTO_INCREMENT,
  `productId` int NULL DEFAULT NULL,
  `imageName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`imageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 277 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, 1, 'Gạo thơm đặc sản Neptune ST25 túi 5kg', 'images/product-images/gao-thom-dac-san-neptune-st25-tui-5kg-202306191511488893.jpg');
INSERT INTO `images` VALUES (2, 2, 'Gạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'images/product-images/gao-giong-nhat-ban-vinh-hien-taiyo-tui-5kg-202007211001455095.jpg');
INSERT INTO `images` VALUES (3, 58, 'Gạo thơm Vua Gạo Phù Sa túi 5kg', 'images/product-images/gao-phu-sa-tui-5kg.jpg');
INSERT INTO `images` VALUES (4, 59, 'Gạo thơm Vua Gạo Đậm Đà ST24 túi 5kg', 'images/product-images/gao-st24-tui-5kg.jpg');
INSERT INTO `images` VALUES (5, 60, 'Gạo Nhật Shinichi Vua Gạo túi 5kg', 'images/product-images/gao-nhat-shinichi-tui-5kg.jpg');
INSERT INTO `images` VALUES (6, 61, 'Gạo Lạc Việt đệ nhất ST25 túi 5kg', 'images/product-images/gao-lac-viet-de-nhat-st25-tui-5kg.jpg');
INSERT INTO `images` VALUES (7, 62, 'Bắp nữ hoàng trái 250g trở lên', 'images/product-images/bap-nu-hoang-trai-tu-250g-tro-len.jpg');
INSERT INTO `images` VALUES (8, 63, 'Khoai lang mật 1kg (2 - 5 củ)', 'images/product-images/khoai-lang-mat-tui-1kg-3-10-cu (1).jpg');
INSERT INTO `images` VALUES (9, 64, 'Khoai lang tím 1kg', 'images/product-images/khoai-lang-tim-1kg (1).jpg');
INSERT INTO `images` VALUES (10, 65, 'Khoai sọ gọt vỏ 400g', 'images/product-images/khoai-so-got-vo-400g (1).jpg');
INSERT INTO `images` VALUES (11, 66, 'Hạt sen khô Việt San gói 150g', 'images/product-images/hat-sen-viet-san-150g-201812041634117252.jpg');
INSERT INTO `images` VALUES (12, 67, 'Hạt điều vỏ lụa Yến Nhung hộp 180g', 'images/product-images/hat-dieu-vo-lua-yen-nhung-hop-180g-202211260948312440.jpg');
INSERT INTO `images` VALUES (13, 68, 'Hạt hạnh nhân Mỹ Your Superfood hũ 450g', 'images/product-images/hat-hanh-nhan-my-your-superfood-hu-450g-202201120844001533.jpg');
INSERT INTO `images` VALUES (14, 69, 'Hạt điều rang củi Your Superfood hộp tròn 240g', 'images/product-images/hat-dieu-rang-cui-your-superfood-hop-tron-240g-202311040947410838.jpg');
INSERT INTO `images` VALUES (15, 70, 'Đậu nành gói 500g', 'images/product-images/dau-nanh-naita-500g-202204161723244150.jpg');
INSERT INTO `images` VALUES (16, 71, 'Đậu phộng Việt San 150g', 'images/product-images/dau-phong-viet-san-150g-201812041440132432.jpg');
INSERT INTO `images` VALUES (17, 72, 'Đậu xanh không vỏ Việt San 500g', 'images/product-images/dau-xanh-khong-vo-viet-san-500g-201812041347258312.jpg');
INSERT INTO `images` VALUES (18, 73, 'Đậu đen Việt San 300g', 'images/product-images/dau-den-viet-san-300g-201812041650351216.jpg');
INSERT INTO `images` VALUES (19, 74, 'Ngũ cốc dinh dưỡng MacCereal bịch 560g', 'images/product-images/ngu-coc-macgereal.jpg');
INSERT INTO `images` VALUES (20, 75, 'Ngũ cốc dinh dưỡng NutiFood bịch 500g', 'images/product-images/ngu-coc-dinh-duong-nutifood-nguyen-cam-bo-sung-canxi-bich-500g.jpg');
INSERT INTO `images` VALUES (21, 76, 'Bột ngũ cốc ăn kiêng Euro Cereal gói 500g', 'images/product-images/bot-ngu-coc-an-kieng-euro-cereal-goi-500g-25g-x-20-goi-202111192314385764.jpeg');
INSERT INTO `images` VALUES (22, 77, 'Sữa dinh dưỡng ngũ cốc Dutch Lady túi 300g', 'images/product-images/sua-dinh-duong-ngu-coc-dutch-lady-tui-300g-12-goi-x-25g-202204231154439430.jpg');
INSERT INTO `images` VALUES (23, 78, 'Bánh canh ống Mikiri gói 300g', 'images/product-images/banh-canh-ong-mikiri-goi-300g-202308210940075440.jpg');
INSERT INTO `images` VALUES (24, 79, 'Bánh mì tươi đông lạnh O\'smiles 350g', 'images/product-images/banh-mi-tuoi-osmiles-goi-350g-70g-x-5-o-202101141649320940.jpg');
INSERT INTO `images` VALUES (25, 80, 'Bánh gạo Tteokbokki Hàn Quốc HT Food gói 500g', 'images/product-images/banh-gao-tteokbokki-han-quoc-ht-food-goi-500g-202201181305036109.jpg');
INSERT INTO `images` VALUES (26, 81, 'Bánh bao nhân khoai môn C.P 270g', 'images/product-images/banh-bao-nhan-khoai-mon-cp-270g-202212261129142314.jpg');
INSERT INTO `images` VALUES (27, 3, 'Gạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'images/product-images/-202210270821594671.jpg');
INSERT INTO `images` VALUES (28, 4, 'Gạo lài sữa Đồng Việt túi 5kg', 'images/product-images/gao-lai-sua-dong-viet-tui-5kg-202212280858091468.jpg');
INSERT INTO `images` VALUES (29, 6, 'Gạo thơm A An ST21 túi 5kg', 'images/product-images/gao-thom-a-an-st21-tui-5kg-202006061602569575.jpg');
INSERT INTO `images` VALUES (30, 5, 'Gạo ST25 Đồng Việt túi 5kg', 'images/product-images/gao-st25-thuong-hang-dong-viet-tui-5kg-202212280854102020.jpg');
INSERT INTO `images` VALUES (31, 7, 'Gạo Lài hương Đồng Việt túi 5kg', 'images/product-images/gao-lai-huong-dong-viet-tui-5kg-202212280845480911.jpg');
INSERT INTO `images` VALUES (32, 8, 'Gạo lức huyết rồng PMT túi 2kg', 'images/product-images/-202210150918339457.jpg');
INSERT INTO `images` VALUES (33, 9, 'Gạo thơm Vua Gạo ST25 túi 5kg', 'images/product-images/-202306191015007772.jpg');
INSERT INTO `images` VALUES (34, 10, 'Gạo Ngọc Sa Cỏ May túi 5kg', 'images/product-images/gao-ngoc-sa-co-may-tui-5kg-202201050907494211.jpg');
INSERT INTO `images` VALUES (35, 1, 'Gạo thơm đặc sản Neptune ST25 túi 5kg', 'images\\product-images\\gao-thom-dac-san-neptune-st25-tui-5kg-202306191510459928.jpg');
INSERT INTO `images` VALUES (36, 1, 'Gạo thơm đặc sản Neptune ST25 túi 5kg', 'images\\product-images\\gao-thom-dac-san-neptune-st25-tui-5kg-202306191510464513.jpg');
INSERT INTO `images` VALUES (37, 1, 'Gạo thơm đặc sản Neptune ST25 túi 5kg', 'images\\product-images\\gao-thom-dac-san-neptune-st25-tui-5kg-202306191510479387.jpg');
INSERT INTO `images` VALUES (38, 2, 'Gạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'images\\product-images\\gao-giong-nhat-ban-Vinh-Hien-Taiyo-tui-5kg.jpg\"');
INSERT INTO `images` VALUES (39, 2, 'Gạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'images\\product-images\\gao-giong-nhat-ban-vinh-hien-taiyo-tui-5kg-202007211001460726.jpg');
INSERT INTO `images` VALUES (40, 2, 'Gạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'images\\product-images\\gao-giong-nhat-ban-vinh-hien-taiyo-tui-5kg-202007211001475055.jpg');
INSERT INTO `images` VALUES (42, 3, 'Gạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'images\\product-images\\\n-202210270822006857.jpg\n');
INSERT INTO `images` VALUES (43, 3, 'Gạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'images\\product-images\\-\n202210270822015270.jpg\n');
INSERT INTO `images` VALUES (44, 4, 'Gạo lài sữa Đồng Việt túi 5kg', 'images\\product-images\\\ngao-dong-viet-tui-5kg.jpg\n\n	');
INSERT INTO `images` VALUES (45, 4, 'Gạo lài sữa Đồng Việt túi 5kg', 'images\\product-images\\\ngao-lai-sua-dong-viet-tui-5kg-202212280858095666.jpg\n    ');
INSERT INTO `images` VALUES (46, 4, 'Gạo lài sữa Đồng Việt túi 5kg', 'images\\product-images\\\ngao-lai-sua-dong-viet-tui-5kg-202212280858102700.jpg\n    ');
INSERT INTO `images` VALUES (47, 5, 'Gạo ST25 Đồng Việt túi 5kg', 'images\\product-images\\\rGạo ST25 Đồng Việt túi 5kg.jpg	');
INSERT INTO `images` VALUES (48, 5, 'Gạo ST25 Đồng Việt túi 5kg', 'images/product-images/gao-st25-thuong-hang-dong-viet-tui-5kg-202212280854102020.jpg');
INSERT INTO `images` VALUES (49, 5, 'Gạo ST25 Đồng Việt túi 5kg', 'images\\product-images\\gao-st25-thuong-hang-dong-viet-tui-5kg-202212280854115526.jpg\r     ');
INSERT INTO `images` VALUES (50, 6, 'Gạo thơm A An ST21 túi 5kg', 'images\\product-images\\\ngao-thom-a-an-st21-tui-5kg-202202111330151511.jpg\n\n	');
INSERT INTO `images` VALUES (51, 6, 'Gạo thơm A An ST21 túi 5kg', 'images\\product-images\\\ngao-thom-a-an-st21-tui-5kg-202006061602585225.jpg\n    ');
INSERT INTO `images` VALUES (52, 6, 'Gạo thơm A An ST21 túi 5kg', 'images\\product-images\\\ngao-thom-a-an-st21-tui-5kg-202006061602592749.jpg\n    ');
INSERT INTO `images` VALUES (53, 7, 'Gạo Lài hương Đồng Việt túi 5kg', 'images\\product-images\\\ngao-lai-huong-dong-viet-tui-5kg-202212280845485143.jpg\n\n	');
INSERT INTO `images` VALUES (54, 7, 'Gạo Lài hương Đồng Việt túi 5kg', 'images\\product-images\\\ngao-lai-huong-dong-viet-tui-5kg-202212280845488858.jpg\n    ');
INSERT INTO `images` VALUES (55, 7, 'Gạo Lài hương Đồng Việt túi 5kg', 'images\\product-images\\\ngao-lai-huong-dong-viet-tui-5kg-202212280845497839.jpg\n    ');
INSERT INTO `images` VALUES (56, 8, 'Gạo lức huyết rồng PMT túi 2kg', 'images\\product-images\\\ngao-luc-huyet-rong-pmt-tui-2kg-202304051610018704.jpg\n\n	');
INSERT INTO `images` VALUES (57, 8, 'Gạo lức huyết rồng PMT túi 2kg', 'images\\product-images\\\n-202210150918350001.jpg\n    ');
INSERT INTO `images` VALUES (58, 8, 'Gạo lức huyết rồng PMT túi 2kg', 'images\\product-images\\\n-202210150918352991.jpg\n    ');
INSERT INTO `images` VALUES (59, 9, 'Gạo thơm Vua Gạo ST25 túi 5kg', 'images\\product-images\\\n-202306191015012272.jpg\n\n	');
INSERT INTO `images` VALUES (60, 9, 'Gạo thơm Vua Gạo ST25 túi 5kg', 'images\\product-images\\\n-202306191015010538.jpg\n    ');
INSERT INTO `images` VALUES (61, 9, 'Gạo thơm Vua Gạo ST25 túi 5kg', 'images\\product-images\\\n-202306191015015993.jpg\n    ');
INSERT INTO `images` VALUES (62, 10, 'Gạo Ngọc Sa Cỏ May túi 5kg', 'images\\product-images\\\ngao-ngoc-sa-co-may-tui-5kg-202203280040413892.jpg\n');
INSERT INTO `images` VALUES (63, 10, 'Gạo Ngọc Sa Cỏ May túi 5kg', 'images\\product-images\\\ngao-ngoc-sa-co-may-tui-5kg-202201050907498256.jpg\n    ');
INSERT INTO `images` VALUES (64, 10, 'Gạo Ngọc Sa Cỏ May túi 5kg', 'images\\product-images\\\ngao-ngoc-sa-co-may-tui-5kg-202201050907505805.jpg\n    ');
INSERT INTO `images` VALUES (65, 11, 'Khoai lang Nhật xuất khẩu 0.9kg - 1.1kg', 'images\\product-images\\\nkhoai-lang-nhat-1kg-4-10-cu-202309211455160438.jpg\n\n	');
INSERT INTO `images` VALUES (66, 11, 'Khoai lang Nhật xuất khẩu 0.9kg - 1.1kg', 'images\\product-images\\\nkhoai-lang-nhat-1kg-4-10-cu-202309211455164365.jpg\n    ');
INSERT INTO `images` VALUES (67, 11, 'Khoai lang Nhật xuất khẩu 0.9kg - 1.1kg', 'images\\product-images\\\nkhoai-lang-nhat-1kg-4-10-cu-202309211455169184.jpg\n    ');
INSERT INTO `images` VALUES (68, 12, 'Chuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'images\\product-images\\\nchuoi-gia-giong-nam-my-09-11kg-6-7-trai-202310020854198371.jpg\n\n	');
INSERT INTO `images` VALUES (69, 12, 'Chuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'images\\product-images\\\nchuoi-gia-giong-nam-my-hop-1kg-6-7-trai-202212021509528386.jpg\n    ');
INSERT INTO `images` VALUES (70, 12, 'Chuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'images\\product-images\\\nchuoi-gia-giong-nam-my-hop-1kg-6-7-trai-202212021509531668.jpg\n    ');
INSERT INTO `images` VALUES (71, 13, 'Nấm kim châm Thái Lan 150g', 'images\\product-images\\\nnam-kim-cham-thai-lan-150g-202308291050424841.jpg\n\n	');
INSERT INTO `images` VALUES (72, 13, 'Nấm kim châm Thái Lan 150g', 'images\\product-images\\\nnam-kim-cham-thai-lan-150g-202308291048258326.jpg\n    ');
INSERT INTO `images` VALUES (73, 13, 'Nấm kim châm Thái Lan 150g', 'images\\product-images\\\nnam-kim-cham-thai-lan-150g-202308291048261576.jpg\n    ');
INSERT INTO `images` VALUES (74, 14, 'Khoai môn 450g - 550g (1 củ)', 'images\\product-images\\\nkhoai-mon-tui-500g-1-cu-202205201542114062.jpg\n	');
INSERT INTO `images` VALUES (75, 14, 'Khoai môn 450g - 550g (1 củ)', 'images\\product-images\\\nkhoai-mon-tui-500g-1-cu-202205201538208669.jpg\n    ');
INSERT INTO `images` VALUES (76, 14, 'Khoai môn 450g - 550g (1 củ)', 'images\\product-images\\\nkhoai-mon-tui-500g-1-cu-202205201538208669.jpg\n    ');
INSERT INTO `images` VALUES (77, 15, '2 trái bắp nếp từ 500g trở lên', 'images\\product-images\\\nbap-nep-cap-202207161545587500.jpg\n	');
INSERT INTO `images` VALUES (78, 15, '2 trái bắp nếp từ 500g trở lên', 'images\\product-images\\\nbap-nep-cap-202207161543292519.jpg\n    ');
INSERT INTO `images` VALUES (79, 15, '2 trái bắp nếp từ 500g trở lên', 'images\\product-images\\\nbap-nep-cap-202207161543300656.jpg\n    ');
INSERT INTO `images` VALUES (80, 16, 'Đậu cove Lâm Đồng 500g', 'images\\product-images\\\ndau-cove-lam-dong-500g-202309211405281824.jpg\n	');
INSERT INTO `images` VALUES (81, 16, 'Đậu cove Lâm Đồng 500g', 'images\\product-images\\\ndau-cove-lam-dong-500g-202309211405291789.jpg\n    ');
INSERT INTO `images` VALUES (82, 16, 'Đậu cove Lâm Đồng 500g', 'images\\product-images\\\ndau-cove-lam-dong-500g-202309211405293783.jpg\n    ');
INSERT INTO `images` VALUES (83, 17, 'Củ sắn 1kg (3 - 5 củ)', 'images\\product-images\\\ncu-san-tui-1kg-3-5-cu-202205201547355369.jpg\n	');
INSERT INTO `images` VALUES (84, 17, 'Củ sắn 1kg (3 - 5 củ)', 'images\\product-images\\\ncu-san-tui-1kg-3-5-cu-202205201546349066.jpg\n    ');
INSERT INTO `images` VALUES (85, 17, 'Củ sắn 1kg (3 - 5 củ)', 'images\\product-images\\\ncu-san-tui-1kg-3-5-cu-202209060829022287.jpg\n    ');
INSERT INTO `images` VALUES (86, 18, 'Khoai tây 0.9-1.1kg (10-14 củ)', 'images\\product-images\\\n-202308301006490878.jpg\n	');
INSERT INTO `images` VALUES (87, 18, 'Khoai tây 0.9-1.1kg (10-14 củ)', 'images\\product-images\\\n-202308301006498819.jpg\n    ');
INSERT INTO `images` VALUES (88, 18, 'Khoai tây 0.9-1.1kg (10-14 củ)', 'images\\product-images\\\n-202308301006501348.jpg\n    ');
INSERT INTO `images` VALUES (89, 19, 'Rau củ nấu súp 400g', 'images\\product-images\\\nsellingpoint.jpg\n	');
INSERT INTO `images` VALUES (90, 19, 'Rau củ nấu súp 400g', 'images\\product-images\\\nrau-cu-nau-sup-400g-202304250826475804.jpg\n    ');
INSERT INTO `images` VALUES (91, 19, 'Rau củ nấu súp 400g', 'images\\product-images\\\nrau-cu-nau-sup-400g-202304250826488772.jpg\n    ');
INSERT INTO `images` VALUES (92, 20, 'Khoai mỡ gọt sẵn 400g', 'images\\product-images\\\nkhoai-mo-got-vo-goi-400g-202205201016363951.jpg\n	');
INSERT INTO `images` VALUES (93, 20, 'Khoai mỡ gọt sẵn 400g', 'images\\product-images\\\nkhoai-mo-got-vo-goi-400g-202205201016366322.jpg\n    ');
INSERT INTO `images` VALUES (94, 20, 'Khoai mỡ gọt sẵn 400g', 'images\\product-images\\\nkhoai-mo-got-vo-goi-400g-202205201016371179.jpg\n    ');
INSERT INTO `images` VALUES (95, 21, 'Rau hỗn hợp 300g', 'images\\product-images\\\nrau-hon-hop-300g-202304250831231269.jpg\n     ');
INSERT INTO `images` VALUES (96, 21, 'Rau hỗn hợp 300g', 'images\\product-images\\\nrau-hon-hop-300g-202304250831234369.jpg\n     ');
INSERT INTO `images` VALUES (97, 21, 'Rau hỗn hợp 300g', 'images\\product-images\\\nrau-hon-hop-300g-202304250831237664.jpg\n     ');
INSERT INTO `images` VALUES (98, 22, 'Tỏi cô đơn 300g', 'images\\product-images\\\ntoi-co-don-tui-300g-202205190845052515.jpg\n     ');
INSERT INTO `images` VALUES (99, 22, 'Tỏi cô đơn 300g', 'images\\product-images\\\ntoi-co-don-tui-300g-202205190845029022.jpg\n     ');
INSERT INTO `images` VALUES (100, 22, 'Tỏi cô đơn 300g', 'images\\product-images\\\ntoi-co-don-tui-300g-202205190845059407.jpg\n     ');
INSERT INTO `images` VALUES (101, 23, 'Bắp Mỹ tách hạt 250g', 'images\\product-images\\\nbap-my-tach-hat-khay-250g-202212231636529700.jpg\n     ');
INSERT INTO `images` VALUES (102, 23, 'Bắp Mỹ tách hạt 250g', 'images\\product-images\\\nbap-my-tach-hat-khay-250g-202212231636533156.jpg\n     ');
INSERT INTO `images` VALUES (103, 23, 'Bắp Mỹ tách hạt 250g', 'images\\product-images\\\nbap-my-tach-hat-khay-250g-202212231636536124.jpg\n     ');
INSERT INTO `images` VALUES (104, 24, 'Yến mạch nguyên chất Oatmeal Cereal gói 350g', 'images\\product-images\\\nyen-mach-nguyen-chat-oatmeal-cereal-bich-350g-202006050941405195.jpg\n     ');
INSERT INTO `images` VALUES (105, 24, 'Yến mạch nguyên chất Oatmeal Cereal gói 350g', 'images\\product-images\\\nyen-mach-nguyen-chat-oatmeal-cereal-bich-350g-202006050941411048.jpg\n     ');
INSERT INTO `images` VALUES (106, 24, 'Yến mạch nguyên chất Oatmeal Cereal gói 350g', 'images\\product-images\\\nyen-mach-nguyen-chat-oatmeal-cereal-bich-350g-202006050941424467.jpg\n     ');
INSERT INTO `images` VALUES (107, 25, 'Ngũ cốc trái cây Calbee gói 700g', 'images\\product-images\\\nngu-coc-trai-cay-calbee-goi-700g-202201061030384963.jpg\n     ');
INSERT INTO `images` VALUES (108, 25, 'Ngũ cốc trái cây Calbee gói 700g', 'images\\product-images\\\nngu-coc-trai-cay-calbee-goi-700g-202201061030387477.jpg\n     ');
INSERT INTO `images` VALUES (109, 25, 'Ngũ cốc trái cây Calbee gói 700g', 'images\\product-images\\\nngu-coc-trai-cay-calbee-goi-700g-202201061030391409.jpg\n     ');
INSERT INTO `images` VALUES (110, 26, 'Yến mạch trái cây Sunrise vị phô mai bịch 300g', 'images\\product-images\\\nyen-mach-trai-cay-sunrise-vi-pho-mai-bich-300g-202110280827525587.jpg\n     ');
INSERT INTO `images` VALUES (111, 26, 'Yến mạch trái cây Sunrise vị phô mai bịch 300g', 'images\\product-images\\\nyen-mach-trai-cay-sunrise-vi-pho-mai-bich-300g-202110280827530119.jpg\n     ');
INSERT INTO `images` VALUES (112, 26, 'Yến mạch trái cây Sunrise vị phô mai bịch 300g', 'images\\product-images\\\nyen-mach-trai-cay-sunrise-vi-pho-mai-bich-300g-202110280827534399.jpg\n     ');
INSERT INTO `images` VALUES (113, 27, 'Ngũ cốc ăn sáng Nestlé Milo gói 50g', 'images\\product-images\\\nngu-coc-an-sang-nestle-milo-goi-50g-202307251047476158.jpg\n     ');
INSERT INTO `images` VALUES (114, 27, 'Ngũ cốc ăn sáng Nestlé Milo gói 50g', 'images\\product-images\\\nngu-coc-an-sang-nestle-milo-goi-50g-202307251047476158.jpg\n     ');
INSERT INTO `images` VALUES (115, 27, 'Ngũ cốc ăn sáng Nestlé Milo gói 50g', 'images\\product-images\\\nngu-coc-an-sang-nestle-milo-goi-50g-202307251047485413.jpg\n     ');
INSERT INTO `images` VALUES (116, 28, 'Ngũ cốc Nestlé Grannola Fitnesse nam việt quất và hạt bí ngô 300g', 'images\\product-images\\\nngu-coc-nestle-grannola-fitnesse-nam-viet-quat-va-hat-bi-ngo-300g-202311241500022933.jpg\n     ');
INSERT INTO `images` VALUES (117, 28, 'Ngũ cốc Nestlé Grannola Fitnesse nam việt quất và hạt bí ngô 300g', 'images\\product-images\\\nngu-coc-nestle-grannola-fitnesse-nam-viet-quat-va-hat-bi-ngo-300g-202311241500026322.jpg\n     ');
INSERT INTO `images` VALUES (118, 28, 'Ngũ cốc Nestlé Grannola Fitnesse nam việt quất và hạt bí ngô 300g', 'images\\product-images\\ngu-coc-nestle-grannola-fitnesse-nam-viet-quat-va-hat-bi-ngo-300g-202311241500018548.jpg\n     ');
INSERT INTO `images` VALUES (119, 29, 'Hạt chia Sunrise gói 300g', 'images\\product-images\\hat-chia-sunrise-goi-300g-202102051608220656.jpg');
INSERT INTO `images` VALUES (120, 29, 'Hạt chia Sunrise gói 300g', 'images\\product-images\\\nhat-chia-sunrise-goi-300g-202102051608229411.jpg\n     ');
INSERT INTO `images` VALUES (121, 29, 'Hạt chia Sunrise gói 300g', 'images\\product-images\\\nhat-chia-sunrise-goi-300g-202102051608236365.jpg\n     ');
INSERT INTO `images` VALUES (122, 30, 'Yến mạch nguyên chất Oatta hũ 400g', 'images\\product-images\\\nyen-mach-nguyen-chat-oatta-hu-400g-202205230910269570.jpg');
INSERT INTO `images` VALUES (123, 30, 'Yến mạch nguyên chất Oatta hũ 400g', 'images\\product-images\\yen-mach-nguyen-chat-oatta-hu-400g-202205230910289205.jpg');
INSERT INTO `images` VALUES (124, 30, 'Yến mạch nguyên chất Oatta hũ 400g', 'images\\product-images\\\n\n\nyen-mach-nguyen-chat-oatta-hu-400g-202205230910281663.jpg\n     ');
INSERT INTO `images` VALUES (125, 31, 'Thực phẩm bổ sung yến mạch hạt chia Best Choice gói 240g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-hat-chia-best-choice-goi-240g-202103101701414125.jpg\n     ');
INSERT INTO `images` VALUES (126, 31, 'Thực phẩm bổ sung yến mạch hạt chia Best Choice gói 240g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-hat-chia-best-choice-goi-240g-202103101701416776.jpg\n     ');
INSERT INTO `images` VALUES (127, 31, 'Thực phẩm bổ sung yến mạch hạt chia Best Choice gói 240g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-hat-chia-best-choice-goi-240g-202103101701419488.jpg\n     ');
INSERT INTO `images` VALUES (128, 32, 'Hạt điều tỏi ớt Vinahe gói 70g', 'images\\product-images\\\nhat-dieu-toi-ot-vinahe-goi-70g-202105221054043641.jpg\n     ');
INSERT INTO `images` VALUES (129, 32, 'Hạt điều tỏi ớt Vinahe gói 70g', 'images\\product-images\\\nhat-dieu-toi-ot-vinahe-goi-70g-202105221054036436.jpg');
INSERT INTO `images` VALUES (130, 32, 'Hạt điều tỏi ớt Vinahe gói 70g', 'images\\product-images\\\nhat-dieu-toi-ot-vinahe-goi-70g-202105221054052937.jpg\n     ');
INSERT INTO `images` VALUES (131, 33, 'Đậu phộng vị tỏi ớt Phi Yến hũ 180g', 'images\\product-images\\\ndau-phong-vi-toi-ot-phi-yen-hu-180g-202309070836589745.jpg\n     ');
INSERT INTO `images` VALUES (132, 33, 'Hạt điều tỏi ớt Vinahe gói 70g', 'images\\product-images\\\ndau-phong-vi-toi-ot-phi-yen-hu-180g-202309070836592640.jpg\n     ');
INSERT INTO `images` VALUES (133, 33, 'Hạt điều tỏi ớt Vinahe gói 70g', 'images\\product-images\\\ndau-phong-vi-toi-ot-phi-yen-hu-180g-202309070836598980.jpg\n     ');
INSERT INTO `images` VALUES (134, 34, 'Hạt Macca Úc nứt vỏ Your Superfood hũ 360g', 'images\\product-images\\\nhat-macca-uc-nut-vo-your-superfood-hu-360g-202201120833548886.jpg\n     ');
INSERT INTO `images` VALUES (135, 34, 'Hạt Macca Úc nứt vỏ Your Superfood hũ 360g', 'images\\product-images\\\nhat-macca-uc-nut-vo-your-superfood-hu-360g-202201120833559794.jpg\n     ');
INSERT INTO `images` VALUES (136, 34, 'Hạt Macca Úc nứt vỏ Your Superfood hũ 360g', 'images\\product-images\\\nhat-macca-uc-nut-vo-your-superfood-hu-360g-202201120833574729.jpg\n     ');
INSERT INTO `images` VALUES (137, 35, 'Hỗn hợp hạt vị socola Nutty Trailmix hũ 220g', 'images\\product-images\\\nhon-hop-hat-vi-socola-nutty-trailmix-hu-220g-202012181051281744.jpg\n     ');
INSERT INTO `images` VALUES (138, 35, 'Hỗn hợp hạt vị socola Nutty Trailmix hũ 220g', 'images\\product-images\\\nhon-hop-hat-vi-socola-nutty-trailmix-hu-220g-202012181051290769.jpg\n     ');
INSERT INTO `images` VALUES (139, 35, 'Hỗn hợp hạt vị socola Nutty Trailmix hũ 220g', 'images\\product-images\\\nhon-hop-hat-vi-socola-nutty-trailmix-hu-220g-202012181051297223.jpg\n     ');
INSERT INTO `images` VALUES (140, 36, 'Hạt hướng dương nguyên vị Chacheer gói 130g', 'images\\product-images\\\nhat-huong-duong-nguyen-vi-chacheer-goi-130g-202307052328276777.jpg\n     ');
INSERT INTO `images` VALUES (141, 36, 'Hạt hướng dương nguyên vị Chacheer gói 130g', 'images\\product-images\\\nhat-huong-duong-nguyen-vi-chacheer-goi-130g-202307052328282284.jpg\n     ');
INSERT INTO `images` VALUES (142, 36, 'Hạt hướng dương nguyên vị Chacheer gói 130g', 'images\\product-images\\\nhat-huong-duong-nguyen-vi-chacheer-goi-130g-202307052328289395.jpg\n     ');
INSERT INTO `images` VALUES (143, 37, 'Hạt hướng dương vị dừa Chacheer gói 130g', 'images\\product-images\\\nhat-huong-duong-vi-dua-chacheer-goi-130g-202102051533468985.jpg\n     ');
INSERT INTO `images` VALUES (144, 37, 'Hạt hướng dương vị dừa Chacheer gói 130g', 'images\\product-images\\\nhat-huong-duong-vi-dua-chacheer-goi-130g-202102051533473548.jpg\n     ');
INSERT INTO `images` VALUES (145, 37, 'Hạt hướng dương vị dừa Chacheer gói 130g', 'images\\product-images\\\nhat-huong-duong-vi-dua-chacheer-goi-130g-202102051533483974.jpg\n     ');
INSERT INTO `images` VALUES (146, 38, 'Tiêu đen hạt gói 50g', 'images\\product-images\\\ntieu-den-hat-goi-50g-202202121137521984.jpg\n     ');
INSERT INTO `images` VALUES (147, 38, 'Tiêu đen hạt gói 50g', 'images\\product-images\\\ntieu-den-hat-goi-50g-202009242351558387.jpg\n     ');
INSERT INTO `images` VALUES (148, 38, 'Tiêu đen hạt gói 50g', 'images\\product-images\\\ntieu-den-hat-goi-50g-202009242351561279.jpg\n     ');
INSERT INTO `images` VALUES (149, 39, 'Bột đậu nành hạt sen mật ong Vitapro bịch 420g', 'images\\product-images\\\nbot-dau-nanh-hat-sen-mat-ong-vitapro-bich-420g-202203171358097166.jpg\n     ');
INSERT INTO `images` VALUES (150, 39, 'Bột đậu nành hạt sen mật ong Vitapro bịch 420g', 'images\\product-images\\\nbot-dau-nanh-hat-sen-mat-ong-vitapro-bich-420g-202111021835221470.jpg\n     ');
INSERT INTO `images` VALUES (151, 39, 'Bột đậu nành hạt sen mật ong Vitapro bịch 420g', 'images\\product-images\\\nbot-dau-nanh-hat-sen-mat-ong-vitapro-bich-420g-202111021835226540.jpg\n     ');
INSERT INTO `images` VALUES (152, 40, 'Bột ngũ cốc Vitapro bịch 400g', 'images\\product-images\\\nbot-ngu-coc-vitapro-bich-400g-202203171452481831.jpg\n     ');
INSERT INTO `images` VALUES (153, 40, 'Bột ngũ cốc Vitapro bịch 400g', 'images\\product-images\\\nbot-ngu-coc-vitapro-bich-400g-202111021836115022.jpg\n     ');
INSERT INTO `images` VALUES (154, 40, 'Bột ngũ cốc Vitapro bịch 400g', 'images\\product-images\\\nbot-ngu-coc-vitapro-bich-400g-202111021836119929.jpg\n     ');
INSERT INTO `images` VALUES (155, 41, 'Bột đậu xanh hạt sen mật ong Vitapro bịch 420g', 'images\\product-images\\\nbot-dau-xanh-hat-sen-mat-ong-vitapro-bich-420g-202203171357015061.jpg\n     ');
INSERT INTO `images` VALUES (156, 41, 'Bột đậu xanh hạt sen mật ong Vitapro bịch 420g', 'images\\product-images\\\nbot-dau-xanh-hat-sen-mat-ong-vitapro-bich-420g-202111021833547519.jpg\n     ');
INSERT INTO `images` VALUES (157, 41, 'Bột đậu xanh hạt sen mật ong Vitapro bịch 420g', 'images\\product-images\\\nbot-dau-xanh-hat-sen-mat-ong-vitapro-bich-420g-202111021833555110.jpg\n     ');
INSERT INTO `images` VALUES (158, 42, 'Gạo lứt tím than Lotus Rice NutriChoice hộp 0,5kg', 'images\\product-images\\\nsellingpoint (1).jpg\n     ');
INSERT INTO `images` VALUES (159, 42, 'Gạo lứt tím than Lotus Rice NutriChoice hộp 0,5kg', 'images\\product-images\\\ngao-lut-tim-than-lotus-rice-nutrichoice-hop-0-5kg-201906210859260130.jpg\n     ');
INSERT INTO `images` VALUES (160, 42, 'Gạo lứt tím than Lotus Rice NutriChoice hộp 0,5kg', 'images\\product-images\\\ngao-lut-tim-than-lotus-rice-nutrichoice-hop-0-5kg-201906210859258859.jpg\n     ');
INSERT INTO `images` VALUES (161, 43, 'Gạo lứt huyết rồng Lotus Rice NutriChoice hộp 0,5kg', 'images\\product-images\\\nsellingpoint (2).jpg\n     ');
INSERT INTO `images` VALUES (162, 43, 'Gạo lứt huyết rồng Lotus Rice NutriChoice hộp 0,5kg', 'images\\product-images\\\ngao-lut-huyet-rong-lotus-rice-nutrichoice-hop-0-5kg-201906210948302476.jpg\n     ');
INSERT INTO `images` VALUES (163, 43, 'Gạo lứt huyết rồng Lotus Rice NutriChoice hộp 0,5kg', 'images\\product-images\\\ngao-lut-huyet-rong-lotus-rice-nutrichoice-hop-0-5kg-201906210948303667.jpg\n     ');
INSERT INTO `images` VALUES (164, 44, 'Gạo Cỏ May lứt nâu organic hộp 1kg', 'images\\product-images\\\nsellingpoint (3).jpg\n');
INSERT INTO `images` VALUES (165, 44, 'Gạo Cỏ May lứt nâu organic hộp 1kg', 'images\\product-images\\\ngao-co-may-lut-nau-organic-hop-1kg-202106260813005532.jpg\n');
INSERT INTO `images` VALUES (166, 44, 'Gạo Cỏ May lứt nâu organic hộp 1kg', 'images\\product-images\\\ngao-co-may-lut-nau-organic-hop-1kg-202106260813008344.jpg\n');
INSERT INTO `images` VALUES (167, 45, 'Nếp Bắc Việt San túi 1kg', 'images\\product-images\\\nsellingpoint (4).jpg\n');
INSERT INTO `images` VALUES (168, 45, 'Nếp Bắc Việt San túi 1kg', 'images\\product-images\\\nnep-bac-viet-san-tui-1kg-201912101503269442.jpg\n');
INSERT INTO `images` VALUES (169, 45, 'Nếp Bắc Việt San túi 1kg', 'images\\product-images\\\nnep-bac-viet-san-tui-1kg-201912101503271613.jpg\n');
INSERT INTO `images` VALUES (170, 46, 'Nếp than PMT túi 1kg', 'images\\product-images\\\nsellingpoint (5).jpg\n');
INSERT INTO `images` VALUES (171, 46, 'Nếp than PMT túi 1kg', 'images\\product-images\\\nnep-than-pmt-tui-1kg-201912101601141869.jpg\n');
INSERT INTO `images` VALUES (172, 47, 'Nếp cái hoa vàng Vinh Hiển túi 1kg', 'images\\product-images\\\nsellingpoint (6).jpg\n');
INSERT INTO `images` VALUES (173, 47, 'Nếp cái hoa vàng Vinh Hiển túi 1kg', 'images\\product-images\\\nnep-cai-hoa-vang-vinh-hien-tui-1kg-202008150913278996.jpg\n');
INSERT INTO `images` VALUES (174, 47, 'Nếp cái hoa vàng Vinh Hiển túi 1kg', 'images\\product-images\\\nnep-cai-hoa-vang-vinh-hien-tui-1kg-202008150913284749.jpg\n');
INSERT INTO `images` VALUES (175, 48, 'Nếp sáp Vinh Hiển túi 1kg', 'images\\product-images\\\nsellingpoint (7).jpg\n');
INSERT INTO `images` VALUES (176, 48, 'Nếp sáp Vinh Hiển túi 1kg', 'images\\product-images\\\nnep-sap-vinh-hien-tui-1kg-202006251846045041.jpg\n');
INSERT INTO `images` VALUES (177, 48, 'Nếp sáp Vinh Hiển túi 1kg', 'images\\product-images\\\nnep-sap-vinh-hien-tui-1kg-202006251846050324.jpg\n');
INSERT INTO `images` VALUES (178, 49, 'Gạo lứt đỏ Vinh Hiển túi 1kg', 'images\\product-images\\\nsellingpoint (8).jpg\n');
INSERT INTO `images` VALUES (179, 49, 'Gạo lứt đỏ Vinh Hiển túi 1kg', 'images\\product-images\\\ngao-lut-do-vinh-hien-tui-1kg-202010171225000994.jpg\n');
INSERT INTO `images` VALUES (180, 49, 'Gạo lứt đỏ Vinh Hiển túi 1kg', 'images\\product-images\\\ngao-lut-do-vinh-hien-tui-1kg-202010171225008919.jpg\n');
INSERT INTO `images` VALUES (181, 50, 'Xúc xích dinh dưỡng thịt heo Ponnie gói 175g', 'images\\product-images\\\nxuc-xich-dinh-duong-thit-heo-ponnie-goi-210g-202306220931518868.png\n');
INSERT INTO `images` VALUES (182, 50, 'Xúc xích dinh dưỡng thịt heo Ponnie gói 175g', 'images\\product-images\\\n-202207290833036388.jpg\n');
INSERT INTO `images` VALUES (183, 50, 'Xúc xích dinh dưỡng thịt heo Ponnie gói 175g', 'images\\product-images\\\n-202207290833053929.jpg\n');
INSERT INTO `images` VALUES (184, 51, 'Lạp xưởng heo Vissan gói 200g', 'images\\product-images\\\nlap-xuong-heo-vissan-goi-200g-202011170920360157.jpg\n');
INSERT INTO `images` VALUES (185, 51, 'Lạp xưởng heo Vissan gói 200g', 'images\\product-images\\lap-xuong-heo-vissan-goi-200g-202011170920354523.jpg\n');
INSERT INTO `images` VALUES (186, 51, 'Lạp xưởng heo Vissan gói 200g', 'images\\product-images\\\nlap-xuong-heo-vissan-goi-200g-202011170920409878.jpg\n');
INSERT INTO `images` VALUES (187, 52, 'Lạp xưởng heo Vissan gói 200g', 'images\\product-images\\\nlap-xuong-mai-que-lo-cp-500g-202308071038584106.png\n');
INSERT INTO `images` VALUES (188, 52, 'Lạp xưởng heo Vissan gói 200g', 'images\\product-images\\\nlap-xuong-mai-que-lo-cp-500g-202004251859076563.jpg\n');
INSERT INTO `images` VALUES (189, 53, 'Thực phẩm bổ sung yến mạch gạo lứt Yumfood gói 210g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-gao-lut-yumfood-goi-210g-202202101042404172.jpg\n');
INSERT INTO `images` VALUES (190, 53, 'Thực phẩm bổ sung yến mạch gạo lứt Yumfood gói 210g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-yumfood-gao-lut-goi-210g-30g-x-7-goi-202010122216193121.jpg\n');
INSERT INTO `images` VALUES (191, 53, 'Thực phẩm bổ sung yến mạch gạo lứt Yumfood gói 210g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-yumfood-gao-lut-goi-210g-30g-x-7-goi-202010122216202217.jpg\n');
INSERT INTO `images` VALUES (192, 54, 'Thực phẩm bổ sung yến mạch nếp cẩm Yumfood gói 210g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-nep-cam-yumfood-goi-210g-202203171448251080.jpg\n');
INSERT INTO `images` VALUES (193, 54, 'Thực phẩm bổ sung yến mạch nếp cẩm Yumfood gói 210g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-yumfood-nep-cam-goi-210g-30g-x-7-goi-202010122213546618.jpg\n');
INSERT INTO `images` VALUES (194, 54, 'Thực phẩm bổ sung yến mạch nếp cẩm Yumfood gói 210g', 'images\\product-images\\\nthuc-pham-bo-sung-yen-mach-yumfood-nep-cam-goi-210g-30g-x-7-goi-202010122213555133.jpg\n');
INSERT INTO `images` VALUES (195, 55, 'Đậu đỏ gói 150g', 'images\\product-images\\\nsellingpoint (9).jpg\n');
INSERT INTO `images` VALUES (196, 55, 'Đậu đỏ gói 150g', 'images\\product-images\\\ndau-do-hat-cao-cap-vietfresh-150g-202012092312229277.jpg\n');
INSERT INTO `images` VALUES (197, 55, 'Đậu đỏ gói 150g', 'images\\product-images\\\ndau-do-goi-150g-giao-ngau-nhien-thuong-hieu-202201111321576331.jpg\n');
INSERT INTO `images` VALUES (201, 56, 'Đậu trắng bi 150g', 'images\\product-images\\\nsellingpoint (10).jpg\n');
INSERT INTO `images` VALUES (202, 56, 'Đậu trắng bi 150g', 'images\\product-images\\\ndau-trang-bi-vietfresh-150g-202104230116058463.jpg\n');
INSERT INTO `images` VALUES (203, 56, 'Đậu trắng bi 150g', 'images\\product-images\\\ndau-trang-bi-vietfresh-150g-202104230116065698.jpg\n');
INSERT INTO `images` VALUES (204, 57, 'Hạt sen khô gói 100g', 'images\\product-images\\\nsellingpoint (11).jpg\n');
INSERT INTO `images` VALUES (205, 57, 'Hạt sen khô gói 100g', 'images\\product-images\\\nhat-sen-kho-duc-dung-goi-100g-202110290743599738.jpg\n');
INSERT INTO `images` VALUES (206, 57, 'Hạt sen khô gói 100g', 'images\\product-images\\\nhat-sen-kho-duc-dung-goi-100g-202110290744007048.jpg\n');
INSERT INTO `images` VALUES (207, 58, 'Gạo thơm Vua Gạo Phù Sa túi 5kg', 'images\\product-images\\\nsellingpoint (12).jpg\n');
INSERT INTO `images` VALUES (208, 58, 'Gạo thơm Vua Gạo Phù Sa túi 5kg', 'images\\product-images\\\ngao-thom-vua-gao-phu-sa-tui-5kg-202009111128384100.jpg\n');
INSERT INTO `images` VALUES (209, 58, 'Gạo thơm Vua Gạo Phù Sa túi 5kg', 'images\\product-images\\\ngao-thom-vua-gao-phu-sa-tui-5kg-202009111128388213.jpg\n');
INSERT INTO `images` VALUES (210, 59, 'Gạo thơm Vua Gạo Đậm Đà ST24 túi 5kg', 'images\\product-images\\\nsellingpoint (13).jpg\n');
INSERT INTO `images` VALUES (211, 59, 'Gạo thơm Vua Gạo Đậm Đà ST24 túi 5kg', 'images\\product-images\\\ngao-thom-vua-gao-dam-da-tui-5kg-202106041130480432.jpg\n');
INSERT INTO `images` VALUES (212, 59, 'Gạo thơm Vua Gạo Đậm Đà ST24 túi 5kg', 'images\\product-images\\\ngao-thom-vua-gao-dam-da-tui-5kg-202106041130598572.jpg\n');
INSERT INTO `images` VALUES (213, 60, 'Gạo Nhật Shinichi Vua Gạo túi 5kg', 'images\\product-images\\\nsellingpoint (14).jpg\n');
INSERT INTO `images` VALUES (214, 60, 'Gạo Nhật Shinichi Vua Gạo túi 5kg', 'images\\product-images\\\ngao-nhat-shinichi-vua-gao-tui-5kg-202103131637378266.jpg\n');
INSERT INTO `images` VALUES (215, 60, 'Gạo Nhật Shinichi Vua Gạo túi 5kg', 'images\\product-images\\\ngao-nhat-shinichi-vua-gao-tui-5kg-202103131637380957.jpg\n');
INSERT INTO `images` VALUES (216, 61, 'Gạo Lạc Việt đệ nhất ST25 túi 5kg', 'images\\product-images\\\nsellingpoint (15).jpg\n');
INSERT INTO `images` VALUES (217, 61, 'Gạo Lạc Việt đệ nhất ST25 túi 5kg', 'images\\product-images\\\ngao-lac-viet-de-nhat-st25-tui-5kg-202205211708088085.jpg\n');
INSERT INTO `images` VALUES (218, 61, 'Gạo Lạc Việt đệ nhất ST25 túi 5kg', 'images\\product-images\\\ngao-lac-viet-de-nhat-st25-tui-5kg-202205211708093420.jpg\n');
INSERT INTO `images` VALUES (219, 62, 'Bắp nữ hoàng trái 250g trở lên', 'images\\product-images\\\nbap-nu-hoang-trai-tu-250g-tro-len-202304081423458716.jpg\n');
INSERT INTO `images` VALUES (220, 62, 'Bắp nữ hoàng trái 250g trở lên', 'images\\product-images\\\nbap-nu-hoang-trai-tu-250g-tro-len-202304081423460761.jpg\n');
INSERT INTO `images` VALUES (221, 62, 'Bắp nữ hoàng trái 250g trở lên', 'images\\product-images\\\nbap-nu-hoang-trai-tu-250g-tro-len-202304081423462837.jpg\n');
INSERT INTO `images` VALUES (222, 63, 'Khoai lang mật 1kg (2 - 5 củ)', 'images\\product-images\\\nkhoai-lang-mat-1kg-2-5-cu-202309211414102930.jpg\n');
INSERT INTO `images` VALUES (223, 63, 'Khoai lang mật 1kg (2 - 5 củ)', 'images\\product-images\\\nkhoai-lang-mat-1kg-2-5-cu-202309211414110826.jpg\n');
INSERT INTO `images` VALUES (224, 63, 'Khoai lang mật 1kg (2 - 5 củ)', 'images\\product-images\\\nkhoai-lang-mat-1kg-2-5-cu-202309211414106983.jpg\n');
INSERT INTO `images` VALUES (225, 64, 'Khoai lang tím 1kg', 'images\\product-images\\\nkhoai-lang-tim-1kg-202309281439515699.jpg\n');
INSERT INTO `images` VALUES (226, 64, 'Khoai lang tím 1kg', 'images\\product-images\\\nkhoai-lang-tim-1kg-202309281439519291.jpg\n');
INSERT INTO `images` VALUES (227, 64, 'Khoai lang tím 1kg', 'images\\product-images\\\nkhoai-lang-tim-1kg-202309281439522261.jpg\n');
INSERT INTO `images` VALUES (228, 65, 'Khoai sọ gọt vỏ 400g', 'images\\product-images\\\nkhoai-so-got-vo-400g-202308181006476134.jpg\n');
INSERT INTO `images` VALUES (229, 65, 'Khoai sọ gọt vỏ 400g', 'images\\product-images\\\nkhoai-so-got-vo-400g-202308181006479282.jpg\n');
INSERT INTO `images` VALUES (230, 65, 'Khoai sọ gọt vỏ 400g', 'images\\product-images\\\nkhoai-so-got-vo-400g-202308181006481959.jpg\n');
INSERT INTO `images` VALUES (231, 66, 'Hạt sen khô Việt San gói 150g', 'images\\product-images\\\nsellingpoint (16).jpg\n');
INSERT INTO `images` VALUES (232, 66, 'Hạt sen khô Việt San gói 150g', 'images\\product-images\\\nhat-sen-viet-san-150g-201812041624436281.jpg\n');
INSERT INTO `images` VALUES (233, 66, 'Hạt sen khô Việt San gói 150g', 'images\\product-images\\\nhat-sen-viet-san-150g-201812041624429406.jpg\n');
INSERT INTO `images` VALUES (234, 67, 'Hạt điều vỏ lụa Yến Nhung hộp 180g', 'images\\product-images\\\nhat-dieu-vo-lua-yen-nhung-hop-180g-202211260948319291.jpg\n');
INSERT INTO `images` VALUES (235, 67, 'Hạt điều vỏ lụa Yến Nhung hộp 180g', 'images\\product-images\\\nhat-dieu-vo-lua-yen-nhung-hop-180g-202211260948323168.jpg\n');
INSERT INTO `images` VALUES (236, 67, 'Hạt điều vỏ lụa Yến Nhung hộp 180g', 'images\\product-images\\\nhat-dieu-vo-lua-yen-nhung-hop-180g-202211260948339017.jpg\n');
INSERT INTO `images` VALUES (237, 68, 'Hạt hạnh nhân Mỹ Your Superfood hũ 450g', 'images\\product-images\\\nhat-hanh-nhan-my-your-superfood-hu-450g-202201120844070766.jpg\n');
INSERT INTO `images` VALUES (238, 68, 'Hạt hạnh nhân Mỹ Your Superfood hũ 450g', 'images\\product-images\\\nhat-hanh-nhan-my-your-superfood-hu-450g-202201120844084622.jpg\n');
INSERT INTO `images` VALUES (239, 68, 'Hạt hạnh nhân Mỹ Your Superfood hũ 450g', 'images\\product-images\\\nhat-hanh-nhan-my-your-superfood-hu-450g-202201120844090085.jpg\n');
INSERT INTO `images` VALUES (240, 69, 'Hạt điều rang củi Your Superfood hộp tròn 240g', 'images\\product-images\\\nhat-dieu-rang-cui-vo-lua-your-superfood-hop-tron-240g-202311010939502942.jpg\n');
INSERT INTO `images` VALUES (241, 69, 'Hạt điều rang củi Your Superfood hộp tròn 240g', 'images\\product-images\\\nhat-dieu-rang-cui-vo-lua-your-superfood-hop-tron-240g-202311010939505641.jpg\n');
INSERT INTO `images` VALUES (242, 69, 'Hạt điều rang củi Your Superfood hộp tròn 240g', 'images\\product-images\\\nhat-dieu-rang-cui-vo-lua-your-superfood-hop-tron-240g-202311010939511104.jpg\n');
INSERT INTO `images` VALUES (243, 70, 'Đậu nành gói 500g', 'images\\product-images\\\ndau-nanh-naita-500g-202204161723251336.jpg\n');
INSERT INTO `images` VALUES (244, 70, 'Đậu nành gói 500g', 'images\\product-images\\\ndau-nanh-goi-500g-202210031640478227.jpg\n');
INSERT INTO `images` VALUES (245, 71, 'Đậu phộng Việt San 150g', 'images\\product-images\\\ndau-phong-viet-san-150g-201812041440224688.jpg\n');
INSERT INTO `images` VALUES (246, 71, 'Đậu phộng Việt San 150g', 'images\\product-images\\\ndau-phong-viet-san-150g-201812041440159439.jpg\n');
INSERT INTO `images` VALUES (247, 71, 'Đậu phộng Việt San 150g', 'images\\product-images\\\ndau-phong-viet-san-150g-201812041440239877.jpg\n');
INSERT INTO `images` VALUES (248, 72, 'Đậu xanh không vỏ Việt San 500g', 'images\\product-images\\\ndau-xanh-khong-vo-viet-san-500g-201812041348074407.jpg\n');
INSERT INTO `images` VALUES (249, 72, 'Đậu xanh không vỏ Việt San 500g', 'images\\product-images\\\ndau-xanh-khong-vo-viet-san-500g-201812041347423340.jpg\n');
INSERT INTO `images` VALUES (250, 72, 'Đậu xanh không vỏ Việt San 500g', 'images\\product-images\\\ndau-xanh-khong-vo-viet-san-500g-201812041347579712.jpg\n');
INSERT INTO `images` VALUES (251, 73, 'Đậu đen Việt San 300g', 'images\\product-images\\\ndau-den-viet-san-300g-201812041650354498.jpg\n');
INSERT INTO `images` VALUES (252, 73, 'Đậu đen Việt San 300g', 'images\\product-images\\\ndau-den-viet-san-300g-201812041650357890.jpg\n');
INSERT INTO `images` VALUES (253, 73, 'Đậu đen Việt San 300g', 'images\\product-images\\\ndau-den-viet-san-300g-201812041650361262.jpg\n');
INSERT INTO `images` VALUES (254, 74, 'Ngũ cốc dinh dưỡng MacCereal bịch 560g', 'images\\product-images\\\n-202307271631519469.jpg\n');
INSERT INTO `images` VALUES (255, 74, 'Ngũ cốc dinh dưỡng MacCereal bịch 560g', 'images\\product-images\\\n-202307271125267187.jpg\n');
INSERT INTO `images` VALUES (256, 74, 'Ngũ cốc dinh dưỡng MacCereal bịch 560g', 'images\\product-images\\\n-202307271125273343.jpg\n');
INSERT INTO `images` VALUES (257, 75, 'Ngũ cốc dinh dưỡng MacCereal bịch 560g', 'images\\product-images\\\nngu-coc-dinh-duong-nutifood-500gam-5-org.jpg\n');
INSERT INTO `images` VALUES (258, 75, 'Ngũ cốc dinh dưỡng MacCereal bịch 560g', 'images\\product-images\\\nngu-coc-dinh-duong-nutifood-500gam-4-org.jpg\n');
INSERT INTO `images` VALUES (259, 76, 'Bột ngũ cốc ăn kiêng Euro Cereal gói 500g', 'images\\product-images\\\nbot-ngu-coc-an-kieng-euro-cereal-goi-500g-25g-x-20-goi-202111192315500710.jpg\n');
INSERT INTO `images` VALUES (260, 76, 'Bột ngũ cốc ăn kiêng Euro Cereal gói 500g', 'images\\product-images\\\nbot-ngu-coc-an-kieng-euro-cereal-goi-500g-25g-x-20-goi-202111192315507241.jpg\n');
INSERT INTO `images` VALUES (261, 76, 'Bột ngũ cốc ăn kiêng Euro Cereal gói 500g', 'images\\product-images\\\nbot-ngu-coc-an-kieng-euro-cereal-goi-500g-25g-x-20-goi-202111192315509867.jpg\n');
INSERT INTO `images` VALUES (262, 77, 'Sữa dinh dưỡng ngũ cốc Dutch Lady túi 300g', 'images\\product-images\\\nsua-dinh-duong-ngu-coc-dutch-lady-tui-300g-12-goi-x-25g-202204231154442867.jpg\n');
INSERT INTO `images` VALUES (263, 77, 'Sữa dinh dưỡng ngũ cốc Dutch Lady túi 300g', 'images\\product-images\\\nsua-dinh-duong-ngu-coc-dutch-lady-tui-300g-12-goi-x-25g-202204231154445523.jpg\n');
INSERT INTO `images` VALUES (264, 77, 'Sữa dinh dưỡng ngũ cốc Dutch Lady túi 300g', 'images\\product-images\\\nsua-dinh-duong-ngu-coc-dutch-lady-tui-300g-12-goi-x-25g-202204231154447867.jpg\n');
INSERT INTO `images` VALUES (265, 78, 'Bánh canh ống Mikiri gói 300g', 'images\\product-images\\\nbanh-canh-ong-mikiri-goi-300g-202308210940077439.jpg\n');
INSERT INTO `images` VALUES (266, 78, 'Bánh canh ống Mikiri gói 300g', 'images\\product-images\\\nbanh-canh-ong-mikiri-goi-300g-202308210940080458.jpg\n');
INSERT INTO `images` VALUES (267, 78, 'Bánh canh ống Mikiri gói 300g', 'images\\product-images\\\nbanh-canh-ong-mikiri-goi-300g-202308210940086002.jpg\n');
INSERT INTO `images` VALUES (268, 79, 'Bánh mì tươi đông lạnh smiles 350g', 'images\\product-images\\\nbanh-mi-tuoi-osmiles-goi-350g-70g-x-5-o-202101141649354954.jpg\n');
INSERT INTO `images` VALUES (269, 79, 'Bánh mì tươi đông lạnh smiles 350g', 'images\\product-images\\\nbanh-mi-tuoi-dong-lanh-osmiles-350g-202304071344331615.jpg\n');
INSERT INTO `images` VALUES (270, 79, 'Bánh mì tươi đông lạnh smiles 350g', 'images\\product-images\\\nbanh-mi-tuoi-dong-lanh-osmiles-goi-350g-70g-x-5-o-202112280957126561.jpg\n');
INSERT INTO `images` VALUES (271, 80, 'Bánh gạo Tteokbokki Hàn Quốc HT Food gói 500g', 'images\\product-images\\\nbanh-gao-tteokbokki-han-quoc-ht-food-goi-500g-202201181305040797.jpg\n');
INSERT INTO `images` VALUES (272, 80, 'Bánh gạo Tteokbokki Hàn Quốc HT Food gói 500g', 'images\\product-images\\\nbanh-gao-tteokbokki-han-quoc-ht-food-goi-500g-202201181305044294.jpg\n');
INSERT INTO `images` VALUES (273, 80, 'Bánh gạo Tteokbokki Hàn Quốc HT Food gói 500g', 'images\\product-images\\\nbanh-gao-tteokbokki-han-quoc-ht-food-goi-500g-202201181305050878.jpg\n');
INSERT INTO `images` VALUES (274, 81, 'Bánh bao nhân khoai môn C.P 270g', 'images\\product-images\\\nbanh-bao-nhan-khoai-mon-cp-270g-202212261129150539.jpg\n');
INSERT INTO `images` VALUES (275, 81, 'Bánh bao nhân khoai môn C.P 270g', 'images\\product-images\\\nbanh-bao-nhan-khoai-mon-cp-270g-202212261129159151.jpg\n');
INSERT INTO `images` VALUES (276, 81, 'Bánh bao nhân khoai môn C.P 270g', 'images\\product-images\\\nbanh-bao-nhan-khoai-mon-cp-270g-202212261129172965.jpg\n');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `logId` int NOT NULL AUTO_INCREMENT,
  `ipAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currentValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `afterValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1351 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (1, '123', 'asd', 'Viet Nam', 'abc', 'dsds', 'dsd', 'INFO', '2024-07-06 03:05:49');
INSERT INTO `logs` VALUES (2, 'ds', 'sd', 'ds', 'ds', 'ds', 'ds', 'WARNING', '2024-07-06 03:42:26');
INSERT INTO `logs` VALUES (3, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:37:09');
INSERT INTO `logs` VALUES (4, '172.16.2.119', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:38:32');
INSERT INTO `logs` VALUES (5, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:52:56');
INSERT INTO `logs` VALUES (6, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:53:12');
INSERT INTO `logs` VALUES (7, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:53:54');
INSERT INTO `logs` VALUES (8, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:54:10');
INSERT INTO `logs` VALUES (9, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:54:10');
INSERT INTO `logs` VALUES (10, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:54:11');
INSERT INTO `logs` VALUES (11, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:54:12');
INSERT INTO `logs` VALUES (12, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 04:55:21');
INSERT INTO `logs` VALUES (13, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:00:42');
INSERT INTO `logs` VALUES (14, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:04:22');
INSERT INTO `logs` VALUES (15, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:05:55');
INSERT INTO `logs` VALUES (16, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:13:31');
INSERT INTO `logs` VALUES (17, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:29:58');
INSERT INTO `logs` VALUES (18, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:31:25');
INSERT INTO `logs` VALUES (19, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:35:36');
INSERT INTO `logs` VALUES (20, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 05:36:16');
INSERT INTO `logs` VALUES (21, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 11:35:28');
INSERT INTO `logs` VALUES (22, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 11:35:55');
INSERT INTO `logs` VALUES (23, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 11:36:28');
INSERT INTO `logs` VALUES (24, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 11:43:36');
INSERT INTO `logs` VALUES (25, '127.0.0.1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 12:10:08');
INSERT INTO `logs` VALUES (26, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:09:07');
INSERT INTO `logs` VALUES (27, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:28:19');
INSERT INTO `logs` VALUES (28, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:31:43');
INSERT INTO `logs` VALUES (29, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:31:57');
INSERT INTO `logs` VALUES (30, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:37:16');
INSERT INTO `logs` VALUES (31, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:37:28');
INSERT INTO `logs` VALUES (32, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:37:47');
INSERT INTO `logs` VALUES (33, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:38:12');
INSERT INTO `logs` VALUES (34, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:38:21');
INSERT INTO `logs` VALUES (35, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:43:46');
INSERT INTO `logs` VALUES (36, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:43:59');
INSERT INTO `logs` VALUES (37, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:44:14');
INSERT INTO `logs` VALUES (38, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:44:56');
INSERT INTO `logs` VALUES (39, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:46:03');
INSERT INTO `logs` VALUES (40, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:49:56');
INSERT INTO `logs` VALUES (41, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:50:09');
INSERT INTO `logs` VALUES (42, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:51:05');
INSERT INTO `logs` VALUES (43, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:51:16');
INSERT INTO `logs` VALUES (44, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:53:20');
INSERT INTO `logs` VALUES (45, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:53:58');
INSERT INTO `logs` VALUES (46, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:54:26');
INSERT INTO `logs` VALUES (47, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:54:36');
INSERT INTO `logs` VALUES (48, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:57:00');
INSERT INTO `logs` VALUES (49, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:57:09');
INSERT INTO `logs` VALUES (50, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:57:45');
INSERT INTO `logs` VALUES (51, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:57:54');
INSERT INTO `logs` VALUES (52, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:58:36');
INSERT INTO `logs` VALUES (53, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:58:45');
INSERT INTO `logs` VALUES (54, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:59:14');
INSERT INTO `logs` VALUES (55, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 13:59:27');
INSERT INTO `logs` VALUES (56, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:00:14');
INSERT INTO `logs` VALUES (57, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:00:23');
INSERT INTO `logs` VALUES (58, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:01:11');
INSERT INTO `logs` VALUES (59, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:01:22');
INSERT INTO `logs` VALUES (60, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:01:55');
INSERT INTO `logs` VALUES (61, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:02:26');
INSERT INTO `logs` VALUES (62, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:02:58');
INSERT INTO `logs` VALUES (63, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:06:15');
INSERT INTO `logs` VALUES (64, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:06:40');
INSERT INTO `logs` VALUES (65, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:07:33');
INSERT INTO `logs` VALUES (66, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 14:07:48');
INSERT INTO `logs` VALUES (67, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:51:01');
INSERT INTO `logs` VALUES (68, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:53:01');
INSERT INTO `logs` VALUES (69, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:53:20');
INSERT INTO `logs` VALUES (70, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:53:30');
INSERT INTO `logs` VALUES (71, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:54:26');
INSERT INTO `logs` VALUES (72, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:55:39');
INSERT INTO `logs` VALUES (73, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:56:08');
INSERT INTO `logs` VALUES (74, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:56:18');
INSERT INTO `logs` VALUES (75, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:56:54');
INSERT INTO `logs` VALUES (76, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 16:57:05');
INSERT INTO `logs` VALUES (77, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:00:29');
INSERT INTO `logs` VALUES (78, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:00:39');
INSERT INTO `logs` VALUES (79, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:01:25');
INSERT INTO `logs` VALUES (80, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:01:33');
INSERT INTO `logs` VALUES (81, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:01:50');
INSERT INTO `logs` VALUES (82, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:04:26');
INSERT INTO `logs` VALUES (83, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:04:26');
INSERT INTO `logs` VALUES (84, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:04:38');
INSERT INTO `logs` VALUES (85, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:04:50');
INSERT INTO `logs` VALUES (86, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:06:26');
INSERT INTO `logs` VALUES (87, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:06:50');
INSERT INTO `logs` VALUES (88, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:07:30');
INSERT INTO `logs` VALUES (89, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:07:53');
INSERT INTO `logs` VALUES (90, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:08:19');
INSERT INTO `logs` VALUES (91, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:09:15');
INSERT INTO `logs` VALUES (92, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:09:31');
INSERT INTO `logs` VALUES (93, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:09:49');
INSERT INTO `logs` VALUES (94, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:10:34');
INSERT INTO `logs` VALUES (95, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:10:53');
INSERT INTO `logs` VALUES (97, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:11:55');
INSERT INTO `logs` VALUES (99, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:12:18');
INSERT INTO `logs` VALUES (100, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:16:22');
INSERT INTO `logs` VALUES (101, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:16:39');
INSERT INTO `logs` VALUES (102, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:18:12');
INSERT INTO `logs` VALUES (103, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:19:01');
INSERT INTO `logs` VALUES (104, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:19:23');
INSERT INTO `logs` VALUES (105, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:20:40');
INSERT INTO `logs` VALUES (106, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:20:45');
INSERT INTO `logs` VALUES (107, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:21:00');
INSERT INTO `logs` VALUES (108, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:23:16');
INSERT INTO `logs` VALUES (109, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:23:29');
INSERT INTO `logs` VALUES (110, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:23:46');
INSERT INTO `logs` VALUES (111, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:24:04');
INSERT INTO `logs` VALUES (112, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:28:24');
INSERT INTO `logs` VALUES (113, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:28:36');
INSERT INTO `logs` VALUES (114, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:37:40');
INSERT INTO `logs` VALUES (115, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:38:02');
INSERT INTO `logs` VALUES (116, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:38:39');
INSERT INTO `logs` VALUES (117, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:38:40');
INSERT INTO `logs` VALUES (118, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:39:19');
INSERT INTO `logs` VALUES (119, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:41:55');
INSERT INTO `logs` VALUES (120, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:42:06');
INSERT INTO `logs` VALUES (121, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:43:15');
INSERT INTO `logs` VALUES (122, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:44:22');
INSERT INTO `logs` VALUES (123, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:44:37');
INSERT INTO `logs` VALUES (124, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:45:09');
INSERT INTO `logs` VALUES (125, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:45:38');
INSERT INTO `logs` VALUES (126, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:46:07');
INSERT INTO `logs` VALUES (127, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:46:37');
INSERT INTO `logs` VALUES (128, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:47:02');
INSERT INTO `logs` VALUES (129, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 17:47:15');
INSERT INTO `logs` VALUES (130, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 18:30:48');
INSERT INTO `logs` VALUES (131, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 18:32:28');
INSERT INTO `logs` VALUES (132, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 19:14:58');
INSERT INTO `logs` VALUES (133, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 22:12:39');
INSERT INTO `logs` VALUES (134, '127.0.0.1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 22:31:36');
INSERT INTO `logs` VALUES (135, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-06 22:56:04');
INSERT INTO `logs` VALUES (136, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-07 11:46:48');
INSERT INTO `logs` VALUES (137, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-08 09:41:52');
INSERT INTO `logs` VALUES (138, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:34:56');
INSERT INTO `logs` VALUES (139, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:35:32');
INSERT INTO `logs` VALUES (140, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:37:59');
INSERT INTO `logs` VALUES (141, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:38:03');
INSERT INTO `logs` VALUES (142, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:39:01');
INSERT INTO `logs` VALUES (143, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:39:43');
INSERT INTO `logs` VALUES (144, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:40:31');
INSERT INTO `logs` VALUES (145, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:40:34');
INSERT INTO `logs` VALUES (146, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:43:33');
INSERT INTO `logs` VALUES (147, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:45:58');
INSERT INTO `logs` VALUES (148, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-10 01:46:44');
INSERT INTO `logs` VALUES (149, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 21:38:25');
INSERT INTO `logs` VALUES (150, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:09:16');
INSERT INTO `logs` VALUES (151, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:09:46');
INSERT INTO `logs` VALUES (152, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:09:58');
INSERT INTO `logs` VALUES (153, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:13:09');
INSERT INTO `logs` VALUES (154, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:13:29');
INSERT INTO `logs` VALUES (155, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:24:25');
INSERT INTO `logs` VALUES (156, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:26:42');
INSERT INTO `logs` VALUES (157, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:29:52');
INSERT INTO `logs` VALUES (158, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:29:55');
INSERT INTO `logs` VALUES (159, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:33:21');
INSERT INTO `logs` VALUES (160, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:33:44');
INSERT INTO `logs` VALUES (161, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:34:18');
INSERT INTO `logs` VALUES (162, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:34:30');
INSERT INTO `logs` VALUES (163, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-11 23:47:41');
INSERT INTO `logs` VALUES (164, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 00:01:37');
INSERT INTO `logs` VALUES (165, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 00:03:19');
INSERT INTO `logs` VALUES (166, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 00:06:09');
INSERT INTO `logs` VALUES (167, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 00:08:20');
INSERT INTO `logs` VALUES (168, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 00:52:08');
INSERT INTO `logs` VALUES (169, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 00:55:02');
INSERT INTO `logs` VALUES (170, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 00:58:05');
INSERT INTO `logs` VALUES (171, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:01:53');
INSERT INTO `logs` VALUES (172, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:07:33');
INSERT INTO `logs` VALUES (173, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:09:41');
INSERT INTO `logs` VALUES (174, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:12:00');
INSERT INTO `logs` VALUES (175, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:27:55');
INSERT INTO `logs` VALUES (176, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:33:37');
INSERT INTO `logs` VALUES (177, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:33:38');
INSERT INTO `logs` VALUES (178, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:33:39');
INSERT INTO `logs` VALUES (179, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:39:34');
INSERT INTO `logs` VALUES (180, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:42:38');
INSERT INTO `logs` VALUES (181, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:44:23');
INSERT INTO `logs` VALUES (182, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:49:31');
INSERT INTO `logs` VALUES (183, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:50:18');
INSERT INTO `logs` VALUES (184, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:51:54');
INSERT INTO `logs` VALUES (185, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:52:10');
INSERT INTO `logs` VALUES (186, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:52:52');
INSERT INTO `logs` VALUES (187, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 01:53:18');
INSERT INTO `logs` VALUES (188, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 02:16:54');
INSERT INTO `logs` VALUES (189, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 03:57:00');
INSERT INTO `logs` VALUES (190, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 05:59:59');
INSERT INTO `logs` VALUES (191, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 07:42:12');
INSERT INTO `logs` VALUES (192, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 07:58:35');
INSERT INTO `logs` VALUES (193, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 08:30:27');
INSERT INTO `logs` VALUES (194, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 08:37:36');
INSERT INTO `logs` VALUES (195, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 08:50:20');
INSERT INTO `logs` VALUES (196, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 21:13:31');
INSERT INTO `logs` VALUES (197, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 21:13:32');
INSERT INTO `logs` VALUES (198, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 21:15:59');
INSERT INTO `logs` VALUES (199, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 22:07:58');
INSERT INTO `logs` VALUES (200, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 22:16:15');
INSERT INTO `logs` VALUES (201, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 22:18:33');
INSERT INTO `logs` VALUES (202, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 23:08:13');
INSERT INTO `logs` VALUES (203, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 23:08:17');
INSERT INTO `logs` VALUES (204, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 23:15:34');
INSERT INTO `logs` VALUES (205, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 23:42:35');
INSERT INTO `logs` VALUES (206, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 23:46:33');
INSERT INTO `logs` VALUES (207, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-12 23:48:33');
INSERT INTO `logs` VALUES (208, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 00:33:02');
INSERT INTO `logs` VALUES (209, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 00:35:43');
INSERT INTO `logs` VALUES (210, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 00:46:15');
INSERT INTO `logs` VALUES (211, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 00:47:11');
INSERT INTO `logs` VALUES (212, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:27:27');
INSERT INTO `logs` VALUES (213, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:27:59');
INSERT INTO `logs` VALUES (214, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:32:12');
INSERT INTO `logs` VALUES (215, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:33:47');
INSERT INTO `logs` VALUES (216, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:33:52');
INSERT INTO `logs` VALUES (217, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:38:05');
INSERT INTO `logs` VALUES (218, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:38:44');
INSERT INTO `logs` VALUES (219, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 03:38:48');
INSERT INTO `logs` VALUES (220, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 04:12:24');
INSERT INTO `logs` VALUES (221, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 04:12:25');
INSERT INTO `logs` VALUES (222, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 05:06:19');
INSERT INTO `logs` VALUES (223, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 05:07:30');
INSERT INTO `logs` VALUES (224, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 05:31:31');
INSERT INTO `logs` VALUES (225, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 05:34:27');
INSERT INTO `logs` VALUES (226, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 05:37:57');
INSERT INTO `logs` VALUES (227, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 20:50:33');
INSERT INTO `logs` VALUES (228, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 20:50:34');
INSERT INTO `logs` VALUES (229, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 20:53:15');
INSERT INTO `logs` VALUES (230, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 21:16:17');
INSERT INTO `logs` VALUES (231, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 21:16:59');
INSERT INTO `logs` VALUES (232, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 21:17:08');
INSERT INTO `logs` VALUES (233, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 21:51:11');
INSERT INTO `logs` VALUES (234, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 21:54:30');
INSERT INTO `logs` VALUES (235, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 21:55:01');
INSERT INTO `logs` VALUES (236, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 21:58:02');
INSERT INTO `logs` VALUES (237, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 23:17:23');
INSERT INTO `logs` VALUES (238, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 23:18:55');
INSERT INTO `logs` VALUES (239, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 23:21:02');
INSERT INTO `logs` VALUES (240, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 23:21:12');
INSERT INTO `logs` VALUES (241, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 23:24:29');
INSERT INTO `logs` VALUES (242, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-13 23:24:45');
INSERT INTO `logs` VALUES (243, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:20:03');
INSERT INTO `logs` VALUES (244, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:23:49');
INSERT INTO `logs` VALUES (245, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:24:04');
INSERT INTO `logs` VALUES (246, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:25:00');
INSERT INTO `logs` VALUES (247, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:25:06');
INSERT INTO `logs` VALUES (248, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:25:42');
INSERT INTO `logs` VALUES (249, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:27:16');
INSERT INTO `logs` VALUES (250, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:27:47');
INSERT INTO `logs` VALUES (251, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:48:59');
INSERT INTO `logs` VALUES (252, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 00:49:00');
INSERT INTO `logs` VALUES (253, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 01:12:00');
INSERT INTO `logs` VALUES (254, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 01:15:27');
INSERT INTO `logs` VALUES (255, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 01:16:15');
INSERT INTO `logs` VALUES (256, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 01:18:33');
INSERT INTO `logs` VALUES (257, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 01:21:02');
INSERT INTO `logs` VALUES (258, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 01:48:50');
INSERT INTO `logs` VALUES (259, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-14 21:59:02');
INSERT INTO `logs` VALUES (260, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 14:57:52');
INSERT INTO `logs` VALUES (261, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:03:20');
INSERT INTO `logs` VALUES (262, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:04:35');
INSERT INTO `logs` VALUES (263, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:04:56');
INSERT INTO `logs` VALUES (264, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:11:14');
INSERT INTO `logs` VALUES (265, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:11:41');
INSERT INTO `logs` VALUES (266, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:12:59');
INSERT INTO `logs` VALUES (267, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:15:45');
INSERT INTO `logs` VALUES (268, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:15:50');
INSERT INTO `logs` VALUES (269, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:15:55');
INSERT INTO `logs` VALUES (270, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:16:23');
INSERT INTO `logs` VALUES (271, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:17:23');
INSERT INTO `logs` VALUES (272, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:27:43');
INSERT INTO `logs` VALUES (273, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:28:54');
INSERT INTO `logs` VALUES (274, '0:0:0:0:0:0:0:1', 'Home', '', '', '', 'View home page', 'INFO', '2024-07-15 15:29:39');
INSERT INTO `logs` VALUES (275, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 17:57:52');
INSERT INTO `logs` VALUES (276, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 17:57:52');
INSERT INTO `logs` VALUES (277, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 17:57:53');
INSERT INTO `logs` VALUES (278, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 17:57:55');
INSERT INTO `logs` VALUES (279, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 18:00:08');
INSERT INTO `logs` VALUES (280, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 18:26:22');
INSERT INTO `logs` VALUES (281, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 11 to cart', 'INFO', '2024-07-16 18:41:16');
INSERT INTO `logs` VALUES (282, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productChuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'INFO', '2024-07-16 18:41:22');
INSERT INTO `logs` VALUES (283, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai lang mật 1kg (2 - 5 củ)', 'INFO', '2024-07-16 18:41:28');
INSERT INTO `logs` VALUES (284, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 18:41:32');
INSERT INTO `logs` VALUES (285, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 11 to cart', 'INFO', '2024-07-16 18:48:36');
INSERT INTO `logs` VALUES (286, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 18:48:42');
INSERT INTO `logs` VALUES (287, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-16 18:48:51');
INSERT INTO `logs` VALUES (288, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 62 to cart', 'INFO', '2024-07-16 18:48:55');
INSERT INTO `logs` VALUES (289, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View product2 trái bắp nếp từ 500g trở lên', 'INFO', '2024-07-16 18:49:00');
INSERT INTO `logs` VALUES (290, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-16 18:49:07');
INSERT INTO `logs` VALUES (291, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 18:49:12');
INSERT INTO `logs` VALUES (292, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 11 to cart', 'INFO', '2024-07-16 18:49:17');
INSERT INTO `logs` VALUES (293, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 14 to cart', 'INFO', '2024-07-16 18:54:35');
INSERT INTO `logs` VALUES (294, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 0 to cart', 'INFO', '2024-07-16 18:54:38');
INSERT INTO `logs` VALUES (295, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 0 to cart', 'INFO', '2024-07-16 18:54:39');
INSERT INTO `logs` VALUES (296, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 14 with quantity 0 to cart', 'INFO', '2024-07-16 18:54:39');
INSERT INTO `logs` VALUES (297, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 18:54:40');
INSERT INTO `logs` VALUES (298, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 18:54:45');
INSERT INTO `logs` VALUES (299, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai môn 450g - 550g (1 củ)', 'INFO', '2024-07-16 18:57:21');
INSERT INTO `logs` VALUES (300, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 14 to cart', 'INFO', '2024-07-16 18:57:25');
INSERT INTO `logs` VALUES (301, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 18:57:26');
INSERT INTO `logs` VALUES (302, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 18:57:39');
INSERT INTO `logs` VALUES (303, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-16 18:57:44');
INSERT INTO `logs` VALUES (304, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 11 to cart', 'INFO', '2024-07-16 18:57:53');
INSERT INTO `logs` VALUES (305, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 18:57:56');
INSERT INTO `logs` VALUES (306, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai lang mật 1kg (2 - 5 củ)', 'INFO', '2024-07-16 18:58:08');
INSERT INTO `logs` VALUES (307, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 62 to cart', 'INFO', '2024-07-16 18:58:21');
INSERT INTO `logs` VALUES (308, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 1 to cart', 'INFO', '2024-07-16 19:00:10');
INSERT INTO `logs` VALUES (309, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-16 19:00:12');
INSERT INTO `logs` VALUES (310, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:00:37');
INSERT INTO `logs` VALUES (311, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:00:37');
INSERT INTO `logs` VALUES (312, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:00:38');
INSERT INTO `logs` VALUES (313, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 1 to cart', 'INFO', '2024-07-16 19:00:41');
INSERT INTO `logs` VALUES (314, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 12 to cart', 'INFO', '2024-07-16 19:01:13');
INSERT INTO `logs` VALUES (315, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-16 19:01:18');
INSERT INTO `logs` VALUES (316, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 18 to cart', 'INFO', '2024-07-16 19:01:21');
INSERT INTO `logs` VALUES (317, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 32 to cart', 'INFO', '2024-07-16 19:01:31');
INSERT INTO `logs` VALUES (318, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 32 to cart', 'INFO', '2024-07-16 19:01:33');
INSERT INTO `logs` VALUES (319, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productHạt điều tỏi ớt Vinahe gói 70g', 'INFO', '2024-07-16 19:01:35');
INSERT INTO `logs` VALUES (320, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 1 with quantity 2 to cart', 'INFO', '2024-07-16 19:03:56');
INSERT INTO `logs` VALUES (321, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 1 with quantity 2 to cart', 'INFO', '2024-07-16 19:03:57');
INSERT INTO `logs` VALUES (322, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 1 with quantity 2 to cart', 'INFO', '2024-07-16 19:03:57');
INSERT INTO `logs` VALUES (323, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 1 with quantity 0 to cart', 'INFO', '2024-07-16 19:03:57');
INSERT INTO `logs` VALUES (324, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 18 with quantity 0 to cart', 'INFO', '2024-07-16 19:03:58');
INSERT INTO `logs` VALUES (325, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 2 to cart', 'INFO', '2024-07-16 19:03:58');
INSERT INTO `logs` VALUES (326, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 3 to cart', 'INFO', '2024-07-16 19:03:59');
INSERT INTO `logs` VALUES (327, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 4 to cart', 'INFO', '2024-07-16 19:03:59');
INSERT INTO `logs` VALUES (328, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 5 to cart', 'INFO', '2024-07-16 19:03:59');
INSERT INTO `logs` VALUES (329, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 6 to cart', 'INFO', '2024-07-16 19:03:59');
INSERT INTO `logs` VALUES (330, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 7 to cart', 'INFO', '2024-07-16 19:04:00');
INSERT INTO `logs` VALUES (331, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 2 to cart', 'INFO', '2024-07-16 19:04:01');
INSERT INTO `logs` VALUES (332, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 3 to cart', 'INFO', '2024-07-16 19:04:01');
INSERT INTO `logs` VALUES (333, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 4 to cart', 'INFO', '2024-07-16 19:04:01');
INSERT INTO `logs` VALUES (334, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 5 to cart', 'INFO', '2024-07-16 19:04:01');
INSERT INTO `logs` VALUES (335, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 6 to cart', 'INFO', '2024-07-16 19:04:06');
INSERT INTO `logs` VALUES (336, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 5 to cart', 'INFO', '2024-07-16 19:04:06');
INSERT INTO `logs` VALUES (337, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 4 to cart', 'INFO', '2024-07-16 19:04:07');
INSERT INTO `logs` VALUES (338, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 3 to cart', 'INFO', '2024-07-16 19:04:07');
INSERT INTO `logs` VALUES (339, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 2 to cart', 'INFO', '2024-07-16 19:04:07');
INSERT INTO `logs` VALUES (340, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 1 to cart', 'INFO', '2024-07-16 19:04:07');
INSERT INTO `logs` VALUES (341, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 2 to cart', 'INFO', '2024-07-16 19:04:09');
INSERT INTO `logs` VALUES (342, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 3 to cart', 'INFO', '2024-07-16 19:04:10');
INSERT INTO `logs` VALUES (343, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 4 to cart', 'INFO', '2024-07-16 19:04:10');
INSERT INTO `logs` VALUES (344, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 5 to cart', 'INFO', '2024-07-16 19:04:10');
INSERT INTO `logs` VALUES (345, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 6 to cart', 'INFO', '2024-07-16 19:04:11');
INSERT INTO `logs` VALUES (346, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 7 to cart', 'INFO', '2024-07-16 19:04:11');
INSERT INTO `logs` VALUES (347, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 8 to cart', 'INFO', '2024-07-16 19:04:11');
INSERT INTO `logs` VALUES (348, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 9 to cart', 'INFO', '2024-07-16 19:04:11');
INSERT INTO `logs` VALUES (349, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 10 to cart', 'INFO', '2024-07-16 19:04:11');
INSERT INTO `logs` VALUES (350, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 11 to cart', 'INFO', '2024-07-16 19:04:12');
INSERT INTO `logs` VALUES (351, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 11 with quantity 12 to cart', 'INFO', '2024-07-16 19:04:12');
INSERT INTO `logs` VALUES (352, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 6 to cart', 'INFO', '2024-07-16 19:04:12');
INSERT INTO `logs` VALUES (353, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 7 to cart', 'INFO', '2024-07-16 19:04:13');
INSERT INTO `logs` VALUES (354, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 8 to cart', 'INFO', '2024-07-16 19:04:13');
INSERT INTO `logs` VALUES (355, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 9 to cart', 'INFO', '2024-07-16 19:04:13');
INSERT INTO `logs` VALUES (356, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 10 to cart', 'INFO', '2024-07-16 19:04:13');
INSERT INTO `logs` VALUES (357, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 14 with quantity 2 to cart', 'INFO', '2024-07-16 19:04:15');
INSERT INTO `logs` VALUES (358, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 14 with quantity 3 to cart', 'INFO', '2024-07-16 19:04:15');
INSERT INTO `logs` VALUES (359, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 14 with quantity 4 to cart', 'INFO', '2024-07-16 19:04:15');
INSERT INTO `logs` VALUES (360, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 2 to cart', 'INFO', '2024-07-16 19:04:16');
INSERT INTO `logs` VALUES (361, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 3 to cart', 'INFO', '2024-07-16 19:04:16');
INSERT INTO `logs` VALUES (362, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 4 to cart', 'INFO', '2024-07-16 19:04:16');
INSERT INTO `logs` VALUES (363, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 5 to cart', 'INFO', '2024-07-16 19:04:16');
INSERT INTO `logs` VALUES (364, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 6 to cart', 'INFO', '2024-07-16 19:04:16');
INSERT INTO `logs` VALUES (365, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 7 to cart', 'INFO', '2024-07-16 19:04:17');
INSERT INTO `logs` VALUES (366, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 13 to cart', 'INFO', '2024-07-16 19:04:31');
INSERT INTO `logs` VALUES (367, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 14 to cart', 'INFO', '2024-07-16 19:04:31');
INSERT INTO `logs` VALUES (368, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 15 to cart', 'INFO', '2024-07-16 19:04:31');
INSERT INTO `logs` VALUES (369, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 16 to cart', 'INFO', '2024-07-16 19:04:31');
INSERT INTO `logs` VALUES (370, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 17 to cart', 'INFO', '2024-07-16 19:04:31');
INSERT INTO `logs` VALUES (371, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 18 to cart', 'INFO', '2024-07-16 19:04:31');
INSERT INTO `logs` VALUES (372, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 19 to cart', 'INFO', '2024-07-16 19:04:32');
INSERT INTO `logs` VALUES (373, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 20 to cart', 'INFO', '2024-07-16 19:04:32');
INSERT INTO `logs` VALUES (374, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 21 to cart', 'INFO', '2024-07-16 19:04:32');
INSERT INTO `logs` VALUES (375, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 22 to cart', 'INFO', '2024-07-16 19:04:32');
INSERT INTO `logs` VALUES (376, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 23 to cart', 'INFO', '2024-07-16 19:04:32');
INSERT INTO `logs` VALUES (377, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 24 to cart', 'INFO', '2024-07-16 19:04:32');
INSERT INTO `logs` VALUES (378, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 25 to cart', 'INFO', '2024-07-16 19:04:33');
INSERT INTO `logs` VALUES (379, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 26 to cart', 'INFO', '2024-07-16 19:04:33');
INSERT INTO `logs` VALUES (380, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 27 to cart', 'INFO', '2024-07-16 19:04:33');
INSERT INTO `logs` VALUES (381, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 28 to cart', 'INFO', '2024-07-16 19:04:33');
INSERT INTO `logs` VALUES (382, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 29 to cart', 'INFO', '2024-07-16 19:04:33');
INSERT INTO `logs` VALUES (383, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 30 to cart', 'INFO', '2024-07-16 19:04:35');
INSERT INTO `logs` VALUES (384, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 31 to cart', 'INFO', '2024-07-16 19:04:35');
INSERT INTO `logs` VALUES (385, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 32 to cart', 'INFO', '2024-07-16 19:04:35');
INSERT INTO `logs` VALUES (386, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 33 to cart', 'INFO', '2024-07-16 19:04:36');
INSERT INTO `logs` VALUES (387, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 34 to cart', 'INFO', '2024-07-16 19:04:36');
INSERT INTO `logs` VALUES (388, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 35 to cart', 'INFO', '2024-07-16 19:04:36');
INSERT INTO `logs` VALUES (389, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 36 to cart', 'INFO', '2024-07-16 19:04:36');
INSERT INTO `logs` VALUES (390, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 37 to cart', 'INFO', '2024-07-16 19:04:36');
INSERT INTO `logs` VALUES (391, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 38 to cart', 'INFO', '2024-07-16 19:04:36');
INSERT INTO `logs` VALUES (392, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 39 to cart', 'INFO', '2024-07-16 19:04:37');
INSERT INTO `logs` VALUES (393, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 40 to cart', 'INFO', '2024-07-16 19:04:37');
INSERT INTO `logs` VALUES (394, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 41 to cart', 'INFO', '2024-07-16 19:04:37');
INSERT INTO `logs` VALUES (395, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 42 to cart', 'INFO', '2024-07-16 19:04:37');
INSERT INTO `logs` VALUES (396, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 43 to cart', 'INFO', '2024-07-16 19:04:37');
INSERT INTO `logs` VALUES (397, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 44 to cart', 'INFO', '2024-07-16 19:04:38');
INSERT INTO `logs` VALUES (398, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 45 to cart', 'INFO', '2024-07-16 19:04:38');
INSERT INTO `logs` VALUES (399, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:38');
INSERT INTO `logs` VALUES (400, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:38');
INSERT INTO `logs` VALUES (401, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:38');
INSERT INTO `logs` VALUES (402, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:39');
INSERT INTO `logs` VALUES (403, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:39');
INSERT INTO `logs` VALUES (404, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:39');
INSERT INTO `logs` VALUES (405, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:39');
INSERT INTO `logs` VALUES (406, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:40');
INSERT INTO `logs` VALUES (407, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:40');
INSERT INTO `logs` VALUES (408, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:40');
INSERT INTO `logs` VALUES (409, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:41');
INSERT INTO `logs` VALUES (410, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 44 to cart', 'INFO', '2024-07-16 19:04:41');
INSERT INTO `logs` VALUES (411, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 43 to cart', 'INFO', '2024-07-16 19:04:42');
INSERT INTO `logs` VALUES (412, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 44 to cart', 'INFO', '2024-07-16 19:04:42');
INSERT INTO `logs` VALUES (413, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 45 to cart', 'INFO', '2024-07-16 19:04:42');
INSERT INTO `logs` VALUES (414, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:42');
INSERT INTO `logs` VALUES (415, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:43');
INSERT INTO `logs` VALUES (416, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:43');
INSERT INTO `logs` VALUES (417, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:43');
INSERT INTO `logs` VALUES (418, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:43');
INSERT INTO `logs` VALUES (419, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 2 to cart', 'INFO', '2024-07-16 19:04:44');
INSERT INTO `logs` VALUES (420, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 3 to cart', 'INFO', '2024-07-16 19:04:44');
INSERT INTO `logs` VALUES (421, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 4 to cart', 'INFO', '2024-07-16 19:04:44');
INSERT INTO `logs` VALUES (422, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 5 to cart', 'INFO', '2024-07-16 19:04:44');
INSERT INTO `logs` VALUES (423, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 6 to cart', 'INFO', '2024-07-16 19:04:44');
INSERT INTO `logs` VALUES (424, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 7 to cart', 'INFO', '2024-07-16 19:04:45');
INSERT INTO `logs` VALUES (425, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 8 to cart', 'INFO', '2024-07-16 19:04:45');
INSERT INTO `logs` VALUES (426, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 9 to cart', 'INFO', '2024-07-16 19:04:45');
INSERT INTO `logs` VALUES (427, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 10 to cart', 'INFO', '2024-07-16 19:04:45');
INSERT INTO `logs` VALUES (428, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 11 to cart', 'INFO', '2024-07-16 19:04:45');
INSERT INTO `logs` VALUES (429, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 12 to cart', 'INFO', '2024-07-16 19:04:46');
INSERT INTO `logs` VALUES (430, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 13 to cart', 'INFO', '2024-07-16 19:04:46');
INSERT INTO `logs` VALUES (431, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 14 to cart', 'INFO', '2024-07-16 19:04:46');
INSERT INTO `logs` VALUES (432, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 15 to cart', 'INFO', '2024-07-16 19:04:46');
INSERT INTO `logs` VALUES (433, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 16 to cart', 'INFO', '2024-07-16 19:04:46');
INSERT INTO `logs` VALUES (434, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 17 to cart', 'INFO', '2024-07-16 19:04:47');
INSERT INTO `logs` VALUES (435, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 18 to cart', 'INFO', '2024-07-16 19:04:47');
INSERT INTO `logs` VALUES (436, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 19 to cart', 'INFO', '2024-07-16 19:04:47');
INSERT INTO `logs` VALUES (437, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 19:04:47');
INSERT INTO `logs` VALUES (438, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 19:04:47');
INSERT INTO `logs` VALUES (439, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 22 to cart', 'INFO', '2024-07-16 19:04:48');
INSERT INTO `logs` VALUES (440, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 23 to cart', 'INFO', '2024-07-16 19:04:48');
INSERT INTO `logs` VALUES (441, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 24 to cart', 'INFO', '2024-07-16 19:04:48');
INSERT INTO `logs` VALUES (442, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 25 to cart', 'INFO', '2024-07-16 19:04:48');
INSERT INTO `logs` VALUES (443, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 26 to cart', 'INFO', '2024-07-16 19:04:48');
INSERT INTO `logs` VALUES (444, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 27 to cart', 'INFO', '2024-07-16 19:04:49');
INSERT INTO `logs` VALUES (445, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 28 to cart', 'INFO', '2024-07-16 19:04:49');
INSERT INTO `logs` VALUES (446, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 29 to cart', 'INFO', '2024-07-16 19:04:49');
INSERT INTO `logs` VALUES (447, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 30 to cart', 'INFO', '2024-07-16 19:04:49');
INSERT INTO `logs` VALUES (448, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 31 to cart', 'INFO', '2024-07-16 19:04:49');
INSERT INTO `logs` VALUES (449, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 32 to cart', 'INFO', '2024-07-16 19:04:50');
INSERT INTO `logs` VALUES (450, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 33 to cart', 'INFO', '2024-07-16 19:04:50');
INSERT INTO `logs` VALUES (451, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 34 to cart', 'INFO', '2024-07-16 19:04:50');
INSERT INTO `logs` VALUES (452, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 35 to cart', 'INFO', '2024-07-16 19:04:50');
INSERT INTO `logs` VALUES (453, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 36 to cart', 'INFO', '2024-07-16 19:04:50');
INSERT INTO `logs` VALUES (454, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 37 to cart', 'INFO', '2024-07-16 19:04:51');
INSERT INTO `logs` VALUES (455, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 38 to cart', 'INFO', '2024-07-16 19:04:51');
INSERT INTO `logs` VALUES (456, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 39 to cart', 'INFO', '2024-07-16 19:04:51');
INSERT INTO `logs` VALUES (457, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 40 to cart', 'INFO', '2024-07-16 19:04:51');
INSERT INTO `logs` VALUES (458, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 41 to cart', 'INFO', '2024-07-16 19:04:51');
INSERT INTO `logs` VALUES (459, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 42 to cart', 'INFO', '2024-07-16 19:04:52');
INSERT INTO `logs` VALUES (460, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 43 to cart', 'INFO', '2024-07-16 19:04:52');
INSERT INTO `logs` VALUES (461, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 44 to cart', 'INFO', '2024-07-16 19:04:52');
INSERT INTO `logs` VALUES (462, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 45 to cart', 'INFO', '2024-07-16 19:04:52');
INSERT INTO `logs` VALUES (463, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 46 to cart', 'INFO', '2024-07-16 19:04:52');
INSERT INTO `logs` VALUES (464, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 47 to cart', 'INFO', '2024-07-16 19:04:52');
INSERT INTO `logs` VALUES (465, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 48 to cart', 'INFO', '2024-07-16 19:04:53');
INSERT INTO `logs` VALUES (466, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:04:54');
INSERT INTO `logs` VALUES (467, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:04:54');
INSERT INTO `logs` VALUES (468, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:04:54');
INSERT INTO `logs` VALUES (469, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:04:54');
INSERT INTO `logs` VALUES (470, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:04:55');
INSERT INTO `logs` VALUES (471, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:04:55');
INSERT INTO `logs` VALUES (472, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 50 to cart', 'INFO', '2024-07-16 19:04:58');
INSERT INTO `logs` VALUES (473, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:00');
INSERT INTO `logs` VALUES (474, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:00');
INSERT INTO `logs` VALUES (475, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:00');
INSERT INTO `logs` VALUES (476, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:01');
INSERT INTO `logs` VALUES (477, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:01');
INSERT INTO `logs` VALUES (478, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:01');
INSERT INTO `logs` VALUES (479, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:02');
INSERT INTO `logs` VALUES (480, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:02');
INSERT INTO `logs` VALUES (481, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:02');
INSERT INTO `logs` VALUES (482, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:03');
INSERT INTO `logs` VALUES (483, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:03');
INSERT INTO `logs` VALUES (484, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:03');
INSERT INTO `logs` VALUES (485, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:04');
INSERT INTO `logs` VALUES (486, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:04');
INSERT INTO `logs` VALUES (487, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:07');
INSERT INTO `logs` VALUES (488, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 51 to cart', 'INFO', '2024-07-16 19:05:07');
INSERT INTO `logs` VALUES (489, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:08');
INSERT INTO `logs` VALUES (490, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 47 to cart', 'INFO', '2024-07-16 19:05:12');
INSERT INTO `logs` VALUES (491, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 48 to cart', 'INFO', '2024-07-16 19:05:13');
INSERT INTO `logs` VALUES (492, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:13');
INSERT INTO `logs` VALUES (493, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:13');
INSERT INTO `logs` VALUES (494, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:13');
INSERT INTO `logs` VALUES (495, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 49 to cart', 'INFO', '2024-07-16 19:05:14');
INSERT INTO `logs` VALUES (496, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 0 to cart', 'INFO', '2024-07-16 19:05:15');
INSERT INTO `logs` VALUES (497, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 0 to cart', 'INFO', '2024-07-16 19:05:16');
INSERT INTO `logs` VALUES (498, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 12 with quantity 0 to cart', 'INFO', '2024-07-16 19:05:17');
INSERT INTO `logs` VALUES (499, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 14 with quantity 0 to cart', 'INFO', '2024-07-16 19:05:17');
INSERT INTO `logs` VALUES (500, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 62 with quantity 0 to cart', 'INFO', '2024-07-16 19:05:17');
INSERT INTO `logs` VALUES (501, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-16 19:05:28');
INSERT INTO `logs` VALUES (502, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 1 to cart', 'INFO', '2024-07-16 19:05:31');
INSERT INTO `logs` VALUES (503, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-16 19:05:37');
INSERT INTO `logs` VALUES (504, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lài sữa Đồng Việt túi 5kg', 'INFO', '2024-07-16 19:05:44');
INSERT INTO `logs` VALUES (506, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 34 to cart', 'INFO', '2024-07-16 19:05:54');
INSERT INTO `logs` VALUES (507, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 34 to cart', 'INFO', '2024-07-16 19:05:54');
INSERT INTO `logs` VALUES (508, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 34 to cart', 'INFO', '2024-07-16 19:05:54');
INSERT INTO `logs` VALUES (509, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 34 to cart', 'INFO', '2024-07-16 19:05:54');
INSERT INTO `logs` VALUES (510, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 37 to cart', 'INFO', '2024-07-16 19:06:24');
INSERT INTO `logs` VALUES (511, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 38 to cart', 'INFO', '2024-07-16 19:06:25');
INSERT INTO `logs` VALUES (512, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 38 to cart', 'INFO', '2024-07-16 19:06:25');
INSERT INTO `logs` VALUES (513, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 36 to cart', 'INFO', '2024-07-16 19:06:25');
INSERT INTO `logs` VALUES (514, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 36 to cart', 'INFO', '2024-07-16 19:06:26');
INSERT INTO `logs` VALUES (515, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 36 to cart', 'INFO', '2024-07-16 19:06:26');
INSERT INTO `logs` VALUES (516, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 37 to cart', 'INFO', '2024-07-16 19:15:37');
INSERT INTO `logs` VALUES (517, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 38 to cart', 'INFO', '2024-07-16 19:18:07');
INSERT INTO `logs` VALUES (518, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 38 to cart', 'INFO', '2024-07-16 19:18:07');
INSERT INTO `logs` VALUES (519, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 36 to cart', 'INFO', '2024-07-16 19:18:08');
INSERT INTO `logs` VALUES (520, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 36 to cart', 'INFO', '2024-07-16 19:18:08');
INSERT INTO `logs` VALUES (521, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 36 to cart', 'INFO', '2024-07-16 19:18:09');
INSERT INTO `logs` VALUES (522, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 36 to cart', 'INFO', '2024-07-16 19:18:09');
INSERT INTO `logs` VALUES (523, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:11');
INSERT INTO `logs` VALUES (524, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 37 to cart', 'INFO', '2024-07-16 19:18:12');
INSERT INTO `logs` VALUES (525, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 37 to cart', 'INFO', '2024-07-16 19:18:12');
INSERT INTO `logs` VALUES (526, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:12');
INSERT INTO `logs` VALUES (527, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:12');
INSERT INTO `logs` VALUES (528, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 37 to cart', 'INFO', '2024-07-16 19:18:14');
INSERT INTO `logs` VALUES (529, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 37 to cart', 'INFO', '2024-07-16 19:18:15');
INSERT INTO `logs` VALUES (530, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 37 to cart', 'INFO', '2024-07-16 19:18:15');
INSERT INTO `logs` VALUES (531, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:15');
INSERT INTO `logs` VALUES (532, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:15');
INSERT INTO `logs` VALUES (533, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:16');
INSERT INTO `logs` VALUES (534, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:16');
INSERT INTO `logs` VALUES (535, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:16');
INSERT INTO `logs` VALUES (536, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 35 to cart', 'INFO', '2024-07-16 19:18:16');
INSERT INTO `logs` VALUES (537, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 0 to cart', 'INFO', '2024-07-16 19:18:25');
INSERT INTO `logs` VALUES (539, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 8 to cart', 'INFO', '2024-07-16 19:20:21');
INSERT INTO `logs` VALUES (540, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 19:20:22');
INSERT INTO `logs` VALUES (541, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 8 to cart', 'INFO', '2024-07-16 19:20:58');
INSERT INTO `logs` VALUES (542, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 8 to cart', 'INFO', '2024-07-16 19:24:25');
INSERT INTO `logs` VALUES (543, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 0 to cart', 'INFO', '2024-07-16 19:24:30');
INSERT INTO `logs` VALUES (545, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 8 to cart', 'INFO', '2024-07-16 19:24:37');
INSERT INTO `logs` VALUES (546, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 11 to cart', 'INFO', '2024-07-16 19:24:40');
INSERT INTO `logs` VALUES (547, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 63 to cart', 'INFO', '2024-07-16 19:24:47');
INSERT INTO `logs` VALUES (548, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai lang Nhật xuất khẩu 0.9kg - 1.1kg', 'INFO', '2024-07-16 19:26:15');
INSERT INTO `logs` VALUES (549, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 45 to cart', 'INFO', '2024-07-16 19:26:21');
INSERT INTO `logs` VALUES (550, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:26:21');
INSERT INTO `logs` VALUES (551, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:26:33');
INSERT INTO `logs` VALUES (552, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 47 to cart', 'INFO', '2024-07-16 19:26:37');
INSERT INTO `logs` VALUES (553, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 47 to cart', 'INFO', '2024-07-16 19:26:42');
INSERT INTO `logs` VALUES (554, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 48 to cart', 'INFO', '2024-07-16 19:27:05');
INSERT INTO `logs` VALUES (555, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:27:07');
INSERT INTO `logs` VALUES (556, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 48 to cart', 'INFO', '2024-07-16 19:28:02');
INSERT INTO `logs` VALUES (557, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 46 to cart', 'INFO', '2024-07-16 19:28:04');
INSERT INTO `logs` VALUES (558, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 3 with quantity 0 to cart', 'INFO', '2024-07-16 19:44:56');
INSERT INTO `logs` VALUES (559, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 0 to cart', 'INFO', '2024-07-16 19:44:56');
INSERT INTO `logs` VALUES (560, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 0 to cart', 'INFO', '2024-07-16 19:44:57');
INSERT INTO `logs` VALUES (561, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-16 19:44:58');
INSERT INTO `logs` VALUES (562, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:45:02');
INSERT INTO `logs` VALUES (563, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 19:45:06');
INSERT INTO `logs` VALUES (565, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 55 to cart', 'INFO', '2024-07-16 19:45:19');
INSERT INTO `logs` VALUES (566, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 1 to cart', 'INFO', '2024-07-16 19:45:40');
INSERT INTO `logs` VALUES (567, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'INFO', '2024-07-16 19:47:26');
INSERT INTO `logs` VALUES (568, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 2 to cart', 'INFO', '2024-07-16 19:47:32');
INSERT INTO `logs` VALUES (569, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'INFO', '2024-07-16 19:47:35');
INSERT INTO `logs` VALUES (570, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 2 to cart', 'INFO', '2024-07-16 19:47:50');
INSERT INTO `logs` VALUES (571, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 2 to cart', 'INFO', '2024-07-16 19:47:59');
INSERT INTO `logs` VALUES (572, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:48:19');
INSERT INTO `logs` VALUES (573, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:49:20');
INSERT INTO `logs` VALUES (574, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:49:30');
INSERT INTO `logs` VALUES (575, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:49:34');
INSERT INTO `logs` VALUES (576, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:49:54');
INSERT INTO `logs` VALUES (577, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:50:03');
INSERT INTO `logs` VALUES (578, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:50:30');
INSERT INTO `logs` VALUES (579, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-16 19:50:55');
INSERT INTO `logs` VALUES (580, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-16 19:52:01');
INSERT INTO `logs` VALUES (581, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:52:20');
INSERT INTO `logs` VALUES (582, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:52:47');
INSERT INTO `logs` VALUES (583, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:54:00');
INSERT INTO `logs` VALUES (584, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:54:11');
INSERT INTO `logs` VALUES (585, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:54:22');
INSERT INTO `logs` VALUES (586, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:56:21');
INSERT INTO `logs` VALUES (587, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:56:24');
INSERT INTO `logs` VALUES (588, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:56:46');
INSERT INTO `logs` VALUES (589, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 19:56:52');
INSERT INTO `logs` VALUES (590, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 20:01:56');
INSERT INTO `logs` VALUES (591, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 30 to cart', 'INFO', '2024-07-16 20:04:33');
INSERT INTO `logs` VALUES (592, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 29 to cart', 'INFO', '2024-07-16 20:04:33');
INSERT INTO `logs` VALUES (593, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 28 to cart', 'INFO', '2024-07-16 20:04:34');
INSERT INTO `logs` VALUES (594, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 27 to cart', 'INFO', '2024-07-16 20:04:34');
INSERT INTO `logs` VALUES (595, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 26 to cart', 'INFO', '2024-07-16 20:04:36');
INSERT INTO `logs` VALUES (596, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 25 to cart', 'INFO', '2024-07-16 20:04:36');
INSERT INTO `logs` VALUES (597, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 24 to cart', 'INFO', '2024-07-16 20:04:37');
INSERT INTO `logs` VALUES (598, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 23 to cart', 'INFO', '2024-07-16 20:04:37');
INSERT INTO `logs` VALUES (599, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 22 to cart', 'INFO', '2024-07-16 20:04:37');
INSERT INTO `logs` VALUES (600, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 21 to cart', 'INFO', '2024-07-16 20:04:37');
INSERT INTO `logs` VALUES (601, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 20 to cart', 'INFO', '2024-07-16 20:04:37');
INSERT INTO `logs` VALUES (602, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 19 to cart', 'INFO', '2024-07-16 20:04:37');
INSERT INTO `logs` VALUES (603, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 18 to cart', 'INFO', '2024-07-16 20:04:38');
INSERT INTO `logs` VALUES (604, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 17 to cart', 'INFO', '2024-07-16 20:04:38');
INSERT INTO `logs` VALUES (605, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 16 to cart', 'INFO', '2024-07-16 20:04:38');
INSERT INTO `logs` VALUES (606, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 15 to cart', 'INFO', '2024-07-16 20:04:38');
INSERT INTO `logs` VALUES (607, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 14 to cart', 'INFO', '2024-07-16 20:04:38');
INSERT INTO `logs` VALUES (608, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 13 to cart', 'INFO', '2024-07-16 20:04:38');
INSERT INTO `logs` VALUES (609, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 12 to cart', 'INFO', '2024-07-16 20:04:39');
INSERT INTO `logs` VALUES (610, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 11 to cart', 'INFO', '2024-07-16 20:04:39');
INSERT INTO `logs` VALUES (611, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 10 to cart', 'INFO', '2024-07-16 20:04:39');
INSERT INTO `logs` VALUES (612, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 9 to cart', 'INFO', '2024-07-16 20:04:39');
INSERT INTO `logs` VALUES (613, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 8 to cart', 'INFO', '2024-07-16 20:04:39');
INSERT INTO `logs` VALUES (614, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 0 to cart', 'INFO', '2024-07-16 20:04:43');
INSERT INTO `logs` VALUES (615, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:04:44');
INSERT INTO `logs` VALUES (616, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 8 to cart', 'INFO', '2024-07-16 20:04:53');
INSERT INTO `logs` VALUES (617, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 2 to cart', 'INFO', '2024-07-16 20:04:56');
INSERT INTO `logs` VALUES (618, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:06:12');
INSERT INTO `logs` VALUES (619, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:08:57');
INSERT INTO `logs` VALUES (620, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:09:01');
INSERT INTO `logs` VALUES (621, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:10:15');
INSERT INTO `logs` VALUES (622, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:11:29');
INSERT INTO `logs` VALUES (623, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:11:29');
INSERT INTO `logs` VALUES (624, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lức huyết rồng PMT túi 2kg', 'INFO', '2024-07-16 20:11:35');
INSERT INTO `logs` VALUES (625, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 9 to cart', 'INFO', '2024-07-16 20:22:22');
INSERT INTO `logs` VALUES (626, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 3 to cart', 'INFO', '2024-07-16 20:22:24');
INSERT INTO `logs` VALUES (627, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 4 to cart', 'INFO', '2024-07-16 20:22:26');
INSERT INTO `logs` VALUES (628, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 5 to cart', 'INFO', '2024-07-16 20:22:26');
INSERT INTO `logs` VALUES (629, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 10 to cart', 'INFO', '2024-07-16 20:22:27');
INSERT INTO `logs` VALUES (630, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 11 to cart', 'INFO', '2024-07-16 20:22:28');
INSERT INTO `logs` VALUES (631, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 12 to cart', 'INFO', '2024-07-16 20:22:30');
INSERT INTO `logs` VALUES (632, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 13 to cart', 'INFO', '2024-07-16 20:22:30');
INSERT INTO `logs` VALUES (633, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 14 to cart', 'INFO', '2024-07-16 20:22:30');
INSERT INTO `logs` VALUES (634, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 15 to cart', 'INFO', '2024-07-16 20:22:31');
INSERT INTO `logs` VALUES (635, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 16 to cart', 'INFO', '2024-07-16 20:22:31');
INSERT INTO `logs` VALUES (636, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 17 to cart', 'INFO', '2024-07-16 20:22:31');
INSERT INTO `logs` VALUES (637, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 18 to cart', 'INFO', '2024-07-16 20:22:31');
INSERT INTO `logs` VALUES (638, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 19 to cart', 'INFO', '2024-07-16 20:22:31');
INSERT INTO `logs` VALUES (639, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 20 to cart', 'INFO', '2024-07-16 20:22:31');
INSERT INTO `logs` VALUES (640, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 21 to cart', 'INFO', '2024-07-16 20:22:32');
INSERT INTO `logs` VALUES (641, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 22 to cart', 'INFO', '2024-07-16 20:22:32');
INSERT INTO `logs` VALUES (642, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 23 to cart', 'INFO', '2024-07-16 20:22:32');
INSERT INTO `logs` VALUES (643, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 24 to cart', 'INFO', '2024-07-16 20:22:32');
INSERT INTO `logs` VALUES (644, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 25 to cart', 'INFO', '2024-07-16 20:22:32');
INSERT INTO `logs` VALUES (645, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 26 to cart', 'INFO', '2024-07-16 20:22:32');
INSERT INTO `logs` VALUES (646, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 27 to cart', 'INFO', '2024-07-16 20:22:33');
INSERT INTO `logs` VALUES (647, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 28 to cart', 'INFO', '2024-07-16 20:22:33');
INSERT INTO `logs` VALUES (648, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 29 to cart', 'INFO', '2024-07-16 20:22:33');
INSERT INTO `logs` VALUES (649, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 30 to cart', 'INFO', '2024-07-16 20:22:33');
INSERT INTO `logs` VALUES (650, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 31 to cart', 'INFO', '2024-07-16 20:22:33');
INSERT INTO `logs` VALUES (651, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 31 to cart', 'INFO', '2024-07-16 20:23:21');
INSERT INTO `logs` VALUES (652, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 6 to cart', 'INFO', '2024-07-16 20:30:46');
INSERT INTO `logs` VALUES (653, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 7 to cart', 'INFO', '2024-07-16 20:30:47');
INSERT INTO `logs` VALUES (654, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 8 to cart', 'INFO', '2024-07-16 20:30:47');
INSERT INTO `logs` VALUES (655, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 9 to cart', 'INFO', '2024-07-16 20:30:47');
INSERT INTO `logs` VALUES (656, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 10 to cart', 'INFO', '2024-07-16 20:30:47');
INSERT INTO `logs` VALUES (657, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 11 to cart', 'INFO', '2024-07-16 20:30:47');
INSERT INTO `logs` VALUES (658, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 12 to cart', 'INFO', '2024-07-16 20:30:48');
INSERT INTO `logs` VALUES (659, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 13 to cart', 'INFO', '2024-07-16 20:30:48');
INSERT INTO `logs` VALUES (660, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 14 to cart', 'INFO', '2024-07-16 20:30:48');
INSERT INTO `logs` VALUES (661, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 15 to cart', 'INFO', '2024-07-16 20:30:48');
INSERT INTO `logs` VALUES (662, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 16 to cart', 'INFO', '2024-07-16 20:30:48');
INSERT INTO `logs` VALUES (663, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 17 to cart', 'INFO', '2024-07-16 20:30:48');
INSERT INTO `logs` VALUES (664, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 18 to cart', 'INFO', '2024-07-16 20:30:48');
INSERT INTO `logs` VALUES (665, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 19 to cart', 'INFO', '2024-07-16 20:30:49');
INSERT INTO `logs` VALUES (666, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 20 to cart', 'INFO', '2024-07-16 20:30:49');
INSERT INTO `logs` VALUES (667, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 21 to cart', 'INFO', '2024-07-16 20:30:49');
INSERT INTO `logs` VALUES (668, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 22 to cart', 'INFO', '2024-07-16 20:30:49');
INSERT INTO `logs` VALUES (669, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 23 to cart', 'INFO', '2024-07-16 20:30:49');
INSERT INTO `logs` VALUES (670, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 24 to cart', 'INFO', '2024-07-16 20:30:49');
INSERT INTO `logs` VALUES (671, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 25 to cart', 'INFO', '2024-07-16 20:30:49');
INSERT INTO `logs` VALUES (672, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 26 to cart', 'INFO', '2024-07-16 20:30:50');
INSERT INTO `logs` VALUES (673, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 27 to cart', 'INFO', '2024-07-16 20:30:50');
INSERT INTO `logs` VALUES (674, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 28 to cart', 'INFO', '2024-07-16 20:30:50');
INSERT INTO `logs` VALUES (675, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 29 to cart', 'INFO', '2024-07-16 20:30:50');
INSERT INTO `logs` VALUES (676, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 30 to cart', 'INFO', '2024-07-16 20:30:50');
INSERT INTO `logs` VALUES (677, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 31 to cart', 'INFO', '2024-07-16 20:30:50');
INSERT INTO `logs` VALUES (678, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 32 to cart', 'INFO', '2024-07-16 20:30:51');
INSERT INTO `logs` VALUES (679, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 33 to cart', 'INFO', '2024-07-16 20:30:51');
INSERT INTO `logs` VALUES (680, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 34 to cart', 'INFO', '2024-07-16 20:30:51');
INSERT INTO `logs` VALUES (681, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 35 to cart', 'INFO', '2024-07-16 20:30:51');
INSERT INTO `logs` VALUES (682, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 36 to cart', 'INFO', '2024-07-16 20:30:51');
INSERT INTO `logs` VALUES (683, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 37 to cart', 'INFO', '2024-07-16 20:30:51');
INSERT INTO `logs` VALUES (684, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 38 to cart', 'INFO', '2024-07-16 20:30:52');
INSERT INTO `logs` VALUES (685, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 39 to cart', 'INFO', '2024-07-16 20:30:52');
INSERT INTO `logs` VALUES (686, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 40 to cart', 'INFO', '2024-07-16 20:30:52');
INSERT INTO `logs` VALUES (687, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 41 to cart', 'INFO', '2024-07-16 20:30:52');
INSERT INTO `logs` VALUES (688, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 42 to cart', 'INFO', '2024-07-16 20:30:52');
INSERT INTO `logs` VALUES (689, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 43 to cart', 'INFO', '2024-07-16 20:30:53');
INSERT INTO `logs` VALUES (690, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 44 to cart', 'INFO', '2024-07-16 20:30:53');
INSERT INTO `logs` VALUES (691, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 45 to cart', 'INFO', '2024-07-16 20:30:53');
INSERT INTO `logs` VALUES (692, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 46 to cart', 'INFO', '2024-07-16 20:30:53');
INSERT INTO `logs` VALUES (693, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 47 to cart', 'INFO', '2024-07-16 20:30:53');
INSERT INTO `logs` VALUES (694, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 48 to cart', 'INFO', '2024-07-16 20:30:53');
INSERT INTO `logs` VALUES (695, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 49 to cart', 'INFO', '2024-07-16 20:30:54');
INSERT INTO `logs` VALUES (696, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 50 to cart', 'INFO', '2024-07-16 20:30:54');
INSERT INTO `logs` VALUES (697, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 51 to cart', 'INFO', '2024-07-16 20:30:54');
INSERT INTO `logs` VALUES (698, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 52 to cart', 'INFO', '2024-07-16 20:30:54');
INSERT INTO `logs` VALUES (699, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 53 to cart', 'INFO', '2024-07-16 20:30:54');
INSERT INTO `logs` VALUES (700, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 54 to cart', 'INFO', '2024-07-16 20:30:54');
INSERT INTO `logs` VALUES (701, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 55 to cart', 'INFO', '2024-07-16 20:30:55');
INSERT INTO `logs` VALUES (702, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 54 to cart', 'INFO', '2024-07-16 20:30:57');
INSERT INTO `logs` VALUES (703, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 53 to cart', 'INFO', '2024-07-16 20:30:57');
INSERT INTO `logs` VALUES (704, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 54 to cart', 'INFO', '2024-07-16 20:30:58');
INSERT INTO `logs` VALUES (705, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 55 to cart', 'INFO', '2024-07-16 20:30:58');
INSERT INTO `logs` VALUES (706, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 3 to cart', 'INFO', '2024-07-16 20:35:20');
INSERT INTO `logs` VALUES (707, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 30 to cart', 'INFO', '2024-07-16 20:36:49');
INSERT INTO `logs` VALUES (708, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 29 to cart', 'INFO', '2024-07-16 20:36:49');
INSERT INTO `logs` VALUES (709, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 28 to cart', 'INFO', '2024-07-16 20:36:49');
INSERT INTO `logs` VALUES (710, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 27 to cart', 'INFO', '2024-07-16 20:36:50');
INSERT INTO `logs` VALUES (711, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 26 to cart', 'INFO', '2024-07-16 20:36:50');
INSERT INTO `logs` VALUES (712, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 0 to cart', 'INFO', '2024-07-16 20:36:51');
INSERT INTO `logs` VALUES (713, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 20:37:11');
INSERT INTO `logs` VALUES (714, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-16 20:37:15');
INSERT INTO `logs` VALUES (715, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 5 to cart', 'INFO', '2024-07-16 20:37:20');
INSERT INTO `logs` VALUES (716, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 4 to cart', 'INFO', '2024-07-16 20:38:34');
INSERT INTO `logs` VALUES (717, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 8 with quantity 5 to cart', 'INFO', '2024-07-16 20:38:34');
INSERT INTO `logs` VALUES (718, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-16 20:40:41');
INSERT INTO `logs` VALUES (719, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-16 20:40:50');
INSERT INTO `logs` VALUES (721, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 7 to cart', 'INFO', '2024-07-16 20:41:26');
INSERT INTO `logs` VALUES (722, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 8 to cart', 'INFO', '2024-07-16 20:41:26');
INSERT INTO `logs` VALUES (723, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 9 to cart', 'INFO', '2024-07-16 20:41:26');
INSERT INTO `logs` VALUES (724, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 10 to cart', 'INFO', '2024-07-16 20:41:27');
INSERT INTO `logs` VALUES (725, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 11 to cart', 'INFO', '2024-07-16 20:41:27');
INSERT INTO `logs` VALUES (726, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 12 to cart', 'INFO', '2024-07-16 20:41:27');
INSERT INTO `logs` VALUES (727, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 13 to cart', 'INFO', '2024-07-16 20:41:27');
INSERT INTO `logs` VALUES (728, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 14 to cart', 'INFO', '2024-07-16 20:41:27');
INSERT INTO `logs` VALUES (729, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 15 to cart', 'INFO', '2024-07-16 20:41:28');
INSERT INTO `logs` VALUES (730, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 16 to cart', 'INFO', '2024-07-16 20:41:28');
INSERT INTO `logs` VALUES (731, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 17 to cart', 'INFO', '2024-07-16 20:41:28');
INSERT INTO `logs` VALUES (732, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 18 to cart', 'INFO', '2024-07-16 20:41:28');
INSERT INTO `logs` VALUES (733, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 19 to cart', 'INFO', '2024-07-16 20:41:28');
INSERT INTO `logs` VALUES (734, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 20:41:29');
INSERT INTO `logs` VALUES (735, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 20:41:29');
INSERT INTO `logs` VALUES (736, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 22 to cart', 'INFO', '2024-07-16 20:41:29');
INSERT INTO `logs` VALUES (737, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai lang Nhật xuất khẩu 0.9kg - 1.1kg', 'INFO', '2024-07-16 20:42:01');
INSERT INTO `logs` VALUES (738, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 11 to cart', 'INFO', '2024-07-16 20:42:17');
INSERT INTO `logs` VALUES (739, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 11 with quantity 0 to cart', 'INFO', '2024-07-16 20:43:31');
INSERT INTO `logs` VALUES (740, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 20:43:47');
INSERT INTO `logs` VALUES (741, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 20:43:49');
INSERT INTO `logs` VALUES (742, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 19 to cart', 'INFO', '2024-07-16 20:43:49');
INSERT INTO `logs` VALUES (743, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 18 to cart', 'INFO', '2024-07-16 20:43:50');
INSERT INTO `logs` VALUES (744, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 17 to cart', 'INFO', '2024-07-16 20:43:50');
INSERT INTO `logs` VALUES (745, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 18 to cart', 'INFO', '2024-07-16 20:43:57');
INSERT INTO `logs` VALUES (746, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 19 to cart', 'INFO', '2024-07-16 20:43:58');
INSERT INTO `logs` VALUES (747, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 20:43:58');
INSERT INTO `logs` VALUES (748, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 20:43:58');
INSERT INTO `logs` VALUES (749, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 22 to cart', 'INFO', '2024-07-16 20:43:58');
INSERT INTO `logs` VALUES (750, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 20:43:59');
INSERT INTO `logs` VALUES (751, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 20:43:59');
INSERT INTO `logs` VALUES (752, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 19 to cart', 'INFO', '2024-07-16 20:43:59');
INSERT INTO `logs` VALUES (753, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 20:44:00');
INSERT INTO `logs` VALUES (754, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 20:44:00');
INSERT INTO `logs` VALUES (755, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 22 to cart', 'INFO', '2024-07-16 20:44:00');
INSERT INTO `logs` VALUES (756, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 23 to cart', 'INFO', '2024-07-16 20:44:00');
INSERT INTO `logs` VALUES (757, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 24 to cart', 'INFO', '2024-07-16 20:44:00');
INSERT INTO `logs` VALUES (758, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 23 to cart', 'INFO', '2024-07-16 20:44:05');
INSERT INTO `logs` VALUES (759, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 22 to cart', 'INFO', '2024-07-16 20:44:05');
INSERT INTO `logs` VALUES (760, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 20:44:05');
INSERT INTO `logs` VALUES (761, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 20:44:06');
INSERT INTO `logs` VALUES (762, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 19 to cart', 'INFO', '2024-07-16 20:44:06');
INSERT INTO `logs` VALUES (763, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 20 to cart', 'INFO', '2024-07-16 20:44:16');
INSERT INTO `logs` VALUES (764, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 21 to cart', 'INFO', '2024-07-16 20:44:16');
INSERT INTO `logs` VALUES (765, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 22 to cart', 'INFO', '2024-07-16 20:44:16');
INSERT INTO `logs` VALUES (766, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 23 to cart', 'INFO', '2024-07-16 20:44:17');
INSERT INTO `logs` VALUES (767, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 24 to cart', 'INFO', '2024-07-16 20:44:17');
INSERT INTO `logs` VALUES (768, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 25 to cart', 'INFO', '2024-07-16 20:44:17');
INSERT INTO `logs` VALUES (769, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 10:54:07');
INSERT INTO `logs` VALUES (770, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 10:54:16');
INSERT INTO `logs` VALUES (771, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 10:54:18');
INSERT INTO `logs` VALUES (772, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 63 to cart', 'INFO', '2024-07-17 10:54:25');
INSERT INTO `logs` VALUES (773, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productBắp nữ hoàng trái 250g trở lên', 'INFO', '2024-07-17 10:54:28');
INSERT INTO `logs` VALUES (774, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 62 to cart', 'INFO', '2024-07-17 10:54:34');
INSERT INTO `logs` VALUES (775, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-17 10:54:52');
INSERT INTO `logs` VALUES (776, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 10:54:53');
INSERT INTO `logs` VALUES (777, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 10:54:53');
INSERT INTO `logs` VALUES (778, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-17 10:54:53');
INSERT INTO `logs` VALUES (779, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 6 to cart', 'INFO', '2024-07-17 10:54:53');
INSERT INTO `logs` VALUES (780, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 7 to cart', 'INFO', '2024-07-17 10:56:09');
INSERT INTO `logs` VALUES (781, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 8 to cart', 'INFO', '2024-07-17 10:56:10');
INSERT INTO `logs` VALUES (782, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 9 to cart', 'INFO', '2024-07-17 10:56:10');
INSERT INTO `logs` VALUES (783, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 10 to cart', 'INFO', '2024-07-17 10:56:10');
INSERT INTO `logs` VALUES (784, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 11 to cart', 'INFO', '2024-07-17 10:56:10');
INSERT INTO `logs` VALUES (785, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 10 to cart', 'INFO', '2024-07-17 10:56:11');
INSERT INTO `logs` VALUES (786, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 9 to cart', 'INFO', '2024-07-17 10:56:11');
INSERT INTO `logs` VALUES (787, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 8 to cart', 'INFO', '2024-07-17 10:56:11');
INSERT INTO `logs` VALUES (788, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 7 to cart', 'INFO', '2024-07-17 10:56:11');
INSERT INTO `logs` VALUES (789, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 7 to cart', 'INFO', '2024-07-17 10:56:12');
INSERT INTO `logs` VALUES (790, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 8 to cart', 'INFO', '2024-07-17 10:56:12');
INSERT INTO `logs` VALUES (791, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 9 to cart', 'INFO', '2024-07-17 10:56:12');
INSERT INTO `logs` VALUES (792, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 10 to cart', 'INFO', '2024-07-17 10:56:12');
INSERT INTO `logs` VALUES (793, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 11 to cart', 'INFO', '2024-07-17 10:56:13');
INSERT INTO `logs` VALUES (794, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 12 to cart', 'INFO', '2024-07-17 10:56:13');
INSERT INTO `logs` VALUES (795, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 13 to cart', 'INFO', '2024-07-17 10:56:13');
INSERT INTO `logs` VALUES (796, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 14 to cart', 'INFO', '2024-07-17 10:56:13');
INSERT INTO `logs` VALUES (797, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 15 to cart', 'INFO', '2024-07-17 10:56:13');
INSERT INTO `logs` VALUES (798, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 16 to cart', 'INFO', '2024-07-17 10:56:13');
INSERT INTO `logs` VALUES (799, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 17 to cart', 'INFO', '2024-07-17 10:56:14');
INSERT INTO `logs` VALUES (800, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 18 to cart', 'INFO', '2024-07-17 10:56:14');
INSERT INTO `logs` VALUES (801, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 19 to cart', 'INFO', '2024-07-17 10:56:14');
INSERT INTO `logs` VALUES (802, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 20 to cart', 'INFO', '2024-07-17 10:56:14');
INSERT INTO `logs` VALUES (803, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 21 to cart', 'INFO', '2024-07-17 10:56:15');
INSERT INTO `logs` VALUES (804, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 22 to cart', 'INFO', '2024-07-17 10:56:15');
INSERT INTO `logs` VALUES (805, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 23 to cart', 'INFO', '2024-07-17 10:56:15');
INSERT INTO `logs` VALUES (806, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 24 to cart', 'INFO', '2024-07-17 10:56:15');
INSERT INTO `logs` VALUES (807, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 25 to cart', 'INFO', '2024-07-17 10:56:15');
INSERT INTO `logs` VALUES (808, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 26 to cart', 'INFO', '2024-07-17 10:56:15');
INSERT INTO `logs` VALUES (809, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 27 to cart', 'INFO', '2024-07-17 10:56:16');
INSERT INTO `logs` VALUES (810, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 28 to cart', 'INFO', '2024-07-17 10:56:16');
INSERT INTO `logs` VALUES (811, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 29 to cart', 'INFO', '2024-07-17 10:56:16');
INSERT INTO `logs` VALUES (812, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 30 to cart', 'INFO', '2024-07-17 10:56:16');
INSERT INTO `logs` VALUES (813, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 31 to cart', 'INFO', '2024-07-17 10:56:16');
INSERT INTO `logs` VALUES (814, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 32 to cart', 'INFO', '2024-07-17 10:56:16');
INSERT INTO `logs` VALUES (815, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 33 to cart', 'INFO', '2024-07-17 10:56:17');
INSERT INTO `logs` VALUES (816, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 34 to cart', 'INFO', '2024-07-17 10:56:17');
INSERT INTO `logs` VALUES (817, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 35 to cart', 'INFO', '2024-07-17 10:56:17');
INSERT INTO `logs` VALUES (818, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 36 to cart', 'INFO', '2024-07-17 10:56:17');
INSERT INTO `logs` VALUES (819, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 37 to cart', 'INFO', '2024-07-17 10:56:17');
INSERT INTO `logs` VALUES (820, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 38 to cart', 'INFO', '2024-07-17 10:56:18');
INSERT INTO `logs` VALUES (821, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 39 to cart', 'INFO', '2024-07-17 10:56:18');
INSERT INTO `logs` VALUES (822, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 40 to cart', 'INFO', '2024-07-17 10:56:18');
INSERT INTO `logs` VALUES (823, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 41 to cart', 'INFO', '2024-07-17 10:56:18');
INSERT INTO `logs` VALUES (824, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 42 to cart', 'INFO', '2024-07-17 10:56:18');
INSERT INTO `logs` VALUES (825, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 43 to cart', 'INFO', '2024-07-17 10:56:18');
INSERT INTO `logs` VALUES (826, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 44 to cart', 'INFO', '2024-07-17 10:56:19');
INSERT INTO `logs` VALUES (827, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 62 with quantity 45 to cart', 'INFO', '2024-07-17 10:56:19');
INSERT INTO `logs` VALUES (828, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 10:58:28');
INSERT INTO `logs` VALUES (829, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 6 with quantity 0 to cart', 'INFO', '2024-07-17 10:58:30');
INSERT INTO `logs` VALUES (830, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 62 with quantity 0 to cart', 'INFO', '2024-07-17 10:58:31');
INSERT INTO `logs` VALUES (831, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 10 to cart', 'INFO', '2024-07-17 10:58:33');
INSERT INTO `logs` VALUES (832, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Ngọc Sa Cỏ May túi 5kg', 'INFO', '2024-07-17 10:58:36');
INSERT INTO `logs` VALUES (834, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 11:00:41');
INSERT INTO `logs` VALUES (835, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 11:00:45');
INSERT INTO `logs` VALUES (836, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-17 11:00:55');
INSERT INTO `logs` VALUES (837, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 11:00:55');
INSERT INTO `logs` VALUES (838, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 11:00:55');
INSERT INTO `logs` VALUES (839, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-17 11:00:57');
INSERT INTO `logs` VALUES (840, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 6 to cart', 'INFO', '2024-07-17 11:00:57');
INSERT INTO `logs` VALUES (841, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 7 to cart', 'INFO', '2024-07-17 11:00:58');
INSERT INTO `logs` VALUES (842, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 8 to cart', 'INFO', '2024-07-17 11:00:58');
INSERT INTO `logs` VALUES (843, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 9 to cart', 'INFO', '2024-07-17 11:00:58');
INSERT INTO `logs` VALUES (844, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 8 to cart', 'INFO', '2024-07-17 11:00:59');
INSERT INTO `logs` VALUES (845, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 7 to cart', 'INFO', '2024-07-17 11:00:59');
INSERT INTO `logs` VALUES (846, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 6 to cart', 'INFO', '2024-07-17 11:00:59');
INSERT INTO `logs` VALUES (847, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-17 11:00:59');
INSERT INTO `logs` VALUES (848, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 11:01:00');
INSERT INTO `logs` VALUES (849, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 11:01:00');
INSERT INTO `logs` VALUES (850, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-17 11:01:00');
INSERT INTO `logs` VALUES (851, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 1 to cart', 'INFO', '2024-07-17 11:01:00');
INSERT INTO `logs` VALUES (852, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-17 11:01:00');
INSERT INTO `logs` VALUES (853, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 11:01:09');
INSERT INTO `logs` VALUES (854, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-17 11:01:11');
INSERT INTO `logs` VALUES (855, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-17 11:01:15');
INSERT INTO `logs` VALUES (856, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 11:05:46');
INSERT INTO `logs` VALUES (857, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 3 to cart', 'INFO', '2024-07-17 11:06:26');
INSERT INTO `logs` VALUES (858, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 2 to cart', 'INFO', '2024-07-17 11:16:15');
INSERT INTO `logs` VALUES (859, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 11:28:47');
INSERT INTO `logs` VALUES (860, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 11:28:48');
INSERT INTO `logs` VALUES (861, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 11:28:48');
INSERT INTO `logs` VALUES (862, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 5 to cart', 'INFO', '2024-07-17 11:28:48');
INSERT INTO `logs` VALUES (863, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 6 to cart', 'INFO', '2024-07-17 11:28:48');
INSERT INTO `logs` VALUES (864, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 7 to cart', 'INFO', '2024-07-17 11:28:48');
INSERT INTO `logs` VALUES (865, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 6 to cart', 'INFO', '2024-07-17 11:28:49');
INSERT INTO `logs` VALUES (866, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 5 to cart', 'INFO', '2024-07-17 11:28:49');
INSERT INTO `logs` VALUES (867, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 11:28:49');
INSERT INTO `logs` VALUES (868, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 11:28:49');
INSERT INTO `logs` VALUES (869, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 11:28:50');
INSERT INTO `logs` VALUES (870, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 5 to cart', 'INFO', '2024-07-17 11:28:51');
INSERT INTO `logs` VALUES (871, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 6 to cart', 'INFO', '2024-07-17 11:28:51');
INSERT INTO `logs` VALUES (872, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 7 to cart', 'INFO', '2024-07-17 11:28:51');
INSERT INTO `logs` VALUES (873, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 8 to cart', 'INFO', '2024-07-17 11:28:51');
INSERT INTO `logs` VALUES (874, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 9 to cart', 'INFO', '2024-07-17 11:28:51');
INSERT INTO `logs` VALUES (875, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 10 to cart', 'INFO', '2024-07-17 11:28:51');
INSERT INTO `logs` VALUES (876, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 9 to cart', 'INFO', '2024-07-17 11:29:06');
INSERT INTO `logs` VALUES (877, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 8 to cart', 'INFO', '2024-07-17 11:29:06');
INSERT INTO `logs` VALUES (878, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 7 to cart', 'INFO', '2024-07-17 11:29:06');
INSERT INTO `logs` VALUES (879, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 6 to cart', 'INFO', '2024-07-17 11:29:06');
INSERT INTO `logs` VALUES (880, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 5 to cart', 'INFO', '2024-07-17 11:29:06');
INSERT INTO `logs` VALUES (881, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 11:29:07');
INSERT INTO `logs` VALUES (882, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 11:29:07');
INSERT INTO `logs` VALUES (883, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 11:29:07');
INSERT INTO `logs` VALUES (884, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 11:29:27');
INSERT INTO `logs` VALUES (885, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 11:36:49');
INSERT INTO `logs` VALUES (886, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 10 to cart', 'INFO', '2024-07-17 11:36:52');
INSERT INTO `logs` VALUES (888, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 11:49:11');
INSERT INTO `logs` VALUES (890, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:02:22');
INSERT INTO `logs` VALUES (891, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-17 12:02:27');
INSERT INTO `logs` VALUES (892, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:03:40');
INSERT INTO `logs` VALUES (893, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:03:42');
INSERT INTO `logs` VALUES (894, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:03:53');
INSERT INTO `logs` VALUES (896, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:07:39');
INSERT INTO `logs` VALUES (897, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:08:02');
INSERT INTO `logs` VALUES (899, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:08:16');
INSERT INTO `logs` VALUES (900, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:12:11');
INSERT INTO `logs` VALUES (901, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 10 to cart', 'INFO', '2024-07-17 12:12:41');
INSERT INTO `logs` VALUES (902, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Ngọc Sa Cỏ May túi 5kg', 'INFO', '2024-07-17 12:12:56');
INSERT INTO `logs` VALUES (903, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 10 to cart', 'INFO', '2024-07-17 12:13:04');
INSERT INTO `logs` VALUES (904, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 6 with quantity 2 to cart', 'INFO', '2024-07-17 12:13:58');
INSERT INTO `logs` VALUES (905, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 12:13:58');
INSERT INTO `logs` VALUES (906, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 12:13:58');
INSERT INTO `logs` VALUES (907, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 6 with quantity 5 to cart', 'INFO', '2024-07-17 12:13:59');
INSERT INTO `logs` VALUES (908, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 6 with quantity 6 to cart', 'INFO', '2024-07-17 12:13:59');
INSERT INTO `logs` VALUES (909, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 12:28:36');
INSERT INTO `logs` VALUES (910, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 13:43:55');
INSERT INTO `logs` VALUES (911, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 13:44:00');
INSERT INTO `logs` VALUES (912, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 13:56:09');
INSERT INTO `logs` VALUES (913, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 13:56:44');
INSERT INTO `logs` VALUES (914, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 13:58:19');
INSERT INTO `logs` VALUES (915, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:18:46');
INSERT INTO `logs` VALUES (916, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 10 to cart', 'INFO', '2024-07-17 14:18:50');
INSERT INTO `logs` VALUES (918, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 5 to cart', 'INFO', '2024-07-17 14:18:55');
INSERT INTO `logs` VALUES (919, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 1 to cart', 'INFO', '2024-07-17 14:18:57');
INSERT INTO `logs` VALUES (920, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-17 14:18:59');
INSERT INTO `logs` VALUES (921, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 14 to cart', 'INFO', '2024-07-17 14:19:06');
INSERT INTO `logs` VALUES (922, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:31:51');
INSERT INTO `logs` VALUES (923, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:31:59');
INSERT INTO `logs` VALUES (924, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:32:08');
INSERT INTO `logs` VALUES (926, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:32:14');
INSERT INTO `logs` VALUES (927, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:32:18');
INSERT INTO `logs` VALUES (928, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 5 to cart', 'INFO', '2024-07-17 14:32:21');
INSERT INTO `logs` VALUES (929, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:38:46');
INSERT INTO `logs` VALUES (930, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:38:49');
INSERT INTO `logs` VALUES (931, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 5 with quantity 0 to cart', 'INFO', '2024-07-17 14:41:13');
INSERT INTO `logs` VALUES (932, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:41:34');
INSERT INTO `logs` VALUES (933, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:41:43');
INSERT INTO `logs` VALUES (934, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:41:48');
INSERT INTO `logs` VALUES (936, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productYến mạch nguyên chất Oatmeal Cereal gói 350g', 'INFO', '2024-07-17 14:43:06');
INSERT INTO `logs` VALUES (937, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:43:08');
INSERT INTO `logs` VALUES (938, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:43:10');
INSERT INTO `logs` VALUES (939, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:43:12');
INSERT INTO `logs` VALUES (940, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 6 to cart', 'INFO', '2024-07-17 14:43:15');
INSERT INTO `logs` VALUES (941, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 10 to cart', 'INFO', '2024-07-17 14:43:16');
INSERT INTO `logs` VALUES (942, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:43:25');
INSERT INTO `logs` VALUES (943, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:43:27');
INSERT INTO `logs` VALUES (944, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:43:29');
INSERT INTO `logs` VALUES (945, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:43:30');
INSERT INTO `logs` VALUES (946, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 6 to cart', 'INFO', '2024-07-17 14:43:32');
INSERT INTO `logs` VALUES (947, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:44:32');
INSERT INTO `logs` VALUES (948, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:44:35');
INSERT INTO `logs` VALUES (949, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:44:57');
INSERT INTO `logs` VALUES (950, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:45:16');
INSERT INTO `logs` VALUES (951, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:45:28');
INSERT INTO `logs` VALUES (952, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:48:04');
INSERT INTO `logs` VALUES (953, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:48:05');
INSERT INTO `logs` VALUES (954, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:48:07');
INSERT INTO `logs` VALUES (955, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:48:36');
INSERT INTO `logs` VALUES (956, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:50:36');
INSERT INTO `logs` VALUES (957, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:53:40');
INSERT INTO `logs` VALUES (958, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:53:52');
INSERT INTO `logs` VALUES (959, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:54:14');
INSERT INTO `logs` VALUES (960, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:54:23');
INSERT INTO `logs` VALUES (961, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:54:49');
INSERT INTO `logs` VALUES (962, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:55:04');
INSERT INTO `logs` VALUES (963, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'INFO', '2024-07-17 14:55:10');
INSERT INTO `logs` VALUES (964, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lài sữa Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:55:15');
INSERT INTO `logs` VALUES (965, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productYến mạch nguyên chất Oatmeal Cereal gói 350g', 'INFO', '2024-07-17 14:55:19');
INSERT INTO `logs` VALUES (966, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-17 14:55:23');
INSERT INTO `logs` VALUES (967, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:55:29');
INSERT INTO `logs` VALUES (968, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 12 to cart', 'INFO', '2024-07-17 14:55:34');
INSERT INTO `logs` VALUES (969, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 14 to cart', 'INFO', '2024-07-17 14:55:36');
INSERT INTO `logs` VALUES (970, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-17 14:55:46');
INSERT INTO `logs` VALUES (971, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:55:48');
INSERT INTO `logs` VALUES (972, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productChuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'INFO', '2024-07-17 14:55:50');
INSERT INTO `logs` VALUES (973, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productChuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'INFO', '2024-07-17 14:55:59');
INSERT INTO `logs` VALUES (974, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai môn 450g - 550g (1 củ)', 'INFO', '2024-07-17 14:56:02');
INSERT INTO `logs` VALUES (975, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai môn 450g - 550g (1 củ)', 'INFO', '2024-07-17 14:56:05');
INSERT INTO `logs` VALUES (976, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 17 to cart', 'INFO', '2024-07-17 14:56:07');
INSERT INTO `logs` VALUES (977, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-17 14:56:11');
INSERT INTO `logs` VALUES (978, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 1 to cart', 'INFO', '2024-07-17 14:56:13');
INSERT INTO `logs` VALUES (979, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 24 to cart', 'INFO', '2024-07-17 14:56:16');
INSERT INTO `logs` VALUES (980, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 4 to cart', 'INFO', '2024-07-17 14:56:18');
INSERT INTO `logs` VALUES (981, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 1 to cart', 'INFO', '2024-07-17 14:56:19');
INSERT INTO `logs` VALUES (982, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productYến mạch nguyên chất Oatmeal Cereal gói 350g', 'INFO', '2024-07-17 14:56:23');
INSERT INTO `logs` VALUES (983, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm Vua Gạo ST25 túi 5kg', 'INFO', '2024-07-17 14:56:26');
INSERT INTO `logs` VALUES (984, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-17 14:56:29');
INSERT INTO `logs` VALUES (985, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 14:56:32');
INSERT INTO `logs` VALUES (986, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-17 14:56:36');
INSERT INTO `logs` VALUES (987, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:56:37');
INSERT INTO `logs` VALUES (988, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 14:56:40');
INSERT INTO `logs` VALUES (989, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productChuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'INFO', '2024-07-17 14:56:44');
INSERT INTO `logs` VALUES (990, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productChuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'INFO', '2024-07-17 14:56:46');
INSERT INTO `logs` VALUES (991, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 14:56:48');
INSERT INTO `logs` VALUES (992, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 33 to cart', 'INFO', '2024-07-17 14:56:53');
INSERT INTO `logs` VALUES (993, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 19 to cart', 'INFO', '2024-07-17 14:59:02');
INSERT INTO `logs` VALUES (994, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 14 with quantity 0 to cart', 'INFO', '2024-07-17 14:59:18');
INSERT INTO `logs` VALUES (995, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 0 to cart', 'INFO', '2024-07-17 14:59:19');
INSERT INTO `logs` VALUES (996, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 4 with quantity 0 to cart', 'INFO', '2024-07-17 14:59:19');
INSERT INTO `logs` VALUES (997, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 33 with quantity 0 to cart', 'INFO', '2024-07-17 14:59:19');
INSERT INTO `logs` VALUES (998, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 19 with quantity 0 to cart', 'INFO', '2024-07-17 14:59:20');
INSERT INTO `logs` VALUES (999, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 70 to cart', 'INFO', '2024-07-17 14:59:22');
INSERT INTO `logs` VALUES (1000, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 56 to cart', 'INFO', '2024-07-17 14:59:30');
INSERT INTO `logs` VALUES (1001, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:00:27');
INSERT INTO `logs` VALUES (1002, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-17 15:00:34');
INSERT INTO `logs` VALUES (1003, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 35 to cart', 'INFO', '2024-07-17 15:00:38');
INSERT INTO `logs` VALUES (1004, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:01:11');
INSERT INTO `logs` VALUES (1005, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:01:18');
INSERT INTO `logs` VALUES (1006, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 35 with quantity 0 to cart', 'INFO', '2024-07-17 15:01:19');
INSERT INTO `logs` VALUES (1007, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 70 with quantity 0 to cart', 'INFO', '2024-07-17 15:01:20');
INSERT INTO `logs` VALUES (1008, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 56 with quantity 0 to cart', 'INFO', '2024-07-17 15:01:21');
INSERT INTO `logs` VALUES (1009, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:01:21');
INSERT INTO `logs` VALUES (1010, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 15:01:24');
INSERT INTO `logs` VALUES (1011, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:02:01');
INSERT INTO `logs` VALUES (1012, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-17 15:02:10');
INSERT INTO `logs` VALUES (1013, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 19 to cart', 'INFO', '2024-07-17 15:02:14');
INSERT INTO `logs` VALUES (1014, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:02:29');
INSERT INTO `logs` VALUES (1015, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 56 to cart', 'INFO', '2024-07-17 15:02:32');
INSERT INTO `logs` VALUES (1016, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 27 to cart', 'INFO', '2024-07-17 15:02:35');
INSERT INTO `logs` VALUES (1017, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:04:26');
INSERT INTO `logs` VALUES (1018, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 26 to cart', 'INFO', '2024-07-17 15:04:29');
INSERT INTO `logs` VALUES (1019, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:05:11');
INSERT INTO `logs` VALUES (1020, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:05:17');
INSERT INTO `logs` VALUES (1021, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:05:22');
INSERT INTO `logs` VALUES (1022, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Ngọc Sa Cỏ May túi 5kg', 'INFO', '2024-07-17 15:05:27');
INSERT INTO `logs` VALUES (1023, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:05:57');
INSERT INTO `logs` VALUES (1024, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 14 to cart', 'INFO', '2024-07-17 15:06:01');
INSERT INTO `logs` VALUES (1025, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 19 with quantity 2 to cart', 'INFO', '2024-07-17 15:06:03');
INSERT INTO `logs` VALUES (1026, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 19 with quantity 3 to cart', 'INFO', '2024-07-17 15:06:04');
INSERT INTO `logs` VALUES (1027, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 19 with quantity 4 to cart', 'INFO', '2024-07-17 15:06:04');
INSERT INTO `logs` VALUES (1028, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 19 with quantity 5 to cart', 'INFO', '2024-07-17 15:06:04');
INSERT INTO `logs` VALUES (1029, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:06:13');
INSERT INTO `logs` VALUES (1030, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:06:15');
INSERT INTO `logs` VALUES (1031, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:06:19');
INSERT INTO `logs` VALUES (1032, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:06:52');
INSERT INTO `logs` VALUES (1033, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:07:45');
INSERT INTO `logs` VALUES (1034, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productKhoai lang Nhật xuất khẩu 0.9kg - 1.1kg', 'INFO', '2024-07-17 15:07:49');
INSERT INTO `logs` VALUES (1035, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:07:55');
INSERT INTO `logs` VALUES (1036, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:08:40');
INSERT INTO `logs` VALUES (1037, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productĐậu trắng bi 150g', 'INFO', '2024-07-17 15:09:19');
INSERT INTO `logs` VALUES (1038, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productYến mạch trái cây Sunrise vị phô mai bịch 300g', 'INFO', '2024-07-17 15:09:22');
INSERT INTO `logs` VALUES (1039, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-17 15:09:24');
INSERT INTO `logs` VALUES (1040, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:09:25');
INSERT INTO `logs` VALUES (1041, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:09:27');
INSERT INTO `logs` VALUES (1042, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:09:45');
INSERT INTO `logs` VALUES (1043, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:09:47');
INSERT INTO `logs` VALUES (1044, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:09:49');
INSERT INTO `logs` VALUES (1045, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:10:47');
INSERT INTO `logs` VALUES (1046, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:10:49');
INSERT INTO `logs` VALUES (1047, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:10:52');
INSERT INTO `logs` VALUES (1048, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:10:55');
INSERT INTO `logs` VALUES (1049, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:10:57');
INSERT INTO `logs` VALUES (1050, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:11:03');
INSERT INTO `logs` VALUES (1051, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productChuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'INFO', '2024-07-17 15:11:19');
INSERT INTO `logs` VALUES (1052, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:11:40');
INSERT INTO `logs` VALUES (1053, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productĐậu phộng vị tỏi ớt Phi Yến hũ 180g', 'INFO', '2024-07-17 15:11:43');
INSERT INTO `logs` VALUES (1054, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productYến mạch nguyên chất Oatmeal Cereal gói 350g', 'INFO', '2024-07-17 15:11:47');
INSERT INTO `logs` VALUES (1055, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:11:48');
INSERT INTO `logs` VALUES (1056, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:11:51');
INSERT INTO `logs` VALUES (1057, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:14:22');
INSERT INTO `logs` VALUES (1058, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 15:14:25');
INSERT INTO `logs` VALUES (1059, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-17 15:14:34');
INSERT INTO `logs` VALUES (1060, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:15:05');
INSERT INTO `logs` VALUES (1061, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-17 15:15:07');
INSERT INTO `logs` VALUES (1062, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:15:23');
INSERT INTO `logs` VALUES (1063, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:15:50');
INSERT INTO `logs` VALUES (1064, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:16:03');
INSERT INTO `logs` VALUES (1065, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 3 to cart', 'INFO', '2024-07-17 15:16:09');
INSERT INTO `logs` VALUES (1066, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 15:16:11');
INSERT INTO `logs` VALUES (1067, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 15:17:20');
INSERT INTO `logs` VALUES (1068, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 15:17:22');
INSERT INTO `logs` VALUES (1069, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:17:23');
INSERT INTO `logs` VALUES (1070, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 4 to cart', 'INFO', '2024-07-17 15:17:26');
INSERT INTO `logs` VALUES (1071, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo lài sữa Đồng Việt túi 5kg', 'INFO', '2024-07-17 15:17:28');
INSERT INTO `logs` VALUES (1072, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 15:18:18');
INSERT INTO `logs` VALUES (1073, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 15:18:23');
INSERT INTO `logs` VALUES (1074, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 15:18:38');
INSERT INTO `logs` VALUES (1075, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:23:08');
INSERT INTO `logs` VALUES (1076, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:23:46');
INSERT INTO `logs` VALUES (1077, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:25:01');
INSERT INTO `logs` VALUES (1078, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:25:44');
INSERT INTO `logs` VALUES (1079, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:26:28');
INSERT INTO `logs` VALUES (1080, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:30:14');
INSERT INTO `logs` VALUES (1081, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 15:50:14');
INSERT INTO `logs` VALUES (1082, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 19 with quantity 0 to cart', 'INFO', '2024-07-17 15:50:18');
INSERT INTO `logs` VALUES (1083, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 3 with quantity 0 to cart', 'INFO', '2024-07-17 15:50:19');
INSERT INTO `logs` VALUES (1084, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 4 with quantity 0 to cart', 'INFO', '2024-07-17 15:50:20');
INSERT INTO `logs` VALUES (1085, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 56 with quantity 0 to cart', 'INFO', '2024-07-17 15:50:21');
INSERT INTO `logs` VALUES (1086, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 26 with quantity 0 to cart', 'INFO', '2024-07-17 15:50:21');
INSERT INTO `logs` VALUES (1087, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 27 with quantity 0 to cart', 'INFO', '2024-07-17 15:50:21');
INSERT INTO `logs` VALUES (1088, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 14 with quantity 0 to cart', 'INFO', '2024-07-17 15:50:22');
INSERT INTO `logs` VALUES (1089, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 1 to cart', 'INFO', '2024-07-17 15:51:48');
INSERT INTO `logs` VALUES (1090, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-17 15:51:50');
INSERT INTO `logs` VALUES (1091, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 2 to cart', 'INFO', '2024-07-17 15:51:54');
INSERT INTO `logs` VALUES (1092, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 3 to cart', 'INFO', '2024-07-17 15:52:56');
INSERT INTO `logs` VALUES (1093, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 3 with quantity 0 to cart', 'INFO', '2024-07-17 15:53:01');
INSERT INTO `logs` VALUES (1094, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 0 to cart', 'INFO', '2024-07-17 15:53:04');
INSERT INTO `logs` VALUES (1096, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 15:53:22');
INSERT INTO `logs` VALUES (1097, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 15:54:51');
INSERT INTO `logs` VALUES (1098, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'INFO', '2024-07-17 15:54:51');
INSERT INTO `logs` VALUES (1099, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 16:23:42');
INSERT INTO `logs` VALUES (1100, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 1 to cart', 'INFO', '2024-07-17 16:23:49');
INSERT INTO `logs` VALUES (1102, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 4 with quantity 0 to cart', 'INFO', '2024-07-17 16:33:25');
INSERT INTO `logs` VALUES (1104, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 16:39:41');
INSERT INTO `logs` VALUES (1105, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 16:39:41');
INSERT INTO `logs` VALUES (1106, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 16:39:42');
INSERT INTO `logs` VALUES (1108, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 16:49:36');
INSERT INTO `logs` VALUES (1109, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 16:49:36');
INSERT INTO `logs` VALUES (1110, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 16:49:37');
INSERT INTO `logs` VALUES (1111, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 16:51:07');
INSERT INTO `logs` VALUES (1112, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 9 to cart', 'INFO', '2024-07-17 16:51:17');
INSERT INTO `logs` VALUES (1113, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 7 to cart', 'INFO', '2024-07-17 16:51:19');
INSERT INTO `logs` VALUES (1114, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 7 with quantity 2 to cart', 'INFO', '2024-07-17 16:51:43');
INSERT INTO `logs` VALUES (1115, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 7 with quantity 3 to cart', 'INFO', '2024-07-17 16:51:43');
INSERT INTO `logs` VALUES (1116, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 7 with quantity 4 to cart', 'INFO', '2024-07-17 16:51:43');
INSERT INTO `logs` VALUES (1117, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 7 with quantity 5 to cart', 'INFO', '2024-07-17 16:51:43');
INSERT INTO `logs` VALUES (1118, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 16:53:11');
INSERT INTO `logs` VALUES (1119, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long add product 2 to cart', 'INFO', '2024-07-17 16:53:24');
INSERT INTO `logs` VALUES (1120, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 6 with quantity 0 to cart', 'INFO', '2024-07-17 16:53:27');
INSERT INTO `logs` VALUES (1121, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 2 with quantity 0 to cart', 'INFO', '2024-07-17 16:53:28');
INSERT INTO `logs` VALUES (1122, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 5 with quantity 2 to cart', 'INFO', '2024-07-17 16:53:29');
INSERT INTO `logs` VALUES (1123, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 5 with quantity 3 to cart', 'INFO', '2024-07-17 16:53:29');
INSERT INTO `logs` VALUES (1124, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Trần Văn Long update product 5 with quantity 4 to cart', 'INFO', '2024-07-17 16:53:29');
INSERT INTO `logs` VALUES (1126, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 0 to cart', 'INFO', '2024-07-17 16:59:37');
INSERT INTO `logs` VALUES (1127, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan add product 1 to cart', 'INFO', '2024-07-17 16:59:44');
INSERT INTO `logs` VALUES (1129, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'INFO', '2024-07-17 16:59:51');
INSERT INTO `logs` VALUES (1130, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 16:59:53');
INSERT INTO `logs` VALUES (1131, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 16:59:54');
INSERT INTO `logs` VALUES (1132, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 16:59:54');
INSERT INTO `logs` VALUES (1133, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 5 to cart', 'INFO', '2024-07-17 16:59:54');
INSERT INTO `logs` VALUES (1134, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 6 to cart', 'INFO', '2024-07-17 16:59:54');
INSERT INTO `logs` VALUES (1135, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 7 to cart', 'INFO', '2024-07-17 16:59:54');
INSERT INTO `logs` VALUES (1136, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 8 to cart', 'INFO', '2024-07-17 16:59:55');
INSERT INTO `logs` VALUES (1137, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 9 to cart', 'INFO', '2024-07-17 16:59:59');
INSERT INTO `logs` VALUES (1138, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 8 to cart', 'INFO', '2024-07-17 17:00:02');
INSERT INTO `logs` VALUES (1139, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 7 to cart', 'INFO', '2024-07-17 17:00:02');
INSERT INTO `logs` VALUES (1140, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 6 to cart', 'INFO', '2024-07-17 17:00:03');
INSERT INTO `logs` VALUES (1141, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 5 to cart', 'INFO', '2024-07-17 17:00:03');
INSERT INTO `logs` VALUES (1142, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 17:00:03');
INSERT INTO `logs` VALUES (1144, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'INFO', '2024-07-17 17:03:00');
INSERT INTO `logs` VALUES (1145, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:04:31');
INSERT INTO `logs` VALUES (1146, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:04:34');
INSERT INTO `logs` VALUES (1147, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:04:50');
INSERT INTO `logs` VALUES (1148, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 2 to cart', 'INFO', '2024-07-17 17:05:02');
INSERT INTO `logs` VALUES (1149, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:08:50');
INSERT INTO `logs` VALUES (1150, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 17:08:51');
INSERT INTO `logs` VALUES (1151, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 17:08:51');
INSERT INTO `logs` VALUES (1152, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 17:08:52');
INSERT INTO `logs` VALUES (1153, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:08:52');
INSERT INTO `logs` VALUES (1154, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 1 to cart', 'INFO', '2024-07-17 17:08:52');
INSERT INTO `logs` VALUES (1155, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 0 to cart', 'INFO', '2024-07-17 17:08:53');
INSERT INTO `logs` VALUES (1156, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 2 to cart', 'INFO', '2024-07-17 17:08:54');
INSERT INTO `logs` VALUES (1157, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:09:02');
INSERT INTO `logs` VALUES (1158, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 17:09:02');
INSERT INTO `logs` VALUES (1159, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 17:09:03');
INSERT INTO `logs` VALUES (1160, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 17:09:09');
INSERT INTO `logs` VALUES (1161, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:09:09');
INSERT INTO `logs` VALUES (1162, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 1 to cart', 'INFO', '2024-07-17 17:09:10');
INSERT INTO `logs` VALUES (1163, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:09:30');
INSERT INTO `logs` VALUES (1164, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 17:09:30');
INSERT INTO `logs` VALUES (1165, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 0 to cart', 'INFO', '2024-07-17 17:09:34');
INSERT INTO `logs` VALUES (1166, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 3 to cart', 'INFO', '2024-07-17 17:09:35');
INSERT INTO `logs` VALUES (1167, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:10:30');
INSERT INTO `logs` VALUES (1168, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 3 with quantity 0 to cart', 'INFO', '2024-07-17 17:10:32');
INSERT INTO `logs` VALUES (1169, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-17 17:10:35');
INSERT INTO `logs` VALUES (1170, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:10:37');
INSERT INTO `logs` VALUES (1171, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:11:00');
INSERT INTO `logs` VALUES (1172, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-17 17:11:03');
INSERT INTO `logs` VALUES (1173, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:11:04');
INSERT INTO `logs` VALUES (1174, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:17:36');
INSERT INTO `logs` VALUES (1175, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:17:36');
INSERT INTO `logs` VALUES (1176, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:17:50');
INSERT INTO `logs` VALUES (1177, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 17:17:52');
INSERT INTO `logs` VALUES (1178, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:17:53');
INSERT INTO `logs` VALUES (1179, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-17 17:17:57');
INSERT INTO `logs` VALUES (1180, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:18:00');
INSERT INTO `logs` VALUES (1181, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-17 17:18:03');
INSERT INTO `logs` VALUES (1182, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:21:48');
INSERT INTO `logs` VALUES (1183, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:21:54');
INSERT INTO `logs` VALUES (1184, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 2 to cart', 'INFO', '2024-07-17 17:22:01');
INSERT INTO `logs` VALUES (1185, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 1 to cart', 'INFO', '2024-07-17 17:22:02');
INSERT INTO `logs` VALUES (1186, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 0 to cart', 'INFO', '2024-07-17 17:22:02');
INSERT INTO `logs` VALUES (1187, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:22:04');
INSERT INTO `logs` VALUES (1188, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 1 to cart', 'INFO', '2024-07-17 17:22:08');
INSERT INTO `logs` VALUES (1189, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-17 17:22:10');
INSERT INTO `logs` VALUES (1190, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-17 17:22:14');
INSERT INTO `logs` VALUES (1191, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-17 17:22:20');
INSERT INTO `logs` VALUES (1192, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:26:12');
INSERT INTO `logs` VALUES (1193, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:26:19');
INSERT INTO `logs` VALUES (1194, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-17 17:26:32');
INSERT INTO `logs` VALUES (1195, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:26:33');
INSERT INTO `logs` VALUES (1196, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:26:37');
INSERT INTO `logs` VALUES (1197, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:27:07');
INSERT INTO `logs` VALUES (1198, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:27:11');
INSERT INTO `logs` VALUES (1199, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:29:23');
INSERT INTO `logs` VALUES (1200, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:29:29');
INSERT INTO `logs` VALUES (1201, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:30:21');
INSERT INTO `logs` VALUES (1202, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:30:26');
INSERT INTO `logs` VALUES (1203, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:32:12');
INSERT INTO `logs` VALUES (1204, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-17 17:32:27');
INSERT INTO `logs` VALUES (1205, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-17 17:32:29');
INSERT INTO `logs` VALUES (1206, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:32:32');
INSERT INTO `logs` VALUES (1207, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:33:33');
INSERT INTO `logs` VALUES (1208, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 17:33:40');
INSERT INTO `logs` VALUES (1209, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-17 17:33:42');
INSERT INTO `logs` VALUES (1210, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 17:33:43');
INSERT INTO `logs` VALUES (1211, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 17:33:43');
INSERT INTO `logs` VALUES (1212, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-17 17:33:43');
INSERT INTO `logs` VALUES (1213, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 6 to cart', 'INFO', '2024-07-17 17:33:44');
INSERT INTO `logs` VALUES (1214, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-17 17:33:45');
INSERT INTO `logs` VALUES (1215, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 17:33:45');
INSERT INTO `logs` VALUES (1216, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 17:33:45');
INSERT INTO `logs` VALUES (1217, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-17 17:33:46');
INSERT INTO `logs` VALUES (1218, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 17:33:46');
INSERT INTO `logs` VALUES (1219, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 17:33:46');
INSERT INTO `logs` VALUES (1220, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:35:17');
INSERT INTO `logs` VALUES (1222, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 17:47:47');
INSERT INTO `logs` VALUES (1223, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 17:47:48');
INSERT INTO `logs` VALUES (1224, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 17:47:48');
INSERT INTO `logs` VALUES (1225, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 17:56:38');
INSERT INTO `logs` VALUES (1226, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-17 18:16:38');
INSERT INTO `logs` VALUES (1227, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-17 18:16:51');
INSERT INTO `logs` VALUES (1228, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-17 18:16:53');
INSERT INTO `logs` VALUES (1229, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-17 18:16:53');
INSERT INTO `logs` VALUES (1230, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-17 18:16:53');
INSERT INTO `logs` VALUES (1231, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-17 18:16:53');
INSERT INTO `logs` VALUES (1233, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 2 to cart', 'INFO', '2024-07-17 18:32:33');
INSERT INTO `logs` VALUES (1234, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 3 to cart', 'INFO', '2024-07-17 18:32:34');
INSERT INTO `logs` VALUES (1235, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 4 to cart', 'INFO', '2024-07-17 18:32:34');
INSERT INTO `logs` VALUES (1236, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 2 with quantity 5 to cart', 'INFO', '2024-07-17 18:32:34');
INSERT INTO `logs` VALUES (1237, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:21:20');
INSERT INTO `logs` VALUES (1238, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:22:14');
INSERT INTO `logs` VALUES (1239, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-18 16:22:17');
INSERT INTO `logs` VALUES (1240, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-18 16:22:17');
INSERT INTO `logs` VALUES (1241, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-18 16:22:17');
INSERT INTO `logs` VALUES (1242, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-18 16:22:17');
INSERT INTO `logs` VALUES (1243, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 6 to cart', 'INFO', '2024-07-18 16:22:17');
INSERT INTO `logs` VALUES (1244, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-18 16:22:19');
INSERT INTO `logs` VALUES (1245, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:22:26');
INSERT INTO `logs` VALUES (1246, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-18 16:22:36');
INSERT INTO `logs` VALUES (1247, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:22:48');
INSERT INTO `logs` VALUES (1248, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:24:08');
INSERT INTO `logs` VALUES (1249, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-18 16:24:26');
INSERT INTO `logs` VALUES (1250, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:24:30');
INSERT INTO `logs` VALUES (1251, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:25:01');
INSERT INTO `logs` VALUES (1252, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:25:07');
INSERT INTO `logs` VALUES (1253, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:27:15');
INSERT INTO `logs` VALUES (1254, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-18 16:27:20');
INSERT INTO `logs` VALUES (1255, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:27:23');
INSERT INTO `logs` VALUES (1256, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 2 to cart', 'INFO', '2024-07-18 16:27:25');
INSERT INTO `logs` VALUES (1257, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 3 to cart', 'INFO', '2024-07-18 16:27:25');
INSERT INTO `logs` VALUES (1258, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 4 to cart', 'INFO', '2024-07-18 16:27:25');
INSERT INTO `logs` VALUES (1259, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 5 to cart', 'INFO', '2024-07-18 16:27:25');
INSERT INTO `logs` VALUES (1260, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-18 16:27:26');
INSERT INTO `logs` VALUES (1261, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-18 16:27:29');
INSERT INTO `logs` VALUES (1262, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo ST25 Đồng Việt túi 5kg', 'INFO', '2024-07-18 16:27:32');
INSERT INTO `logs` VALUES (1263, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-18 16:27:37');
INSERT INTO `logs` VALUES (1264, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-18 16:27:46');
INSERT INTO `logs` VALUES (1265, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-18 16:27:57');
INSERT INTO `logs` VALUES (1266, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 8 to cart', 'INFO', '2024-07-18 16:28:05');
INSERT INTO `logs` VALUES (1267, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 9 to cart', 'INFO', '2024-07-18 16:28:06');
INSERT INTO `logs` VALUES (1268, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 10 to cart', 'INFO', '2024-07-18 16:28:06');
INSERT INTO `logs` VALUES (1269, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 9 to cart', 'INFO', '2024-07-18 16:28:06');
INSERT INTO `logs` VALUES (1270, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 8 to cart', 'INFO', '2024-07-18 16:28:06');
INSERT INTO `logs` VALUES (1271, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 7 to cart', 'INFO', '2024-07-18 16:28:07');
INSERT INTO `logs` VALUES (1272, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 6 to cart', 'INFO', '2024-07-18 16:28:07');
INSERT INTO `logs` VALUES (1273, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 7 to cart', 'INFO', '2024-07-18 16:28:07');
INSERT INTO `logs` VALUES (1274, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 8 to cart', 'INFO', '2024-07-18 16:28:07');
INSERT INTO `logs` VALUES (1275, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 9 to cart', 'INFO', '2024-07-18 16:28:08');
INSERT INTO `logs` VALUES (1276, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 0 to cart', 'INFO', '2024-07-18 16:28:36');
INSERT INTO `logs` VALUES (1277, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:39:16');
INSERT INTO `logs` VALUES (1279, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 2 to cart', 'INFO', '2024-07-18 16:39:33');
INSERT INTO `logs` VALUES (1280, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 3 to cart', 'INFO', '2024-07-18 16:39:33');
INSERT INTO `logs` VALUES (1281, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 4 to cart', 'INFO', '2024-07-18 16:39:33');
INSERT INTO `logs` VALUES (1282, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 3 to cart', 'INFO', '2024-07-18 16:39:34');
INSERT INTO `logs` VALUES (1283, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 2 to cart', 'INFO', '2024-07-18 16:39:34');
INSERT INTO `logs` VALUES (1284, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 1 to cart', 'INFO', '2024-07-18 16:39:34');
INSERT INTO `logs` VALUES (1285, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 0 to cart', 'INFO', '2024-07-18 16:39:34');
INSERT INTO `logs` VALUES (1286, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:39:52');
INSERT INTO `logs` VALUES (1288, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 2 to cart', 'INFO', '2024-07-18 16:39:58');
INSERT INTO `logs` VALUES (1289, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 3 to cart', 'INFO', '2024-07-18 16:39:58');
INSERT INTO `logs` VALUES (1290, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 4 to cart', 'INFO', '2024-07-18 16:39:58');
INSERT INTO `logs` VALUES (1291, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 3 to cart', 'INFO', '2024-07-18 16:39:58');
INSERT INTO `logs` VALUES (1292, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 2 to cart', 'INFO', '2024-07-18 16:39:59');
INSERT INTO `logs` VALUES (1293, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 1 to cart', 'INFO', '2024-07-18 16:40:00');
INSERT INTO `logs` VALUES (1294, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Chuc Ngan update product 5 with quantity 0 to cart', 'INFO', '2024-07-18 16:40:00');
INSERT INTO `logs` VALUES (1295, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:48:40');
INSERT INTO `logs` VALUES (1296, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:48:44');
INSERT INTO `logs` VALUES (1297, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:51:53');
INSERT INTO `logs` VALUES (1298, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:52:17');
INSERT INTO `logs` VALUES (1299, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:52:21');
INSERT INTO `logs` VALUES (1300, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 1 to cart', 'INFO', '2024-07-18 16:52:24');
INSERT INTO `logs` VALUES (1301, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-18 16:52:24');
INSERT INTO `logs` VALUES (1302, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:53:32');
INSERT INTO `logs` VALUES (1303, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-18 16:53:34');
INSERT INTO `logs` VALUES (1304, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 15 to cart', 'INFO', '2024-07-18 16:53:36');
INSERT INTO `logs` VALUES (1305, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-18 16:53:38');
INSERT INTO `logs` VALUES (1306, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 0 to cart', 'INFO', '2024-07-18 16:53:43');
INSERT INTO `logs` VALUES (1307, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-18 16:54:56');
INSERT INTO `logs` VALUES (1308, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 0 to cart', 'INFO', '2024-07-18 16:54:58');
INSERT INTO `logs` VALUES (1309, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:55:01');
INSERT INTO `logs` VALUES (1310, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-18 16:55:05');
INSERT INTO `logs` VALUES (1311, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:55:19');
INSERT INTO `logs` VALUES (1312, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-18 16:55:21');
INSERT INTO `logs` VALUES (1313, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 1 to cart', 'INFO', '2024-07-18 16:55:23');
INSERT INTO `logs` VALUES (1314, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm đặc sản Neptune ST25 túi 5kg', 'INFO', '2024-07-18 16:55:26');
INSERT INTO `logs` VALUES (1315, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 5 to cart', 'INFO', '2024-07-18 16:55:29');
INSERT INTO `logs` VALUES (1316, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 2 to cart', 'INFO', '2024-07-18 16:55:32');
INSERT INTO `logs` VALUES (1317, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 3 to cart', 'INFO', '2024-07-18 16:55:32');
INSERT INTO `logs` VALUES (1318, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 5 with quantity 0 to cart', 'INFO', '2024-07-18 16:55:39');
INSERT INTO `logs` VALUES (1319, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:55:47');
INSERT INTO `logs` VALUES (1320, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 12 to cart', 'INFO', '2024-07-18 16:55:53');
INSERT INTO `logs` VALUES (1321, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 12 with quantity 0 to cart', 'INFO', '2024-07-18 16:55:59');
INSERT INTO `logs` VALUES (1322, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:57:45');
INSERT INTO `logs` VALUES (1323, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:57:51');
INSERT INTO `logs` VALUES (1324, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:57:53');
INSERT INTO `logs` VALUES (1325, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:58:39');
INSERT INTO `logs` VALUES (1326, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:58:40');
INSERT INTO `logs` VALUES (1327, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 16:59:15');
INSERT INTO `logs` VALUES (1328, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 10 to cart', 'INFO', '2024-07-18 16:59:56');
INSERT INTO `logs` VALUES (1329, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 16:59:58');
INSERT INTO `logs` VALUES (1330, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-18 17:00:11');
INSERT INTO `logs` VALUES (1331, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 17:02:30');
INSERT INTO `logs` VALUES (1332, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-18 17:02:32');
INSERT INTO `logs` VALUES (1333, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 17:02:35');
INSERT INTO `logs` VALUES (1334, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 17:02:38');
INSERT INTO `logs` VALUES (1335, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 17:02:47');
INSERT INTO `logs` VALUES (1336, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 17:02:48');
INSERT INTO `logs` VALUES (1337, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 2 to cart', 'INFO', '2024-07-18 17:03:00');
INSERT INTO `logs` VALUES (1338, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'INFO', '2024-07-18 17:03:02');
INSERT INTO `logs` VALUES (1339, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 2 to cart', 'INFO', '2024-07-18 17:03:04');
INSERT INTO `logs` VALUES (1340, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 2 with quantity 0 to cart', 'INFO', '2024-07-18 17:05:52');
INSERT INTO `logs` VALUES (1341, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách update product 6 with quantity 0 to cart', 'INFO', '2024-07-18 17:05:52');
INSERT INTO `logs` VALUES (1342, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 17:19:03');
INSERT INTO `logs` VALUES (1343, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 17:20:37');
INSERT INTO `logs` VALUES (1344, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 17:47:30');
INSERT INTO `logs` VALUES (1345, '127.0.0.1', '/ProductDetail', 'Viet Nam', '', '', 'View productGạo thơm A An ST21 túi 5kg', 'INFO', '2024-07-18 17:48:15');
INSERT INTO `logs` VALUES (1346, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 17:54:13');
INSERT INTO `logs` VALUES (1347, '127.0.0.1', '/CartController', 'Viet Nam', '', '', 'User Khách add product 6 to cart', 'INFO', '2024-07-18 17:54:17');
INSERT INTO `logs` VALUES (1348, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 19:38:45');
INSERT INTO `logs` VALUES (1349, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 19:46:45');
INSERT INTO `logs` VALUES (1350, '127.0.0.1', '/Home', 'Viet Nam', '', '', 'View', 'INFO', '2024-07-18 19:46:50');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `newId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `blogId` int NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`newId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `orderId` int NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  `price` decimal(11, 0) NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  INDEX `fk_order_details_products`(`productId` ASC) USING BTREE,
  INDEX `fk_order_details_orders`(`orderId` ASC) USING BTREE,
  CONSTRAINT `fk_order_details_orders` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_details_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (1, 2, 149000, 4);
INSERT INTO `orderdetails` VALUES (2, 6, 133000, 2);
INSERT INTO `orderdetails` VALUES (3, 16, 23000, 3);
INSERT INTO `orderdetails` VALUES (1, 6, 133000, 1);
INSERT INTO `orderdetails` VALUES (4, 1, 119000, 4);
INSERT INTO `orderdetails` VALUES (4, 5, 108540, 5);
INSERT INTO `orderdetails` VALUES (4, 6, 113000, 3);
INSERT INTO `orderdetails` VALUES (4, 10, 127000, 4);
INSERT INTO `orderdetails` VALUES (4, 11, 46000, 1);
INSERT INTO `orderdetails` VALUES (4, 14, 27000, 1);
INSERT INTO `orderdetails` VALUES (5, 32, 23000, 1);
INSERT INTO `orderdetails` VALUES (5, 33, 35000, 1);
INSERT INTO `orderdetails` VALUES (5, 2, 149000, 4);
INSERT INTO `orderdetails` VALUES (5, 34, 157000, 2);
INSERT INTO `orderdetails` VALUES (5, 3, 120000, 4);
INSERT INTO `orderdetails` VALUES (5, 19, 31500, 1);
INSERT INTO `orderdetails` VALUES (5, 25, 280000, 1);
INSERT INTO `orderdetails` VALUES (5, 14, 27000, 6);
INSERT INTO `orderdetails` VALUES (5, 15, 10440, 3);
INSERT INTO `orderdetails` VALUES (6, 1, 119000, 7);
INSERT INTO `orderdetails` VALUES (6, 34, 157000, 1);
INSERT INTO `orderdetails` VALUES (6, 3, 120000, 7);
INSERT INTO `orderdetails` VALUES (6, 5, 108540, 10);
INSERT INTO `orderdetails` VALUES (6, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (6, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (7, 2, 149000, 10);
INSERT INTO `orderdetails` VALUES (7, 3, 120000, 12);
INSERT INTO `orderdetails` VALUES (7, 5, 108540, 8);
INSERT INTO `orderdetails` VALUES (7, 6, 113000, 8);
INSERT INTO `orderdetails` VALUES (7, 7, 120000, 1);
INSERT INTO `orderdetails` VALUES (7, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (7, 11, 46000, 7);
INSERT INTO `orderdetails` VALUES (8, 32, 23000, 7);
INSERT INTO `orderdetails` VALUES (8, 33, 35000, 8);
INSERT INTO `orderdetails` VALUES (8, 2, 149000, 4);
INSERT INTO `orderdetails` VALUES (8, 34, 157000, 2);
INSERT INTO `orderdetails` VALUES (8, 3, 120000, 4);
INSERT INTO `orderdetails` VALUES (8, 13, 11000, 1);
INSERT INTO `orderdetails` VALUES (8, 14, 27000, 7);
INSERT INTO `orderdetails` VALUES (8, 15, 10440, 4);
INSERT INTO `orderdetails` VALUES (8, 16, 23000, 1);
INSERT INTO `orderdetails` VALUES (8, 145, 130000, 1);
INSERT INTO `orderdetails` VALUES (8, 81, 55250, 1);
INSERT INTO `orderdetails` VALUES (8, 50, 22500, 1);
INSERT INTO `orderdetails` VALUES (8, 19, 31500, 1);
INSERT INTO `orderdetails` VALUES (8, 51, 33150, 1);
INSERT INTO `orderdetails` VALUES (8, 52, 73830, 1);
INSERT INTO `orderdetails` VALUES (8, 25, 280000, 1);
INSERT INTO `orderdetails` VALUES (9, 32, 23000, 7);
INSERT INTO `orderdetails` VALUES (9, 33, 35000, 8);
INSERT INTO `orderdetails` VALUES (9, 34, 157000, 2);
INSERT INTO `orderdetails` VALUES (9, 2, 149000, 4);
INSERT INTO `orderdetails` VALUES (9, 3, 120000, 4);
INSERT INTO `orderdetails` VALUES (9, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (9, 6, 113000, 2);
INSERT INTO `orderdetails` VALUES (9, 10, 127000, 2);
INSERT INTO `orderdetails` VALUES (9, 13, 11000, 1);
INSERT INTO `orderdetails` VALUES (9, 14, 27000, 7);
INSERT INTO `orderdetails` VALUES (9, 15, 10440, 4);
INSERT INTO `orderdetails` VALUES (9, 16, 23000, 1);
INSERT INTO `orderdetails` VALUES (9, 145, 130000, 1);
INSERT INTO `orderdetails` VALUES (9, 81, 55250, 1);
INSERT INTO `orderdetails` VALUES (9, 50, 22500, 1);
INSERT INTO `orderdetails` VALUES (9, 19, 31500, 1);
INSERT INTO `orderdetails` VALUES (9, 51, 33150, 1);
INSERT INTO `orderdetails` VALUES (9, 52, 73830, 1);
INSERT INTO `orderdetails` VALUES (9, 24, 56000, 1);
INSERT INTO `orderdetails` VALUES (9, 25, 280000, 1);
INSERT INTO `orderdetails` VALUES (10, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (10, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (10, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (11, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (11, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (11, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (12, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (12, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (12, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (13, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (13, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (13, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (14, 5, 108540, 7);
INSERT INTO `orderdetails` VALUES (14, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (14, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (14, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (15, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (15, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (15, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (16, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (16, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (16, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (16, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (17, 1, 119000, 1);
INSERT INTO `orderdetails` VALUES (17, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (17, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (17, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (18, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (18, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (18, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (18, 12, 26000, 1);
INSERT INTO `orderdetails` VALUES (20, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (21, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (21, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (21, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (22, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (22, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (23, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (25, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (25, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (26, 45, 42000, 5);
INSERT INTO `orderdetails` VALUES (26, 46, 55500, 6);
INSERT INTO `orderdetails` VALUES (27, 45, 42000, 1);
INSERT INTO `orderdetails` VALUES (27, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (28, 45, 42000, 1);
INSERT INTO `orderdetails` VALUES (28, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (28, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (29, 45, 42000, 1);
INSERT INTO `orderdetails` VALUES (30, 45, 42000, 1);
INSERT INTO `orderdetails` VALUES (31, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (32, 48, 32500, 2);
INSERT INTO `orderdetails` VALUES (33, 48, 32500, 1);
INSERT INTO `orderdetails` VALUES (34, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (35, 48, 32500, 1);
INSERT INTO `orderdetails` VALUES (35, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (36, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (37, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (38, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (39, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (40, 45, 42000, 1);
INSERT INTO `orderdetails` VALUES (42, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (43, 2, 149000, 1);
INSERT INTO `orderdetails` VALUES (44, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (44, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (45, 5, 108540, 4);
INSERT INTO `orderdetails` VALUES (46, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (46, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (46, 14, 27000, 1);
INSERT INTO `orderdetails` VALUES (46, 15, 10440, 4);
INSERT INTO `orderdetails` VALUES (47, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (48, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (49, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (50, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (51, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (52, 47, 25200, 1);
INSERT INTO `orderdetails` VALUES (53, 2, 149000, 1);
INSERT INTO `orderdetails` VALUES (54, 3, 120000, 1);
INSERT INTO `orderdetails` VALUES (55, 1, 119000, 1);
INSERT INTO `orderdetails` VALUES (56, 4, 115000, 1);
INSERT INTO `orderdetails` VALUES (57, 46, 55500, 1);
INSERT INTO `orderdetails` VALUES (58, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (58, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (58, 11, 46000, 1);
INSERT INTO `orderdetails` VALUES (58, 12, 26000, 1);
INSERT INTO `orderdetails` VALUES (58, 14, 27000, 1);
INSERT INTO `orderdetails` VALUES (58, 15, 10440, 1);
INSERT INTO `orderdetails` VALUES (59, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (60, 1, 119000, 1);
INSERT INTO `orderdetails` VALUES (61, 6, 113000, 2);
INSERT INTO `orderdetails` VALUES (61, 10, 127000, 2);
INSERT INTO `orderdetails` VALUES (62, 10, 127000, 1);
INSERT INTO `orderdetails` VALUES (62, 15, 10440, 70);
INSERT INTO `orderdetails` VALUES (63, 63, 19500, 55);
INSERT INTO `orderdetails` VALUES (64, 5, 108540, 7);
INSERT INTO `orderdetails` VALUES (64, 8, 100000, 5);
INSERT INTO `orderdetails` VALUES (65, 2, 149000, 2);
INSERT INTO `orderdetails` VALUES (65, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (66, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (67, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (67, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (68, 6, 113000, 6);
INSERT INTO `orderdetails` VALUES (69, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (70, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (71, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (72, 5, 108540, 1);
INSERT INTO `orderdetails` VALUES (72, 6, 113000, 1);
INSERT INTO `orderdetails` VALUES (72, 14, 27000, 1);
INSERT INTO `orderdetails` VALUES (73, 3, 120000, 1);
INSERT INTO `orderdetails` VALUES (74, 2, 149000, 4);
INSERT INTO `orderdetails` VALUES (75, 5, 108540, 4);
INSERT INTO `orderdetails` VALUES (76, 2, 149000, 4);
INSERT INTO `orderdetails` VALUES (77, 2, 149000, 2);
INSERT INTO `orderdetails` VALUES (77, 6, 113000, 4);
INSERT INTO `orderdetails` VALUES (78, 2, 149000, 4);
INSERT INTO `orderdetails` VALUES (79, 6, 113000, 5);
INSERT INTO `orderdetails` VALUES (80, 2, 149000, 5);
INSERT INTO `orderdetails` VALUES (81, 6, 113000, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `statusId` int NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  `totalPrice` decimal(11, 0) NULL DEFAULT NULL,
  `discountId` int NULL DEFAULT NULL,
  `paymentMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shippingFee` float NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dateCreated` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdated` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `fk_orders_status`(`statusId` ASC) USING BTREE,
  INDEX `fk_orders_users`(`userId` ASC) USING BTREE,
  CONSTRAINT `fk_orders_status` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orders_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 6, 2, 729000, 0, 'COD', 0, '123 Nguyen Hue Street, Ho Chi Minh City', '2024-03-12 01:05:45', '2024-07-12 02:09:04', 'Giao hàng nhanh');
INSERT INTO `orders` VALUES (2, 6, 3, 266000, 1, 'Credit card', 0, '456 Le Loi Street, Ho Chi Minh City', '2024-03-12 01:05:56', '2024-07-12 02:09:06', 'Không cần gấp');
INSERT INTO `orders` VALUES (3, 6, 4, 39000, 1, 'PayPal', 0, '789 Pham Ngu Lao Street, Ho Chi Minh City', '2024-02-12 01:05:55', '2024-07-12 02:09:08', 'Không cần gấp');
INSERT INTO `orders` VALUES (4, 6, 2, 1978700, 0, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-13 04:15:18', '2024-07-13 04:15:18', 'Giao hàng theo giờ hành chính');
INSERT INTO `orders` VALUES (5, 6, 4, 1992820, 0, 'COD', 40000, ' Xã Yên Hoa Huyện Na Hang Tỉnh Tuyên Quang', '2024-07-13 04:14:55', '2024-07-13 04:14:55', 'Giao hàng nhanh');
INSERT INTO `orders` VALUES (6, 6, 2, 3195400, 0, 'COD', 40000, 'Quận lịch sử và thương mại của Hà Nội Phường Hàng Trống Quận Ba Đình Hà Nội', '2024-07-13 04:15:03', '2024-07-13 04:15:03', 'Giao hàng theo giờ hành chính');
INSERT INTO `orders` VALUES (7, 6, 6, 5311320, 0, 'COD', 40000, 'Quận lịch sử và thương mại của Hà Nội Phường Hàng Trống Quận Ba Đình Hà Nội', '2024-07-13 04:15:05', '2024-07-13 04:15:05', 'Giao hàng theo giờ hành chính');
INSERT INTO `orders` VALUES (8, 4, 6, 2761990, 0, 'COD', 40000, 'Quận lịch sử và thương mại của Hà Nội Phường Hàng Trống Quận Ba Đình Hà Nội', '2024-07-13 04:15:07', '2024-07-13 04:15:07', 'Giao hàng theo giờ hành chính');
INSERT INTO `orders` VALUES (9, 6, 6, 3406530, 0, 'COD', 40000, '789 Pham Ngu Lao Street, Ho Chi Minh City', '2024-06-12 01:56:26', '2024-07-12 02:09:25', 'Không cần gấp');
INSERT INTO `orders` VALUES (10, 6, 6, 388540, 0, 'COD', 40000, 'Quận lịch sử và thương mại của Hà Nội Phường Hàng Trống Quận Ba Đình Hà Nội', '2024-07-13 04:15:09', '2024-07-13 04:15:09', 'Giao hàng nhanh');
INSERT INTO `orders` VALUES (11, 6, 4, 388540, 0, 'COD', 40000, 'Khu dân cư quận Gò Vấp13Go VapHo Chi Minh City', '2024-02-12 01:07:16', '2024-07-12 02:09:32', 'Giao hàng theo giờ hành chính');
INSERT INTO `orders` VALUES (12, 4, 4, 290440, 0, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-13 04:15:21', '2024-07-13 04:15:21', 'Không cần gấp');
INSERT INTO `orders` VALUES (13, 4, 6, 290440, 0, 'COD', 40000, 'Khu dân cư quận Gò Vấp13Go VapHo Chi Minh City', '2024-01-23 01:41:04', '2024-07-12 01:55:23', 'Giao hàng theo giờ hành chính');
INSERT INTO `orders` VALUES (14, 4, 4, 1050220, 0, 'COD', 40000, '789 Pham Ngu Lao Street, Ho Chi Minh City', '2024-07-12 01:06:46', '2024-07-12 01:06:46', 'Giao hàng nhanh');
INSERT INTO `orders` VALUES (15, 6, 8, 388540, 0, 'COD', 40000, '789 Pham Ngu Lao Street, Ho Chi Minh City', '2024-03-12 01:07:22', '2024-07-12 01:55:29', 'Không cần gấp');
INSERT INTO `orders` VALUES (16, 6, 4, 398980, 0, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-04-12 01:59:14', '2024-07-12 02:07:43', 'Giao hàng nhanh');
INSERT INTO `orders` VALUES (17, 6, 9, 404980, 0, 'COD', 40000, ' Xã Yên Hoa Huyện Na Hang Tỉnh Tuyên Quang', '2024-07-12 01:57:27', '2024-07-12 01:57:27', 'Yêu cầu gọi điện trước khi giao hàng');
INSERT INTO `orders` VALUES (18, 6, 4, 414540, 0, 'COD', 40000, 'Quận lịch sử và thương mại của Hà Nội Phường Hàng Trống Quận Ba Đình Hà Nội', '2024-07-12 01:57:16', '2024-07-12 01:57:16', 'Yêu cầu gọi điện trước khi giao hàng');
INSERT INTO `orders` VALUES (20, 6, 4, 153000, 0, 'COD', 40000, 'Quận lịch sử và thương mại của Hà Nội Phường Hàng Trống Quận Ba Đình Hà Nội', '2024-04-12 01:59:05', '2024-07-12 02:08:09', 'Yêu cầu gọi điện trước khi giao hàng');
INSERT INTO `orders` VALUES (21, 6, 4, 290440, 0, 'COD', 40000, 'Tỉnh Bắc Kạn, Huyện Chợ Đồn, Xã Yên Thượng', '2024-05-12 01:59:04', '2024-07-12 02:08:20', '');
INSERT INTO `orders` VALUES (22, 6, 7, 280000, 0, 'COD', 40000, '123 Xã Hồng Sĩ Huyện Hà Quảng Tỉnh Cao Bằng', '2024-04-12 01:59:01', '2024-07-12 02:08:25', 'giao nhanh nha');
INSERT INTO `orders` VALUES (23, 4, 4, 148540, 0, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 01:42:55', '2024-07-12 01:42:55', '');
INSERT INTO `orders` VALUES (24, 4, 4, 40000, 0, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 01:48:18', '2024-07-12 01:48:18', '');
INSERT INTO `orders` VALUES (25, 4, 4, 280000, 0, 'COD', 40000, 'Quận lịch sử và thương mại của Hà Nội Phường Hàng Trống Quận Ba Đình Hà Nội', '2024-07-12 01:49:57', '2024-07-12 01:49:57', '');
INSERT INTO `orders` VALUES (26, 4, 4, 583000, 3, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 07:39:21', '2024-07-12 07:39:21', '');
INSERT INTO `orders` VALUES (27, 4, 4, 137500, 3, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 07:43:14', '2024-07-12 07:43:14', '');
INSERT INTO `orders` VALUES (28, 4, 4, 153, 3, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 07:49:30', '2024-07-12 07:49:30', '');
INSERT INTO `orders` VALUES (29, 4, 4, 72, 3, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 07:53:04', '2024-07-12 07:53:04', '');
INSERT INTO `orders` VALUES (30, 4, 4, 72000, 3, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 08:02:26', '2024-07-12 08:02:26', '');
INSERT INTO `orders` VALUES (31, 4, 4, 55200, 3, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 08:04:31', '2024-07-12 08:04:31', '');
INSERT INTO `orders` VALUES (32, 4, 4, 95000, 3, 'COD', 40000, 'Khu dân cư quận Gò Vấp 13 Go Vap Ho Chi Minh City', '2024-07-12 08:19:01', '2024-07-12 08:19:01', '');
INSERT INTO `orders` VALUES (33, 4, 4, 62500, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 22:32:41', '2024-07-12 22:32:41', '');
INSERT INTO `orders` VALUES (34, 4, 8, 25200, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:48:31', '2024-07-13 00:48:31', '');
INSERT INTO `orders` VALUES (35, 4, 4, 57700, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 22:48:07', '2024-07-12 22:48:07', '');
INSERT INTO `orders` VALUES (36, 4, 4, 85500, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 22:55:57', '2024-07-12 22:55:57', '');
INSERT INTO `orders` VALUES (37, 4, 4, 85500, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 22:58:38', '2024-07-12 22:58:38', '');
INSERT INTO `orders` VALUES (38, 4, 4, 85500, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:04:16', '2024-07-12 23:04:16', '');
INSERT INTO `orders` VALUES (39, 4, 5, 55200, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:48:28', '2024-07-13 00:48:28', '');
INSERT INTO `orders` VALUES (40, 4, 4, 72000, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:08:02', '2024-07-12 23:08:02', '');
INSERT INTO `orders` VALUES (41, 4, 6, 72000, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:48:25', '2024-07-13 00:48:25', '');
INSERT INTO `orders` VALUES (42, 4, 4, 85500, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:14:38', '2024-07-12 23:14:38', '');
INSERT INTO `orders` VALUES (43, 4, 6, 149000, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:48:23', '2024-07-13 00:48:23', '');
INSERT INTO `orders` VALUES (44, 4, 4, 137440, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:42:49', '2024-07-12 23:42:49', '');
INSERT INTO `orders` VALUES (45, 4, 4, 434160, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:44:39', '2024-07-12 23:44:39', '');
INSERT INTO `orders` VALUES (46, 4, 4, 290300, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:46:45', '2024-07-12 23:46:45', '');
INSERT INTO `orders` VALUES (47, 4, 4, 85500, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:49:09', '2024-07-12 23:49:09', '');
INSERT INTO `orders` VALUES (48, 4, 6, 55500, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:48:34', '2024-07-13 00:48:34', '');
INSERT INTO `orders` VALUES (49, 4, 4, 55500, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-12 23:53:59', '2024-07-12 23:53:59', '');
INSERT INTO `orders` VALUES (50, 4, 4, 55200, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:00:07', '2024-07-13 00:00:07', '');
INSERT INTO `orders` VALUES (51, 4, 4, 55200, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:25:18', '2024-07-13 00:25:18', '');
INSERT INTO `orders` VALUES (52, 4, 5, 55200, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:48:45', '2024-07-13 00:48:45', '');
INSERT INTO `orders` VALUES (53, 4, 4, 149000, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:28:11', '2024-07-13 00:28:11', '');
INSERT INTO `orders` VALUES (54, 4, 3, 120000, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:48:40', '2024-07-13 00:48:40', '');
INSERT INTO `orders` VALUES (55, 4, 4, 119000, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:31:04', '2024-07-13 00:31:04', '');
INSERT INTO `orders` VALUES (56, 4, 4, 155000, 0, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:32:57', '2024-07-13 00:32:57', '');
INSERT INTO `orders` VALUES (57, 4, 4, 85500, 3, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:34:09', '2024-07-13 00:34:09', '');
INSERT INTO `orders` VALUES (58, 4, 4, 354980, 6, 'COD', 40000, ' Xã Cẩm Giàng Huyện Bạch Thông Tỉnh Bắc Kạn', '2024-07-13 00:45:46', '2024-07-13 00:45:46', '');
INSERT INTO `orders` VALUES (59, 4, 4, 153000, 0, 'COD', 40000, '2, Người nhận: null, Số điện thoại:Thành phố Hà Nội', '2024-07-13 04:43:33', '2024-07-13 04:43:33', 'nhanh nha');
INSERT INTO `orders` VALUES (60, 4, 4, 159000, 0, 'COD', 40000, '780, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn, Người nhận: Nguyễn Thị Chúc Ngân 123, Số điện thoại: 0869769142', '2024-07-13 05:06:50', '2024-07-13 05:06:50', '');
INSERT INTO `orders` VALUES (61, 4, 4, 520000, 0, 'COD', 40000, '780, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn, Người nhận: Nguyễn Thị Chúc Ngân 123, Số điện thoại: 0869769142', '2024-07-13 23:17:18', '2024-07-13 23:17:18', '');
INSERT INTO `orders` VALUES (62, 4, 4, 897800, 0, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-14 01:11:52', '2024-07-14 01:11:52', '');
INSERT INTO `orders` VALUES (63, 4, 4, 1112500, 0, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-14 01:16:05', '2024-07-14 01:16:05', '');
INSERT INTO `orders` VALUES (64, 4, 4, 1269780, 6, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-16 20:40:28', '2024-07-16 20:40:28', 'nhanh');
INSERT INTO `orders` VALUES (65, 4, 4, 451000, 0, 'COD', 40000, '123, Xã Vân Tùng, Huyện Ngân Sơn, Tỉnh Bắc Kạn, Người nhận: Quang Minh, Số điện thoại: 0747532573', '2024-07-17 11:29:21', '2024-07-17 11:29:21', '');
INSERT INTO `orders` VALUES (66, 4, 4, 153000, 0, 'COD', 40000, '123, Xã Vân Tùng, Huyện Ngân Sơn, Tỉnh Bắc Kạn, Người nhận: Quang Minh, Số điện thoại: 0747532573', '2024-07-17 11:46:11', '2024-07-17 11:46:11', '');
INSERT INTO `orders` VALUES (67, 4, 4, 261540, 0, 'COD', 40000, 'Tỉnh Cao Bằng, Huyện Trùng Khánh, Xã Phong Châu, Người nhận: Chuc Ngan, Số điện thoại: 0925821472', '2024-07-17 12:02:54', '2024-07-17 12:02:54', 'nhanh');
INSERT INTO `orders` VALUES (68, 4, 13, 718000, 0, 'COD', 40000, 'Tỉnh Cao Bằng, Huyện Trùng Khánh, Xã Lăng Hiếu, Người nhận: Trần Văn Long, Số điện thoại: 0222222222', '2024-07-17 12:28:52', '2024-07-17 12:28:52', '');
INSERT INTO `orders` VALUES (69, 4, 4, 153000, 0, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-17 12:47:57', '2024-07-17 12:47:57', '');
INSERT INTO `orders` VALUES (70, 4, 4, 153000, 0, 'COD', 40000, '780, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn, Người nhận: Nguyễn Thị Chúc Ngân 123, Số điện thoại: 0869769142', '2024-07-17 13:56:28', '2024-07-17 13:56:28', '');
INSERT INTO `orders` VALUES (71, 4, 4, 153000, 0, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-17 13:58:38', '2024-07-17 13:58:38', '');
INSERT INTO `orders` VALUES (72, 4, 13, 258540, 6, 'COD', 40000, 'Tỉnh Cao Bằng, Huyện Trà Lĩnh, Xã Xuân Nội, Người nhận: Trần Văn Long, Số điện thoại: 0222222222', '2024-07-17 14:20:47', '2024-07-17 14:20:47', 'NHANH');
INSERT INTO `orders` VALUES (73, 4, 4, 160000, 0, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-17 16:20:53', '2024-07-17 16:20:53', '');
INSERT INTO `orders` VALUES (74, 4, 4, 516800, 2, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-17 16:40:18', '2024-07-17 16:40:18', '');
INSERT INTO `orders` VALUES (75, 4, 13, 387328, 2, 'COD', 40000, 'Tỉnh Hà Giang, Huyện Quản Bạ, Xã Đông Hà, Người nhận: Trần Văn Long, Số điện thoại: 0222222222', '2024-07-17 16:54:20', '2024-07-17 16:54:20', '');
INSERT INTO `orders` VALUES (76, 4, 4, 516800, 2, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-17 17:00:57', '2024-07-17 17:00:57', '');
INSERT INTO `orders` VALUES (77, 4, 4, 790000, 0, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-17 17:35:00', '2024-07-17 17:35:00', '');
INSERT INTO `orders` VALUES (78, 4, 4, 516800, 2, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-17 17:50:27', '2024-07-17 17:50:27', '');
INSERT INTO `orders` VALUES (79, 4, 4, 492000, 2, 'COD', 40000, '780, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn, Người nhận: Nguyễn Thị Chúc Ngân 123, Số điện thoại: 0869769142', '2024-07-17 18:17:41', '2024-07-17 18:17:41', '');
INSERT INTO `orders` VALUES (80, 4, 4, 636000, 2, 'COD', 40000, '780, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn, Người nhận: Nguyễn Thị Chúc Ngân 123, Số điện thoại: 0869769142', '2024-07-17 18:35:47', '2024-07-17 18:35:47', '');
INSERT INTO `orders` VALUES (81, 4, 4, 153000, 0, 'COD', 40000, '456, Xã Phúc Ứng, Huyện Sơn Dương, Tỉnh Tuyên Quang, Người nhận: Chúc Ngân123, Số điện thoại: 0463632573', '2024-07-18 17:54:29', '2024-07-18 17:54:29', '');

-- ----------------------------
-- Table structure for producthaspromotion
-- ----------------------------
DROP TABLE IF EXISTS `producthaspromotion`;
CREATE TABLE `producthaspromotion`  (
  `promotionId` int NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  `categoryId` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of producthaspromotion
-- ----------------------------

-- ----------------------------
-- Table structure for productimports
-- ----------------------------
DROP TABLE IF EXISTS `productimports`;
CREATE TABLE `productimports`  (
  `productId` int NOT NULL,
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` decimal(10, 2) NOT NULL,
  `costPrice` decimal(10, 0) NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productimports
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `productId` int NOT NULL AUTO_INCREMENT,
  `categoryId` int NULL DEFAULT NULL,
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `thumb` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `costPrice` decimal(10, 0) NULL DEFAULT NULL,
  `unitPrice` decimal(10, 0) NULL DEFAULT NULL,
  `blogId` int NULL DEFAULT NULL,
  `statusId` int NULL DEFAULT NULL,
  `weight` decimal(11, 2) NULL DEFAULT NULL,
  `unitsInStock` int NULL DEFAULT NULL,
  `dateCreated` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdated` datetime NULL DEFAULT NULL,
  `lastUpdatedImport` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  INDEX `fk_products_categories`(`categoryId` ASC) USING BTREE,
  INDEX `fk_products_status`(`statusId` ASC) USING BTREE,
  INDEX `fk_products_blog`(`blogId` ASC) USING BTREE,
  CONSTRAINT `fk_products_blog` FOREIGN KEY (`blogId`) REFERENCES `blogs` (`blogId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_products_status` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 2, 'Gạo thơm đặc sản Neptune ST25 túi 5kg', 'images/product-images/gao-thom-dac-san-neptune-st25-tui-5kg-202306191511488893.jpg', 100000, 129000, 1, 9, 10.00, 0, '2023-01-29 00:00:00', '2023-01-30 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (2, 2, 'Gạo giống Nhật Bản Vinh Hiển Taiyo túi 5kg', 'images/product-images/gao-giong-nhat-ban-vinh-hien-taiyo-tui-5kg-202007211001455095.jpg', 100000, 149000, 2, 8, 25.00, 10, '2023-01-20 00:00:00', '2023-01-21 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (3, 2, 'Gạo Hạt Ngọc Trời Tiên Nữ túi 5kg', 'images/product-images/-202210270821594671.jpg', 100000, 120000, 3, 8, 10.00, 223, '2023-01-25 00:00:00', '2023-02-26 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (4, 2, 'Gạo lài sữa Đồng Việt túi 5kg', 'images/product-images/gao-lai-sua-dong-viet-tui-5kg-202212280858091468.jpg', 100000, 115000, 4, 8, 10.00, 33, '2022-12-29 00:00:00', '2023-03-24 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (5, 2, 'Gạo ST25 Đồng Việt túi 5kg', 'images/product-images/gao-st25-thuong-hang-dong-viet-tui-5kg-202212280854102020.jpg', 100000, 134000, 5, 8, 5.00, 55, '2023-01-10 00:00:00', '2023-01-10 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (6, 2, 'Gạo thơm A An ST21 túi 5kg', 'images/product-images/gao-thom-a-an-st21-tui-5kg-202006061602569575.jpg', 123000, 133000, 1, 8, 5.00, 25, '2023-01-16 00:00:00', '2023-01-17 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (7, 2, 'Gạo Lài hương Đồng Việt túi 5kg', 'images/product-images/gao-lai-huong-dong-viet-tui-5kg-202212280845480911.jpg', 100000, 120000, 1, 8, 5.00, 13, '2023-01-17 00:00:00', '2023-01-18 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (8, 14, 'Gạo lức huyết rồng PMT túi 2kg', 'images/product-images/-202210150918339457.jpg', 800000, 100000, 1, 8, 5.00, 50, '2023-03-22 00:00:00', '2023-04-06 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (9, 2, 'Gạo thơm Vua Gạo ST25 túi 5kg', 'images/product-images/-202306191015007772.jpg', 124000, 134000, 1, 9, 5.00, 0, '2023-05-20 00:00:00', '2023-05-20 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (10, 2, 'Gạo Ngọc Sa Cỏ May túi 5kg', 'images/product-images/gao-ngoc-sa-co-may-tui-5kg-202201050907494211.jpg', 137000, 157000, 1, 9, 10.00, 0, '2022-12-13 00:00:00', '2022-12-14 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (11, 7, 'Khoai lang Nhật xuất khẩu 0.9kg - 1.1kg', 'images/product-images/khoai-lang-nhat-xuat-khau-1kg-202306141637486543.jpg', 40000, 46000, 1, 8, 5.00, 45, '2023-03-03 00:00:00', '2023-03-03 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (12, 7, 'Chuối già giống Nam Mỹ hộp 0.9-1.1kg (6-7 trái)', 'images/product-images/chuoi-gia-giong-nam-my-hop-09-11kg-6-7-trai-202401151353168342.jpg', 20000, 26000, 1, 8, 5.00, 73, '2022-09-02 00:00:00', '2022-09-02 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (13, 10, 'Nấm kim châm Thái Lan 150g', 'images/product-images/nam-kim-cham-thai-lan-150g-202308291048255023.jpg', 8000, 11000, 1, 8, 10.00, 94, '2023-03-05 00:00:00', '2023-04-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (14, 7, 'Khoai môn 450g - 550g (1 củ)', 'images/product-images/khoai-mon-tui-500g-1-cu-202205201541019491.jpg', 19500, 27000, 1, 8, 5.00, 11, '2023-03-06 00:00:00', '2023-03-07 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (15, 7, '2 trái bắp nếp từ 500g trở lên', 'images/product-images/bap-nep-cap-202207161543295487.jpg', 10000, 18000, 1, 9, 5.00, 0, '2023-03-07 00:00:00', '2023-03-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (16, 11, 'Đậu cove Lâm Đồng 500g', 'images/product-images/dau-cove-lam-dong-tui-500g-202205201441226078.jpg', 16000, 23000, 1, 8, 50.00, 665, '2023-03-08 00:00:00', '2023-03-09 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (17, 7, 'Củ sắn 1kg (3 - 5 củ)', 'images/product-images/cu-san-tui-1kg-3-5-cu-202205201546346566.jpg', 15000, 21000, 1, 9, 50.00, 0, '2020-08-16 00:00:00', '2022-12-06 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (18, 7, 'Khoai tây 0.9-1.1kg (10-14 củ)', 'images/product-images/-202308301006493585.jpg', 16000, 24000, 1, 8, 25.00, 556, '2023-08-12 00:00:00', '2023-09-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (19, 12, 'Rau củ nấu súp 400g', 'images/product-images/rau-cu-nau-sup-400g-202304250826472059.jpg', 21500, 31500, 1, 8, 25.00, 43, '2023-03-11 00:00:00', '2023-03-11 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (20, 12, 'Khoai mỡ gọt sẵn 400g', 'images/product-images/khoai-mo-got-vo-goi-400g-202205201016361262.jpg', 21500, 34000, 1, 8, 50.00, 535, '2023-03-12 00:00:00', '2023-03-12 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (21, 12, 'Rau hỗn hợp 300g', 'images/product-images/rau-hon-hop-300g-202304211604279400.jpg', 21500, 31500, 1, 8, 50.00, 367, '2023-03-13 00:00:00', '2023-03-13 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (22, 10, 'Tỏi cô đơn 300g', 'images/product-images/toi-co-don-tui-300g-202205190845024132.jpg', 30000, 40000, 1, 8, 50.00, 75, '2023-03-14 00:00:00', '2023-03-14 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (23, 12, 'Bắp Mỹ tách hạt 250g', 'images/product-images/bap-my-tach-hat-khay-250g-202212231636526263.jpg', 15000, 18000, 1, 8, 50.00, 35, '2023-07-14 00:00:00', '2023-07-14 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (24, 8, 'Yến mạch nguyên chất Oatmeal Cereal gói 350g', 'images/product-images/yen-mach-nguyen-chat-oatmeal-cereal-bich-350g-202006050941400071.jpg', 50000, 56000, 1, 9, 25.00, 0, '2023-03-16 00:00:00', '2023-03-16 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (25, 8, 'Ngũ cốc trái cây Calbee gói 700g', 'images/product-images/ngu-coc-trai-cay-calbee-goi-700g-202201061030381669.jpg', 210000, 280000, 1, 8, 25.00, 32, '2023-03-17 00:00:00', '2023-03-17 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (26, 8, 'Yến mạch trái cây Sunrise vị phô mai bịch 300g', 'images/product-images/yen-mach-trai-cay-sunrise-vi-pho-mai-bich-300g-202110280827521037.jpg', 75000, 95000, 1, 8, 25.00, 36, '2023-03-17 00:00:00', '2023-03-17 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (27, 8, 'Ngũ cốc ăn sáng Nestlé Milo gói 50g', 'images/product-images/ngu-coc-an-sang-nestle-milo-goi-50g-202307251047471726.jpg', 30000, 32000, 1, 8, 70.00, 775, '2023-03-19 00:00:00', '2023-03-19 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (28, 8, 'Ngũ cốc Nestlé Grannola Fitnesse nam việt quất và hạt bí ngô 300g', 'images/product-images/ngu-coc-nestle-grannola-fitnesse-nam-viet-quat-va-hat-bi-ngo-300g-202311241500018548.jpg', 92000, 112000, 1, 8, 70.00, 26, '2023-03-20 00:00:00', '2023-03-20 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (29, 8, 'Hạt chia Sunrise gói 300g', 'images/product-images/hat-chia-sunrise-goi-300g-202102051608220656.jpg', 82000, 102000, 1, 8, 50.00, 73, '2023-03-21 00:00:00', '2023-03-21 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (30, 8, 'Yến mạch nguyên chất Oatta hũ 400g', 'images/product-images/yen-mach-nguyen-chat-oatta-hu-400g-202205230910269570.jpg', 55000, 75000, 1, 8, 50.00, 242, '2023-03-22 00:00:00', '2023-03-25 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (31, 8, 'Thực phẩm bổ sung yến mạch hạt chia Best Choice gói 240g', 'images/product-images/thuc-pham-bo-sung-yen-mach-hat-chia-best-choice-goi-240g-202103101701410503.jpg', 40000, 48000, 1, 8, 50.00, 115, '2022-12-29 00:00:00', '2022-12-30 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (32, 9, 'Hạt điều tỏi ớt Vinahe gói 70g', 'images/product-images/hat-dieu-toi-ot-vinahe-goi-70g-202105221054036436.jpg', 23000, 33000, 1, 9, 50.00, 0, '2023-07-01 00:00:00', '2023-07-01 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (33, 9, 'Đậu phộng vị tỏi ớt Phi Yến hũ 180g', 'images/product-images/dau-phong-vi-toi-ot-phi-yen-hu-180g-202309070836582924.jpg', 25000, 35000, 1, 8, 25.00, 85, '2023-01-07 00:00:00', '2023-01-07 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (34, 9, 'Hạt Macca Úc nứt vỏ Your Superfood hũ 360g', 'images/product-images/hat-macca-uc-nut-vo-your-superfood-hu-360g-202201120833531644.jpg', 137000, 157000, 1, 8, 50.00, 81, '2022-10-06 00:00:00', '2022-10-06 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (35, 9, 'Hỗn hợp hạt vị socola Nutty Trailmix hũ 220g', 'images/product-images/hon-hop-hat-vi-socola-nutty-trailmix-hu-220g-202012181051277230.jpg', 109000, 129000, 1, 8, 50.00, 4, '2022-12-02 00:00:00', '2022-12-13 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (36, 9, 'Hạt hướng dương nguyên vị Chacheer gói 130g', 'images/product-images/hat-huong-duong-nguyen-vi-chacheer-goi-130g-202307052328272630.jpg', 20000, 25000, 1, 8, 50.00, 37, '2023-03-28 00:00:00', '2023-03-31 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (37, 9, 'Hạt hướng dương vị dừa Chacheer gói 130g', 'images/product-images/hat-huong-duong-vi-dua-chacheer-goi-130g-202102051533461550.jpg', 20000, 25000, 1, 8, 50.00, 33, '2023-03-29 00:00:00', '2023-03-29 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (38, 9, 'Tiêu đen hạt gói 50g', 'images/product-images/tieu-den-hat-goi-50g-202009242351555936.jpg', 8900, 11900, 1, 8, 50.00, 84, '2022-12-02 00:00:00', '2022-12-02 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (39, 13, 'Bột đậu nành hạt sen mật ong Vitapro bịch 420g', 'images/product-images/bot-dau-nanh-hat-sen-mat-ong-vitapro-bich-420g-202111021835211739.jpg', 23000, 33000, 1, 8, 50.00, 2, '2022-11-24 00:00:00', '2022-11-24 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (40, 8, 'Bột ngũ cốc Vitapro bịch 400g', 'images/product-images/bot-ngu-coc-vitapro-bich-400g-202111021836110392.jpg', 23000, 33000, 1, 8, 50.00, 556, '2023-01-10 00:00:00', '2023-01-10 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (41, 13, 'Bột đậu xanh hạt sen mật ong Vitapro bịch 420g', 'images/product-images/bot-dau-xanh-hat-sen-mat-ong-vitapro-bich-420g-202111021833538201.jpg', 23000, 33000, 1, 8, 25.00, 34, '2023-01-16 00:00:00', '2023-01-16 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (42, 14, 'Gạo lứt tím than Lotus Rice NutriChoice hộp 0,5kg', 'images/product-images/gao-lut-tim-than-lotus-rice-nutrichoice-hop-0-5kg-201906210859255437.jpg', 52000, 62000, 1, 8, 25.00, 22, '2023-01-17 00:00:00', '2023-01-17 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (43, 14, 'Gạo lứt huyết rồng Lotus Rice NutriChoice hộp 0,5kg', 'images/product-images/gao-lut-huyet-rong-lotus-rice-nutrichoice-hop-0-5kg-201906210948298885.jpg', 52000, 62000, 1, 8, 25.00, 16, '2023-03-22 00:00:00', '2023-03-31 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (44, 14, 'Gạo Cỏ May lứt nâu organic hộp 1kg', 'images/product-images/gao-co-may-lut-nau-organic-hop-1kg-202106260813001938.jpg', 50000, 66000, 1, 8, 50.00, 998, '2023-05-20 00:00:00', '2023-05-20 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (45, 6, 'Nếp Bắc Việt San túi 1kg', 'images/product-images/nep-bac-viet-san-tui-1kg-201912101503256744.jpg', 32000, 42000, 1, 8, 50.00, 436, '2023-07-14 00:00:00', '2023-07-14 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (46, 6, 'Nếp than PMT túi 1kg', 'images/product-images/nep-than-pmt-tui-1kg-201912101601134334.jpg', 40500, 55500, 1, 8, 50.00, 4, '2023-03-16 00:00:00', '2023-03-16 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (47, 6, 'Nếp cái hoa vàng Vinh Hiển túi 1kg', 'images/product-images/nep-cai-hoa-vang-vinh-hien-tui-1kg-202008150913276084.jpg', 30000, 36000, 1, 8, 50.00, 565, '2023-03-17 00:00:00', '2023-03-17 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (48, 6, 'Nếp sáp Vinh Hiển túi 1kg', 'images/product-images/nep-sap-vinh-hien-tui-1kg-202006251846038687.jpg', 22500, 32500, 1, 8, 25.00, 21, '2023-03-17 00:00:00', '2023-03-17 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (49, 14, 'Gạo lứt đỏ Vinh Hiển túi 1kg', 'images/product-images/gao-lut-do-vinh-hien-tui-1kg-202010171224597621.jpg', 20000, 27000, 1, 8, 25.00, 79, '2023-03-19 00:00:00', '2023-04-14 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (50, 10, 'Xúc xích dinh dưỡng thịt heo Ponnie gói 175g', 'images/product-images/-202207290833032025.jpg', 16500, 22500, 1, 8, 25.00, 1, '2023-03-20 00:00:00', '2023-03-20 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (51, 10, 'Lạp xưởng heo Vissan gói 200g', 'images/product-images/lap-xuong-heo-vissan-goi-200g-202011170920354523.jpg', 41000, 51000, 1, 8, 50.00, 23, '2023-03-21 00:00:00', '2023-03-21 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (52, 10, 'Lạp xưởng Mai Quế Lộ C.P 500g', 'images/product-images/lap-xuong-mai-que-lo-cp-500g-202004251859056840.jpg', 87000, 107000, 1, 8, 50.00, 33, '2023-03-22 00:00:00', '2023-04-01 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (53, 8, 'Thực phẩm bổ sung yến mạch gạo lứt Yumfood gói 210g', 'images/product-images/thuc-pham-bo-sung-yen-mach-yumfood-gao-lut-goi-210g-30g-x-7-goi-202010122216179623.jpg', 32000, 42000, 1, 8, 50.00, 5, '2022-12-29 00:00:00', '2022-12-29 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (54, 8, 'Thực phẩm bổ sung yến mạch nếp cẩm Yumfood gói 210g', 'images/product-images/thuc-pham-bo-sung-yen-mach-yumfood-nep-cam-goi-210g-30g-x-7-goi-202010122213538084.jpg', 32000, 42000, 1, 8, 50.00, 446, '2023-07-01 00:00:00', '2023-07-01 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (55, 11, 'Đậu đỏ gói 150g', 'images/product-images/dau-do-hat-cao-cap-vietfresh-150g-202012092312144594.jpg', 8900, 11900, 1, 8, 50.00, 2, '2023-03-12 00:00:00', '2023-04-02 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (56, 11, 'Đậu trắng bi 150g', 'images/product-images/dau-trang-bi-vietfresh-150g-202104230116055741.jpg', 12600, 15600, 1, 8, 50.00, 46, '2023-03-13 00:00:00', '2023-03-13 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (57, 9, 'Hạt sen khô gói 100g', 'images/product-images/hat-sen-kho-duc-dung-goi-100g-202110290743596457.jpg', 30000, 35000, 1, 8, 50.00, 45, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (58, 2, 'Gạo thơm Vua Gạo Phù Sa túi 5kg', 'images/product-images/gao-phu-sa-tui-5kg.jpg', 100000, 120000, 1, 8, 5.00, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (59, 2, 'Gạo thơm Vua Gạo Đậm Đà ST24 túi 5kg', 'images/product-images/gao-st24-tui-5kg.jpg', 90000, 110000, 1, 8, 5.00, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (60, 2, 'Gạo Nhật Shinichi Vua Gạo túi 5kg', 'images/product-images/gao-nhat-shinichi-tui-5kg.jpg', 20000, 28000, 1, 8, 5.00, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (61, 2, 'Gạo Lạc Việt đệ nhất ST25 túi 5kg', 'images/product-images/gao-lac-viet-de-nhat-st25-tui-5kg.jpg', 20000, 26000, 1, 8, 5.00, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (62, 7, 'Bắp nữ hoàng trái 250g trở lên', 'images/product-images/bap-nu-hoang-trai-tu-250g-tro-len.jpg', 60000, 64000, 1, 8, 0.25, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (63, 7, 'Khoai lang mật 1kg (2 - 5 củ)', 'images/product-images/khoai-lang-mat-tui-1kg-3-10-cu%20(1).jpg', 17000, 19500, 1, 9, 1.00, 0, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (64, 7, 'Khoai lang tím 1kg', 'images/product-images/khoai-lang-tim-1kg%20(1).jpg', 36000, 38000, 1, 8, 1.00, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (65, 7, 'Khoai sọ gọt vỏ 400g', 'images/product-images/khoai-so-got-vo-400g%20(1).jpg', 85000, 90000, 1, 8, 0.40, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (66, 9, 'Hạt sen khô Việt San gói 150g', 'images/product-images/hat-sen-viet-san-150g-201812041634117252.jpg', 230000, 250000, 1, 8, 0.15, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (67, 9, 'Hạt điều vỏ lụa Yến Nhung hộp 180g', 'images/product-images/hat-dieu-vo-lua-yen-nhung-hop-180g-202211260948312440.jpg', 350000, 360000, 1, 8, 0.18, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (68, 9, 'Hạt hạnh nhân Mỹ Your Superfood hũ 450g', 'images/product-images/hat-hanh-nhan-my-your-superfood-hu-450g-202201120844001533.jpg', 450000, 500000, 1, 8, 0.45, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (69, 9, 'Hạt điều rang củi Your Superfood hộp tròn 240g', 'images/product-images/hat-dieu-rang-cui-your-superfood-hop-tron-240g-202311040947410838.jpg', 450000, 500000, 1, 8, 0.24, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (70, 11, 'Đậu nành gói 500g', 'images/product-images/dau-nanh-naita-500g-202204161723244150.jpg', 42000, 45000, 1, 8, 0.50, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (71, 11, 'Đậu phộng Việt San 150g', 'images/product-images/dau-phong-viet-san-150g-201812041440132432.jpg', 74000, 76000, 1, 8, 0.15, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (72, 11, 'Đậu xanh không vỏ Việt San 500g', 'images/product-images/dau-xanh-khong-vo-viet-san-500g-201812041347258312.jpg', 65000, 70000, 1, 8, 0.50, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (73, 11, 'Đậu đen Việt San 300g', 'images/product-images/dau-den-viet-san-300g-201812041650351216.jpg', 42000, 46000, 1, 8, 0.30, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (74, 8, 'Ngũ cốc dinh dưỡng MacCereal bịch 560g', 'images/product-images/ngu-coc-macgereal.jpg', 100000, 112000, 1, 8, 0.56, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (75, 8, 'Ngũ cốc dinh dưỡng NutiFood bịch 500g', 'images/product-images/ngu-coc-dinh-duong-nutifood-nguyen-cam-bo-sung-canxi-bich-500g.jpg', 100000, 110000, 1, 8, 0.50, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (76, 8, 'Bột ngũ cốc ăn kiêng Euro Cereal gói 500g', 'images/product-images/bot-ngu-coc-an-kieng-euro-cereal-goi-500g-25g-x-20-goi-202111192314385764.jpeg', 100000, 114000, 1, 8, 0.50, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (77, 8, 'Sữa dinh dưỡng ngũ cốc Dutch Lady túi 300g', 'images/product-images/sua-dinh-duong-ngu-coc-dutch-lady-tui-300g-12-goi-x-25g-202204231154439430.jpg', 200000, 216000, 1, 8, 0.30, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (78, 10, 'Bánh canh ống Mikiri gói 300g', 'images/product-images/banh-canh-ong-mikiri-goi-300g-202308210940075440.jpg', 87000, 93000, 1, 8, 0.30, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (79, 10, 'Bánh mì tươi đông lạnh O\'smiles 350g', 'images/product-images/banh-mi-tuoi-osmiles-goi-350g-70g-x-5-o-202101141649320940.jpg', 90000, 100000, 1, 8, 0.35, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (80, 10, 'Bánh gạo Tteokbokki Hàn Quốc HT Food gói 500g', 'images/product-images/banh-gao-tteokbokki-han-quoc-ht-food-goi-500g-202201181305036109.jpg', 70000, 76000, 1, 8, 0.50, 55, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (81, 10, 'Bánh bao nhân khoai môn C.P 270g', 'images/product-images/banh-bao-nhan-khoai-mon-cp-270g-202212261129142314.jpg', 80000, 85000, 1, 8, 0.27, 53, '2023-03-14 00:00:00', '2023-07-08 00:00:00', '2024-07-17 15:39:42');
INSERT INTO `products` VALUES (145, 3, 'Gạo Lạc Việt 5kg', 'images/product-images/sellingpoint1.jpg', 125000, 130000, 1, 8, 5.00, 63, '2024-01-26 12:57:26', '2024-01-26 12:57:26', '2024-07-17 15:39:42');

-- ----------------------------
-- Table structure for products_sale
-- ----------------------------
DROP TABLE IF EXISTS `products_sale`;
CREATE TABLE `products_sale`  (
  `productId` int NOT NULL,
  `sale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `newPrice` decimal(10, 0) NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `quantitySold` int NULL DEFAULT NULL,
  `startDateDiscount` datetime NULL DEFAULT NULL,
  `endDateDiscount` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products_sale
-- ----------------------------
INSERT INTO `products_sale` VALUES (1, '20.000đ', 119000, 149, 109, '2024-01-29 08:50:02', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (5, '19%', 108540, 331, 173, '2024-01-28 18:48:53', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (6, '20.000đ', 113000, 444, 216, '2024-01-26 10:50:27', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (10, '30.000đ', 127000, 145, 125, '2024-01-29 16:05:06', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (15, '42%', 10440, 280, 204, '2024-01-21 07:25:44', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (17, '51%', 10290, 317, 312, '2024-01-27 00:11:43', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (18, '44%', 13440, 195, 125, '2024-01-29 05:56:23', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (23, '8.000đ', 10000, 353, 190, '2024-01-22 03:27:48', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (26, '50%', 47500, 454, 222, '2024-01-21 02:12:57', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (28, '16%', 94080, 132, 112, '2024-01-23 12:49:19', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (30, '45%', 41250, 336, 301, '2024-01-28 06:38:42', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (32, '10.000đ', 23000, 296, 275, '2024-01-28 07:36:25', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (35, '43%', 73530, 499, 221, '2024-01-27 09:19:18', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (37, '47%', 13250, 309, 248, '2024-01-28 15:30:51', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (40, '58%', 13860, 490, 391, '2024-01-25 07:11:48', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (43, '28%', 44640, 421, 348, '2024-01-24 09:01:24', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (44, '33%', 44220, 279, 267, '2024-01-29 02:59:19', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (47, '30%', 25200, 228, 203, '2024-01-29 20:55:34', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (49, '32%', 18360, 113, 110, '2024-01-27 20:10:45', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (51, '35%', 33150, 413, 282, '2024-01-21 16:07:15', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (52, '31%', 73830, 321, 104, '2024-01-29 01:38:23', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (56, '41%', 9204, 281, 136, '2024-01-26 08:39:31', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (57, '5.000đ', 30000, 356, 255, '2024-01-29 12:52:26', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (66, '21%', 197500, 138, 125, '2024-01-26 17:23:54', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (71, '17%', 63080, 114, 102, '2024-01-23 04:32:33', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (72, '14%', 60200, 438, 319, '2024-01-28 14:16:17', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (73, '18%', 37720, 383, 268, '2024-01-28 06:52:25', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (78, '47%', 49290, 441, 261, '2024-01-24 10:08:22', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (79, '39%', 61000, 423, 300, '2024-01-22 20:10:16', '2024-08-06 00:21:56');
INSERT INTO `products_sale` VALUES (81, '35%', 55250, 368, 233, '2024-01-21 20:54:43', '2024-08-06 00:21:56');

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount` decimal(10, 0) NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `startDate` datetime NULL DEFAULT NULL,
  `expDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of promotions
-- ----------------------------

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `dateCreated` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewId`) USING BTREE,
  INDEX `fk_user`(`userId` ASC) USING BTREE,
  INDEX `fk_product`(`productId` ASC) USING BTREE,
  CONSTRAINT `fk_product` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 446 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (1, 2, 1, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (2, 3, 2, 4, 'Chất lượng ổn, giá hợp lý', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (3, 4, 3, 5, 'Sản phẩm đáng mua, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (4, 5, 4, 4, 'Sản phẩm phù hợp với nhu cầu, đánh giá 4 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (5, 6, 5, 5, 'Đánh giá cao cho sản phẩm, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (6, 7, 6, 4, 'Hài lòng với sản phẩm, đánh giá 4 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (7, 8, 7, 5, 'Giao hàng nhanh chóng, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (8, 9, 8, 4, 'Thiết kế đẹp, chất lượng ổn', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (9, 10, 9, 4, 'Sản phẩm không gây kích ứng, đánh giá 4 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (10, 11, 10, 5, 'Chất lượng sản phẩm đỉnh cao, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (11, 12, 11, 4, 'Sản phẩm nhẹ nhàng và an toàn, đánh giá 4 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (12, 13, 12, 3, 'Giao hàng nhanh chóng, sản phẩm nhẹ nhàng', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (17, 18, 17, 3, 'Sản phẩm khó sử dụng, cần cải thiện', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (18, 19, 18, 5, 'Bền bỉ, đánh giá 5 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (19, 2, 19, 2, 'Sản phẩm khó giữ sạch, chất lượng tốt', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (20, 3, 81, 1, 'Đáng trải nghiệm, không hài lòng', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (21, 4, 21, 4, 'Giao hàng nhanh gọn, đánh giá 4 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (22, 5, 22, 3, 'Chất lượng tốt, cần cải thiện', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (23, 6, 23, 5, 'Sản phẩm chất lượng cao, đánh giá 5 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (24, 7, 24, 2, 'Giá trị tốt, chất lượng ổn', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (25, 8, 25, 1, 'Giao hàng kém, không hài lòng', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (26, 9, 26, 4, 'Sản phẩm giữ nhiệt tốt, đánh giá 4 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (27, 10, 27, 3, 'Thời gian giao hàng nhanh, cần cải thiện', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (28, 11, 28, 5, 'Sản phẩm nhẹ, đánh giá 5 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (29, 12, 29, 2, 'Khó kiểm soát, cần cải thiện', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (30, 13, 30, 1, 'Không phải lựa chọn tốt nhất, không hài lòng', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (34, 17, 34, 2, 'Hỗ trợ khách hàng tốt, chất lượng ổn', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (35, 18, 35, 1, 'Khó chịu, không hài lòng', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (36, 19, 36, 4, 'Sản phẩm phù hợp với nhu cầu, đánh giá 4 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (37, 2, 37, 3, 'Sản phẩm giữ nước tốt, cần cải thiện', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (38, 3, 38, 5, 'Chất lượng tốt nhất, đánh giá 5 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (39, 4, 39, 2, 'Giao hàng nhanh, chất lượng ổn', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (40, 5, 40, 1, 'Không mua lần nữa, không hài lòng', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (41, 6, 41, 4, 'Nên thử, đánh giá 4 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (42, 7, 42, 3, 'Dùng lâu không hỏng, cần cải thiện', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (43, 8, 43, 5, 'Sản phẩm ưa chuộng, đánh giá 5 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (44, 9, 44, 2, 'Không phải lựa chọn tốt, chất lượng ổn', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (45, 10, 45, 1, 'Giao hàng nhanh nhất, không hài lòng', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (46, 11, 46, 4, 'Đẹp mắt, đánh giá 4 sao', '2024-01-26 18:58:57');
INSERT INTO `reviews` VALUES (47, 12, 47, 3, 'Thời gian giao hàng tốt, cần cải thiện', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (48, 13, 48, 5, 'Chất lượng vượt trội, đánh giá 5 sao', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (52, 17, 52, 3, 'Khó sử dụng, cần cải thiện', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (53, 18, 53, 5, 'Sản phẩm ưa chuộng nhất, đánh giá 5 sao', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (54, 19, 54, 2, 'Giao hàng đúng hẹn, chất lượng ổn', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (55, 2, 55, 1, 'Sản phẩm không đúng với hình ảnh, không hài lòng', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (56, 3, 56, 4, 'Giao hàng kém chất lượng, đánh giá 4 sao', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (57, 4, 57, 3, 'Sản phẩm giữ ẩm tốt, cần cải thiện', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (58, 5, 58, 5, 'Giá hợp lý, đánh giá 5 sao', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (59, 6, 59, 2, 'Sản phẩm nổi bật, chất lượng ổn', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (60, 7, 60, 1, 'Hỗ trợ khách hàng tốt nhất, không hài lòng', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (61, 8, 61, 4, 'Sản phẩm kém chất lượng, đánh giá 4 sao', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (62, 9, 62, 3, 'Giao hàng nhanh nhất, cần cải thiện', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (63, 10, 63, 5, 'Đánh giá cao, đánh giá 5 sao', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (64, 11, 64, 2, 'Sản phẩm an toàn, chất lượng ổn', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (65, 12, 65, 1, 'Giá cả hợp lý, không hài lòng', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (66, 13, 66, 4, 'Không mua lần nữa, đánh giá 4 sao', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (70, 17, 70, 1, 'Giao hàng chậm, không hài lòng', '2024-01-26 18:59:27');
INSERT INTO `reviews` VALUES (71, 18, 71, 4, 'Nên mua, đánh giá 4 sao', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (72, 19, 72, 3, 'Chất lượng tốt, cần cải thiện', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (73, 2, 73, 5, 'Sản phẩm nhẹ nhàng, đánh giá 5 sao', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (74, 3, 74, 2, 'Sản phẩm khó sử dụng, chất lượng ổn', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (75, 4, 75, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (76, 5, 76, 4, 'Sản phẩm an toàn, đánh giá 4 sao', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (77, 6, 77, 3, 'Không phù hợp, cần cải thiện', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (78, 7, 78, 5, 'Thời gian giao hàng nhanh, đánh giá 5 sao', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (79, 8, 79, 2, 'Sản phẩm kém chất lượng, cần cải thiện', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (80, 9, 80, 1, 'Giao hàng kém chất lượng, không hài lòng', '2024-01-26 19:00:25');
INSERT INTO `reviews` VALUES (81, 10, 1, 4, 'Chất lượng kém, đánh giá 4 sao', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (82, 11, 2, 3, 'Sản phẩm giữ nước tốt, cần cải thiện', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (83, 12, 3, 5, 'Mức giá hợp lý, đánh giá 5 sao', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (84, 13, 4, 2, 'Giao hàng nhanh chóng, chất lượng ổn', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (88, 17, 5, 5, 'Chất lượng tốt nhất, đánh giá 5 sao', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (89, 18, 6, 2, 'Hỗ trợ khách hàng kém, chất lượng ổn', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (90, 19, 7, 1, 'Chất lượng kém nhất, không hài lòng', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (91, 2, 8, 4, 'Sản phẩm tốt nhất, đánh giá 4 sao', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (92, 3, 9, 3, 'Khó sử dụng, cần cải thiện', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (93, 4, 10, 5, 'Sản phẩm ưa chuộng nhất, đánh giá 5 sao', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (94, 5, 11, 2, 'Giao hàng đúng hẹn, chất lượng ổn', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (95, 6, 12, 1, 'Sản phẩm không đúng với hình ảnh, không hài lòng', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (96, 7, 13, 4, 'Giao hàng kém chất lượng, đánh giá 4 sao', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (97, 8, 14, 3, 'Sản phẩm giữ ẩm tốt, cần cải thiện', '2024-01-26 19:02:02');
INSERT INTO `reviews` VALUES (101, 3, 3, 5, 'Rất tốt', '2024-01-26 18:22:59');
INSERT INTO `reviews` VALUES (102, 4, 4, 3, 'Không phải lựa chọn tốt', '2024-01-26 18:22:59');
INSERT INTO `reviews` VALUES (103, 5, 4, 4, 'Đánh giá cao', '2024-01-26 18:22:59');
INSERT INTO `reviews` VALUES (104, 6, 5, 2, 'Sản phẩm không đúng với hình ảnh', '2024-01-26 18:22:59');
INSERT INTO `reviews` VALUES (105, 7, 8, 1, 'Giao hàng kém chất lượng', '2024-01-26 18:22:59');
INSERT INTO `reviews` VALUES (106, 8, 4, 4, 'Sản phẩm giữ ẩm tốt, đánh giá 4 sao', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (107, 9, 1, 3, 'Giá hợp lý, chất lượng tốt', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (108, 10, 9, 5, 'Sản phẩm nổi bật, đánh giá 5 sao', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (109, 11, 10, 2, 'Hỗ trợ khách hàng tốt nhất, chất lượng khá', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (110, 12, 11, 1, 'Sản phẩm kém chất lượng, không hài lòng', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (111, 13, 12, 4, 'Giao hàng nhanh nhất, đánh giá 4 sao', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (112, 1, 13, 3, 'Sản phẩm giữ ấm tốt, cần cải thiện', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (113, 2, 14, 5, 'Đánh giá cao, đánh giá 5 sao', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (114, 3, 15, 2, 'Sản phẩm an toàn, chất lượng ổn', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (115, 17, 16, 1, 'Giá cả hợp lý, không hài lòng', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (116, 18, 17, 4, 'Không mua lần nữa, đánh giá 4 sao', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (117, 19, 18, 3, 'Hỗ trợ khách hàng tốt nhất, chất lượng tốt', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (118, 2, 19, 5, 'Sản phẩm khá tốt, đánh giá 5 sao', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (119, 3, 20, 2, 'Sản phẩm không ổn định, cần cải thiện', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (120, 4, 22, 1, 'Giao hàng chậm, không hài lòng', '2024-01-26 19:24:58');
INSERT INTO `reviews` VALUES (121, 5, 22, 4, 'Nên mua, đánh giá 4 sao', '2024-01-26 19:26:01');
INSERT INTO `reviews` VALUES (122, 6, 23, 3, 'Chất lượng tốt, cần cải thiện', '2024-01-26 19:26:01');
INSERT INTO `reviews` VALUES (123, 7, 15, 5, 'Sản phẩm nhẹ nhàng, đánh giá 5 sao', '2024-01-26 19:26:01');
INSERT INTO `reviews` VALUES (124, 8, 26, 2, 'Sản phẩm khó sử dụng, chất lượng ổn', '2024-01-26 19:26:01');
INSERT INTO `reviews` VALUES (125, 9, 27, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 19:26:01');
INSERT INTO `reviews` VALUES (126, 10, 27, 4, 'Sản phẩm an toàn, đánh giá 4 sao', '2024-01-26 19:27:02');
INSERT INTO `reviews` VALUES (127, 11, 28, 3, 'Không phù hợp, cần cải thiện', '2024-01-26 19:27:02');
INSERT INTO `reviews` VALUES (128, 12, 29, 5, 'Thời gian giao hàng nhanh, đánh giá 5 sao', '2024-01-26 19:27:02');
INSERT INTO `reviews` VALUES (129, 13, 30, 2, 'Sản phẩm kém chất lượng, cần cải thiện', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (130, 7, 31, 1, 'Giao hàng kém chất lượng, không hài lòng', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (131, 8, 32, 4, 'Chất lượng kém, đánh giá 4 sao', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (132, 9, 33, 3, 'Sản phẩm tốt nhất, chất lượng khá', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (133, 17, 34, 5, 'Giá phải chăng nhất, đánh giá 5 sao', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (134, 18, 35, 2, 'Chất lượng khá, chất lượng tốt', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (135, 19, 36, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (136, 2, 37, 4, 'Sản phẩm nhẹ nhàng, đánh giá 4 sao', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (137, 3, 39, 3, 'Giao hàng nhanh gọn, chất lượng tốt', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (138, 4, 40, 5, 'Chất lượng tốt nhất, đánh giá 5 sao', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (139, 5, 40, 2, 'Sản phẩm kém chất lượng nhất, cần cải thiện', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (140, 6, 41, 1, 'Giao hàng chậm nhất, không hài lòng', '2024-01-26 19:27:58');
INSERT INTO `reviews` VALUES (141, 7, 43, 4, 'Hài lòng, đánh giá 4 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (142, 8, 44, 3, 'Sản phẩm giữ nước tốt nhất, chất lượng tốt', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (143, 9, 47, 5, 'Chất lượng tốt nhất, đánh giá 5 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (144, 10, 45, 2, 'Không phải lựa chọn tốt, cần cải thiện', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (145, 11, 46, 1, 'Sản phẩm kém, không hài lòng', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (146, 12, 47, 4, 'Sản phẩm giữ nước tốt nhất, đánh giá 4 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (147, 13, 48, 3, 'Đáng tiền, cần cải thiện', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (148, 10, 49, 5, 'Thời gian giao hàng nhanh nhất, đánh giá 5 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (149, 12, 50, 2, 'Sản phẩm kém chất lượng nhất, cần cải thiện', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (150, 13, 51, 1, 'Sản phẩm giữ nước tốt nhất, không hài lòng', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (151, 17, 52, 4, 'Sản phẩm tốt nhất, đánh giá 4 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (152, 18, 53, 3, 'Hỗ trợ khách hàng kém, cần cải thiện', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (153, 19, 54, 5, 'Chất lượng tốt, đánh giá 5 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (154, 2, 55, 2, 'Sản phẩm không đúng với hình ảnh, cần cải thiện', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (155, 3, 57, 1, 'Giao hàng kém chất lượng, không hài lòng', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (156, 4, 58, 4, 'Sản phẩm giữ ẩm tốt, đánh giá 4 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (157, 5, 58, 3, 'Giá hợp lý, chất lượng tốt', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (158, 6, 59, 5, 'Sản phẩm nổi bật, đánh giá 5 sao', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (159, 7, 61, 2, 'Hỗ trợ khách hàng tốt nhất, cần cải thiện', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (160, 8, 69, 1, 'Sản phẩm kém chất lượng, không hài lòng', '2024-01-26 19:28:58');
INSERT INTO `reviews` VALUES (161, 9, 12, 4, 'Giao hàng nhanh nhất, đánh giá 4 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (162, 10, 63, 3, 'Sản phẩm giữ ấm tốt, chất lượng tốt', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (163, 11, 64, 5, 'Đánh giá cao, đánh giá 5 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (164, 12, 65, 2, 'Sản phẩm an toàn, chất lượng ổn', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (165, 13, 66, 1, 'Giá cả hợp lý, không hài lòng', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (166, 17, 67, 4, 'Không mua lần nữa, đánh giá 4 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (167, 18, 68, 3, 'Hỗ trợ khách hàng tốt nhất, chất lượng tốt', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (168, 19, 69, 5, 'Sản phẩm khá tốt, đánh giá 5 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (169, 17, 70, 2, 'Sản phẩm không ổn định, cần cải thiện', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (170, 18, 71, 1, 'Giao hàng chậm, không hài lòng', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (171, 19, 72, 4, 'Nên mua, đánh giá 4 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (172, 2, 73, 3, 'Chất lượng tốt, cần cải thiện', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (173, 3, 80, 5, 'Sản phẩm nhẹ nhàng, đánh giá 5 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (174, 4, 76, 2, 'Sản phẩm khó sử dụng, chất lượng ổn', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (175, 5, 76, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (176, 6, 77, 4, 'Sản phẩm an toàn, đánh giá 4 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (177, 7, 79, 3, 'Không phù hợp, cần cải thiện', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (178, 8, 80, 5, 'Thời gian giao hàng nhanh, đánh giá 5 sao', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (179, 9, 81, 2, 'Sản phẩm kém chất lượng, cần cải thiện', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (180, 10, 81, 1, 'Giao hàng kém chất lượng, không hài lòng', '2024-01-26 19:31:16');
INSERT INTO `reviews` VALUES (306, 2, 4, 4, 'Ngon lắm', '2024-01-24 20:49:00');
INSERT INTO `reviews` VALUES (373, 2, 1, 4, 'Nhìn khá đẹp', '2023-11-16 12:45:30');
INSERT INTO `reviews` VALUES (374, 3, 2, 3, 'Cũng ổn', '2023-11-17 14:22:18');
INSERT INTO `reviews` VALUES (375, 4, 3, 5, 'Tuyệt vời', '2023-11-18 09:10:45');
INSERT INTO `reviews` VALUES (376, 5, 4, 4, 'Được đấy', '2023-11-19 17:30:02');
INSERT INTO `reviews` VALUES (377, 6, 5, 2, 'Không thích', '2023-11-20 08:55:12');
INSERT INTO `reviews` VALUES (378, 7, 6, 5, 'Quá tuyệt vời', '2023-11-21 21:11:05');
INSERT INTO `reviews` VALUES (379, 8, 7, 3, 'Có vẻ bình thường', '2023-11-22 16:40:37');
INSERT INTO `reviews` VALUES (380, 9, 8, 4, 'Tạm được', '2023-11-23 19:48:59');
INSERT INTO `reviews` VALUES (381, 10, 9, 5, 'Rất hài lòng', '2023-11-24 10:17:23');
INSERT INTO `reviews` VALUES (382, 11, 10, 2, 'Không ổn', '2023-11-25 23:55:41');
INSERT INTO `reviews` VALUES (383, 12, 11, 4, 'Chấp nhận được', '2023-11-26 15:30:14');
INSERT INTO `reviews` VALUES (384, 13, 12, 3, 'Không tốt lắm', '2023-11-27 18:42:08');
INSERT INTO `reviews` VALUES (385, 13, 1, 5, 'Sản phẩm rất tốt', '2024-01-25 20:06:28');
INSERT INTO `reviews` VALUES (387, 2, 2, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (388, 2, 3, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (389, 2, 4, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (390, 2, 5, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (391, 2, 6, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (392, 2, 7, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (393, 2, 9, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (394, 2, 10, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (395, 2, 2, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (396, 2, 3, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (397, 2, 4, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (398, 2, 5, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (399, 2, 6, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (400, 2, 7, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (401, 2, 9, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (402, 2, 10, 5, 'Sản phẩm tốt, đánh giá 5 sao', '2024-01-26 18:54:15');
INSERT INTO `reviews` VALUES (403, 3, 7, 1, 'Giao hàng chậm, không hài lòng', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (404, 3, 10, 5, 'Nên mua, đánh giá 4 sao', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (405, 3, 17, 3, 'Chất lượng tốt, cần cải thiện', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (406, 3, 29, 5, 'Sản phẩm nhẹ nhàng, đánh giá 5 sao', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (407, 3, 41, 2, 'Sản phẩm khó sử dụng, chất lượng ổn', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (408, 3, 45, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (409, 4, 15, 4, 'Sản phẩm an toàn, đánh giá 4 sao', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (410, 4, 78, 3, 'Không phù hợp, cần cải thiện', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (411, 4, 79, 5, 'Thời gian giao hàng nhanh, đánh giá 5 sao', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (412, 4, 80, 2, 'Sản phẩm kém chất lượng, cần cải thiện', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (413, 4, 81, 1, 'Giao hàng kém chất lượng, không hài lòng', '2024-01-26 20:05:06');
INSERT INTO `reviews` VALUES (414, 7, 7, 1, 'Giao hàng chậm, không hài lòng', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (415, 7, 10, 5, 'Nên mua, đánh giá 4 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (416, 7, 17, 4, 'Chất lượng tốt, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (417, 7, 29, 5, 'Sản phẩm nhẹ nhàng, đánh giá 5 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (418, 7, 41, 2, 'Sản phẩm khó sử dụng, chất lượng ổn', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (419, 7, 45, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (420, 7, 50, 4, 'Sản phẩm an toàn, đánh giá 4 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (421, 7, 80, 4, 'Không phù hợp, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (422, 7, 55, 5, 'Thời gian giao hàng nhanh, đánh giá 5 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (423, 7, 81, 2, 'Sản phẩm kém chất lượng, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (424, 8, 1, 5, 'Nên mua, đánh giá 4 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (425, 8, 8, 5, 'Chất lượng tốt, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (426, 8, 29, 5, 'Sản phẩm nhẹ nhàng, đánh giá 5 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (427, 8, 41, 2, 'Sản phẩm khó sử dụng, chất lượng ổn', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (428, 8, 45, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (429, 8, 68, 4, 'Sản phẩm an toàn, đánh giá 4 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (430, 8, 78, 4, 'Không phù hợp, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (431, 8, 71, 5, 'Thời gian giao hàng nhanh, đánh giá 5 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (432, 9, 2, 2, 'Sản phẩm kém chất lượng, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (433, 9, 10, 5, 'Nên mua, đánh giá 4 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (434, 9, 17, 4, 'Chất lượng tốt, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (435, 9, 29, 5, 'Sản phẩm nhẹ nhàng, đánh giá 5 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (436, 9, 41, 2, 'Sản phẩm khó sử dụng, chất lượng ổn', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (437, 9, 45, 1, 'Đánh giá cao, không hài lòng', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (438, 9, 63, 4, 'Sản phẩm an toàn, đánh giá 4 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (439, 9, 78, 4, 'Không phù hợp, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (440, 9, 79, 5, 'Thời gian giao hàng nhanh, đánh giá 5 sao', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (441, 8, 70, 2, 'Sản phẩm kém chất lượng, cần cải thiện', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (442, 8, 67, 1, 'Giao hàng kém chất lượng, không hài lòng', '2024-01-26 20:19:34');
INSERT INTO `reviews` VALUES (445, 20, 2, 3, 'cung tam', '2024-07-06 00:08:10');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin');
INSERT INTO `roles` VALUES (2, 'user');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `statusId` int NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`statusId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'hoạt động');
INSERT INTO `status` VALUES (2, 'chưa kích hoạt email');
INSERT INTO `status` VALUES (3, 'bị cấm');
INSERT INTO `status` VALUES (4, 'đang xử lý');
INSERT INTO `status` VALUES (5, 'đang vận chuyển');
INSERT INTO `status` VALUES (6, 'đã hoàn thành');
INSERT INTO `status` VALUES (7, 'đã hủy');
INSERT INTO `status` VALUES (8, 'còn hàng');
INSERT INTO `status` VALUES (9, 'hết hàng');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userId` int NOT NULL AUTO_INCREMENT,
  `passwordHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `roleId` int NULL DEFAULT 2,
  `statusId` int NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdated` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `fk_users_role`(`roleId` ASC) USING BTREE,
  INDEX `fk_users_status`(`statusId` ASC) USING BTREE,
  CONSTRAINT `fk_users_role` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_users_status` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'admin', 'admin@gmail.com', '0925821477', 1, 1, '2024-01-25 13:27:35', '2024-01-25 13:27:35');
INSERT INTO `users` VALUES (2, '$2a$04$p8j7jJjP44dJr7tJr1qNzOf4fMeh5bhVFvIIJJHMYbJLf.iD8OXYm', 'Thanh Minh', 'minh@gmail.com', '0925821477', 2, 1, '2024-01-26 20:19:33', '2024-01-26 20:19:33');
INSERT INTO `users` VALUES (3, '$2a$04$p8j7jJjP44dJr7tJr1qNzOf4fMeh5bhVFvIIJJHMYbJLf.iD8OXYm', 'Huynh Minh', 'huynhminh@gmail.com', '0925821477', 2, 1, '2023-03-29 00:00:00', '2023-03-29 00:00:00');
INSERT INTO `users` VALUES (4, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'Chuc Ngan', 'chucngan@gmail.com', '0925821472', 2, 1, '2024-07-13 02:25:05', '2024-07-13 02:25:05');
INSERT INTO `users` VALUES (5, '$2a$04$l3Qw4OrBxY41Qbxhy2SzPOVY0Dlj4/GS6bz.ZBj.Ih05N5XMH5wca', 'Hồng Hạnh', 'hanhlam@gmail.com', '0925821477', 2, 1, '2024-01-24 20:54:31', '2024-01-24 20:54:31');
INSERT INTO `users` VALUES (6, '$2a$04$85li0fsOjQ1FyT0BtG5/rOBTwBkxe4Fo/zMrwHdhn3/qTGZSbHJ0a', 'Dư Thành Thảo', 'thaodu@gmail.com', '0224452222', 2, 1, '2024-01-24 20:54:37', '2024-01-24 20:54:37');
INSERT INTO `users` VALUES (7, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'Nguyễn Thị Chúc Giang', 'chuctet@gmail.com', '0925821477', 2, 1, '2024-01-24 20:55:12', '2024-01-24 20:55:12');
INSERT INTO `users` VALUES (8, '$2a$04$a15S6so/.fnSa3fDVFcUOu3OXbz1dpCZ.25VpZPKU4ShukFkluprO', 'Trần Văn Trọng', 'vantrong@gmail.com', '0925832477', 2, 1, '2024-01-24 20:56:16', '2024-01-24 20:56:16');
INSERT INTO `users` VALUES (9, '$2a$04$p8j7jJjP44dJr7tJr1qNzOf4fMeh5bhVFvIIJJHMYbJLf.iD8OXYm', 'Lê Phi Hùng', 'phihung@gmail.com', '094512466', 2, 1, '2024-01-24 20:56:22', '2024-01-24 20:56:22');
INSERT INTO `users` VALUES (10, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'Nguyễn Thị Chúc Ngân', 'ag@gmail.com', '0869769142', 2, 1, '2024-01-24 20:56:25', '2024-01-24 20:56:25');
INSERT INTO `users` VALUES (11, '$2a$04$a15S6so/.fnSa3fDVFcUOu3OXbz1dpCZ.25VpZPKU4ShukFkluprO', 'Liêu Thị Diễm Quỳnh', '21130509@st.hcmuaf.edu.vn', '0785145453', 2, 1, '2024-01-24 20:56:26', '2024-01-24 20:56:26');
INSERT INTO `users` VALUES (12, '$2a$04$85li0fsOjQ1FyT0BtG5/rOBTwBkxe4Fo/zMrwHdhn3/qTGZSbHJ0a', 'Dư Thành Minh', 'abc@gmail.com', '0925821477', 2, 1, '2024-01-24 20:56:34', '2024-01-24 20:56:34');
INSERT INTO `users` VALUES (13, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'Trần Văn Long', '21130445@st.hcmuaf.edu.vn', '0222222222', 2, 1, '2024-07-17 12:03:28', '2024-07-17 12:03:28');
INSERT INTO `users` VALUES (17, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'Lê Anh Hùng', 'huynh123minh@gmail.com', '0222222222', 2, 1, '2024-07-10 01:45:17', '2024-07-10 01:45:17');
INSERT INTO `users` VALUES (18, '$04$l3Qw4OrBxY41Qbxhy2SzPOVY0Dlj4/GS6bz.ZBj.Ih05N5XMH5wca', 'Tăng Thanh Tuệ', 'huyminh@gmail.com', '0925451547', 2, 1, '2023-11-15 20:23:46', '2023-11-15 20:23:46');
INSERT INTO `users` VALUES (19, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'Lê Văn Sĩ', 'siteoma@gmail.com', '0925811454', 2, 1, '2024-07-10 01:43:08', '2024-07-10 01:43:08');
INSERT INTO `users` VALUES (20, '$2a$04$z9UbulvHUJ4TUqLdwz9NNeilmM0hRmELPhvrIc7ZHdDdPMUqVxzgq', 'Minh Dư (Ánh Sáng)', 'solokokone8@gmail.com', '', 2, 1, '2024-07-05 23:52:11', '2024-07-05 23:52:11');
INSERT INTO `users` VALUES (21, '$2a$04$3KDYTPpiP1GYFYfuCjx1VuivXcn1PK629xnQozA/h3oVjfKytRxba', 'Nguyễn Thị Chúc Ngân', 'ngan@gmail.com', '0747532573', 2, 2, '2024-07-10 01:43:07', '2024-07-10 01:43:07');
INSERT INTO `users` VALUES (22, '$2a$04$u9wQzRTZiBFk6qrRe50C5OKJcYDxRFIJ3Cw0uzGy5.pY5gtJltwrm', 'Nguyễn Thị Chúc Ngân', 'ng@gmail.com', '0747532573', 2, 2, '2024-07-06 06:16:35', '2024-07-06 06:16:35');
INSERT INTO `users` VALUES (23, '$2a$04$ud6msm0lxZmRQhmodB9eV.oelZmEKwLx4prvRT67CJJf4siEZUvmm', 'Nguyễn Thị Chúc Ngân', 'ngew@gmail.com', '0747532573', 2, 2, '2024-07-06 06:22:16', '2024-07-06 06:22:16');
INSERT INTO `users` VALUES (24, '$2a$04$j.IIOkkbrEYBbhVhMAdi8.fSUk8jx5suZI7W30/HYj3UVuHQEMoz6', 'Nguyễn Thị Chúc Ngân', 's@gmail.com', '0747532573', 2, 2, '2024-07-06 06:30:42', '2024-07-06 06:30:42');
INSERT INTO `users` VALUES (25, '$2a$04$9FdBhzcGkq/CgbDjhuBxl.Mn.CdhxFy13YZuy/5UyRJ9w/IyOesru', 'Nguyễn Thị Chúc Ngân', 'chucngan123@gmail.com', '086976914', 2, 1, '2024-07-18 17:42:43', '2024-07-18 17:42:43');

-- ----------------------------
-- Table structure for verification
-- ----------------------------
DROP TABLE IF EXISTS `verification`;
CREATE TABLE `verification`  (
  `verificationId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `expDate` bigint NOT NULL,
  PRIMARY KEY (`verificationId`) USING BTREE,
  INDEX `fk_verification_user`(`userId` ASC) USING BTREE,
  CONSTRAINT `fk_verification_user` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_vietnamese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of verification
-- ----------------------------
INSERT INTO `verification` VALUES (2, 2, '925624', 1704990468711);
INSERT INTO `verification` VALUES (3, 10, '224440', 1705074872702);
INSERT INTO `verification` VALUES (4, 11, '479768', 1704304038232);
INSERT INTO `verification` VALUES (5, 12, '455710', 1704519194842);
INSERT INTO `verification` VALUES (6, 13, '916034', 1704520146408);
INSERT INTO `verification` VALUES (7, 21, '484065', 1720219112906);
INSERT INTO `verification` VALUES (8, 22, '277539', 1720221395746);
INSERT INTO `verification` VALUES (9, 23, '931491', 1720221736415);
INSERT INTO `verification` VALUES (10, 24, '037697', 1720222242439);
INSERT INTO `verification` VALUES (11, 25, '794348', 1721299342533);

-- ----------------------------
-- Table structure for wishlists
-- ----------------------------
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists`  (
  `userId` int NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishlists
-- ----------------------------
INSERT INTO `wishlists` VALUES (3, 12);
INSERT INTO `wishlists` VALUES (3, 2);
INSERT INTO `wishlists` VALUES (3, 32);
INSERT INTO `wishlists` VALUES (3, 33);
INSERT INTO `wishlists` VALUES (3, 3);
INSERT INTO `wishlists` VALUES (4, 6);

SET FOREIGN_KEY_CHECKS = 1;
