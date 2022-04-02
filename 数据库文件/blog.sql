/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2022-04-02 18:23:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `article_id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '博文ID',
  `user_id` bigint(20) NOT NULL COMMENT '发表用户ID',
  `article_title` text NOT NULL COMMENT '博文标题',
  `article_content` longtext NOT NULL COMMENT '博文内容',
  `article_views` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '浏览量',
  `article_comment_count` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '评论总数',
  `article_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `article_like_count` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '点赞量',
  PRIMARY KEY (`article_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `articles` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('42', '10', '主键', '主键是能确定一条记录的唯一标识，比如，一条记录包括身份正号，姓名，年龄。身份证号是唯一能确定你这个人的，其他都可能有重复，所以，身份证号是主键。\r\n外键用于与另一张表的关联。是能确定另一张表记录的字段，用于保持数据的一致性。比如，A表中的一个字段，是B表的主键，那他就可以是A表的外键。\r\n...\r\n可以发现utf8最大支持3个字节的字符，到这里就基本确定是因为这个字符集设定所引起的异常，于是我试着修改对应列的字符集，这里的字符集分为表级字符集以及列级字符集，如果没有特别设定，列级字符集默认继承表级字符集，于是为了降低产品的影响面，我试着将发生异常的列的字符集改成utf8mb4，\r\n\r\n作者：eason02\r\n链接：https://www.jianshu.com/p/992bd01dbf60\r\n来源：简书\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', null, null, '2021-10-09 19:21:17', null);
INSERT INTO `articles` VALUES ('54', '10', '这是一个测试文章', '此词为醉归遇雨抒怀之作。词人借雨中潇洒徐行之举动，表现了虽处逆境屡遭挫折而不畏惧不颓丧的倔强性格和旷达胸怀。全词即景生情，语言诙谐。\n\n　　首句“莫听穿林打叶声”，一方面渲染出雨骤风狂，另一方面又以“莫听”二字点明外物不足萦怀之意。“何妨吟啸且徐行”，是前一句的延伸。在雨中照常舒徐行步，呼应小序“同行皆狼狈，余独不觉”，又引出下文“谁怕”即不怕来。徐行而又吟啸，是加倍写；“何妨”二字透出一点俏皮，更增加挑战色彩。首两句是全篇枢纽，以下词情都是由此生发。', null, null, '2021-10-20 19:21:35', null);
INSERT INTO `articles` VALUES ('57', '9', '静夜思\n（李白）\n', '床前明月光，\n疑是地上霜。\n举头望明月，\n低头思故乡。\r\n床前明月光，\r\n疑是地上霜。\r\n举头望明月，\r\n低头思故乡。\r\n床前明月光，\r\n疑是地上霜。\r\n举头望明月，\r\n低头思故乡。\r\n床前明月光，\r\n疑是地上霜。\r\n举头望明月，\r\n低头思故乡。', null, null, '2021-10-06 19:21:07', null);
INSERT INTO `articles` VALUES ('72', '10', '搜索icon事件search绑定失效', 'Method \"search\" has already been defined as a data property.', null, null, '2021-10-06 19:21:11', null);
INSERT INTO `articles` VALUES ('73', '10', 'mybatis', '\'%${input1}%\' or article_content like \'%${input1}%\'', '00000000000000000000', null, '2021-10-04 19:21:14', '00000000000000000000');
INSERT INTO `articles` VALUES ('82', '14', '啊啊', '床前明月光，\n疑是地上霜。\n举头望明月，\n低头思故乡。\n床前明月光，\n疑是地上霜。\n举头望明月，\n低头思故乡。\n床前明月光，\n疑是地上霜。\n举头望明月，\n低头思故乡。\n床前明月光，\n疑是地上霜。\n举头望明月，\n低头思故乡。', null, null, '2021-10-29 11:25:40', null);
INSERT INTO `articles` VALUES ('88', '14', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', '。。。', null, null, '2021-10-29 11:45:43', null);
INSERT INTO `articles` VALUES ('89', '9', 'a', '主键是能确定一条记录的唯一标识，比如，一条记录包括身份正号，姓名，年龄。身份证号是唯一能确定你这个人的，其他都可能有重复，所以，身份证号是主键。\n外键用于与另一张表的关联。是能确定另一张表记录的字段，用于保持数据的一致性。比如，A表中的一个字段，是B表的主键，那他就可以是A表的外键。\n...\n可以发现utf8最大支持3个字节的字符，到这里就基本确定是因为这个字符集设定所引起的异常，于是我试着修改对应列的字符集，这里的字符集分为表级字符集以及列级字符集，如果没有特别设定，列级字符集默认继承表级字符集，于是为了降低产品的影响面，我试着将发生异常的列的字符集改成utf8mb4，\n\n作者：eason02\n链接：https://www.jianshu.com/p/992bd01dbf60\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n主键是能确定一条记录的唯一标识，比如，一条记录包括身份正号，姓名，年龄。身份证号是唯一能确定你这个人的，其他都可能有重复，所以，身份证号是主键。\n外键用于与另一张表的关联。是能确定另一张表记录的字段，用于保持数据的一致性。比如，A表中的一个字段，是B表的主键，那他就可以是A表的外键。\n...\n可以发现utf8最大支持3个字节的字符，到这里就基本确定是因为这个字符集设定所引起的异常，于是我试着修改对应列的字符集，这里的字符集分为表级字符集以及列级字符集，如果没有特别设定，列级字符集默认继承表级字符集，于是为了降低产品的影响面，我试着将发生异常的列的字符集改成utf8mb4，\n\n作者：eason02\n链接：https://www.jianshu.com/p/992bd01dbf60\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n主键是能确定一条记录的唯一标识，比如，一条记录包括身份正号，姓名，年龄。身份证号是唯一能确定你这个人的，其他都可能有重复，所以，身份证号是主键。\n外键用于与另一张表的关联。是能确定另一张表记录的字段，用于保持数据的一致性。比如，A表中的一个字段，是B表的主键，那他就可以是A表的外键。\n...\n可以发现utf8最大支持3个字节的字符，到这里就基本确定是因为这个字符集设定所引起的异常，于是我试着修改对应列的字符集，这里的字符集分为表级字符集以及列级字符集，如果没有特别设定，列级字符集默认继承表级字符集，于是为了降低产品的影响面，我试着将发生异常的列的字符集改成utf8mb4，\n\n作者：eason02\n链接：https://www.jianshu.com/p/992bd01dbf60\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n主键是能确定一条记录的唯一标识，比如，一条记录包括身份正号，姓名，年龄。身份证号是唯一能确定你这个人的，其他都可能有重复，所以，身份证号是主键。\n外键用于与另一张表的关联。是能确定另一张表记录的字段，用于保持数据的一致性。比如，A表中的一个字段，是B表的主键，那他就可以是A表的外键。\n...\n可以发现utf8最大支持3个字节的字符，到这里就基本确定是因为这个字符集设定所引起的异常，于是我试着修改对应列的字符集，这里的字符集分为表级字符集以及列级字符集，如果没有特别设定，列级字符集默认继承表级字符集，于是为了降低产品的影响面，我试着将发生异常的列的字符集改成utf8mb4，\n\n作者：eason02\n链接：https://www.jianshu.com/p/992bd01dbf60\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n主键是能确定一条记录的唯一标识，比如，一条记录包括身份正号，姓名，年龄。身份证号是唯一能确定你这个人的，其他都可能有重复，所以，身份证号是主键。\n外键用于与另一张表的关联。是能确定另一张表记录的字段，用于保持数据的一致性。比如，A表中的一个字段，是B表的主键，那他就可以是A表的外键。\n...\n可以发现utf8最大支持3个字节的字符，到这里就基本确定是因为这个字符集设定所引起的异常，于是我试着修改对应列的字符集，这里的字符集分为表级字符集以及列级字符集，如果没有特别设定，列级字符集默认继承表级字符集，于是为了降低产品的影响面，我试着将发生异常的列的字符集改成utf8mb4，\n\n作者：eason02\n链接：https://www.jianshu.com/p/992bd01dbf60\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n', null, null, '2021-10-29 19:18:10', null);
INSERT INTO `articles` VALUES ('93', '16', 'z', 'z', null, null, '2021-12-29 08:42:41', null);
INSERT INTO `articles` VALUES ('94', '9', '。。。。。。。。。。。', '。。。。。。。。。。。', null, null, '2022-01-20 14:45:48', null);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` bigint(20) NOT NULL COMMENT '发表用户ID',
  `article_id` bigint(20) NOT NULL COMMENT '评论博文ID',
  `comment_like_count` bigint(20) DEFAULT NULL COMMENT '点赞数',
  `comment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论日期',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `parent_comment_id` bigint(20) DEFAULT NULL COMMENT '父评论ID',
  PRIMARY KEY (`comment_id`),
  KEY `article_id` (`article_id`),
  KEY `comment_date` (`comment_date`),
  KEY `parent_comment_id` (`parent_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '10', '42', '0', '2021-10-21 14:51:56', '这是一个测试评论', null);
