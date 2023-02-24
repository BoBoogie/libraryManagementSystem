/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : books_manage_system

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 07/03/2022 15:43:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`, `account`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'admin', 'admin');
INSERT INTO `administrator` VALUES (2, 'admin123', 'admin123');
INSERT INTO `administrator` VALUES (5, 'admin1', 'admin1');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `booknumber` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookid` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `picname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lenddate` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `returndate` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lenduserid` int NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `price` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00.00',
  `bookclass` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'javaScript高级程序设计', '李松锋', '人民邮电出版社', 'A001', 'A001-1', '1.jpg', '1629626378110', '1647770378110', 38, 1, '99.00', '软件类');
INSERT INTO `books` VALUES (2, '数据科学入门', '岳冰', '中国工信出版集团', 'A002', 'A002-2', '2.jpg', '1629626388520', '1632218388520', 38, 1, '30.99', '软件类');
INSERT INTO `books` VALUES (3, '项目管理新思维', '金从军', '人民邮电出版社', 'B001', 'B001-3', '3.jpg', '1629626403878', '1632218403878', 38, 1, '20.00', '管理类');
INSERT INTO `books` VALUES (4, '精益数据分析', '韩知白', '人民邮电出版社', 'A003', 'A003-4', '4.jpg', '1629626419240', '1632218419240', 39, 1, '25.00', '软件类');
INSERT INTO `books` VALUES (5, '你不知道的50个脑科学知识', '荊妍', '人民邮电出版社', 'C001', 'C001-5', '5.jpg', '1629626447511', '1632218447511', 39, 1, '40.50', '生物类');
INSERT INTO `books` VALUES (6, '证明达尔文', '陈鹏', '人民邮电出版社', 'D001', 'D001-6', '6.jpg', '1629626435554', '1632218435554', 39, 1, '70.00', '生物类');
INSERT INTO `books` VALUES (7, '信息流广告入门', '李明', '中国工信出版集团', 'B002', 'B002-7', '7.jpg', '1629628274949', '1632220274949', 40, 1, '50.33', '管理类');
INSERT INTO `books` VALUES (8, '精益品牌塑造', '谢婷婷', '中国工信出版集团', 'B003', 'B003-8', '8.jpg', '1629628518587', '1632220518587', 41, 1, '68.00', '管理类');
INSERT INTO `books` VALUES (9, '决策知识自动化', '王飞燕', '工业出版社', 'B004', 'B004-9', '9.jpg', '1629628553624', '1632220553624', 41, 1, '44.00', '管理类');
INSERT INTO `books` VALUES (10, '简单高校LATEX', '吴康隆', '人民邮电出版社', 'B005', 'B005-10', '10.jpg', NULL, NULL, NULL, 0, '62.00', '管理类');
INSERT INTO `books` VALUES (11, 'C语言程序设计现代方法', '吕修锋', '人民邮电出版社', 'A004', 'A004-11', '11.jpg', NULL, NULL, NULL, 0, '55.00', '软件类');
INSERT INTO `books` VALUES (12, '超供电电压的电路设计', '吴顺珉', '工业出版社', 'E001', 'E001-12', '12.jpg', NULL, NULL, NULL, 0, '44.00', '硬件类');
INSERT INTO `books` VALUES (13, '数据驱动力企业分析实战', '张奎', '人民邮电出版社', 'B006', 'B006-13', '13.jpg', NULL, NULL, NULL, 0, '22.69', '管理类');
INSERT INTO `books` VALUES (14, '简明的TensorFlow2', '李双锋', '人民邮电出版社', 'A005', 'A005-14', '14.jpg', NULL, NULL, NULL, 0, '70.52', '软件类');
INSERT INTO `books` VALUES (15, '面向对象是怎样工作的', '平泽章', '中国工信出版集团', 'A006', 'A006-15', '15.jpg', NULL, NULL, NULL, 0, '80.00', '软件类');
INSERT INTO `books` VALUES (16, '深入java虚拟机的算法与实现', '中村成洋', '人民邮电出版社', 'A007', 'A007-16', '16.jpg', NULL, NULL, NULL, 0, '19.99', '软件类');
INSERT INTO `books` VALUES (17, '图解人工智能', '多田智史', '人民邮电出版社', 'A008', 'A008-17', '17.jpg', NULL, NULL, NULL, 0, '46.50', '软件类');
INSERT INTO `books` VALUES (18, '微积分入门', '小平邦彦', '人民邮电出版社', 'F001', 'F001-18', '18.jpg', NULL, NULL, NULL, 0, '78.55', '数学类');
INSERT INTO `books` VALUES (19, '概率论及其应用', '郑元碌', '人民邮电出版社', 'F002', 'F002-19', '19.jpg', NULL, NULL, NULL, 0, '46.32', '数学类');
-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'admin123',
  `studentname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `class` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '暂无信息',
  `schooldate` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '暂无信息',
  `gender` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '男',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `lendbook` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `account`) USING BTREE,
  UNIQUE INDEX `idstudents_UNIQUE`(`id`) USING BTREE,
  UNIQUE INDEX `account_UNIQUE`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (38, '0000000000001', '111111', '张三', '2019大数据1班', '1629624693156', '男', 0, '1,2,3');
