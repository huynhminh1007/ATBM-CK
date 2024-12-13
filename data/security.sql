USE luong_thuc_viet;

DROP TABLE IF EXISTS `order_signature`;
DROP TABLE IF EXISTS `keys`;

CREATE TABLE `keys` (
    keyId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    `key` TEXT NOT NULL,
    algorithm VARCHAR(100) NOT NULL,
    begin_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active TINYINT(1) UNSIGNED DEFAULT '0' COMMENT '0: inactive, 1: active',
		
    INDEX `fk_key_users`(`userId` ASC) USING BTREE,
    CONSTRAINT `fk_key_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `order_signature` (
    signatureId INT AUTO_INCREMENT PRIMARY KEY,
		keyId INT,
    signatureBase64 TEXT NOT NULL,    
		orderId INT NOT NULL,
		`hash` VARCHAR(255),
    signed_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		
		INDEX `fk_key`(`keyId` ASC) USING BTREE,
    CONSTRAINT `fk_key` FOREIGN KEY (`keyId`) REFERENCES `keys` (`keyId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
		
    INDEX `fk_order_key_signature`(`orderId` ASC) USING BTREE,
    CONSTRAINT `fk_order_key_signature` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;