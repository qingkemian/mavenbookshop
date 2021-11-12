-- 创建字符集为utf-8的BookShop数据库
CREATE SCHEMA `MyBookShop` DEFAULT CHARACTER SET utf8;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

use `MyBookShop`;

-- 1.创建admin表
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 ROW_FORMAT = Dynamic;

INSERT INTO `admin` VALUES (1, 'admin', '123456');
INSERT INTO `admin` VALUES (2, 'root', '123456');

-- 2.创建user表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
	`upwd` varchar(40) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `headimg` varchar(255) DEFAULT 'images/111347us9sszkewzz5xso2.png',
  `sex` enum('female','male') DEFAULT NULL,
  `registDate` date DEFAULT NULL,
  `address` int(20) DEFAULT 0,
  PRIMARY KEY (`uid`)
) ENGINE = InnoDB CHARACTER SET = utf8 ROW_FORMAT = Dynamic;

INSERT INTO `user` VALUES (1,'user1','123456aA','18112559352','1272627545@qq.com','images/111347us9sszkewzz5xso2.png','male','2021-09-01',1);

-- 3.创建address表
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
	`addressId` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
  `province` varchar(20) NOT NULL,
	`city` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `detailed` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
	FOREIGN KEY (`uid`) REFERENCES `user`(`uid`)
) ENGINE = InnoDB CHARACTER SET = utf8 ROW_FORMAT = Dynamic;

INSERT INTO `address` VALUES (1,1,'CZL','江苏省','苏州市','虎丘区','苏州科技大学',18112559352,1);

-- 4.创建商品state表
DROP TABLE IF EXISTS `orederstatus`;
CREATE TABLE `orderstatus`  (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`stateId`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 ROW_FORMAT = Dynamic;

INSERT INTO `orderstatus` VALUES (1, '待支付');
INSERT INTO `orderstatus` VALUES (2, '待发货');
INSERT INTO `orderstatus` VALUES (3, '运输中');
INSERT INTO `orderstatus` VALUES (4, '待收货');
INSERT INTO `orderstatus` VALUES (5, '待评价');

-- 5.创建theorder表
DROP TABLE IF EXISTS `theorder`;
CREATE TABLE `theorder`  (
	`orderNo` int(20) NOT NULL AUTO_INCREMENT,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`stateId` int(11) NOT NULL,
  `addressId` int(20) NOT NULL,
	`price` DECIMAL(6,3) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`orderNo`),
	FOREIGN KEY (`stateId`) REFERENCES `orderstatus`(`stateId`),
	FOREIGN KEY (`addressId`) REFERENCES `address`(`addressId`),
	FOREIGN KEY (`uid`) REFERENCES `user`(`uid`)
) ENGINE = InnoDB CHARACTER SET = utf8 ROW_FORMAT = Dynamic;


INSERT INTO `theorder` VALUES (1,CURRENT_TIMESTAMP,1,1,20.6,1);

-- 6.创建商品state表
DROP TABLE IF EXISTS `goodstatus`;
CREATE TABLE `goodstatus`  (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`stateId`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 ROW_FORMAT = Dynamic;

INSERT INTO `goodstatus` VALUES (1, '有货');
INSERT INTO `goodstatus` VALUES (2, '无货');
INSERT INTO `goodstatus` VALUES (3, '下架');

-- 7.创建goodclassify表
DROP TABLE IF EXISTS `goodclassify`;
CREATE TABLE `goodclassify`  (
  `classifyId` int(20) NOT NULL AUTO_INCREMENT,
  `exName` varchar(255) NOT NULL,
	`midName` varchar(255) DEFAULT NULL,
	`smName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classifyId`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 ROW_FORMAT = Dynamic;

INSERT INTO `goodclassify` VALUES (1,'书籍',NULL,NULL);

-- 8.创建商品详情表
DROP TABLE IF EXISTS `gooddetail`;
CREATE TABLE `gooddetail`  (
  `detailId` int(11) NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) NOT NULL,
  PRIMARY KEY (`detailId`)
) ENGINE = InnoDB ROW_FORMAT = Dynamic;


INSERT INTO `gooddetail` VALUES (1, '这个商品 好！！！');

-- 9.创建goods表
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodNo` int(20) NOT NULL AUTO_INCREMENT,
  `goodName` varchar(255) NOT NULL,
	`producer` varchar(255) DEFAULT NULL,
	`stateId` int(11) NOT NULL DEFAULT 1,
	`detailId` int(11) DEFAULT 1,
	`price` DECIMAL(8,3) NOT NULL DEFAULT 0,
	`discount` DECIMAL(4,3) DEFAULT 1.000,
	`classifyId` int(20) NOT NULL,
  PRIMARY KEY (`goodNo`),
	FOREIGN KEY (`stateId`) REFERENCES `goodstatus`(`stateId`),
	FOREIGN KEY (`classifyId`) REFERENCES `goodclassify`(`classifyId`)
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

INSERT INTO `goods` VALUES (1,'《java编程思想》','埃克尔',1,1,30.8,1,1);

-- 10.订单详情表
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `detailsNo` int(20) NOT NULL AUTO_INCREMENT,
  `orderNo` int(20) NOT NULL,
	`goodNo` int(20) NOT NULL,
	`goodNum` int(11) NOT NULL DEFAULT 1,
	`price` DECIMAL(8,3) NOT NULL DEFAULT 0,
	`total` DECIMAL(8,3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`detailsNo`),
	FOREIGN KEY (`orderNo`) REFERENCES `theorder`(`orderNo`),
	FOREIGN KEY (`goodNo`) REFERENCES `goods`(`goodNo`)
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

INSERT INTO `orderdetails` VALUES (1,1,1,2,31.8,61.6);

-- 11.创建货物图片表
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img`  (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `imgSrc` varchar(255) DEFAULT 'images/111347us9sszkewzz5xso2.png',
  `goodNo` int(20) NOT NULL,
  PRIMARY KEY (`imgId`),
	FOREIGN KEY (`goodNo`) REFERENCES `goods`(`goodNo`)
) ENGINE = InnoDB CHARACTER SET = utf8 ROW_FORMAT = Dynamic;

INSERT INTO `img` VALUES (1,'images/111347us9sszkewzz5xso2.png',1);

-- 12.创建shoppingcar购物车表
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar`  (
  `carId` int(11) NOT NULL AUTO_INCREMENT,
  `goodNo` int(20) NOT NULL,
	`goodNum` int(11) NOT NULL DEFAULT 1,
	`uid` int(11) NOT NULL,
  PRIMARY KEY (`carId`),
	FOREIGN KEY (`uid`) REFERENCES `user`(`uid`),
	FOREIGN KEY (`goodNo`) REFERENCES `goods`(`goodNo`)
) ENGINE = InnoDB CHARACTER SET = utf8 ROW_FORMAT = Dynamic;

INSERT INTO `shoppingcar` VALUES (1,1,1,1);