INSERT INTO `students` VALUES (39, '0000000000002', '111111', '李四', '2019级信管1班', '1629624693156', '女', 0, '4,6,5');
INSERT INTO `students` VALUES (40, '0000000000003', '111111', '王五', '2020级物联网1班', '1629624693156', '男', 0, '7');
INSERT INTO `students` VALUES (41, '0000000000004', '111111', '老刘', '2020级光电1班', '1629624693156', '男', 0, '8,9');
INSERT INTO `students` VALUES (42, '0000000000005', '111111', '黄游', '2021级光电1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (43, '0000000000006', '111111', '李氏', '2019级光电1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (44, '0000000000007', '111111', '王竹', '2020级物联网1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (45, '0000000000008', '111111', '何舒', '2020级光电1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (46, '0000000000009', '111111', '张璇', '2020级物联网1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (47, '0000000000010', '111111', '曹金玉','2020级光电1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (48, '0000000000011', '111111', '李珏', '2021级物联网1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (49, '0000000000012', '111111', '郭思', '2020级大数据1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (50, '0000000000013', '111111', '孙亮', '2019级大数据1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (51, '0000000000014', '111111', '卢植', '2021级光电1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (52, '0000000000015', '111111', '陈到', '2019级物联网1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (53, '0000000000016', '111111', '袁术', '2022级大数据1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (41, '0000000000017', '111111', '陈宫', '2022级光电1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (54, '0000000000018', '111111', '马岱', '2020级信管1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (55, '0000000000019', '111111', '简亮', '2021级物联网1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (56, '0000000000020', '111111', '曹真', '2022级光电1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (57, '0000000000021', '111111', '陈群', '2020级电工1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (58, '0000000000022', '111111', '周仓', '2021级电工1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (59, '0000000000023', '111111', '顾勇', '2022级电工1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (60, '0000000000024', '111111', '刘湛', '2020级电工1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (61, '0000000000025', '111111', '张毅', '2019级光电1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (62, '0000000000026', '111111', '李典', '2022级电工1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (63, '0000000000027', '111111', '刘协', '2019级光电1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (64, '0000000000028', '111111', '张璐', '2021级电工1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (65, '0000000000029', '111111', '李艳', '2019级电工1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (66, '0000000000030', '111111', '吕岱', '2021级信管1班', '1629624693156', '男', 0, '');
INSERT INTO `students` VALUES (67, '0000000000031', '111111', '董白', '2019级信管1班', '1629624693156', '女', 0, '');
INSERT INTO `students` VALUES (68, '0000000000032', '111111', '周室', '2021级电工1班', '1629624693156', '女', 0, '');
SET FOREIGN_KEY_CHECKS = 1;