INSERT INTO `comments` VALUES ('13', '10', '54', null, '2021-10-21 18:29:18', '这个写的太棒了，为作者打call', null);
INSERT INTO `comments` VALUES ('14', '10', '54', null, '2021-10-21 18:34:29', '我也觉得', null);
INSERT INTO `comments` VALUES ('15', '10', '54', null, '2021-10-21 18:37:51', '我来水经验啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦', null);
INSERT INTO `comments` VALUES ('16', '10', '54', null, '2021-10-21 18:39:23', '潇洒撒', null);
INSERT INTO `comments` VALUES ('18', '10', '42', null, '2021-10-21 22:15:21', '嗷嗷嗷', null);
INSERT INTO `comments` VALUES ('20', '10', '42', null, '2021-10-22 17:40:18', '吴永杰是傻逼', null);
INSERT INTO `comments` VALUES ('22', '9', '57', null, '2021-10-29 11:10:43', '李白大诗人', null);
INSERT INTO `comments` VALUES ('24', '9', '57', null, '2021-10-29 11:58:53', '啊啊啊啊啊啊啊啊啊啊啊aaaaaaaa', null);
INSERT INTO `comments` VALUES ('27', '9', '89', null, '2021-11-08 16:52:39', 'a', null);
INSERT INTO `comments` VALUES ('28', '10', '42', null, '2021-11-22 11:05:59', 'kkk', null);
INSERT INTO `comments` VALUES ('29', '9', '90', null, '2021-11-22 11:06:43', '，，，', null);
INSERT INTO `comments` VALUES ('30', '9', '57', null, '2021-11-26 16:55:44', 'aa', null);
INSERT INTO `comments` VALUES ('31', '9', '57', null, '2021-11-26 16:55:48', '1', null);
INSERT INTO `comments` VALUES ('32', '9', '57', null, '2021-11-26 16:55:53', '2', null);
INSERT INTO `comments` VALUES ('33', '9', '57', null, '2021-11-26 16:55:57', '3', null);
INSERT INTO `comments` VALUES ('34', '9', '57', null, '2021-11-26 16:56:00', '4', null);
INSERT INTO `comments` VALUES ('35', '9', '57', null, '2021-11-27 13:10:05', 'a', null);
INSERT INTO `comments` VALUES ('36', '14', '88', null, '2021-11-27 13:17:24', 'niub', null);
INSERT INTO `comments` VALUES ('37', '10', '42', null, '2021-12-27 19:04:47', '测试', null);
INSERT INTO `comments` VALUES ('38', '10', '42', null, '2021-12-27 19:04:57', '测试2', null);
INSERT INTO `comments` VALUES ('39', '9', '57', null, '2022-01-06 14:35:34', '锕', null);

-- ----------------------------
-- Table structure for labels
-- ----------------------------
DROP TABLE IF EXISTS `labels`;
CREATE TABLE `labels` (
  `label_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `label_name` varchar(20) NOT NULL COMMENT '标签名称',
  `label_alias` varchar(15) NOT NULL COMMENT '标签别名',
  `label_description` text NOT NULL COMMENT '标签描述',
  PRIMARY KEY (`label_id`),
  KEY `label_name` (`label_name`),
  KEY `label_alias` (`label_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of labels
-- ----------------------------
INSERT INTO `labels` VALUES ('1', 'name', 'name', 'name');

-- ----------------------------
-- Table structure for set_artitle_label
-- ----------------------------
DROP TABLE IF EXISTS `set_artitle_label`;
CREATE TABLE `set_artitle_label` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `label_id` bigint(20) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set_artitle_label
-- ----------------------------

-- ----------------------------
-- Table structure for set_artitle_sort
-- ----------------------------
DROP TABLE IF EXISTS `set_artitle_sort`;
CREATE TABLE `set_artitle_sort` (
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `sort_id` bigint(20) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`article_id`,`sort_id`),
  KEY `sort_id` (`sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set_artitle_sort
-- ----------------------------

-- ----------------------------
-- Table structure for sorts
-- ----------------------------
DROP TABLE IF EXISTS `sorts`;
CREATE TABLE `sorts` (
  `sort_id` bigint(20) NOT NULL COMMENT '分类ID',
  `sort_name` varchar(50) NOT NULL COMMENT '分类名称',
  `sort_alias` varchar(15) NOT NULL COMMENT '分类别名',
  `sort_description` text NOT NULL COMMENT '分类描述',
  `parent_sort_id` bigint(20) NOT NULL COMMENT '父分类ID',
  PRIMARY KEY (`sort_id`),
  KEY `sort_name` (`sort_name`),
  KEY `sort_alias` (`sort_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sorts
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_ip` varchar(20) DEFAULT NULL COMMENT '用户IP',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `user_password` varchar(15) NOT NULL COMMENT '用户密码',
  `user_email` varchar(30) NOT NULL COMMENT '用户邮箱',
  `user_profile_photo` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_registration_time` datetime DEFAULT NULL COMMENT '注册时间',
  `user_birthday` date DEFAULT NULL COMMENT '用户生日',
  `user_age` tinyint(4) DEFAULT NULL COMMENT '用户年龄',
  `user_telephone_number` int(11) DEFAULT NULL COMMENT '用户手机号',
  `user_nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `user_nickname` (`user_nickname`),
  KEY `user_email` (`user_email`),
  KEY `user_telephone_number` (`user_telephone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('9', null, 'username', 'password', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('10', null, 'name', 'user_password', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('11', null, '北风', '123456', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('12', null, 'asd', '123456', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('13', null, '。', '123456', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('14', null, '。.', '123456789', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('15', null, 'username1', '123456', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('16', null, 'admin', '123456', '735308877@qq.com', null, null, null, null, null, null);
INSERT INTO `users` VALUES ('17', null, 'lilll', '123456789', '735308877@qq.com', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_friends
-- ----------------------------
DROP TABLE IF EXISTS `user_friends`;
CREATE TABLE `user_friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_friends_id` bigint(20) NOT NULL COMMENT '好友ID',
  `user_note` varchar(20) NOT NULL COMMENT '好友备注',
  `user_status` varchar(20) NOT NULL COMMENT '好友状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_friends
-- ----------------------------

-- ----------------------------
-- View structure for friends
-- ----------------------------
DROP VIEW IF EXISTS `friends`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `friends` AS select `user_friends`.`user_id` AS `user_id`,`users`.`user_name` AS `user_name`,`user_friends`.`user_friends_id` AS `user_friends_id`,`user_friends`.`user_note` AS `user_note` from (`users` join `user_friends`) where (`users`.`user_id` = `user_friends`.`user_id`) ;
