/*
Navicat MySQL Data Transfer

Source Server         : win10
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : chenzx

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-10-26 17:51:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add Bookmark', '6', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('22', 'Can change Bookmark', '6', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete Bookmark', '6', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('24', 'Can add log entry', '7', 'add_log');
INSERT INTO `auth_permission` VALUES ('25', 'Can change log entry', '7', 'change_log');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete log entry', '7', 'delete_log');
INSERT INTO `auth_permission` VALUES ('27', 'Can add User Setting', '8', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('28', 'Can change User Setting', '8', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete User Setting', '8', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('30', 'Can add User Widget', '9', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('31', 'Can change User Widget', '9', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('32', 'Can delete User Widget', '9', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('33', 'Can view Bookmark', '6', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('34', 'Can view log entry', '7', 'view_log');
INSERT INTO `auth_permission` VALUES ('35', 'Can view User Setting', '8', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('36', 'Can view User Widget', '9', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 邮箱验证码', '10', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 邮箱验证码', '10', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 邮箱验证码', '10', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 用户信息', '11', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 用户信息', '11', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 用户信息', '11', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('43', 'Can view 邮箱验证码', '10', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 用户信息', '11', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 个人博客', '12', 'add_article');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 个人博客', '12', 'change_article');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 个人博客', '12', 'delete_article');
INSERT INTO `auth_permission` VALUES ('48', 'Can add 作者', '13', 'add_author');
INSERT INTO `auth_permission` VALUES ('49', 'Can change 作者', '13', 'change_author');
INSERT INTO `auth_permission` VALUES ('50', 'Can delete 作者', '13', 'delete_author');
INSERT INTO `auth_permission` VALUES ('51', 'Can view 个人博客', '12', 'view_article');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 作者', '13', 'view_author');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 博客分类', '14', 'add_category');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 博客分类', '14', 'change_category');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 博客分类', '14', 'delete_category');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 博客分类', '14', 'view_category');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 点赞数目统计', '15', 'add_likenum');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 点赞数目统计', '15', 'change_likenum');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 点赞数目统计', '15', 'delete_likenum');
INSERT INTO `auth_permission` VALUES ('60', 'Can add 用户收藏', '16', 'add_favorite');
INSERT INTO `auth_permission` VALUES ('61', 'Can change 用户收藏', '16', 'change_favorite');
INSERT INTO `auth_permission` VALUES ('62', 'Can delete 用户收藏', '16', 'delete_favorite');
INSERT INTO `auth_permission` VALUES ('63', 'Can add 阅读数目统计', '17', 'add_viewnum');
INSERT INTO `auth_permission` VALUES ('64', 'Can change 阅读数目统计', '17', 'change_viewnum');
INSERT INTO `auth_permission` VALUES ('65', 'Can delete 阅读数目统计', '17', 'delete_viewnum');
INSERT INTO `auth_permission` VALUES ('66', 'Can add 点赞详情统计', '18', 'add_like');
INSERT INTO `auth_permission` VALUES ('67', 'Can change 点赞详情统计', '18', 'change_like');
INSERT INTO `auth_permission` VALUES ('68', 'Can delete 点赞详情统计', '18', 'delete_like');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 阅读详情统计', '19', 'add_view');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 阅读详情统计', '19', 'change_view');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 阅读详情统计', '19', 'delete_view');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 用户收藏', '16', 'view_favorite');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 点赞详情统计', '18', 'view_like');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 点赞数目统计', '15', 'view_likenum');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 阅读详情统计', '19', 'view_view');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 阅读数目统计', '17', 'view_viewnum');
INSERT INTO `auth_permission` VALUES ('77', 'Can add 个人简介', '20', 'add_personalprofile');
INSERT INTO `auth_permission` VALUES ('78', 'Can change 个人简介', '20', 'change_personalprofile');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete 个人简介', '20', 'delete_personalprofile');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 个人简介', '20', 'view_personalprofile');
INSERT INTO `auth_permission` VALUES ('81', 'Can add site', '21', 'add_site');
INSERT INTO `auth_permission` VALUES ('82', 'Can change site', '21', 'change_site');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete site', '21', 'delete_site');
INSERT INTO `auth_permission` VALUES ('84', 'Can view site', '21', 'view_site');
INSERT INTO `auth_permission` VALUES ('85', 'Can add comment flag', '22', 'add_commentflag');
INSERT INTO `auth_permission` VALUES ('86', 'Can change comment flag', '22', 'change_commentflag');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete comment flag', '22', 'delete_commentflag');
INSERT INTO `auth_permission` VALUES ('88', 'Can add comment', '23', 'add_comment');
INSERT INTO `auth_permission` VALUES ('89', 'Can change comment', '23', 'change_comment');
INSERT INTO `auth_permission` VALUES ('90', 'Can delete comment', '23', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('91', 'Can moderate comments', '23', 'can_moderate');
INSERT INTO `auth_permission` VALUES ('92', 'Can view comment', '23', 'view_comment');
INSERT INTO `auth_permission` VALUES ('93', 'Can view comment flag', '22', 'view_commentflag');
INSERT INTO `auth_permission` VALUES ('94', 'Can add nonce', '24', 'add_nonce');
INSERT INTO `auth_permission` VALUES ('95', 'Can change nonce', '24', 'change_nonce');
INSERT INTO `auth_permission` VALUES ('96', 'Can delete nonce', '24', 'delete_nonce');
INSERT INTO `auth_permission` VALUES ('97', 'Can add code', '25', 'add_code');
INSERT INTO `auth_permission` VALUES ('98', 'Can change code', '25', 'change_code');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete code', '25', 'delete_code');
INSERT INTO `auth_permission` VALUES ('100', 'Can add user social auth', '26', 'add_usersocialauth');
INSERT INTO `auth_permission` VALUES ('101', 'Can change user social auth', '26', 'change_usersocialauth');
INSERT INTO `auth_permission` VALUES ('102', 'Can delete user social auth', '26', 'delete_usersocialauth');
INSERT INTO `auth_permission` VALUES ('103', 'Can add association', '27', 'add_association');
INSERT INTO `auth_permission` VALUES ('104', 'Can change association', '27', 'change_association');
INSERT INTO `auth_permission` VALUES ('105', 'Can delete association', '27', 'delete_association');
INSERT INTO `auth_permission` VALUES ('106', 'Can add partial', '28', 'add_partial');
INSERT INTO `auth_permission` VALUES ('107', 'Can change partial', '28', 'change_partial');
INSERT INTO `auth_permission` VALUES ('108', 'Can delete partial', '28', 'delete_partial');
INSERT INTO `auth_permission` VALUES ('109', 'Can view association', '27', 'view_association');
INSERT INTO `auth_permission` VALUES ('110', 'Can view code', '25', 'view_code');
INSERT INTO `auth_permission` VALUES ('111', 'Can view nonce', '24', 'view_nonce');
INSERT INTO `auth_permission` VALUES ('112', 'Can view partial', '28', 'view_partial');
INSERT INTO `auth_permission` VALUES ('113', 'Can view user social auth', '26', 'view_usersocialauth');
INSERT INTO `auth_permission` VALUES ('114', 'Can add black listed domain', '29', 'add_blacklisteddomain');
INSERT INTO `auth_permission` VALUES ('115', 'Can change black listed domain', '29', 'change_blacklisteddomain');
INSERT INTO `auth_permission` VALUES ('116', 'Can delete black listed domain', '29', 'delete_blacklisteddomain');
INSERT INTO `auth_permission` VALUES ('117', 'Can add comment', '30', 'add_xtdcomment');
INSERT INTO `auth_permission` VALUES ('118', 'Can change comment', '30', 'change_xtdcomment');
INSERT INTO `auth_permission` VALUES ('119', 'Can delete comment', '30', 'delete_xtdcomment');
INSERT INTO `auth_permission` VALUES ('120', 'Can moderate comments', '30', 'can_moderate');
INSERT INTO `auth_permission` VALUES ('121', 'Can view black listed domain', '29', 'view_blacklisteddomain');
INSERT INTO `auth_permission` VALUES ('122', 'Can view comment', '30', 'view_xtdcomment');
INSERT INTO `auth_permission` VALUES ('123', 'Can add 留言板', '31', 'add_guesbook');
INSERT INTO `auth_permission` VALUES ('124', 'Can change 留言板', '31', 'change_guesbook');
INSERT INTO `auth_permission` VALUES ('125', 'Can delete 留言板', '31', 'delete_guesbook');
INSERT INTO `auth_permission` VALUES ('126', 'Can view 留言板', '31', 'view_guesbook');
INSERT INTO `auth_permission` VALUES ('127', 'Can add notification', '32', 'add_notification');
INSERT INTO `auth_permission` VALUES ('128', 'Can change notification', '32', 'change_notification');
INSERT INTO `auth_permission` VALUES ('129', 'Can delete notification', '32', 'delete_notification');
INSERT INTO `auth_permission` VALUES ('130', 'Can view notification', '32', 'view_notification');
INSERT INTO `auth_permission` VALUES ('131', 'Can add 我的相册', '33', 'add_mypicture');
INSERT INTO `auth_permission` VALUES ('132', 'Can change 我的相册', '33', 'change_mypicture');
INSERT INTO `auth_permission` VALUES ('133', 'Can delete 我的相册', '33', 'delete_mypicture');
INSERT INTO `auth_permission` VALUES ('134', 'Can view 我的相册', '33', 'view_mypicture');
INSERT INTO `auth_permission` VALUES ('135', 'Can add 相册照片', '34', 'add_photo');
INSERT INTO `auth_permission` VALUES ('136', 'Can change 相册照片', '34', 'change_photo');
INSERT INTO `auth_permission` VALUES ('137', 'Can delete 相册照片', '34', 'delete_photo');

-- ----------------------------
-- Table structure for category_category
-- ----------------------------
DROP TABLE IF EXISTS `category_category`;
CREATE TABLE `category_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_category_parent_id_bce0763d_fk_category_category_id` (`parent_id`) USING BTREE,
  CONSTRAINT `category_category_parent_id_bce0763d_fk_category_category_id` FOREIGN KEY (`parent_id`) REFERENCES `category_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category_category
-- ----------------------------
INSERT INTO `category_category` VALUES ('1', '技术博客', '1', null);
INSERT INTO `category_category` VALUES ('2', '我的网站建设', '1:2', '1');
INSERT INTO `category_category` VALUES ('3', 'Python', '1:3', '1');
INSERT INTO `category_category` VALUES ('4', 'C/C++', '1:4', '1');
INSERT INTO `category_category` VALUES ('5', 'HTML', '1:5', '1');
INSERT INTO `category_category` VALUES ('6', '数据库', '1:6', '1');
INSERT INTO `category_category` VALUES ('7', '深度学习', '1:7', '1');
INSERT INTO `category_category` VALUES ('8', '其他', '1:8', '1');
INSERT INTO `category_category` VALUES ('9', '生活笔记', '9', null);
INSERT INTO `category_category` VALUES ('11', '技术随笔', '9:11', '9');
INSERT INTO `category_category` VALUES ('12', '个人随笔', '9:12', '9');
INSERT INTO `category_category` VALUES ('13', '个人日记', '9:13', '9');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_comments
-- ----------------------------
DROP TABLE IF EXISTS `django_comments`;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` longtext NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_commen_content_type_id_c4afe962_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `django_comments_site_id_9dcf666e_fk_django_site_id` (`site_id`) USING BTREE,
  KEY `django_comments_user_id_a0a440a1_fk_user_userprofile_id` (`user_id`) USING BTREE,
  KEY `django_comments_submit_date_514ed2d9_uniq` (`submit_date`) USING BTREE,
  CONSTRAINT `django_commen_content_type_id_c4afe962_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_comments_site_id_9dcf666e_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `django_comments_user_id_a0a440a1_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_comments
-- ----------------------------
INSERT INTO `django_comments` VALUES ('16', '1', 'chenzhixiang1992', 'chenzhixiang1992@163.com', '', '留言测试', '2017-10-26 17:49:02.025718', '127.0.0.1', '1', '0', '31', '1', '1');
INSERT INTO `django_comments` VALUES ('17', '1', 'chenzhixiang1992', 'chenzhixiang1992@163.com', '', '二级评论测试', '2017-10-26 17:49:45.001941', '127.0.0.1', '1', '0', '31', '1', '1');

-- ----------------------------
-- Table structure for django_comments_xtd_blacklisteddomain
-- ----------------------------
DROP TABLE IF EXISTS `django_comments_xtd_blacklisteddomain`;
CREATE TABLE `django_comments_xtd_blacklisteddomain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_comments_xtd_blacklisteddomain_ad5f82e8` (`domain`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_comments_xtd_blacklisteddomain
-- ----------------------------

-- ----------------------------
-- Table structure for django_comments_xtd_xtdcomment
-- ----------------------------
DROP TABLE IF EXISTS `django_comments_xtd_xtdcomment`;
CREATE TABLE `django_comments_xtd_xtdcomment` (
  `comment_ptr_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `order` int(11) NOT NULL,
  `followup` tinyint(1) NOT NULL,
  `parent_comment_id` int(11),
  PRIMARY KEY (`comment_ptr_id`) USING BTREE,
  KEY `django_comments_xtd_xtdcomment_e3464c97` (`thread_id`) USING BTREE,
  KEY `django_comments_xtd_xtdcomment_70a17ffa` (`order`) USING BTREE,
  KEY `ccd08d9a05c889d72e9ca55569b81c86` (`parent_comment_id`),
  CONSTRAINT `ccd08d9a05c889d72e9ca55569b81c86` FOREIGN KEY (`parent_comment_id`) REFERENCES `django_comments_xtd_xtdcomment` (`comment_ptr_id`),
  CONSTRAINT `django_comments_xt_comment_ptr_id_01d47130_fk_django_comments_id` FOREIGN KEY (`comment_ptr_id`) REFERENCES `django_comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_comments_xtd_xtdcomment
-- ----------------------------
INSERT INTO `django_comments_xtd_xtdcomment` VALUES ('16', '16', '16', '0', '1', '0', null);
INSERT INTO `django_comments_xtd_xtdcomment` VALUES ('17', '16', '16', '1', '2', '0', '16');

-- ----------------------------
-- Table structure for django_comment_flags
-- ----------------------------
DROP TABLE IF EXISTS `django_comment_flags`;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_comment_flags_user_id_537f77a7_uniq` (`user_id`,`comment_id`,`flag`) USING BTREE,
  KEY `django_comment_flags_comment_id_d8054933_fk_django_comments_id` (`comment_id`) USING BTREE,
  KEY `django_comment_flags_327a6c43` (`flag`) USING BTREE,
  CONSTRAINT `django_comment_flags_comment_id_d8054933_fk_django_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `django_comment_flags_user_id_f3f81f0a_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_comment_flags
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('14', 'category', 'category');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('23', 'django_comments', 'comment');
INSERT INTO `django_content_type` VALUES ('22', 'django_comments', 'commentflag');
INSERT INTO `django_content_type` VALUES ('29', 'django_comments_xtd', 'blacklisteddomain');
INSERT INTO `django_content_type` VALUES ('30', 'django_comments_xtd', 'xtdcomment');
INSERT INTO `django_content_type` VALUES ('31', 'me', 'guesbook');
INSERT INTO `django_content_type` VALUES ('33', 'me', 'mypicture');
INSERT INTO `django_content_type` VALUES ('20', 'me', 'personalprofile');
INSERT INTO `django_content_type` VALUES ('34', 'me', 'photo');
INSERT INTO `django_content_type` VALUES ('32', 'notifications', 'notification');
INSERT INTO `django_content_type` VALUES ('12', 'post', 'article');
INSERT INTO `django_content_type` VALUES ('13', 'post', 'author');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('21', 'sites', 'site');
INSERT INTO `django_content_type` VALUES ('27', 'social_django', 'association');
INSERT INTO `django_content_type` VALUES ('25', 'social_django', 'code');
INSERT INTO `django_content_type` VALUES ('24', 'social_django', 'nonce');
INSERT INTO `django_content_type` VALUES ('28', 'social_django', 'partial');
INSERT INTO `django_content_type` VALUES ('26', 'social_django', 'usersocialauth');
INSERT INTO `django_content_type` VALUES ('16', 'tools', 'favorite');
INSERT INTO `django_content_type` VALUES ('18', 'tools', 'like');
INSERT INTO `django_content_type` VALUES ('15', 'tools', 'likenum');
INSERT INTO `django_content_type` VALUES ('19', 'tools', 'view');
INSERT INTO `django_content_type` VALUES ('17', 'tools', 'viewnum');
INSERT INTO `django_content_type` VALUES ('10', 'user', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('11', 'user', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('7', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('8', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-09-24 02:33:36.390787');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2017-09-24 02:33:36.471074');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2017-09-24 02:33:36.773125');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2017-09-24 02:33:36.853558');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2017-09-24 02:33:36.862232');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2017-09-24 02:33:36.870177');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2017-09-24 02:33:36.879048');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2017-09-24 02:33:36.882286');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2017-09-24 02:33:36.889679');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2017-09-24 02:33:36.897509');
INSERT INTO `django_migrations` VALUES ('11', 'user', '0001_initial', '2017-09-24 02:33:37.273421');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2017-09-24 02:33:37.448676');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2017-09-24 02:33:37.463726');
INSERT INTO `django_migrations` VALUES ('14', 'category', '0001_initial', '2017-09-24 02:33:37.548603');
INSERT INTO `django_migrations` VALUES ('15', 'me', '0001_initial', '2017-09-24 02:33:37.566984');
INSERT INTO `django_migrations` VALUES ('16', 'post', '0001_initial', '2017-09-24 02:33:37.788942');
INSERT INTO `django_migrations` VALUES ('17', 'post', '0002_article_user', '2017-09-24 02:33:37.982774');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2017-09-24 02:33:38.056918');
INSERT INTO `django_migrations` VALUES ('19', 'tools', '0001_initial', '2017-09-24 02:33:38.288916');
INSERT INTO `django_migrations` VALUES ('20', 'tools', '0002_auto_20170924_0225', '2017-09-24 02:33:38.775264');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0001_initial', '2017-09-24 02:33:39.082580');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0002_log', '2017-09-24 02:33:39.260973');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0003_auto_20160715_0100', '2017-09-24 02:33:39.346010');
INSERT INTO `django_migrations` VALUES ('24', 'sites', '0001_initial', '2017-10-01 02:18:36.609364');
INSERT INTO `django_migrations` VALUES ('25', 'django_comments', '0001_initial', '2017-10-01 02:18:37.104250');
INSERT INTO `django_migrations` VALUES ('26', 'django_comments', '0002_update_user_email_field_length', '2017-10-01 02:18:37.158586');
INSERT INTO `django_migrations` VALUES ('27', 'django_comments', '0003_add_submit_date_index', '2017-10-01 02:18:37.198270');
INSERT INTO `django_migrations` VALUES ('28', 'sites', '0002_alter_domain_unique', '2017-10-01 02:18:37.234366');
INSERT INTO `django_migrations` VALUES ('29', 'default', '0001_initial', '2017-10-01 02:18:37.510682');
INSERT INTO `django_migrations` VALUES ('30', 'social_auth', '0001_initial', '2017-10-01 02:18:37.514193');
INSERT INTO `django_migrations` VALUES ('31', 'default', '0002_add_related_name', '2017-10-01 02:18:37.599825');
INSERT INTO `django_migrations` VALUES ('32', 'social_auth', '0002_add_related_name', '2017-10-01 02:18:37.602126');
INSERT INTO `django_migrations` VALUES ('33', 'default', '0003_alter_email_max_length', '2017-10-01 02:18:37.637318');
INSERT INTO `django_migrations` VALUES ('34', 'social_auth', '0003_alter_email_max_length', '2017-10-01 02:18:37.640592');
INSERT INTO `django_migrations` VALUES ('35', 'default', '0004_auto_20160423_0400', '2017-10-01 02:18:37.665726');
INSERT INTO `django_migrations` VALUES ('36', 'social_auth', '0004_auto_20160423_0400', '2017-10-01 02:18:37.692688');
INSERT INTO `django_migrations` VALUES ('37', 'social_auth', '0005_auto_20160727_2333', '2017-10-01 02:18:37.710181');
INSERT INTO `django_migrations` VALUES ('38', 'social_django', '0006_partial', '2017-10-01 02:18:37.742312');
INSERT INTO `django_migrations` VALUES ('39', 'social_django', '0004_auto_20160423_0400', '2017-10-01 02:18:37.747554');
INSERT INTO `django_migrations` VALUES ('40', 'social_django', '0005_auto_20160727_2333', '2017-10-01 02:18:37.750724');
INSERT INTO `django_migrations` VALUES ('41', 'social_django', '0001_initial', '2017-10-01 02:18:37.753826');
INSERT INTO `django_migrations` VALUES ('42', 'social_django', '0002_add_related_name', '2017-10-01 02:18:37.756913');
INSERT INTO `django_migrations` VALUES ('43', 'social_django', '0003_alter_email_max_length', '2017-10-01 02:18:37.759934');
INSERT INTO `django_migrations` VALUES ('44', 'django_comments_xtd', '0001_initial', '2017-10-03 09:44:22.317850');
INSERT INTO `django_migrations` VALUES ('45', 'django_comments_xtd', '0002_blacklisteddomain', '2017-10-03 09:44:22.393297');
INSERT INTO `django_migrations` VALUES ('46', 'django_comments_xtd', '0003_auto_20170220_1333', '2017-10-03 09:44:22.422460');
INSERT INTO `django_migrations` VALUES ('47', 'django_comments_xtd', '0004_auto_20170221_1510', '2017-10-03 09:44:22.449212');
INSERT INTO `django_migrations` VALUES ('48', 'django_comments_xtd', '0005_auto_20171003_0340', '2017-10-03 09:44:22.519492');
INSERT INTO `django_migrations` VALUES ('49', 'me', '0002_guesbook', '2017-10-03 09:44:22.539868');
INSERT INTO `django_migrations` VALUES ('50', 'notifications', '0001_initial', '2017-10-19 00:45:43.162053');
INSERT INTO `django_migrations` VALUES ('51', 'notifications', '0002_auto_20150224_1134', '2017-10-19 00:45:43.335836');
INSERT INTO `django_migrations` VALUES ('52', 'notifications', '0003_notification_data', '2017-10-19 00:45:43.397652');
INSERT INTO `django_migrations` VALUES ('53', 'notifications', '0004_auto_20150826_1508', '2017-10-19 00:45:43.433265');
INSERT INTO `django_migrations` VALUES ('54', 'notifications', '0005_auto_20160504_1520', '2017-10-19 00:45:43.464084');
INSERT INTO `django_migrations` VALUES ('55', 'me', '0002_mypicture', '2017-10-21 20:19:38.713667');
INSERT INTO `django_migrations` VALUES ('56', 'django_comments_xtd', '0006_xtdcomment_parent_comment', '2017-10-26 17:48:24.063961');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_de54fa62` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0m1kluftjyopswbp9kt5tl0wef6bo2u4', 'ZTQ1YzdhZGVkMzYwYzQ1OGNjY2E3MDJkZTExYzIyN2M1YTQ4MThkMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidG9vbHMiLCJmYXZvcml0ZSJdLCIiXSwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJVc2VyXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwib3JkZXJcIjogMywgXCJ1cmxcIjogXCIveGFkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIn0sIHtcInRpdGxlXCI6IFwiXHU5MGFlXHU3YmIxXHU5YThjXHU4YmMxXHU3ODAxXCIsIFwib3JkZXJcIjogNywgXCJ1cmxcIjogXCIveGFkbWluL3VzZXIvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwiaWNvblwiOiBudWxsfV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi91c2VyL3VzZXJwcm9maWxlL1wiLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS11c2VyXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1NTE4NVx1NWJiOVwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1N2I4MFx1NGVjYlwiLCBcIm9yZGVyXCI6IDE2LCBcInVybFwiOiBcIi94YWRtaW4vbWUvcGVyc29uYWxwcm9maWxlL1wiLCBcImljb25cIjogbnVsbH1dLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vbWUvcGVyc29uYWxwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTUzNWFcdTViYTJcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTRmNWNcdTgwMDVcIiwgXCJvcmRlclwiOiA4LCBcInVybFwiOiBcIi94YWRtaW4vcG9zdC9hdXRob3IvXCIsIFwiaWNvblwiOiBcImZhIGZhLXBlbmNpbFwifSwge1widGl0bGVcIjogXCJcdTRlMmFcdTRlYmFcdTUzNWFcdTViYTJcIiwgXCJvcmRlclwiOiA5LCBcInVybFwiOiBcIi94YWRtaW4vcG9zdC9hcnRpY2xlL1wiLCBcImljb25cIjogXCJmYSBmYS1ib29rXCJ9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3Bvc3QvYXJ0aWNsZS9cIiwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtYm9va1wifSwge1widGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTRlM2JcdTk4OThcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTUyMDZcdTdjN2JcIiwgXCJvcmRlclwiOiAxMCwgXCJ1cmxcIjogXCIveGFkbWluL2NhdGVnb3J5L2NhdGVnb3J5L1wiLCBcImljb25cIjogbnVsbH1dLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vY2F0ZWdvcnkvY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NTM1YVx1NWJhMlx1NWRlNVx1NTE3N1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OTYwNVx1OGJmYlx1OGJlNlx1NjBjNVx1N2VkZlx1OGJhMVwiLCBcIm9yZGVyXCI6IDExLCBcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvdmlldy9cIiwgXCJpY29uXCI6IG51bGx9LCB7XCJ0aXRsZVwiOiBcIlx1OTYwNVx1OGJmYlx1NjU3MFx1NzZlZVx1N2VkZlx1OGJhMVwiLCBcIm9yZGVyXCI6IDEyLCBcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvdmlld251bS9cIiwgXCJpY29uXCI6IG51bGx9LCB7XCJ0aXRsZVwiOiBcIlx1NzBiOVx1OGQ1ZVx1OGJlNlx1NjBjNVx1N2VkZlx1OGJhMVwiLCBcIm9yZGVyXCI6IDEzLCBcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvbGlrZS9cIiwgXCJpY29uXCI6IG51bGx9LCB7XCJ0aXRsZVwiOiBcIlx1NzBiOVx1OGQ1ZVx1NjU3MFx1NzZlZVx1N2VkZlx1OGJhMVwiLCBcIm9yZGVyXCI6IDE0LCBcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvbGlrZW51bS9cIiwgXCJpY29uXCI6IG51bGx9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwiLCBcIm9yZGVyXCI6IDE1LCBcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvZmF2b3JpdGUvXCIsIFwiaWNvblwiOiBudWxsfV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi90b29scy9saWtlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJvcmRlclwiOiA2LCBcInVybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCJ9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wifSwge1widGl0bGVcIjogXCJcdThiYTRcdThiYzFcdTU0OGNcdTYzODhcdTY3NDNcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTdlYzRcIiwgXCJvcmRlclwiOiAyLCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIiwgXCJpY29uXCI6IFwiZmEgZmEtZ3JvdXBcIn0sIHtcInRpdGxlXCI6IFwiXHU2NzQzXHU5NjUwXCIsIFwib3JkZXJcIjogNCwgXCJ1cmxcIjogXCIveGFkbWluL2F1dGgvcGVybWlzc2lvbi9cIiwgXCJpY29uXCI6IFwiZmEgZmEtbG9ja1wifV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ncm91cFwifV0iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2VyLnZpZXdzLnVzZXJhZGQuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQifQ==', '2017-10-08 03:01:59.045873');
INSERT INTO `django_session` VALUES ('2bey2su9tuu7zj15husiprj3abnwkg3d', 'M2YwMmRhOWU2OWE2NmJjMzU1MjEzOGY0ZTJmYTE3MTg0YzZhZmM5Mjp7InFxX3N0YXRlIjoienNvWlJEVVM4azhucWF1cWFmdlpxcW0ycG9EcXRnR0QifQ==', '2017-10-15 19:18:19.300375');
INSERT INTO `django_session` VALUES ('2k5e2lhqj2ow358fg37xw5avot0j7dq7', 'MjI3ZmFlM2VhMTMwNTQzZmMwNjRiZTdiMWEyNzdhYzc5NTEyMzVjNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ2l0aHViLkdpdGh1Yk9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjBlOWZkNDczZGJlMjFhMWU2MzNmNWE3ZmZhY2MyM2M3NjQ5ZmJjMjgiLCJnaXRodWJfc3RhdGUiOiJqMDVzUUFTQ1ZjMDZVRXc4V1NnSlJKYTVVcTFwYkhZUCIsInNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZCI6ImdpdGh1YiJ9', '2017-10-15 18:25:29.225565');
INSERT INTO `django_session` VALUES ('2o4xmyi3n8d3fajna89qaxwz0dzrpvdx', 'MmFjODU2OTY2OTk0MWQ4MDBhMzk5ZjRkMzM2Y2UzNmQzZDQ2NzgwNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2VyLnZpZXdzLnVzZXJhZGQuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-10-17 11:25:39.145116');
INSERT INTO `django_session` VALUES ('3foumfqm3ckhkw4iq0y4ec6qg0qu31y9', 'NGM0NWQ4OWUzNzcxMjQ1MzllYzk2MDI1MzkxOWExNmMwNmZjYjZlZjp7Im5leHQiOiIvcG9zdC8xMy8iLCJnaXRodWJfc3RhdGUiOiJBSk5ra0JMM2t4ZHlNVG1ya1lGMFBEVlRIaWZPUWZMaSJ9', '2017-11-02 17:04:53.350519');
INSERT INTO `django_session` VALUES ('4vsarqn1ciu8hbfbc4aq8yvbrk9viemd', 'ZTUyNjY2Nzg0M2JlOWEyMzU5ODYzZDJiMDk3YmMzYTcwZWNjZWJjMzp7ImdpdGh1Yl9zdGF0ZSI6ImtXZHFEY0hVdHl0a0plS2dsdVpkaHdqY0VaQTY5eHdpIn0=', '2017-10-16 19:09:30.371668');
INSERT INTO `django_session` VALUES ('7qtllync0ld9swaj0l4oo2jtdls2z2er', 'MWJlNmQwNjNmODZkMzhkOWZkZGFkMzFlYzkxZWVjOTI1ZTcxMjlhMTp7IkxJU1RfUVVFUlkiOltbInVzZXIiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmMWJmMTNlYWViYzViMDBjYTAxYzU3ZjU0NWZlZjkyMDE4OGVkNTc0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy51c2VyYWRkLkN1c3RvbUJhY2tlbmQifQ==', '2017-10-12 20:03:08.489754');
INSERT INTO `django_session` VALUES ('7s0wql8h7y4i7hvo1w8r2udiivyknhfd', 'MTU3Y2NkNDdlN2ExNDZjMjg3NjAzOWY0MjExYzZkNzQ4ODVkYzhkNDp7Im5leHQiOiIvcG9zdC8xMy8iLCJxcV9zdGF0ZSI6IjZ5bkdvWEE1UFZRNUZtZUF4eXl5ZkhPMU9MOFlmb2ozIn0=', '2017-11-02 17:01:35.838470');
INSERT INTO `django_session` VALUES ('7x86a5a6e29kscb1ill58jr4gh9wt9e6', 'NWQ3OTA1ZDM0NWExZDdlYmQ0MDIyNjhiNmQyNzhiMDMwN2ZmNTc2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjFiZjEzZWFlYmM1YjAwY2EwMWM1N2Y1NDVmZWY5MjAxODhlZDU3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXIudmlld3MudXNlcmFkZC5DdXN0b21CYWNrZW5kIn0=', '2017-11-09 17:48:54.067260');
INSERT INTO `django_session` VALUES ('8tmzjal9ako61l643lgwj1rdkk9mtr4o', 'YjA3MThhYTBiODYyMDBkMTc2NTEyYTMxOWMxNzEwNjFhMDBkOTRkMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXIudmlld3MudXNlcmFkZC5DdXN0b21CYWNrZW5kIn0=', '2017-10-08 23:14:40.484411');
INSERT INTO `django_session` VALUES ('a1413qj5i7ed7spgd5s5pp8fepv8qmlw', 'YjA3MThhYTBiODYyMDBkMTc2NTEyYTMxOWMxNzEwNjFhMDBkOTRkMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXIudmlld3MudXNlcmFkZC5DdXN0b21CYWNrZW5kIn0=', '2017-10-28 01:28:44.693468');
INSERT INTO `django_session` VALUES ('a3sppouua7c7l89hxv3yvnlzeydgiomd', 'NGM2YzZiYzgyMzYzZWZkYWMwZjJkYmMzYzk0OGYzNDRkMDQyYTg2ZDp7IndlaWJvX3N0YXRlIjoiQVZPcXdwUE1xd21UTUhGU2RHQzdwVm1pM0pYUVlocWkifQ==', '2017-10-16 19:07:51.461441');
INSERT INTO `django_session` VALUES ('belrxva26xpa8wuh2j8p29agv70rdvhi', 'ZGRiNGY5Mzg2MTY3MWM0OGUyYjQ5ZjFhOTkxYTFmM2JiM2U2YTZkMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXIudmlld3MudXNlcmFkZC5DdXN0b21CYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sicG9zdCIsImFydGljbGUiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQiLCJuYXZfbWVudSI6Ilt7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi91c2VyL3VzZXJwcm9maWxlL1wiLCBcIm9yZGVyXCI6IDMsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NGZlMVx1NjA2ZlwifSwge1widXJsXCI6IFwiL3hhZG1pbi91c2VyL2VtYWlsdmVyaWZ5cmVjb3JkL1wiLCBcIm9yZGVyXCI6IDcsIFwiaWNvblwiOiBudWxsLCBcInRpdGxlXCI6IFwiXHU5MGFlXHU3YmIxXHU5YThjXHU4YmMxXHU3ODAxXCJ9XSwgXCJ0aXRsZVwiOiBcIlVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCIsIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL21lL3BlcnNvbmFscHJvZmlsZS9cIiwgXCJvcmRlclwiOiAxNiwgXCJpY29uXCI6IG51bGwsIFwidGl0bGVcIjogXCJcdTRlMmFcdTRlYmFcdTdiODBcdTRlY2JcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vbWUvZ3Vlc2Jvb2svXCIsIFwib3JkZXJcIjogMTcsIFwiaWNvblwiOiBudWxsLCBcInRpdGxlXCI6IFwiXHU3NTU5XHU4YTAwXHU2NzdmXCJ9XSwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1NTE4NVx1NWJiOVwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vbWUvcGVyc29uYWxwcm9maWxlL1wifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vcG9zdC9hdXRob3IvXCIsIFwib3JkZXJcIjogOCwgXCJpY29uXCI6IFwiZmEgZmEtcGVuY2lsXCIsIFwidGl0bGVcIjogXCJcdTRmNWNcdTgwMDVcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vcG9zdC9hcnRpY2xlL1wiLCBcIm9yZGVyXCI6IDksIFwiaWNvblwiOiBcImZhIGZhLWJvb2tcIiwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1NTM1YVx1NWJhMlwifV0sIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3Bvc3QvYXV0aG9yL1wiLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1wZW5jaWxcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL2NhdGVnb3J5L2NhdGVnb3J5L1wiLCBcIm9yZGVyXCI6IDEwLCBcImljb25cIjogbnVsbCwgXCJ0aXRsZVwiOiBcIlx1NTM1YVx1NWJhMlx1NTIwNlx1N2M3YlwifV0sIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTRlM2JcdTk4OThcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2NhdGVnb3J5L2NhdGVnb3J5L1wifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvdmlldy9cIiwgXCJvcmRlclwiOiAxMSwgXCJpY29uXCI6IG51bGwsIFwidGl0bGVcIjogXCJcdTk2MDVcdThiZmJcdThiZTZcdTYwYzVcdTdlZGZcdThiYTFcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvdmlld251bS9cIiwgXCJvcmRlclwiOiAxMiwgXCJpY29uXCI6IG51bGwsIFwidGl0bGVcIjogXCJcdTk2MDVcdThiZmJcdTY1NzBcdTc2ZWVcdTdlZGZcdThiYTFcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvbGlrZS9cIiwgXCJvcmRlclwiOiAxMywgXCJpY29uXCI6IG51bGwsIFwidGl0bGVcIjogXCJcdTcwYjlcdThkNWVcdThiZTZcdTYwYzVcdTdlZGZcdThiYTFcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvbGlrZW51bS9cIiwgXCJvcmRlclwiOiAxNCwgXCJpY29uXCI6IG51bGwsIFwidGl0bGVcIjogXCJcdTcwYjlcdThkNWVcdTY1NzBcdTc2ZWVcdTdlZGZcdThiYTFcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vdG9vbHMvZmF2b3JpdGUvXCIsIFwib3JkZXJcIjogMTUsIFwiaWNvblwiOiBudWxsLCBcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4NWNmXCJ9XSwgXCJ0aXRsZVwiOiBcIlx1NTM1YVx1NWJhMlx1NWRlNVx1NTE3N1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vdG9vbHMvdmlldy9cIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwib3JkZXJcIjogNiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwidGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIn1dLCBcInRpdGxlXCI6IFwiXHU3YmExXHU3NDA2XCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wiLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1jb2dcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL2F1dGgvZ3JvdXAvXCIsIFwib3JkZXJcIjogMiwgXCJpY29uXCI6IFwiZmEgZmEtZ3JvdXBcIiwgXCJ0aXRsZVwiOiBcIlx1N2VjNFwifSwge1widXJsXCI6IFwiL3hhZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwib3JkZXJcIjogNCwgXCJpY29uXCI6IFwiZmEgZmEtbG9ja1wiLCBcInRpdGxlXCI6IFwiXHU2NzQzXHU5NjUwXCJ9XSwgXCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1sb2NrXCJ9XSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-10-30 15:56:08.067341');
INSERT INTO `django_session` VALUES ('et9mzsyku2dcyhghxcnvkkos6kgd6r5g', 'N2UxMjg2NGFkYzE3NTFjYTJmZDg1YjUzN2QwMTdlMDgwMTQwYTJmNjp7InFxX3N0YXRlIjoiVWNEWTE0NmIyZHBOSFdwNkhOdDdrVTdmM3AxMFR5SXkifQ==', '2017-11-01 03:57:03.503452');
INSERT INTO `django_session` VALUES ('fsj0ujw6c6i4q0yo2uobcm6yd209ac9w', 'NmExZGRhYWY4YmM4YTViZDhiMGY3ZDJiMGY5MDg3MGEwZjZiYWZlMzp7InFxX3N0YXRlIjoiUnhtUDlrSFZtUkVpSm83UVVLamtQNE1mbmFXRGRUdkIifQ==', '2017-10-16 19:06:04.048990');
INSERT INTO `django_session` VALUES ('j711aln73xmwn3vh2gz5jck3q6io2pw2', 'NWFkZmI0NTViN2JkMmFjZWQ0ZmM5OTkwM2Y0ZmQ5OTg5MTlmYTFjMzp7Im5leHQiOiIvcG9zdC83LyIsImdpdGh1Yl9zdGF0ZSI6IktjSUlFenNzYlZFZnF6YXF4b3JDWHhCSWNpamtrMmx3In0=', '2017-11-02 18:16:43.736022');
INSERT INTO `django_session` VALUES ('nnns64lj1w6rcwkykq1l97pa8ht27hm9', 'OWE4NWUzYjc5YzQ4ODJmZmFmMWRiNWM0OTAzMzY4NzhlNDUzYjhjMzp7IndlaWJvX3N0YXRlIjoiTFRid2hJVzc5cUhEbUd6dnpWNFB5bHRCVFdmbjJvZGIifQ==', '2017-10-15 19:16:30.663724');
INSERT INTO `django_session` VALUES ('oeezma9baf19lafs7mnd11x4e6igghhm', 'ODFiN2M4ZGQ5NDM1Y2ZhYmIyNjMwMjc4MzJkMjVkYzJlNzNiOWYzODp7IndlaWJvX3N0YXRlIjoiT295b2syRzQ4NXpGSVFHU3VCTDMzRk9relgxSlZzSkQifQ==', '2017-11-01 03:57:13.056989');
INSERT INTO `django_session` VALUES ('r7ozz4ybgfi836on7m3nv2kow82uplv0', 'Mzc2Zjc4MTdiYWZkZjhiN2RjZmRkMTJiNjNlOTNjZWE2MTQ1MTg5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXIudmlld3MudXNlcmFkZC5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJMSVNUX1FVRVJZIjpbWyJ1c2VyIiwidXNlcnByb2ZpbGUiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQiLCJuYXZfbWVudSI6Ilt7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAzLCBcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCJ9LCB7XCJvcmRlclwiOiA3LCBcInRpdGxlXCI6IFwiXHU5MGFlXHU3YmIxXHU5YThjXHU4YmMxXHU3ODAxXCIsIFwiaWNvblwiOiBudWxsLCBcInVybFwiOiBcIi94YWRtaW4vdXNlci9lbWFpbHZlcmlmeXJlY29yZC9cIn1dLCBcInRpdGxlXCI6IFwiVXNlclwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vdXNlci91c2VycHJvZmlsZS9cIn0sIHtcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAxNiwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1N2I4MFx1NGVjYlwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL21lL3BlcnNvbmFscHJvZmlsZS9cIn0sIHtcIm9yZGVyXCI6IDE3LCBcInRpdGxlXCI6IFwiXHU3NTU5XHU4YTAwXHU2NzdmXCIsIFwiaWNvblwiOiBudWxsLCBcInVybFwiOiBcIi94YWRtaW4vbWUvZ3Vlc2Jvb2svXCJ9XSwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1NTE4NVx1NWJiOVwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vbWUvZ3Vlc2Jvb2svXCJ9LCB7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtYm9va1wiLCBcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiA4LCBcInRpdGxlXCI6IFwiXHU0ZjVjXHU4MDA1XCIsIFwiaWNvblwiOiBcImZhIGZhLXBlbmNpbFwiLCBcInVybFwiOiBcIi94YWRtaW4vcG9zdC9hdXRob3IvXCJ9LCB7XCJvcmRlclwiOiA5LCBcInRpdGxlXCI6IFwiXHU0ZTJhXHU0ZWJhXHU1MzVhXHU1YmEyXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2tcIiwgXCJ1cmxcIjogXCIveGFkbWluL3Bvc3QvYXJ0aWNsZS9cIn1dLCBcInRpdGxlXCI6IFwiXHU1MzVhXHU1YmEyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9wb3N0L2FydGljbGUvXCJ9LCB7XCJtZW51c1wiOiBbe1wib3JkZXJcIjogMTAsIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTUyMDZcdTdjN2JcIiwgXCJpY29uXCI6IG51bGwsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeS9jYXRlZ29yeS9cIn1dLCBcInRpdGxlXCI6IFwiXHU1MzVhXHU1YmEyXHU0ZTNiXHU5ODk4XCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeS9jYXRlZ29yeS9cIn0sIHtcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAxMSwgXCJ0aXRsZVwiOiBcIlx1OTYwNVx1OGJmYlx1OGJlNlx1NjBjNVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL3ZpZXcvXCJ9LCB7XCJvcmRlclwiOiAxMiwgXCJ0aXRsZVwiOiBcIlx1OTYwNVx1OGJmYlx1NjU3MFx1NzZlZVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL3ZpZXdudW0vXCJ9LCB7XCJvcmRlclwiOiAxMywgXCJ0aXRsZVwiOiBcIlx1NzBiOVx1OGQ1ZVx1OGJlNlx1NjBjNVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL2xpa2UvXCJ9LCB7XCJvcmRlclwiOiAxNCwgXCJ0aXRsZVwiOiBcIlx1NzBiOVx1OGQ1ZVx1NjU3MFx1NzZlZVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL2xpa2VudW0vXCJ9LCB7XCJvcmRlclwiOiAxNSwgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL2Zhdm9yaXRlL1wifV0sIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTVkZTVcdTUxNzdcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3Rvb2xzL3ZpZXdudW0vXCJ9LCB7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwibWVudXNcIjogW3tcIm9yZGVyXCI6IDYsIFwidGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwidXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wifV0sIFwidGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtbG9ja1wiLCBcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAyLCBcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wifSwge1wib3JkZXJcIjogNCwgXCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL3Blcm1pc3Npb24vXCJ9XSwgXCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wifV0ifQ==', '2017-11-04 10:18:15.727771');
INSERT INTO `django_session` VALUES ('sixuj97ape7u5gn6irx1y4eq57waufcn', 'MjEyMjBlZTg5OTY0N2IwYmJkYmU1Mzc2YzE0MTY5NDIyOGY0YmM1Mzp7ImdpdGh1Yl9zdGF0ZSI6IjFJU2tESjQ4Q25TazFNQXliaklyNTdla2dyRkdhcmZ4In0=', '2017-10-15 19:19:54.848776');
INSERT INTO `django_session` VALUES ('spd1pf3777u136osexzs04t3kjgydif8', 'MWYzMzJmMzUyYWM3NjRiYjVkOWY4M2ZhNjkyOGViYmQ3NDMxN2E2Nzp7ImdpdGh1Yl9zdGF0ZSI6IjhTdWRkeDBsUjdNRmVUMGtvWkR5aHVqN1o3c2hMMG85In0=', '2017-11-01 03:57:03.493539');
INSERT INTO `django_session` VALUES ('t7uuehc0czt6ot6huje44tygef60ao9v', 'ZDJlMWJjZmRkZDJmNmRlMmY2ODYwZDU3ZTMwNmVhNjFmYWZmZDA0Zjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ2l0aHViLkdpdGh1Yk9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjBlOWZkNDczZGJlMjFhMWU2MzNmNWE3ZmZhY2MyM2M3NjQ5ZmJjMjgiLCJnaXRodWJfc3RhdGUiOiJSZlcyMzIxZERCdEdHMVJqMW1mMGVSMjRrZGFQUjFDciIsInNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZCI6ImdpdGh1YiJ9', '2017-10-15 18:56:42.500598');
INSERT INTO `django_session` VALUES ('tjum5a2hiyq1ewrogcf9issu8ecw10dx', 'NDNkMWU0ODdlYzg3MDBjMGQ2YjQzOWUxNDE4MDMyY2FiZDZhZGIxNjp7InNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZCI6InFxIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2YxNjRkM2Q5ZWMxYmU5OWUwYjM4MjU0YzdhODhiMTE0Y2JjOWZlZSIsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InNvY2lhbF9jb3JlLmJhY2tlbmRzLnFxLlFRT0F1dGgyIiwicXFfc3RhdGUiOiJ0RUdnQ05Kckw4T2JsUUlkYzVZckE3a09oWWFjbklQeCJ9', '2017-10-25 00:19:23.400054');
INSERT INTO `django_session` VALUES ('tnxiyk3mgxgpddviwefucvxgii7atbv3', 'YTJhMTE0NzYzY2RiNjc0MWI5ZDM2OTIxMGUxY2M3N2QwNzkzNzdlYTp7Im5leHQiOiIvcG9zdC83LyIsIndlaWJvX3N0YXRlIjoiTlk4MnRLZ3c4VUdQUm1BUjB2WGw3NDFXUHpubnVLTXEifQ==', '2017-11-02 18:19:20.833536');
INSERT INTO `django_session` VALUES ('tqjumg67f4n6tie1uq56snuleeguage5', 'Yjg3OGE4MGI0NjQ3MzM1N2E4YTUwMTY5YWQ2NjU0MDgxZmZjZDFjNzp7Im5leHQiOiIvcG9zdC83LyIsInFxX3N0YXRlIjoiU2ZJY3c0WGhBMXJ1dFJ4M2tPaVg2S1dTOFFsaUdQNE8ifQ==', '2017-11-02 18:17:45.242152');
INSERT INTO `django_session` VALUES ('w0dgpm6o1a9115insbxntxhxxq9phg9m', 'NTI1MzBkMDExZDRlYTM5ZWI1NDc2N2NkNGQ0N2ViZjMyZjYzMDVjODp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQiLCJMSVNUX1FVRVJZIjpbWyJtZSIsImd1ZXNib29rIl0sIiJdLCJuYXZfbWVudSI6Ilt7XCJtZW51c1wiOiBbe1wib3JkZXJcIjogMywgXCJ1cmxcIjogXCIveGFkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCIsIFwidGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTRmZTFcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwifSwge1wib3JkZXJcIjogNywgXCJ1cmxcIjogXCIveGFkbWluL3VzZXIvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwidGl0bGVcIjogXCJcdTkwYWVcdTdiYjFcdTlhOGNcdThiYzFcdTc4MDFcIiwgXCJpY29uXCI6IG51bGx9XSwgXCJ0aXRsZVwiOiBcIlVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXIvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIn0sIHtcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAxNiwgXCJ1cmxcIjogXCIveGFkbWluL21lL3BlcnNvbmFscHJvZmlsZS9cIiwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1N2I4MFx1NGVjYlwiLCBcImljb25cIjogbnVsbH0sIHtcIm9yZGVyXCI6IDE3LCBcInVybFwiOiBcIi94YWRtaW4vbWUvZ3Vlc2Jvb2svXCIsIFwidGl0bGVcIjogXCJcdTc1NTlcdThhMDBcdTY3N2ZcIiwgXCJpY29uXCI6IG51bGx9LCB7XCJvcmRlclwiOiAxOCwgXCJ1cmxcIjogXCIveGFkbWluL21lL215cGljdHVyZS9cIiwgXCJ0aXRsZVwiOiBcIlx1NjIxMVx1NzY4NFx1NzZmOFx1NTE4Y1wiLCBcImljb25cIjogbnVsbH0sIHtcIm9yZGVyXCI6IDE5LCBcInVybFwiOiBcIi94YWRtaW4vbWUvcGhvdG8vXCIsIFwidGl0bGVcIjogXCJcdTc2ZjhcdTUxOGNcdTcxNjdcdTcyNDdcIiwgXCJpY29uXCI6IG51bGx9XSwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1NTE4NVx1NWJiOVwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vbWUvbXlwaWN0dXJlL1wifSwge1wibWVudXNcIjogW3tcIm9yZGVyXCI6IDgsIFwidXJsXCI6IFwiL3hhZG1pbi9wb3N0L2F1dGhvci9cIiwgXCJ0aXRsZVwiOiBcIlx1NGY1Y1x1ODAwNVwiLCBcImljb25cIjogXCJmYSBmYS1wZW5jaWxcIn0sIHtcIm9yZGVyXCI6IDksIFwidXJsXCI6IFwiL3hhZG1pbi9wb3N0L2FydGljbGUvXCIsIFwidGl0bGVcIjogXCJcdTRlMmFcdTRlYmFcdTUzNWFcdTViYTJcIiwgXCJpY29uXCI6IFwiZmEgZmEtYm9va1wifV0sIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3Bvc3QvYXJ0aWNsZS9cIiwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtYm9va1wifSwge1wibWVudXNcIjogW3tcIm9yZGVyXCI6IDEwLCBcInVybFwiOiBcIi94YWRtaW4vY2F0ZWdvcnkvY2F0ZWdvcnkvXCIsIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTUyMDZcdTdjN2JcIiwgXCJpY29uXCI6IG51bGx9XSwgXCJ0aXRsZVwiOiBcIlx1NTM1YVx1NWJhMlx1NGUzYlx1OTg5OFwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vY2F0ZWdvcnkvY2F0ZWdvcnkvXCJ9LCB7XCJtZW51c1wiOiBbe1wib3JkZXJcIjogMTEsIFwidXJsXCI6IFwiL3hhZG1pbi90b29scy92aWV3L1wiLCBcInRpdGxlXCI6IFwiXHU5NjA1XHU4YmZiXHU4YmU2XHU2MGM1XHU3ZWRmXHU4YmExXCIsIFwiaWNvblwiOiBudWxsfSwge1wib3JkZXJcIjogMTIsIFwidXJsXCI6IFwiL3hhZG1pbi90b29scy92aWV3bnVtL1wiLCBcInRpdGxlXCI6IFwiXHU5NjA1XHU4YmZiXHU2NTcwXHU3NmVlXHU3ZWRmXHU4YmExXCIsIFwiaWNvblwiOiBudWxsfSwge1wib3JkZXJcIjogMTMsIFwidXJsXCI6IFwiL3hhZG1pbi90b29scy9saWtlL1wiLCBcInRpdGxlXCI6IFwiXHU3MGI5XHU4ZDVlXHU4YmU2XHU2MGM1XHU3ZWRmXHU4YmExXCIsIFwiaWNvblwiOiBudWxsfSwge1wib3JkZXJcIjogMTQsIFwidXJsXCI6IFwiL3hhZG1pbi90b29scy9saWtlbnVtL1wiLCBcInRpdGxlXCI6IFwiXHU3MGI5XHU4ZDVlXHU2NTcwXHU3NmVlXHU3ZWRmXHU4YmExXCIsIFwiaWNvblwiOiBudWxsfSwge1wib3JkZXJcIjogMTUsIFwidXJsXCI6IFwiL3hhZG1pbi90b29scy9mYXZvcml0ZS9cIiwgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwiLCBcImljb25cIjogbnVsbH1dLCBcInRpdGxlXCI6IFwiXHU1MzVhXHU1YmEyXHU1ZGU1XHU1MTc3XCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi90b29scy92aWV3L1wifSwge1wibWVudXNcIjogW3tcIm9yZGVyXCI6IDYsIFwidXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wiLCBcInRpdGxlXCI6IFwiXHU2NWU1XHU1ZmQ3XHU4YmIwXHU1ZjU1XCIsIFwiaWNvblwiOiBcImZhIGZhLWNvZ1wifV0sIFwidGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wifSwge1wibWVudXNcIjogW3tcIm9yZGVyXCI6IDIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCJ9LCB7XCJvcmRlclwiOiA0LCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcInRpdGxlXCI6IFwiXHU2NzQzXHU5NjUwXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIn1dLCBcInRpdGxlXCI6IFwiXHU4YmE0XHU4YmMxXHU1NDhjXHU2Mzg4XHU2NzQzXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ncm91cFwifV0iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2VyLnZpZXdzLnVzZXJhZGQuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-11-08 11:17:20.517807');
INSERT INTO `django_session` VALUES ('wt150xtevnrpm16pq3t76l58ko81c0s6', 'MjUwZTliMzExM2FlYTA5OTY1NGM4YTc0OThhMzk4ODFmNzUzZWU2Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxYmYxM2VhZWJjNWIwMGNhMDFjNTdmNTQ1ZmVmOTIwMTg4ZWQ1NzQiLCJMSVNUX1FVRVJZIjpbWyJ1c2VyIiwidXNlcnByb2ZpbGUiXSwiIl0sIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy51c2VyYWRkLkN1c3RvbUJhY2tlbmQiLCJuYXZfbWVudSI6Ilt7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAzLCBcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXIvdXNlcnByb2ZpbGUvXCJ9LCB7XCJvcmRlclwiOiA3LCBcInRpdGxlXCI6IFwiXHU5MGFlXHU3YmIxXHU5YThjXHU4YmMxXHU3ODAxXCIsIFwiaWNvblwiOiBudWxsLCBcInVybFwiOiBcIi94YWRtaW4vdXNlci9lbWFpbHZlcmlmeXJlY29yZC9cIn1dLCBcInRpdGxlXCI6IFwiVXNlclwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vdXNlci91c2VycHJvZmlsZS9cIn0sIHtcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAxNiwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1N2I4MFx1NGVjYlwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL21lL3BlcnNvbmFscHJvZmlsZS9cIn0sIHtcIm9yZGVyXCI6IDE3LCBcInRpdGxlXCI6IFwiXHU3NTU5XHU4YTAwXHU2NzdmXCIsIFwiaWNvblwiOiBudWxsLCBcInVybFwiOiBcIi94YWRtaW4vbWUvZ3Vlc2Jvb2svXCJ9XSwgXCJ0aXRsZVwiOiBcIlx1NGUyYVx1NGViYVx1NTE4NVx1NWJiOVwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vbWUvZ3Vlc2Jvb2svXCJ9LCB7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtYm9va1wiLCBcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiA4LCBcInRpdGxlXCI6IFwiXHU0ZjVjXHU4MDA1XCIsIFwiaWNvblwiOiBcImZhIGZhLXBlbmNpbFwiLCBcInVybFwiOiBcIi94YWRtaW4vcG9zdC9hdXRob3IvXCJ9LCB7XCJvcmRlclwiOiA5LCBcInRpdGxlXCI6IFwiXHU0ZTJhXHU0ZWJhXHU1MzVhXHU1YmEyXCIsIFwiaWNvblwiOiBcImZhIGZhLWJvb2tcIiwgXCJ1cmxcIjogXCIveGFkbWluL3Bvc3QvYXJ0aWNsZS9cIn1dLCBcInRpdGxlXCI6IFwiXHU1MzVhXHU1YmEyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9wb3N0L2FydGljbGUvXCJ9LCB7XCJtZW51c1wiOiBbe1wib3JkZXJcIjogMTAsIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTUyMDZcdTdjN2JcIiwgXCJpY29uXCI6IG51bGwsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeS9jYXRlZ29yeS9cIn1dLCBcInRpdGxlXCI6IFwiXHU1MzVhXHU1YmEyXHU0ZTNiXHU5ODk4XCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeS9jYXRlZ29yeS9cIn0sIHtcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAxMSwgXCJ0aXRsZVwiOiBcIlx1OTYwNVx1OGJmYlx1OGJlNlx1NjBjNVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL3ZpZXcvXCJ9LCB7XCJvcmRlclwiOiAxMiwgXCJ0aXRsZVwiOiBcIlx1OTYwNVx1OGJmYlx1NjU3MFx1NzZlZVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL3ZpZXdudW0vXCJ9LCB7XCJvcmRlclwiOiAxMywgXCJ0aXRsZVwiOiBcIlx1NzBiOVx1OGQ1ZVx1OGJlNlx1NjBjNVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL2xpa2UvXCJ9LCB7XCJvcmRlclwiOiAxNCwgXCJ0aXRsZVwiOiBcIlx1NzBiOVx1OGQ1ZVx1NjU3MFx1NzZlZVx1N2VkZlx1OGJhMVwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL2xpa2VudW0vXCJ9LCB7XCJvcmRlclwiOiAxNSwgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwiLCBcImljb25cIjogbnVsbCwgXCJ1cmxcIjogXCIveGFkbWluL3Rvb2xzL2Zhdm9yaXRlL1wifV0sIFwidGl0bGVcIjogXCJcdTUzNWFcdTViYTJcdTVkZTVcdTUxNzdcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3Rvb2xzL3ZpZXdudW0vXCJ9LCB7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwibWVudXNcIjogW3tcIm9yZGVyXCI6IDYsIFwidGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwidXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wifV0sIFwidGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtbG9ja1wiLCBcIm1lbnVzXCI6IFt7XCJvcmRlclwiOiAyLCBcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wifSwge1wib3JkZXJcIjogNCwgXCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL3Blcm1pc3Npb24vXCJ9XSwgXCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wifV0ifQ==', '2017-11-06 19:37:51.306762');
INSERT INTO `django_session` VALUES ('yi5xigqabk5hr6k30rgh7ggr2bn9dj15', 'ZjcwZDE0NGUzN2Y4NjQ2NDYzYmNiM2M3ZTQxNGJkYzhmNjczZmY4MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXIudmlld3MudXNlcmFkZC5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmMWJmMTNlYWViYzViMDBjYTAxYzU3ZjU0NWZlZjkyMDE4OGVkNTc0In0=', '2017-11-02 02:02:43.780410');
INSERT INTO `django_session` VALUES ('zwjfcbtnwhpc9f08adliviqfyqs4yecw', 'NjE2MzlmZTQxMzA4YTBkNzFjY2JmYWMxZWFiMmFlM2E3N2Q0OTE2Yzp7IndlaWJvX3N0YXRlIjoiMUtjdVJnMXNtWUJtTm5oS1NkS0h0NDlBbTZDSzJkUVAiLCJxcV9zdGF0ZSI6IjFoMG9yRG1ETTU3NWRCVXphbmhkbVhmdDFLTUsyUlpVIn0=', '2017-10-29 21:16:00.175305');
INSERT INTO `django_session` VALUES ('zxyo5e9ub9ulbhnlrrajythxz2sood3q', 'ZmE1MWZmZWM0ODQzODYyOTM0MTA4NzZkOWFjZmY0NGI0NWQxZTc2MTp7Im5leHQiOiIvcG9zdC8xMy8iLCJ3ZWlib19zdGF0ZSI6Inp5RTI5UUFoblA3QVVaYW1UQU51b1JVQ0hnMzJ0ejFFIn0=', '2017-11-02 17:03:29.095665');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('1', 'chenzx.name', 'chenzx.name');
INSERT INTO `django_site` VALUES ('2', '127.0.0.1:8000', 'localhost');

-- ----------------------------
-- Table structure for me_guesbook
-- ----------------------------
DROP TABLE IF EXISTS `me_guesbook`;
CREATE TABLE `me_guesbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of me_guesbook
-- ----------------------------
INSERT INTO `me_guesbook` VALUES ('1', '留言板', '<p>这是我的留言板，这是我的留言板<br/></p>', '2017-10-03 09:50:20.057190');

-- ----------------------------
-- Table structure for me_mypicture
-- ----------------------------
DROP TABLE IF EXISTS `me_mypicture`;
CREATE TABLE `me_mypicture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mypicture_cover` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of me_mypicture
-- ----------------------------

-- ----------------------------
-- Table structure for me_personalprofile
-- ----------------------------
DROP TABLE IF EXISTS `me_personalprofile`;
CREATE TABLE `me_personalprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `profile` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of me_personalprofile
-- ----------------------------
INSERT INTO `me_personalprofile` VALUES ('1', '个人简介', '2017-09-24 02:46:30.595317', '<p style=\"text-align: center; line-height: 2em;\"><span style=\"font-size: 20px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">青玉案-元夕</span></strong></span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">【宋】辛弃疾</span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">东风夜放花千树。更吹落、星如雨。宝马雕车香满路。凤箫声动、玉壶光转，一夜鱼龙舞。<br/> </span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">蛾儿雪柳黄金缕。笑语盈盈暗香去。众里寻他千百度。蓦然回首，那人却在，灯火阑珊处。</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/> </span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/> </span></p><p style=\"text-align: center; line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">蝶恋花-伫倚危楼风细细</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\"></span></strong><br/> </span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;\">【宋】柳永</span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\"><br/> </span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 16px;\">伫倚危楼风细细。望极春愁，黯黯生天际。草色烟光残照里。无言谁会凭栏意。</span></span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 16px;\">拟把疏狂图一醉。对酒当歌，强乐还无味。衣带渐宽终不悔。为伊消得人憔悴。</span></span></p><p style=\"line-height: 3em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 16px;\"><br/> </span></span></p><p><br/></p><p><span style=\"font-family:微软雅黑, Microsoft YaHei\">记得高中时候抄写的几首诗词，现在已经全然忘却。这还是百度抄下来的，留着做个纪念吧！</span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">网站现在基本功能基本已经完善，现在是时候该去做点别的时候了。。。</span></p>');

-- ----------------------------
-- Table structure for me_photo
-- ----------------------------
DROP TABLE IF EXISTS `me_photo`;
CREATE TABLE `me_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `mypicture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `me_photo_mypicture_id_a4da2a90_fk_me_mypicture_id` (`mypicture_id`),
  CONSTRAINT `me_photo_mypicture_id_a4da2a90_fk_me_mypicture_id` FOREIGN KEY (`mypicture_id`) REFERENCES `me_mypicture` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of me_photo
-- ----------------------------

-- ----------------------------
-- Table structure for notifications_notification
-- ----------------------------
DROP TABLE IF EXISTS `notifications_notification`;
CREATE TABLE `notifications_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `actor_object_id` varchar(255) NOT NULL,
  `verb` varchar(255) NOT NULL,
  `description` longtext,
  `target_object_id` varchar(255) DEFAULT NULL,
  `action_object_object_id` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `action_object_content_type_id` int(11) DEFAULT NULL,
  `actor_content_type_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `target_content_type_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `emailed` tinyint(1) NOT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `D048a8ef5652b3aa09c098d37988e8ec` (`action_object_content_type_id`),
  KEY `notific_actor_content_type_id_0c69d7b7_fk_django_content_type_id` (`actor_content_type_id`),
  KEY `notifications_notif_recipient_id_d055f3f0_fk_user_userprofile_id` (`recipient_id`),
  KEY `notifi_target_content_type_id_ccb24d88_fk_django_content_type_id` (`target_content_type_id`),
  CONSTRAINT `D048a8ef5652b3aa09c098d37988e8ec` FOREIGN KEY (`action_object_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notifi_target_content_type_id_ccb24d88_fk_django_content_type_id` FOREIGN KEY (`target_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notific_actor_content_type_id_0c69d7b7_fk_django_content_type_id` FOREIGN KEY (`actor_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notifications_notif_recipient_id_d055f3f0_fk_user_userprofile_id` FOREIGN KEY (`recipient_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notifications_notification
-- ----------------------------

-- ----------------------------
-- Table structure for post_article
-- ----------------------------
DROP TABLE IF EXISTS `post_article`;
CREATE TABLE `post_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `excerpt` varchar(300) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `post_article_author_id_eab1d97c_fk_post_author_id` (`author_id`) USING BTREE,
  KEY `post_article_category_id_3222cb0c_fk_category_category_id` (`category_id`) USING BTREE,
  CONSTRAINT `post_article_author_id_eab1d97c_fk_post_author_id` FOREIGN KEY (`author_id`) REFERENCES `post_author` (`id`),
  CONSTRAINT `post_article_category_id_3222cb0c_fk_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of post_article
-- ----------------------------
INSERT INTO `post_article` VALUES ('1', '1 - 搭建django网站开发环境', '本教程使用的开发环境\n\n经过一个多月的搭建，今天网站终于完成。本教程制作时的本地的开发系统平台为Ubuntu17.04（64位），Python版本为3.5.2（64位），Django版本为1.10.7。建议尽可能使用与上述环境相同的系统开发环境（尤其是Python和Django的版本），以避免不必要的麻烦。推荐使用Py', '<p style=\"line-height: 1.5em;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">本教程使用的开发环境</span></strong></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\">经过一个多月的搭建，今天网站终于完成。本教程制作时的本地的开发系统平台为Ubuntu17.04（64位），Python版本为3.5.2（64</span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">位），Django版本为1.10.7。<span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">建议尽可能使用与上述环境相同的系统开发环境（尤其是Python和Django的版本），以避免不必要的麻烦。推荐使用Python版本为Python3.4及以上，Django版本必须为Django1.10.7及以下（Xadmin和django1.11以上不适配）</span></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><br/> </span></p><p style=\"line-height: 1.5em;\"><strong><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 18px;\">安装Python</span></span></strong></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">1、通过命令行安装Python3.5,执行命令：</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;apt-get&nbsp;install&nbsp;python3.5</pre><p style=\"text-align: justify; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2. 由于Ubuntu底层采用的是Python2.*，Python3.*与Python2.*是不兼容的，但是不能卸载Python2,随意卸载会出现意想不到的后果，只要把默认的Python指向Python3即可。注：Python3.5默认安装在/usr/local/lib/python3.5目录下，需要删除默认python link文件，重新建立连接关系，输入如下两条命令：</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;rm&nbsp;/usr/bin/pythonsudo&nbsp;ln&nbsp;-s&nbsp;/usr/bin/python3.5&nbsp;/usr/bin/python</pre><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">3、终端输入python就可以看到版本变成3.5了</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4、pip安装和升级</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;apt-get&nbsp;install&nbsp;python3-pippip3&nbsp;install&nbsp;--upgrade&nbsp;pip</pre><p style=\"text-align: left; line-height: 1.5em;\">参考：<a href=\"http://blog.csdn.net/u010426270/article/details/51059260\" target=\"_blank\">Ubuntu下安装Python3.5</a></p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: justify; line-height: 1.5em;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">安装django和Pycharm</span></strong></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\">1、安装django</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;pip3&nbsp;install&nbsp;django==1.11.2</pre><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"></span>2、安装Pycharm</p><p style=\"line-height: 1.5em;\">&nbsp;<a href=\"https://www.jetbrains.com/pycharm/download/#section=linux\" target=\"_blank\" textvalue=\"Pycharm下载地址\">Pycharm下载地址</a>，下载linux版本的pycharm；用命令行打开下载Pycharm的下载位置，然后解压：</p><pre class=\"brush:ps;toolbar:false\">tar&nbsp;xfz&nbsp;pycharm-*.tar.gz</pre><p style=\"line-height: 1.5em;\">打开解压后文件的bin目录下，然后运行：</p><pre class=\"brush:ps;toolbar:false\">cd&nbsp;pycharm*/bin/&nbsp;./pycharm.sh</pre><p><br/></p>', '2017-08-22 02:43:13.000000', '2017-09-01 02:43:13.000000', '1', '2');
INSERT INTO `post_article` VALUES ('2', '2 - django网站需求分析', '网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分', '<p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析网站的需求分析</span></p>', '2017-08-26 02:43:45.000000', '2017-10-14 00:56:05.988054', '1', '2');
INSERT INTO `post_article` VALUES ('3', '3 - 网站的数据模型', '数据模型：', '<p>数据模型：</p>', '2017-08-31 16:38:24.000000', '2017-09-24 23:28:06.277135', '1', '2');
INSERT INTO `post_article` VALUES ('4', '4 - django后台Xadmin', '用户登录注册', '<p>用户登录注册</p>', '2017-09-09 21:34:19.000000', '2017-10-03 21:36:49.000000', '1', '2');
INSERT INTO `post_article` VALUES ('5', '5 - 用户登录注册', '用户登录注册分析用户登录、注册是一个网站的最基本功能，用户注册就是创建一个用户，并把这个用户保存在数据库。django提供了专门的登录注册基本功能我们在这基础上稍微加以修改。 注册功能用户注册的模型django已经为我们提供了，我们只需要在这个模型基础上添加一些字段就可以了，具体的用户models.py', '<p style=\"line-height: 1.5em;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">用户登录注册分析</span></strong></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">用户登录、注册是一个网站的最基本功能，用户注册就是创建一个用户，并把这个用户保存在数据库。django提供了专门的登录注册基本功能我们在这基础上稍微加以修改。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/> </span></p><p style=\"line-height: 1.5em;\"><strong><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 18px;\">注册功能</span></span></strong></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 16px;\">用户注册的模型django已经为我们提供了，我们只需要在这个模型基础上添加一些字段就可以了，具体的用户models.py如下：</span></span><strong><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 18px;\"><br/> </span></span></strong></p><pre class=\"brush:python;toolbar:false\">from&nbsp;django.contrib.auth.models&nbsp;import&nbsp;AbstractUser\r\n\r\n\r\n#&nbsp;用户信息\r\nclass&nbsp;UserProfile(AbstractUser):\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;继承django自带的AbstractUser，并增加如下字段\r\n&nbsp;&nbsp;&nbsp;&nbsp;nickname&nbsp;=&nbsp;models.CharField(max_length=50,&nbsp;verbose_name=&#39;昵称&#39;,&nbsp;default=&quot;&quot;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;gender&nbsp;=&nbsp;models.CharField(choices=((&quot;male&quot;,&nbsp;&#39;男&#39;),&nbsp;(&quot;female&quot;,&nbsp;&#39;女&#39;)),&nbsp;verbose_name=&#39;性别&#39;,&nbsp;default=&quot;male&quot;,&nbsp;max_length=6)\r\n&nbsp;&nbsp;&nbsp;&nbsp;birthday&nbsp;=&nbsp;models.DateField(null=True,&nbsp;blank=True,&nbsp;verbose_name=&#39;生日&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;address&nbsp;=&nbsp;models.CharField(max_length=100,&nbsp;default=&#39;火星的地球驻点&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;mobile&nbsp;=&nbsp;models.CharField(max_length=11,&nbsp;null=True,&nbsp;blank=True,&nbsp;verbose_name=&#39;电话&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;avatar&nbsp;=&nbsp;models.ImageField(upload_to=&quot;image/avatar&quot;,&nbsp;default=u&#39;image/avatar/you.png&#39;,&nbsp;max_length=200,&nbsp;verbose_name=&#39;头像&#39;)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Meta:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name&nbsp;=&nbsp;&quot;用户信息&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name_plural&nbsp;=&nbsp;verbose_name&nbsp;&nbsp;#&nbsp;加上之后admin后台会去除复数形式\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;__str__(self):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;self.username&nbsp;&nbsp;#&nbsp;继承的AbstractUser含有username</pre><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-size: 16px;\"></span></span>用户注册的逻辑<br/> </p><pre class=\"brush:python;toolbar:false\">#&nbsp;注册\r\nclass&nbsp;RegisterView(View):\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;get(self,&nbsp;request):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;render(request,&nbsp;&#39;user/register.html&#39;,&nbsp;{})\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;post(self,&nbsp;request):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;registerform&nbsp;=&nbsp;RegisterForm(request.POST)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;registerform.is_valid():\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;username&nbsp;=&nbsp;request.POST.get(&#39;username&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;email&nbsp;=&nbsp;request.POST.get(&#39;email&#39;)\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;UserProfile.objects.filter(username=username):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&#39;registerform&#39;:&nbsp;registerform是用来返回前端的验证码,&nbsp;判断用户名是否存在\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;render(request,&nbsp;&#39;user/register.html&#39;,&nbsp;{&#39;registerform&#39;:&nbsp;registerform,&nbsp;&#39;msg&#39;:&nbsp;&#39;该用户名已注册&#39;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;elif&nbsp;UserProfile.objects.filter(email=email):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;判断邮箱是否存在\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;render(request,&nbsp;&#39;user/register.html&#39;,&nbsp;{&#39;registerform&#39;:&nbsp;registerform,&nbsp;&#39;msg&#39;:&nbsp;&#39;该邮箱已注册&#39;})\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;password&nbsp;=&nbsp;request.POST.get(&#39;password&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;userprofile&nbsp;=&nbsp;UserProfile(username=username,&nbsp;nickname=username,&nbsp;email=email)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;userprofile.password&nbsp;=&nbsp;make_password(password)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;userprofile.is_active&nbsp;=&nbsp;False\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;userprofile.set_password(password)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;userprofile.save()\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;send_email(email,&nbsp;&#39;register&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;render(request,&nbsp;&#39;message.html&#39;,&nbsp;{&#39;msg&#39;:&nbsp;&#39;注册成功，请激活后登录&#39;})\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;render(request,&nbsp;&#39;user/register.html&#39;,&nbsp;{&#39;registerform&#39;:&nbsp;registerform})</pre><p style=\"line-height: 1.5em;\"><br/> </p>', '2017-09-15 21:37:18.000000', '2017-10-17 22:50:54.645021', '1', '2');
INSERT INTO `post_article` VALUES ('6', 'Ubuntu上的docker和sentry安装', '1、docker和sentry介绍 docker是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。 sentry是一个在线bug管理系统，用PythonWeb中的Dj', '<p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-size: 18px;\">1、docker和sentry介绍</span></strong><br/> </span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">docker是一个开源的应用容器引擎，</span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。<br/> </span></p><p style=\"white-space: normal;\"><br/> </p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">sentry是一个在线bug管理系统，用PythonWeb中的Django制作，支持多种语言。</span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/> </span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-size: 18px;\">2、docker的安装</span></strong></span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2.1、<span style=\"color: rgb(63, 63, 63);\">添加 GPG Key</span></span></p><pre class=\"brush:ps;toolbar:false\">curl&nbsp;-fsSL&nbsp;https://download.docker.com/linux/ubuntu/gpg&nbsp;|&nbsp;sudo&nbsp;apt-key&nbsp;add&nbsp;-</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2.2、添加源</span></p><pre class=\"brush:ps;toolbar:false\">#&nbsp;第一种办法：将源信息直接写入/etc/apt/sources.list\r\nsudo&nbsp;add-apt-repository&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&quot;deb&nbsp;[arch=amd64]&nbsp;https://download.docker.com/linux/ubuntu&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;$(lsb_release&nbsp;-cs)&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;stable&quot;\r\n&nbsp;&nbsp;&nbsp;\r\n#&nbsp;第二种办法：或者直接创建docker的源信息\r\nsudo&nbsp;vim&nbsp;/etc/apt/sources.list\r\n#&nbsp;然后将deb&nbsp;[arch=amd64]&nbsp;https://download.docker.com/linux/ubuntu&nbsp;trusty&nbsp;stable&nbsp;&gt;&nbsp;/etc/apt/sources.list.d/docker.list加入sources.list</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\">更新刚刚添加的源</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;apt-get&nbsp;update</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2.3、安装docker</span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2017年3月之后的版本安装的是docker-ce（免费版），之前的是安装docker-engine</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;apt-get&nbsp;install&nbsp;docker-ce</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">2.4、验证是否安装成功<br/> </span></p><pre class=\"brush:ps;toolbar:false\">docker&nbsp;--version\r\nsudo&nbsp;docker&nbsp;run&nbsp;hello-world\r\n\r\n#&nbsp;启动docker\r\nsudo&nbsp;systemctl&nbsp;start&nbsp;docker</pre><p style=\"white-space: normal;\"><br/> </p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong>3、安装docker-compose</strong></span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">使用pip安装，没有pip需要先安装pip</span></p><pre class=\"brush:ps;toolbar:false\">#&nbsp;安装pip，如果安装了就跳过\r\nsudo&nbsp;apt-get&nbsp;install&nbsp;python-pip\r\n#&nbsp;安装docker-compose\r\nsudo&nbsp;pip&nbsp;install&nbsp;docker-compose</pre><p style=\"white-space: normal;\"><br/> </p><p style=\"white-space: normal; line-height: 1.5em;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">4、构建容器安装sentry</span></strong></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4.1和4.2尽可能用sudo运行</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;apt-get&nbsp;install&nbsp;git\r\nsudo&nbsp;git&nbsp;clone&nbsp;https://github.com/getsentry/onpremise.git\r\nsudo&nbsp;mkdir&nbsp;-p&nbsp;data/{sentry,postgres}</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4.1、生成secret key并添加到docker-compose.yml</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;docker-compose&nbsp;run&nbsp;--rm&nbsp;web&nbsp;config&nbsp;generate-secret-key\r\n#&nbsp;这一步会安装很多支持软件，最后会生成一串字符串\r\nsudo&nbsp;vim&nbsp;docker-compose.yml\r\n#&nbsp;取消SENTRY_SECRET_KEY的注释，并把刚刚生成的字符串插入其中，然后保存</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4.2、重建数据库，并创建sentry超级管理员用户</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;docker-compose&nbsp;run&nbsp;--rm&nbsp;web&nbsp;upgrade\r\n#&nbsp;这一步会生成一系列的数据文件，最后汇创建一个超级用户，输入邮箱和密码即可</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4.3、启动所有服务</span></p><pre class=\"brush:ps;toolbar:false\">sudo&nbsp;docker-compose&nbsp;up&nbsp;-d</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">4.4、访问sentry</span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\">打开浏览器，输入你的服务器ip加上9000端口：ipadress:9000（首先服务器安全组得开放9000端口），然后输入4.2中创建的用户即可进入sentry的管理后台。</span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><br/> </span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\">本文参考：<a href=\"http://xujpxm.blog.51cto.com/8614409/1868597\" target=\"_blank\" textvalue=\"Sentry--错误日志收集框架\">Sentry--错误日志收集框架</a>和<a href=\"http://blog.csdn.net/gatieme/article/details/78177983\" target=\"_blank\" textvalue=\"Ubuntu 14.04 安装 Docker\">Ubuntu 14.04 安装 Docker</a></span></p>', '2017-10-13 12:17:02.731328', '2017-10-14 00:55:02.120368', '1', '8');
INSERT INTO `post_article` VALUES ('7', '6 - Django 博客首页视图', '博客首页视图', '<p>博客首页视图</p>', '2017-10-16 14:31:33.936126', '2017-10-16 14:31:33.936168', '1', '2');
INSERT INTO `post_article` VALUES ('8', '7 - 博客点赞功能实现', '网站的点赞功能需求分析我们要实现一个点赞功能，包括给文章、评论等进行点赞，当然也可以取消点赞。那么我们就需要两个表：主表和明细表；主表用来记录对象的点赞次数，明细表用来记录是哪个用户点赞、点赞的时间以及什么时候取消了点赞。这个两个表是一对多的一个关系。  点赞的模型这里点赞也可以给其他任意对象实现点赞的', '<p style=\"line-height: 1.5em;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">网站的点赞功能需求分析</span></strong></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;\">我们要实现一个点赞功能，包括给文章、评论等进行点赞，当然也可以取消点赞。那么我们就需要两个表：主表和明细表；主表用来记录对象的点赞次数，明细表用来记录是哪个用户点赞、点赞的时间以及什么时候取消了点赞。这个两个表是一对多的一个关系。</span><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\"><br/> </span></strong></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;\"><br/> </span></p><p style=\"line-height: 1.5em;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-family:微软雅黑, Microsoft YaHei\">点赞的模型</span></strong></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-size: 16px;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">这里点赞也可以给其他任意对象实现点赞的功能，这时候我们需要引入一个ContentType这个东西。</span></span><span style=\"font-size: 18px;\"><strong><span style=\"font-family:微软雅黑, Microsoft YaHei\"> </span></strong></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\">如果对数据库开发比较好的人员就很容易明白这个是什么作用。简单来说，就是给主表添加两个字段，一个是对象的类型，一个是对象的ID。这样就可以应对区分任何对象，不管你的对象是什么，又要填入这两个字段就可以区分的清楚。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\">&nbsp; &nbsp; &nbsp; 大概的模型（models.py文件）如下：</span></p><pre class=\"brush:python;toolbar:false\">from&nbsp;django.db&nbsp;import&nbsp;models\r\nfrom&nbsp;django.contrib.contenttypes.models&nbsp;import&nbsp;ContentType&nbsp;&nbsp;#&nbsp;引用ContentType相关模块\r\nfrom&nbsp;django.contrib.contenttypes.fields&nbsp;import&nbsp;GenericForeignKey\r\nfrom&nbsp;user.models&nbsp;import&nbsp;UserProfile&nbsp;&nbsp;#&nbsp;引用系统自带的用户模型\r\n\r\n\r\n&quot;&quot;&quot;点赞统计&quot;&quot;&quot;\r\nclass&nbsp;Like(models.Model):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;点赞明细记录&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;content_type&nbsp;=&nbsp;models.ForeignKey(ContentType,&nbsp;verbose_name=&#39;点赞类型&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;object_id&nbsp;=&nbsp;models.PositiveIntegerField(verbose_name=&#39;点赞id&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;content_object&nbsp;=&nbsp;GenericForeignKey(\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ct_field=&quot;content_type&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fk_field=&quot;object_id&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;like&nbsp;=&nbsp;models.ForeignKey(&#39;LikeNum&#39;,&nbsp;verbose_name=&#39;点赞类型[点赞id,&nbsp;点赞数目]&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;user&nbsp;=&nbsp;models.ForeignKey(UserProfile,&nbsp;verbose_name=&#39;用户&#39;)&nbsp;&nbsp;#&nbsp;必须登录才能点赞\r\n&nbsp;&nbsp;&nbsp;&nbsp;is_like&nbsp;=&nbsp;models.BooleanField(default=False,&nbsp;verbose_name=&#39;是否点赞&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;like_time&nbsp;=&nbsp;models.DateTimeField(auto_now=True,&nbsp;verbose_name=&#39;点赞时间&#39;)&nbsp;&nbsp;#&nbsp;点赞的时间\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Meta:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name&nbsp;=&nbsp;&#39;点赞详情统计&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name_plural&nbsp;=&nbsp;verbose_name\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ordering&nbsp;=&nbsp;[&#39;like_time&#39;]\r\n\r\n\r\nclass&nbsp;LikeNum(models.Model):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;点赞数目记录&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;content_type&nbsp;=&nbsp;models.ForeignKey(ContentType,&nbsp;verbose_name=&#39;点赞类型&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;object_id&nbsp;=&nbsp;models.PositiveIntegerField(verbose_name=&#39;点赞id&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;content_object&nbsp;=&nbsp;GenericForeignKey(\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ct_field=&quot;content_type&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fk_field=&quot;object_id&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;点赞数目\r\n&nbsp;&nbsp;&nbsp;&nbsp;like_num&nbsp;=&nbsp;models.IntegerField(default=0,&nbsp;verbose_name=&#39;点赞数目&#39;)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Meta:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name&nbsp;=&nbsp;&#39;点赞数目统计&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name_plural&nbsp;=&nbsp;verbose_name\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;__str__(self):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;u&#39;%s[%s,&nbsp;%s]&#39;&nbsp;%&nbsp;(self.content_type,&nbsp;self.object_id,&nbsp;self.like_num)</pre><p style=\"box-sizing: border-box; font-family: &quot;lucida grande&quot;, &quot;lucida sans unicode&quot;, lucida, helvetica, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; text-indent: 2em; line-height: 1.6; color: rgb(51, 51, 51); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;\"></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;\">这里LikeNum和Like分别对应着主表和点赞的明细表</span></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family:微软雅黑, Microsoft YaHei\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 16px;\"><br/></span></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\"><strong>点赞的处理</strong></span><strong style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">方法</strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\"><br/></span></p><p style=\"line-height: 1.5em;\"><font face=\"微软雅黑, Microsoft YaHei\">主要的处理方法就是点赞和取消点赞，具体代码（views.py）</font><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">如下</span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">:</span></p><pre class=\"brush:python;toolbar:false\">import&nbsp;json\r\n\r\nfrom&nbsp;django.views&nbsp;import&nbsp;View\r\nfrom&nbsp;django.http&nbsp;import&nbsp;HttpResponse\r\nfrom&nbsp;django.contrib.contenttypes.models&nbsp;import&nbsp;ContentType\r\n\r\nfrom&nbsp;tools.models&nbsp;import&nbsp;Like,&nbsp;LikeNum\r\nfrom&nbsp;tools.decorator.likes_decorator&nbsp;import&nbsp;check_request\r\n\r\n\r\n#&nbsp;导入likes自定义的装饰器\r\nclass&nbsp;LikeView(View):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;用户点赞\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;@check_request(&#39;like_type&#39;,&nbsp;&#39;like_id&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;post(self,&nbsp;request):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u&quot;&quot;&quot;处理改变点赞状态\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Method:&nbsp;POST\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;params:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type&nbsp;&nbsp;:&nbsp;object&nbsp;type\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;id&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;object&nbsp;id\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return:&nbsp;json\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;创建json对象需要的数据\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;not&nbsp;request.user.is_authenticated():\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;判断用户是否登录\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;HttpResponse(&#39;{&quot;status&quot;:&quot;fail&quot;,&nbsp;&quot;msg&quot;:&quot;用户未登录&quot;}&#39;,&nbsp;content_type=&#39;application/json&#39;)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;获取数据和对应的对象\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;obj_type&nbsp;=&nbsp;request.POST.get(&#39;like_type&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;obj_id&nbsp;=&nbsp;request.POST.get(&#39;like_id&#39;)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c&nbsp;=&nbsp;ContentType.objects.get(model=obj_type)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;获取LikeNum对象\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l&nbsp;=&nbsp;LikeNum.objects.get(content_type=c,&nbsp;object_id=obj_id)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except&nbsp;Exception&nbsp;as&nbsp;e:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;没有获取到对象，则新增一个Likes对象\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l&nbsp;=&nbsp;LikeNum(content_type=c,&nbsp;object_id=obj_id)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;获取Like明细对象\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detail&nbsp;=&nbsp;Like.objects.get(content_type=c,&nbsp;object_id=obj_id,&nbsp;user=request.user)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except&nbsp;Exception&nbsp;as&nbsp;e:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detail&nbsp;=&nbsp;Like(content_type=c,&nbsp;object_id=obj_id,&nbsp;user=request.user)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;liked&nbsp;=&nbsp;detail.is_like\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data&nbsp;=&nbsp;{}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;判断是否赞过，或者取消赞\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;liked:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;修改明细\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detail.is_like&nbsp;=&nbsp;False\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detail.save()\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;更新点赞数目记录\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l.like_num&nbsp;-=&nbsp;1\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;l.like_num&nbsp;&lt;&nbsp;0:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l.like_num&nbsp;=&nbsp;0\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l.save()\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;返回前端的数据\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data[&#39;like_num&#39;]&nbsp;=&nbsp;&#39;%s喜欢&#39;&nbsp;%&nbsp;l.like_num\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data[&#39;status&#39;]&nbsp;=&nbsp;&quot;success&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data[&#39;msg&#39;]&nbsp;=&nbsp;&quot;您已取消点赞&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;HttpResponse(json.dumps(data),&nbsp;content_type=&#39;application/json&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;修改明细\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detail.is_like&nbsp;=&nbsp;True\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;detail.save()\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;更新点赞数目记录\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l.like_num&nbsp;+=&nbsp;1\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;l.like_num&nbsp;&lt;&nbsp;0:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l.like_num&nbsp;=&nbsp;0\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l.save()\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;返回前端的数据\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data[&#39;like_num&#39;]&nbsp;=&nbsp;&#39;%s喜欢&#39;&nbsp;%&nbsp;l.like_num\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data[&#39;status&#39;]&nbsp;=&nbsp;&quot;success&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data[&#39;msg&#39;]&nbsp;=&nbsp;&quot;您已点赞&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;HttpResponse(json.dumps(data),&nbsp;content_type=&#39;application/json&#39;)</pre><p style=\"line-height: 1.5em;\">前端传递进来两个参数一个是对象的类型、一个是对象的id。</p><p style=\"line-height: 1.5em;\">我们根据传递进来的两个参数，判断是否存在Like和LikeNum这两个相应的记录，不存在则创建一个新的记录。然后根据Like和LikeNum的记录判断是否用户点赞过该对象，没有的话进行点赞，如果存在点赞则取消点赞。</p><p style=\"line-height: 1.5em;\"><br/></p><p style=\"line-height: 1.5em;\">文章参考：<a href=\"http://yshblog.com/blog/52\" target=\"_blank\" textvalue=\"Django点赞功能实现\">Django点赞功能实现</a> </p><p style=\"line-height: 1.5em;\"><br/></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\"><br/> </span></p>', '2017-10-16 14:32:25.625629', '2017-10-16 15:41:20.344292', '1', '2');
INSERT INTO `post_article` VALUES ('9', '8 - 博客的收藏功能', '网站的收藏功能需求分析\n\n收藏功能和点赞功能类似可以参考：博客点赞功能实现\n\n我们要实现一个收藏功能，包括给文章、评论等进行点赞，当然也可以取消点赞。那么我们就需要两个表：主表和明细表；主表用来记录对象的点赞次数，明细表用来记录是哪个用户点赞、点赞的时间以及什么时候取消了点赞。这个两个表是一对多的一个关系。 \n\n \n\n', '<p style=\"white-space: normal; line-height: 1.5em;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">网站的收藏功能需求分析</span></strong></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">收藏功能和点赞功能类似可以参考：<a href=\"http://chenzx.name/post/8/\" target=\"_blank\" textvalue=\"博客点赞功能实现\">博客点赞功能实现</a></span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">我们要实现一个收藏功能，包括给文章、评论等进行点赞，当然也可以取消点赞。那么我们就需要两个表：主表和明细表；主表用来记录对象的点赞次数，明细表用来记录是哪个用户点赞、点赞的时间以及什么时候取消了点赞。这个两个表是一对多的一个关系。</span><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\"><br/> </span></strong></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/> </span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">点赞的模型</span></strong></span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">这里点赞也可以给其他任意对象实现点赞的功能，这时候我们需要引入一个ContentType这个东西。</span><span style=\"font-size: 18px;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></strong></span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">如果对数据库开发比较好的人员就很容易明白这个是什么作用。简单来说，就是给主表添加两个字段，一个是对象的类型，一个是对象的ID。这样就可以应对区分任何对象，不管你的对象是什么，又要填入这两个字段就可以区分的清楚。</span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">&nbsp; &nbsp; &nbsp; 大概的模型（models.py文件）如下：</span></p><pre class=\"brush:python;toolbar:false\">from&nbsp;django.db&nbsp;import&nbsp;models\r\nfrom&nbsp;user.models&nbsp;import&nbsp;UserProfile&nbsp;&nbsp;#&nbsp;引用系统自带的用户模型\r\n\r\n\r\nclass&nbsp;Favorite(models.Model):\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;用户收藏\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;&quot;&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;user&nbsp;=&nbsp;models.ForeignKey(UserProfile,&nbsp;verbose_name=&#39;用户&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;favorite_id&nbsp;=&nbsp;models.IntegerField(default=0,&nbsp;verbose_name=&#39;数据id&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;favorite_type&nbsp;=&nbsp;models.IntegerField(choices=((1,&nbsp;&quot;文章&quot;),&nbsp;(2,&nbsp;&quot;专题&quot;)),&nbsp;default=1,&nbsp;verbose_name=&#39;收藏类型&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;favorite_time&nbsp;=&nbsp;models.DateTimeField(auto_now_add=True,&nbsp;verbose_name=&#39;收藏时间&#39;)\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;class&nbsp;Meta:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name&nbsp;=&nbsp;&#39;用户收藏&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;verbose_name_plural&nbsp;=&nbsp;verbose_name</pre><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span><br/> </p><p><br/> </p>', '2017-10-16 14:32:59.165353', '2017-10-16 15:46:07.110547', '1', '2');
INSERT INTO `post_article` VALUES ('10', '9 - 博客分类显示', '分类显示文章', '<p>分类显示文章</p>', '2017-10-16 14:34:19.291903', '2017-10-16 14:34:19.291927', '1', '2');
INSERT INTO `post_article` VALUES ('11', '10 - 博客分页', '博客的分页功能', '<p>博客的分页功能</p>', '2017-10-16 14:35:13.689274', '2017-10-16 14:35:13.689327', '1', '2');
INSERT INTO `post_article` VALUES ('12', '11 - 网站评论功能实现', '网站评论功能选用django-comments-xtd \n\n', '<p>网站评论功能选用<a href=\"https://github.com/danirus/django-comments-xtd\" target=\"_blank\" textvalue=\"django-comments-xtd\">django-comments-xtd</a> </p><p><br/></p>', '2017-10-16 14:38:53.981176', '2017-10-16 14:38:53.981203', '1', '2');
INSERT INTO `post_article` VALUES ('13', '12 - 用户中心(一)修改个人资料', '用户中心功能的实现', '<p>用户中心功能的实现</p>', '2017-10-16 14:41:58.938450', '2017-10-16 14:41:58.938490', '1', '2');
INSERT INTO `post_article` VALUES ('14', '13 - 用户中心(二)修改邮箱和密码', '个人中心', '<p>个人中心</p>', '2017-10-16 14:42:45.323815', '2017-10-16 14:42:45.323843', '1', '2');
INSERT INTO `post_article` VALUES ('15', '14 - 用户中心(三)添加用户收藏文章', '用户中心收藏文章', '<p>用户中心收藏文章</p>', '2017-10-16 14:43:43.884843', '2017-10-16 14:43:52.890120', '1', '2');
INSERT INTO `post_article` VALUES ('16', '15 - 忘记密码？之后通过邮件修改密码', '忘记密码', '<p>忘记密码</p>', '2017-10-16 14:44:50.858642', '2017-10-16 14:46:15.891939', '1', '2');
INSERT INTO `post_article` VALUES ('17', '16 - 博客浏览计数功能', '博客浏览计数功能', '<p>博客浏览计数功能</p>', '2017-10-16 14:48:02.452802', '2017-10-16 14:48:02.452845', '1', '2');
INSERT INTO `post_article` VALUES ('18', '17 - 博客上一篇和下一篇', '博客的上一篇和下一篇', '<p>博客的上一篇和下一篇</p>', '2017-10-16 14:50:55.555087', '2017-10-16 14:50:55.555110', '1', '2');

-- ----------------------------
-- Table structure for post_article_user
-- ----------------------------
DROP TABLE IF EXISTS `post_article_user`;
CREATE TABLE `post_article_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `post_article_user_article_id_2a7c3fcf_uniq` (`article_id`,`userprofile_id`) USING BTREE,
  KEY `post_article_user_userprofile_id_3beb8b11_fk_user_userprofile_id` (`userprofile_id`) USING BTREE,
  CONSTRAINT `post_article_user_article_id_e3fa02e0_fk_post_article_id` FOREIGN KEY (`article_id`) REFERENCES `post_article` (`id`),
  CONSTRAINT `post_article_user_userprofile_id_3beb8b11_fk_user_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of post_article_user
-- ----------------------------

-- ----------------------------
-- Table structure for post_author
-- ----------------------------
DROP TABLE IF EXISTS `post_author`;
CREATE TABLE `post_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `profile` varchar(300) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of post_author
-- ----------------------------
INSERT INTO `post_author` VALUES ('1', '陈志祥', '一个兴趣广泛的人');

-- ----------------------------
-- Table structure for social_auth_association
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_association`;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `social_auth_association_server_url_078befa2_uniq` (`server_url`,`handle`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of social_auth_association
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_code
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_code`;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `social_auth_code_email_801b2d02_uniq` (`email`,`code`) USING BTREE,
  KEY `social_auth_code_c1336794` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of social_auth_code
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_nonce
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_nonce`;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `social_auth_nonce_server_url_f6284463_uniq` (`server_url`,`timestamp`,`salt`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of social_auth_nonce
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_partial
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_partial`;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `social_auth_partial_94a08da1` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of social_auth_partial
-- ----------------------------

-- ----------------------------
-- Table structure for social_auth_usersocialauth
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_usersocialauth`;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `social_auth_usersocialauth_provider_e6b5e668_uniq` (`provider`,`uid`) USING BTREE,
  KEY `social_auth_usersocialau_user_id_17d28448_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `social_auth_usersocialau_user_id_17d28448_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of social_auth_usersocialauth
-- ----------------------------
INSERT INTO `social_auth_usersocialauth` VALUES ('7', 'github', '26867628', '{\"token_type\": \"bearer\", \"auth_time\": 1508429936, \"id\": 26867628, \"access_token\": \"0f79a9deb9ad74dc9090fdc90724aa244a0650a0\", \"expires\": null, \"login\": \"chenzhixiang1992\"}', '16');
INSERT INTO `social_auth_usersocialauth` VALUES ('10', 'qq', '8BD429222FA1DF732BD7C8BF675BD02B', '{\"token_type\": null, \"auth_time\": 1508427233, \"username\": null, \"gender\": null, \"profile_image_url\": null, \"access_token\": \"CD9023217DDD1C07B6F66D0AC87F279F\"}', '19');
INSERT INTO `social_auth_usersocialauth` VALUES ('12', 'weibo', '5082698575', '{\"token_type\": null, \"gender\": \"m\", \"profile_image_url\": \"http://tva1.sinaimg.cn/crop.121.1.261.261.50/005xYu5hjw8eow0yl2r5qj30b408c0tt.jpg\", \"id\": 5082698575, \"access_token\": \"2.00RFUyXFimY_PE70adef6ab0fa_jjB\", \"auth_time\": 1508482458, \"username\": \"\\u9ed1\\u591c\\u91cc\\u9ed1\\u8272\\u7684\\u5149\"}', '21');

-- ----------------------------
-- Table structure for tools_favorite
-- ----------------------------
DROP TABLE IF EXISTS `tools_favorite`;
CREATE TABLE `tools_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `favorite_id` int(11) NOT NULL,
  `favorite_type` int(11) NOT NULL,
  `favorite_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tools_favorite_user_id_a5af2f66_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `tools_favorite_user_id_a5af2f66_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tools_favorite
-- ----------------------------
INSERT INTO `tools_favorite` VALUES ('9', '3', '1', '2017-09-25 22:16:23.009850', '1');
INSERT INTO `tools_favorite` VALUES ('13', '2', '1', '2017-09-25 23:30:10.790146', '1');
INSERT INTO `tools_favorite` VALUES ('14', '5', '1', '2017-10-13 11:21:16.659180', '1');
INSERT INTO `tools_favorite` VALUES ('17', '4', '1', '2017-10-16 10:33:42.859226', '1');
INSERT INTO `tools_favorite` VALUES ('22', '6', '1', '2017-10-16 11:40:24.992267', '1');
INSERT INTO `tools_favorite` VALUES ('23', '1', '1', '2017-10-16 14:07:41.557769', '1');
INSERT INTO `tools_favorite` VALUES ('25', '9', '1', '2017-10-18 19:26:25.312449', '1');
INSERT INTO `tools_favorite` VALUES ('26', '8', '1', '2017-10-18 20:37:13.018632', '1');

-- ----------------------------
-- Table structure for tools_like
-- ----------------------------
DROP TABLE IF EXISTS `tools_like`;
CREATE TABLE `tools_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `is_like` tinyint(1) NOT NULL,
  `like_time` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tools_like_content_type_id_0b6d8082_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `tools_like_user_id_4c576002_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `tools_like_content_type_id_0b6d8082_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `tools_like_user_id_4c576002_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tools_like
-- ----------------------------
INSERT INTO `tools_like` VALUES ('1', '2', '0', '2017-10-17 22:50:20.781377', '12', '1');
INSERT INTO `tools_like` VALUES ('2', '1', '0', '2017-10-18 15:47:28.354841', '12', '1');
INSERT INTO `tools_like` VALUES ('3', '3', '0', '2017-10-16 14:28:33.619857', '12', '1');
INSERT INTO `tools_like` VALUES ('8', '4', '0', '2017-10-16 14:28:32.755362', '12', '1');
INSERT INTO `tools_like` VALUES ('9', '5', '0', '2017-10-16 13:47:07.391721', '12', '1');
INSERT INTO `tools_like` VALUES ('10', '6', '0', '2017-10-23 19:38:44.620558', '12', '1');
INSERT INTO `tools_like` VALUES ('14', '9', '0', '2017-10-18 15:40:53.353074', '12', '1');
INSERT INTO `tools_like` VALUES ('15', '8', '0', '2017-10-19 01:36:14.440102', '12', '1');
INSERT INTO `tools_like` VALUES ('16', '11', '0', '2017-10-17 22:12:03.158826', '12', '1');
INSERT INTO `tools_like` VALUES ('17', '18', '0', '2017-10-25 23:31:00.196454', '12', '1');
INSERT INTO `tools_like` VALUES ('18', '17', '0', '2017-10-23 19:39:03.676585', '12', '1');
INSERT INTO `tools_like` VALUES ('19', '16', '0', '2017-10-23 19:39:14.618571', '12', '1');
INSERT INTO `tools_like` VALUES ('20', '15', '0', '2017-10-18 00:31:19.571305', '12', '1');
INSERT INTO `tools_like` VALUES ('21', '7', '0', '2017-10-18 19:27:16.760167', '12', '1');
INSERT INTO `tools_like` VALUES ('23', '18', '0', '2017-10-20 13:21:36.784578', '12', '21');

-- ----------------------------
-- Table structure for tools_likenum
-- ----------------------------
DROP TABLE IF EXISTS `tools_likenum`;
CREATE TABLE `tools_likenum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `like_num` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tools_likenum_content_type_id_d605b782_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  CONSTRAINT `tools_likenum_content_type_id_d605b782_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tools_likenum
-- ----------------------------
INSERT INTO `tools_likenum` VALUES ('1', '2', '3', '12');
INSERT INTO `tools_likenum` VALUES ('2', '1', '4', '12');
INSERT INTO `tools_likenum` VALUES ('3', '3', '2', '12');
INSERT INTO `tools_likenum` VALUES ('4', '4', '1', '12');
INSERT INTO `tools_likenum` VALUES ('5', '5', '0', '12');
INSERT INTO `tools_likenum` VALUES ('6', '6', '0', '12');
INSERT INTO `tools_likenum` VALUES ('7', '9', '0', '12');
INSERT INTO `tools_likenum` VALUES ('8', '8', '0', '12');
INSERT INTO `tools_likenum` VALUES ('9', '11', '0', '12');
INSERT INTO `tools_likenum` VALUES ('10', '18', '0', '12');
INSERT INTO `tools_likenum` VALUES ('11', '17', '0', '12');
INSERT INTO `tools_likenum` VALUES ('12', '16', '0', '12');
INSERT INTO `tools_likenum` VALUES ('13', '15', '0', '12');
INSERT INTO `tools_likenum` VALUES ('14', '7', '0', '12');

-- ----------------------------
-- Table structure for tools_view
-- ----------------------------
DROP TABLE IF EXISTS `tools_view`;
CREATE TABLE `tools_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(40) NOT NULL,
  `view_time` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tools_view_content_type_id_466ef3cf_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `tools_view_user_id_3ffbf221_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `tools_view_content_type_id_466ef3cf_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `tools_view_user_id_3ffbf221_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tools_view
-- ----------------------------
INSERT INTO `tools_view` VALUES ('1', '2', '183.63.97.199,183.63.97.199', '2017-09-24 03:00:32.867730', '12', null);
INSERT INTO `tools_view` VALUES ('2', '1', '183.236.19.68,183.236.19.68', '2017-09-24 07:26:12.916924', '12', null);
INSERT INTO `tools_view` VALUES ('3', '2', '183.236.9.34,183.236.9.34', '2017-09-24 07:32:46.305339', '12', null);
INSERT INTO `tools_view` VALUES ('4', '1', '176.193.134.8,176.193.134.8', '2017-09-24 11:54:55.332784', '12', null);
INSERT INTO `tools_view` VALUES ('5', '2', '123.125.71.102,123.125.71.102', '2017-09-24 13:06:13.161957', '12', null);
INSERT INTO `tools_view` VALUES ('6', '1', '220.181.108.181,220.181.108.181', '2017-09-24 13:12:53.174300', '12', null);
INSERT INTO `tools_view` VALUES ('7', '3', '183.51.194.33,183.51.194.33', '2017-09-24 16:42:24.514441', '12', null);
INSERT INTO `tools_view` VALUES ('8', '3', '101.226.233.148,101.226.233.148', '2017-09-24 16:42:24.907461', '12', null);
INSERT INTO `tools_view` VALUES ('9', '3', '183.51.194.33,183.51.194.33', '2017-09-24 16:43:55.367567', '12', null);
INSERT INTO `tools_view` VALUES ('10', '3', '183.63.97.199,183.63.97.199', '2017-09-24 20:44:12.601388', '12', '1');
INSERT INTO `tools_view` VALUES ('11', '3', '183.63.102.17,183.63.102.17', '2017-09-24 23:14:30.965001', '12', null);
INSERT INTO `tools_view` VALUES ('12', '2', '183.63.102.17,183.63.102.17', '2017-09-24 23:15:48.625893', '12', '1');
INSERT INTO `tools_view` VALUES ('13', '3', '183.63.102.17,183.63.102.17', '2017-09-24 23:26:50.384692', '12', '1');
INSERT INTO `tools_view` VALUES ('14', '2', '183.63.102.17,183.63.102.17', '2017-09-25 09:06:41.757949', '12', '1');
INSERT INTO `tools_view` VALUES ('15', '1', '183.63.97.199,183.63.97.199', '2017-09-25 13:18:25.476718', '12', '1');
INSERT INTO `tools_view` VALUES ('16', '2', '183.63.97.199,183.63.97.199', '2017-09-25 17:25:58.303574', '12', null);
INSERT INTO `tools_view` VALUES ('17', '1', '183.63.97.199,183.63.97.199', '2017-09-25 17:26:07.002615', '12', null);
INSERT INTO `tools_view` VALUES ('18', '1', '183.63.97.199,183.63.97.199', '2017-09-25 17:50:26.259778', '12', '1');
INSERT INTO `tools_view` VALUES ('19', '2', '183.63.97.199,183.63.97.199', '2017-09-25 22:15:49.381787', '12', null);
INSERT INTO `tools_view` VALUES ('20', '3', '183.63.97.199,183.63.97.199', '2017-09-25 22:16:18.588456', '12', '1');
INSERT INTO `tools_view` VALUES ('21', '1', '183.63.97.199,183.63.97.199', '2017-09-25 22:16:30.679342', '12', '1');
INSERT INTO `tools_view` VALUES ('22', '2', '183.63.97.199,183.63.97.199', '2017-09-25 23:29:18.280393', '12', null);
INSERT INTO `tools_view` VALUES ('23', '1', '180.76.15.8,180.76.15.8', '2017-09-27 08:45:56.309135', '12', null);
INSERT INTO `tools_view` VALUES ('24', '2', '183.63.102.17,183.63.102.17', '2017-09-27 09:37:32.398444', '12', '1');
INSERT INTO `tools_view` VALUES ('26', '1', '183.63.102.17,183.63.102.17', '2017-09-28 08:54:20.305464', '12', null);
INSERT INTO `tools_view` VALUES ('27', '1', '128.69.198.19,128.69.198.19', '2017-09-28 20:05:10.854761', '12', null);
INSERT INTO `tools_view` VALUES ('28', '1', '188.32.231.229,188.32.231.229', '2017-09-29 04:33:03.603094', '12', null);
INSERT INTO `tools_view` VALUES ('30', '2', '183.63.97.199,183.63.97.199', '2017-10-01 21:21:20.749259', '12', null);
INSERT INTO `tools_view` VALUES ('32', '2', '183.63.102.17,183.63.102.17', '2017-10-01 23:01:11.825676', '12', null);
INSERT INTO `tools_view` VALUES ('33', '1', '183.63.102.17,183.63.102.17', '2017-10-01 23:01:23.771644', '12', null);
INSERT INTO `tools_view` VALUES ('34', '4', '66.249.64.221,66.249.64.221', '2017-10-02 00:14:35.898650', '12', null);
INSERT INTO `tools_view` VALUES ('35', '5', '66.249.64.221,66.249.64.221', '2017-10-02 00:15:46.031737', '12', null);
INSERT INTO `tools_view` VALUES ('36', '1', '183.63.97.199,183.63.97.199', '2017-10-02 10:48:34.219064', '12', '1');
INSERT INTO `tools_view` VALUES ('37', '5', '183.63.97.199,183.63.97.199', '2017-10-02 11:36:42.131443', '12', '1');
INSERT INTO `tools_view` VALUES ('38', '4', '66.249.66.29,66.249.66.29', '2017-10-02 19:18:11.460395', '12', null);
INSERT INTO `tools_view` VALUES ('39', '1', '117.136.41.86,117.136.41.86', '2017-10-03 10:30:44.085181', '12', null);
INSERT INTO `tools_view` VALUES ('40', '1', '183.236.19.68,183.236.19.68', '2017-10-03 10:35:38.127099', '12', '1');
INSERT INTO `tools_view` VALUES ('41', '1', '180.76.15.140,180.76.15.140', '2017-10-03 17:47:53.450219', '12', null);
INSERT INTO `tools_view` VALUES ('45', '2', '123.125.67.165,123.125.67.165', '2017-10-03 19:44:45.253932', '12', null);
INSERT INTO `tools_view` VALUES ('47', '1', '59.42.54.23,59.42.54.23', '2017-10-04 02:11:15.483940', '12', '1');
INSERT INTO `tools_view` VALUES ('48', '2', '59.42.54.23,59.42.54.23', '2017-10-04 02:11:41.259254', '12', '1');
INSERT INTO `tools_view` VALUES ('49', '3', '203.208.60.204,203.208.60.204', '2017-10-04 15:42:05.367239', '12', null);
INSERT INTO `tools_view` VALUES ('50', '1', '203.208.60.203,203.208.60.203', '2017-10-04 15:42:23.427459', '12', null);
INSERT INTO `tools_view` VALUES ('51', '4', '203.208.60.204,203.208.60.204', '2017-10-04 15:42:44.276523', '12', null);
INSERT INTO `tools_view` VALUES ('52', '5', '203.208.60.206,203.208.60.206', '2017-10-04 15:43:07.719028', '12', null);
INSERT INTO `tools_view` VALUES ('53', '2', '203.208.60.207,203.208.60.207', '2017-10-04 15:43:35.086456', '12', null);
INSERT INTO `tools_view` VALUES ('54', '3', '123.125.71.81,123.125.71.81', '2017-10-04 19:49:37.732735', '12', null);
INSERT INTO `tools_view` VALUES ('55', '5', '123.125.71.43,123.125.71.43', '2017-10-04 21:29:37.715932', '12', null);
INSERT INTO `tools_view` VALUES ('56', '3', '112.96.109.182,112.96.109.182', '2017-10-04 23:07:47.495941', '12', null);
INSERT INTO `tools_view` VALUES ('57', '1', '112.96.109.182,112.96.109.182', '2017-10-04 23:08:14.493942', '12', null);
INSERT INTO `tools_view` VALUES ('58', '1', '112.96.109.182,112.96.109.182', '2017-10-04 23:08:48.936176', '12', null);
INSERT INTO `tools_view` VALUES ('59', '1', '183.63.97.199,183.63.97.199', '2017-10-04 23:09:15.566667', '12', '1');
INSERT INTO `tools_view` VALUES ('60', '5', '220.181.108.106,220.181.108.106', '2017-10-04 23:09:57.477967', '12', null);
INSERT INTO `tools_view` VALUES ('61', '5', '183.63.97.199,183.63.97.199', '2017-10-04 23:22:26.541818', '12', '1');
INSERT INTO `tools_view` VALUES ('62', '1', '183.63.97.199,183.63.97.199', '2017-10-04 23:23:11.329197', '12', '1');
INSERT INTO `tools_view` VALUES ('63', '4', '123.125.71.43,123.125.71.43', '2017-10-04 23:42:57.712890', '12', null);
INSERT INTO `tools_view` VALUES ('64', '1', '220.181.108.149,220.181.108.149', '2017-10-05 00:16:17.676932', '12', null);
INSERT INTO `tools_view` VALUES ('65', '1', '183.63.102.17,183.63.102.17', '2017-10-05 00:42:08.208332', '12', null);
INSERT INTO `tools_view` VALUES ('66', '2', '123.125.71.55,123.125.71.55', '2017-10-05 00:49:39.151465', '12', null);
INSERT INTO `tools_view` VALUES ('67', '3', '220.181.108.113,220.181.108.113', '2017-10-05 01:22:57.695202', '12', null);
INSERT INTO `tools_view` VALUES ('68', '4', '123.125.71.45,123.125.71.45', '2017-10-05 01:56:17.761153', '12', null);
INSERT INTO `tools_view` VALUES ('70', '1', '180.76.15.6,180.76.15.6', '2017-10-07 07:04:42.723065', '12', null);
INSERT INTO `tools_view` VALUES ('74', '2', 'b\'\'', '2017-10-10 13:18:51.454030', '12', null);
INSERT INTO `tools_view` VALUES ('75', '1', 'b\'\'', '2017-10-10 23:01:30.608368', '12', '1');
INSERT INTO `tools_view` VALUES ('76', '1', 'b\'\'', '2017-10-10 23:04:51.132848', '12', null);
INSERT INTO `tools_view` VALUES ('77', '4', '183.63.102.119,183.63.102.119', '2017-10-13 10:23:11.948224', '12', '1');
INSERT INTO `tools_view` VALUES ('78', '6', '183.63.102.119,183.63.102.119', '2017-10-13 12:34:08.270060', '12', '1');
INSERT INTO `tools_view` VALUES ('79', '6', '183.63.102.119,183.63.102.119', '2017-10-13 13:22:53.129889', '12', '1');
INSERT INTO `tools_view` VALUES ('80', '2', '188.255.16.224,188.255.16.224', '2017-10-13 14:06:58.698192', '12', null);
INSERT INTO `tools_view` VALUES ('81', '6', '112.96.33.43,112.96.33.43', '2017-10-13 15:24:16.532515', '12', null);
INSERT INTO `tools_view` VALUES ('82', '2', '183.63.102.119,183.63.102.119', '2017-10-13 19:10:41.086377', '12', null);
INSERT INTO `tools_view` VALUES ('83', '1', '183.63.102.119,183.63.102.119', '2017-10-14 01:21:01.193262', '12', '1');
INSERT INTO `tools_view` VALUES ('84', '6', '183.63.102.119,183.63.102.119', '2017-10-14 01:21:15.397290', '12', '1');
INSERT INTO `tools_view` VALUES ('85', '2', '183.63.102.119,183.63.102.119', '2017-10-14 01:21:55.398747', '12', '1');
INSERT INTO `tools_view` VALUES ('86', '2', '37.204.81.148,37.204.81.148', '2017-10-14 04:06:04.618920', '12', null);
INSERT INTO `tools_view` VALUES ('87', '2', '95.220.105.112,95.220.105.112', '2017-10-14 04:28:32.939035', '12', null);
INSERT INTO `tools_view` VALUES ('88', '6', '112.96.173.29,112.96.173.29', '2017-10-14 21:17:34.891630', '12', null);
INSERT INTO `tools_view` VALUES ('89', '1', '112.96.173.29,112.96.173.29', '2017-10-14 21:18:09.445915', '12', '1');
INSERT INTO `tools_view` VALUES ('90', '6', '203.208.60.205,203.208.60.205', '2017-10-15 03:41:43.030562', '12', null);
INSERT INTO `tools_view` VALUES ('91', '1', '112.96.173.240,112.96.173.240', '2017-10-15 07:00:07.141931', '12', null);
INSERT INTO `tools_view` VALUES ('92', '5', '183.236.19.67,183.236.19.67', '2017-10-15 21:57:21.077554', '12', '1');
INSERT INTO `tools_view` VALUES ('93', '2', '203.208.60.232,203.208.60.232', '2017-10-16 01:20:58.193589', '12', null);
INSERT INTO `tools_view` VALUES ('94', '1', '203.208.60.206,203.208.60.206', '2017-10-16 01:53:20.410016', '12', null);
INSERT INTO `tools_view` VALUES ('95', '2', '203.208.60.205,203.208.60.205', '2017-10-16 05:16:18.161867', '12', null);
INSERT INTO `tools_view` VALUES ('96', '3', '203.208.60.204,203.208.60.204', '2017-10-16 06:07:29.794247', '12', null);
INSERT INTO `tools_view` VALUES ('97', '3', '183.63.102.119,183.63.102.119', '2017-10-16 10:33:35.832103', '12', '1');
INSERT INTO `tools_view` VALUES ('98', '4', '183.63.102.119,183.63.102.119', '2017-10-16 10:34:40.718222', '12', '1');
INSERT INTO `tools_view` VALUES ('99', '6', '183.63.102.119,183.63.102.119', '2017-10-16 10:40:19.712120', '12', '1');
INSERT INTO `tools_view` VALUES ('100', '9', '183.63.102.119,183.63.102.119', '2017-10-16 14:36:00.480857', '12', '1');
INSERT INTO `tools_view` VALUES ('101', '12', '183.63.102.119,183.63.102.119', '2017-10-16 14:39:00.144475', '12', '1');
INSERT INTO `tools_view` VALUES ('102', '17', '183.63.102.119,183.63.102.119', '2017-10-16 14:48:29.019690', '12', '1');
INSERT INTO `tools_view` VALUES ('103', '11', '183.63.102.119,183.63.102.119', '2017-10-16 14:57:21.731883', '12', '1');
INSERT INTO `tools_view` VALUES ('104', '10', '183.63.102.119,183.63.102.119', '2017-10-16 14:57:42.057932', '12', '1');
INSERT INTO `tools_view` VALUES ('105', '8', '183.63.102.119,183.63.102.119', '2017-10-16 14:57:44.915945', '12', '1');
INSERT INTO `tools_view` VALUES ('106', '2', '203.208.60.205,203.208.60.205', '2017-10-16 15:04:49.395191', '12', null);
INSERT INTO `tools_view` VALUES ('107', '8', '183.63.102.119,183.63.102.119', '2017-10-16 15:52:56.592801', '12', '1');
INSERT INTO `tools_view` VALUES ('108', '2', '203.208.60.204,203.208.60.204', '2017-10-16 19:40:53.495368', '12', null);
INSERT INTO `tools_view` VALUES ('109', '18', '183.63.97.223,183.63.97.223', '2017-10-16 19:57:59.755228', '12', '1');
INSERT INTO `tools_view` VALUES ('110', '6', '183.63.97.223,183.63.97.223', '2017-10-17 01:17:58.664022', '12', null);
INSERT INTO `tools_view` VALUES ('111', '7', '203.208.60.205,203.208.60.205', '2017-10-17 08:05:16.184797', '12', null);
INSERT INTO `tools_view` VALUES ('112', '8', '203.208.60.205,203.208.60.205', '2017-10-17 08:05:18.871795', '12', null);
INSERT INTO `tools_view` VALUES ('113', '9', '203.208.60.205,203.208.60.205', '2017-10-17 08:05:26.390505', '12', null);
INSERT INTO `tools_view` VALUES ('114', '10', '203.208.60.205,203.208.60.205', '2017-10-17 08:05:30.349304', '12', null);
INSERT INTO `tools_view` VALUES ('115', '16', '203.208.60.203,203.208.60.203', '2017-10-17 08:26:04.690460', '12', null);
INSERT INTO `tools_view` VALUES ('116', '13', '203.208.60.203,203.208.60.203', '2017-10-17 08:26:27.876583', '12', null);
INSERT INTO `tools_view` VALUES ('117', '15', '203.208.60.203,203.208.60.203', '2017-10-17 08:27:16.128454', '12', null);
INSERT INTO `tools_view` VALUES ('118', '17', '203.208.60.205,203.208.60.205', '2017-10-17 08:27:59.560917', '12', null);
INSERT INTO `tools_view` VALUES ('119', '12', '203.208.60.207,203.208.60.207', '2017-10-17 08:28:44.958208', '12', null);
INSERT INTO `tools_view` VALUES ('120', '11', '203.208.60.206,203.208.60.206', '2017-10-17 08:29:31.507103', '12', null);
INSERT INTO `tools_view` VALUES ('121', '7', '183.63.97.223,183.63.97.223', '2017-10-17 09:09:24.053678', '12', '1');
INSERT INTO `tools_view` VALUES ('122', '14', '203.208.60.204,203.208.60.204', '2017-10-17 09:43:46.493599', '12', null);
INSERT INTO `tools_view` VALUES ('123', '16', '221.4.32.15,221.4.32.15', '2017-10-17 12:23:50.731908', '12', '1');
INSERT INTO `tools_view` VALUES ('124', '18', '203.208.60.206,203.208.60.206', '2017-10-17 12:59:17.756208', '12', null);
INSERT INTO `tools_view` VALUES ('125', '9', '183.63.102.119,183.63.102.119', '2017-10-17 13:34:31.840450', '12', '1');
INSERT INTO `tools_view` VALUES ('126', '7', '123.125.71.54,123.125.71.54', '2017-10-17 17:17:38.244035', '12', null);
INSERT INTO `tools_view` VALUES ('127', '15', '220.181.108.101,220.181.108.101', '2017-10-17 17:50:58.182578', '12', null);
INSERT INTO `tools_view` VALUES ('128', '6', '220.181.108.97,220.181.108.97', '2017-10-17 18:24:18.226289', '12', null);
INSERT INTO `tools_view` VALUES ('129', '14', '123.125.71.114,123.125.71.114', '2017-10-17 18:57:38.232833', '12', null);
INSERT INTO `tools_view` VALUES ('130', '17', '220.181.108.185,220.181.108.185', '2017-10-17 19:42:55.111678', '12', null);
INSERT INTO `tools_view` VALUES ('131', '11', '123.125.71.116,123.125.71.116', '2017-10-17 20:28:12.061580', '12', null);
INSERT INTO `tools_view` VALUES ('132', '8', '123.125.71.112,123.125.71.112', '2017-10-17 21:13:28.830096', '12', null);
INSERT INTO `tools_view` VALUES ('133', '10', '220.181.108.112,220.181.108.112', '2017-10-17 21:33:37.666488', '12', null);
INSERT INTO `tools_view` VALUES ('134', '9', '220.181.108.181,220.181.108.181', '2017-10-17 21:43:42.138242', '12', null);
INSERT INTO `tools_view` VALUES ('135', '16', '123.125.71.50,123.125.71.50', '2017-10-17 21:53:46.644092', '12', null);
INSERT INTO `tools_view` VALUES ('136', '7', '123.125.71.75,123.125.71.75', '2017-10-17 22:13:55.451147', '12', null);
INSERT INTO `tools_view` VALUES ('137', '12', '123.125.71.90,123.125.71.90', '2017-10-17 22:23:59.956086', '12', null);
INSERT INTO `tools_view` VALUES ('138', '9', '123.125.71.112,123.125.71.112', '2017-10-17 22:34:04.399408', '12', null);
INSERT INTO `tools_view` VALUES ('139', '8', '123.125.71.39,123.125.71.39', '2017-10-17 22:44:08.826666', '12', null);
INSERT INTO `tools_view` VALUES ('140', '6', '220.181.108.162,220.181.108.162', '2017-10-18 00:14:59.975668', '12', null);
INSERT INTO `tools_view` VALUES ('141', '10', '123.125.71.81,123.125.71.81', '2017-10-18 01:45:51.211932', '12', null);
INSERT INTO `tools_view` VALUES ('142', '18', '203.208.60.206,203.208.60.206', '2017-10-18 02:00:13.163317', '12', null);
INSERT INTO `tools_view` VALUES ('143', '9', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:31.731417', '12', null);
INSERT INTO `tools_view` VALUES ('144', '15', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:31.817691', '12', null);
INSERT INTO `tools_view` VALUES ('145', '11', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:32.013066', '12', null);
INSERT INTO `tools_view` VALUES ('146', '9', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:32.098376', '12', null);
INSERT INTO `tools_view` VALUES ('147', '10', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:32.285127', '12', null);
INSERT INTO `tools_view` VALUES ('148', '8', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:41.418482', '12', null);
INSERT INTO `tools_view` VALUES ('149', '6', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:41.506989', '12', null);
INSERT INTO `tools_view` VALUES ('150', '3', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:51.351109', '12', null);
INSERT INTO `tools_view` VALUES ('151', '2', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:51.436675', '12', null);
INSERT INTO `tools_view` VALUES ('152', '7', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:51.535443', '12', null);
INSERT INTO `tools_view` VALUES ('153', '1', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:51.629804', '12', null);
INSERT INTO `tools_view` VALUES ('154', '5', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:51.824596', '12', null);
INSERT INTO `tools_view` VALUES ('155', '4', '34.192.116.178,34.192.116.178', '2017-10-18 03:56:51.909600', '12', null);
INSERT INTO `tools_view` VALUES ('156', '12', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.308304', '12', null);
INSERT INTO `tools_view` VALUES ('157', '11', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.393181', '12', null);
INSERT INTO `tools_view` VALUES ('158', '18', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.478913', '12', null);
INSERT INTO `tools_view` VALUES ('159', '15', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.560829', '12', null);
INSERT INTO `tools_view` VALUES ('160', '14', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.645651', '12', null);
INSERT INTO `tools_view` VALUES ('161', '6', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.732251', '12', null);
INSERT INTO `tools_view` VALUES ('162', '3', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.814515', '12', null);
INSERT INTO `tools_view` VALUES ('163', '10', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:04.896766', '12', null);
INSERT INTO `tools_view` VALUES ('164', '16', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:13.450691', '12', null);
INSERT INTO `tools_view` VALUES ('165', '9', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:13.537544', '12', null);
INSERT INTO `tools_view` VALUES ('166', '5', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:13.620820', '12', null);
INSERT INTO `tools_view` VALUES ('167', '2', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:13.706420', '12', null);
INSERT INTO `tools_view` VALUES ('168', '4', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:13.809224', '12', null);
INSERT INTO `tools_view` VALUES ('169', '7', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:13.892484', '12', null);
INSERT INTO `tools_view` VALUES ('170', '13', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:13.979481', '12', null);
INSERT INTO `tools_view` VALUES ('171', '1', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:14.064046', '12', null);
INSERT INTO `tools_view` VALUES ('172', '8', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:14.165910', '12', null);
INSERT INTO `tools_view` VALUES ('173', '17', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:23.467630', '12', null);
INSERT INTO `tools_view` VALUES ('174', '15', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:33.918589', '12', null);
INSERT INTO `tools_view` VALUES ('175', '14', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:34.056689', '12', null);
INSERT INTO `tools_view` VALUES ('176', '12', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:34.141948', '12', null);
INSERT INTO `tools_view` VALUES ('177', '18', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:34.228842', '12', null);
INSERT INTO `tools_view` VALUES ('178', '10', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:34.315205', '12', null);
INSERT INTO `tools_view` VALUES ('179', '16', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:34.399825', '12', null);
INSERT INTO `tools_view` VALUES ('180', '13', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:44.055359', '12', null);
INSERT INTO `tools_view` VALUES ('181', '6', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:44.140887', '12', null);
INSERT INTO `tools_view` VALUES ('182', '8', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:44.236440', '12', null);
INSERT INTO `tools_view` VALUES ('183', '2', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:44.321343', '12', null);
INSERT INTO `tools_view` VALUES ('184', '17', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:44.424700', '12', null);
INSERT INTO `tools_view` VALUES ('185', '4', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:55.005833', '12', null);
INSERT INTO `tools_view` VALUES ('186', '3', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:55.108931', '12', null);
INSERT INTO `tools_view` VALUES ('187', '1', '34.192.116.178,34.192.116.178', '2017-10-18 03:57:55.196907', '12', null);
INSERT INTO `tools_view` VALUES ('188', '5', '34.192.116.178,34.192.116.178', '2017-10-18 03:58:10.856455', '12', null);
INSERT INTO `tools_view` VALUES ('189', '7', '34.192.116.178,34.192.116.178', '2017-10-18 03:58:10.975701', '12', null);
INSERT INTO `tools_view` VALUES ('190', '8', '203.208.60.207,203.208.60.207', '2017-10-18 05:30:36.805141', '12', null);
INSERT INTO `tools_view` VALUES ('191', '11', '203.208.60.205,203.208.60.205', '2017-10-18 05:44:54.218054', '12', null);
INSERT INTO `tools_view` VALUES ('192', '14', '123.125.71.111,123.125.71.111', '2017-10-18 07:47:39.852881', '12', null);
INSERT INTO `tools_view` VALUES ('193', '17', '203.208.60.207,203.208.60.207', '2017-10-18 08:58:15.562186', '12', null);
INSERT INTO `tools_view` VALUES ('194', '17', '123.125.71.117,123.125.71.117', '2017-10-18 10:47:39.896321', '12', null);
INSERT INTO `tools_view` VALUES ('195', '11', '123.125.71.113,123.125.71.113', '2017-10-18 11:20:59.890705', '12', null);
INSERT INTO `tools_view` VALUES ('196', '13', '220.181.108.156,220.181.108.156', '2017-10-18 11:54:19.987935', '12', null);
INSERT INTO `tools_view` VALUES ('197', '18', '220.181.108.117,220.181.108.117', '2017-10-18 12:27:39.924050', '12', null);
INSERT INTO `tools_view` VALUES ('198', '15', '220.181.108.111,220.181.108.111', '2017-10-18 13:00:59.967813', '12', null);
INSERT INTO `tools_view` VALUES ('199', '18', '123.125.71.107,123.125.71.107', '2017-10-18 13:34:19.994709', '12', null);
INSERT INTO `tools_view` VALUES ('200', '12', '123.125.71.54,123.125.71.54', '2017-10-18 14:07:39.896663', '12', null);
INSERT INTO `tools_view` VALUES ('201', '13', '220.181.108.99,220.181.108.99', '2017-10-18 14:40:59.909375', '12', null);
INSERT INTO `tools_view` VALUES ('202', '1', '46.161.9.3,46.161.9.3', '2017-10-18 14:42:51.354082', '12', null);
INSERT INTO `tools_view` VALUES ('203', '16', '220.181.108.118,220.181.108.118', '2017-10-18 15:14:19.946179', '12', null);
INSERT INTO `tools_view` VALUES ('204', '1', '220.181.108.179,220.181.108.179', '2017-10-18 16:20:59.985919', '12', null);
INSERT INTO `tools_view` VALUES ('205', '13', '203.208.60.205,203.208.60.205', '2017-10-18 17:56:23.711119', '12', null);
INSERT INTO `tools_view` VALUES ('206', '1', '203.208.60.207,203.208.60.207', '2017-10-18 19:12:45.064957', '12', null);
INSERT INTO `tools_view` VALUES ('207', '13', '203.208.60.205,203.208.60.205', '2017-10-19 02:27:31.752375', '12', null);
INSERT INTO `tools_view` VALUES ('208', '8', '203.208.60.205,203.208.60.205', '2017-10-19 04:11:49.204921', '12', null);
INSERT INTO `tools_view` VALUES ('209', '9', '203.208.60.206,203.208.60.206', '2017-10-19 04:11:58.480249', '12', null);
INSERT INTO `tools_view` VALUES ('210', '6', '203.208.60.204,203.208.60.204', '2017-10-19 04:12:11.422421', '12', null);
INSERT INTO `tools_view` VALUES ('211', '4', '203.208.60.206,203.208.60.206', '2017-10-19 04:12:24.147154', '12', null);
INSERT INTO `tools_view` VALUES ('212', '5', '203.208.60.205,203.208.60.205', '2017-10-19 04:12:36.880548', '12', null);
INSERT INTO `tools_view` VALUES ('213', '7', '203.208.60.207,203.208.60.207', '2017-10-19 04:12:49.621973', '12', null);
INSERT INTO `tools_view` VALUES ('214', '14', '203.208.60.207,203.208.60.207', '2017-10-19 04:23:51.898656', '12', null);
INSERT INTO `tools_view` VALUES ('215', '14', '203.208.60.206,203.208.60.206', '2017-10-19 05:04:00.192324', '12', null);
INSERT INTO `tools_view` VALUES ('216', '15', '203.208.60.206,203.208.60.206', '2017-10-19 05:19:16.127418', '12', null);
INSERT INTO `tools_view` VALUES ('217', '17', '203.208.60.204,203.208.60.204', '2017-10-19 06:35:02.698250', '12', null);
INSERT INTO `tools_view` VALUES ('218', '7', '203.208.60.204,203.208.60.204', '2017-10-19 06:55:51.828565', '12', null);
INSERT INTO `tools_view` VALUES ('219', '15', '203.208.60.204,203.208.60.204', '2017-10-19 07:00:33.643616', '12', null);
INSERT INTO `tools_view` VALUES ('220', '12', '203.208.60.205,203.208.60.205', '2017-10-19 07:50:49.700496', '12', null);
INSERT INTO `tools_view` VALUES ('221', '7', '203.208.60.204,203.208.60.204', '2017-10-19 08:08:01.624253', '12', null);
INSERT INTO `tools_view` VALUES ('222', '15', '203.208.60.203,203.208.60.203', '2017-10-19 08:16:56.587073', '12', null);
INSERT INTO `tools_view` VALUES ('223', '7', '203.208.60.206,203.208.60.206', '2017-10-19 08:27:11.719303', '12', null);
INSERT INTO `tools_view` VALUES ('224', '12', '203.208.60.203,203.208.60.203', '2017-10-19 08:52:22.315290', '12', null);
INSERT INTO `tools_view` VALUES ('225', '3', '203.208.60.203,203.208.60.203', '2017-10-19 12:53:56.586945', '12', null);
INSERT INTO `tools_view` VALUES ('226', '1', '180.76.15.147,180.76.15.147', '2017-10-19 13:36:49.310145', '12', null);
INSERT INTO `tools_view` VALUES ('227', '13', '203.208.60.206,203.208.60.206', '2017-10-19 13:41:50.278041', '12', null);
INSERT INTO `tools_view` VALUES ('228', '1', '203.208.60.204,203.208.60.204', '2017-10-19 14:09:43.768885', '12', null);
INSERT INTO `tools_view` VALUES ('229', '13', '203.208.60.203,203.208.60.203', '2017-10-19 15:13:31.011926', '12', null);
INSERT INTO `tools_view` VALUES ('230', '13', '203.208.60.203,203.208.60.203', '2017-10-19 15:13:31.947559', '12', null);
INSERT INTO `tools_view` VALUES ('231', '13', '203.208.60.204,203.208.60.204', '2017-10-19 16:55:01.246285', '12', null);
INSERT INTO `tools_view` VALUES ('232', '13', '203.208.60.205,203.208.60.205', '2017-10-19 18:00:28.024843', '12', null);
INSERT INTO `tools_view` VALUES ('233', '7', '203.208.60.203,203.208.60.203', '2017-10-19 18:10:48.984262', '12', null);
INSERT INTO `tools_view` VALUES ('234', '7', '203.208.60.205,203.208.60.205', '2017-10-19 19:22:28.159334', '12', null);
INSERT INTO `tools_view` VALUES ('235', '2', '203.208.60.204,203.208.60.204', '2017-10-19 20:24:51.318993', '12', null);
INSERT INTO `tools_view` VALUES ('236', '10', '203.208.60.207,203.208.60.207', '2017-10-19 23:00:25.855580', '12', null);
INSERT INTO `tools_view` VALUES ('237', '16', '203.208.60.203,203.208.60.203', '2017-10-20 01:31:47.588059', '12', null);
INSERT INTO `tools_view` VALUES ('238', '11', '203.208.60.203,203.208.60.203', '2017-10-20 02:47:34.758843', '12', null);
INSERT INTO `tools_view` VALUES ('239', '9', '203.208.60.206,203.208.60.206', '2017-10-20 04:03:21.589477', '12', null);
INSERT INTO `tools_view` VALUES ('240', '13', '203.208.60.206,203.208.60.206', '2017-10-20 04:51:05.249497', '12', null);
INSERT INTO `tools_view` VALUES ('241', '15', '203.208.60.207,203.208.60.207', '2017-10-20 05:41:46.199613', '12', null);
INSERT INTO `tools_view` VALUES ('242', '12', '203.208.60.204,203.208.60.204', '2017-10-20 06:34:02.569191', '12', null);
INSERT INTO `tools_view` VALUES ('243', '18', '203.208.60.206,203.208.60.206', '2017-10-20 06:36:06.279008', '12', null);
INSERT INTO `tools_view` VALUES ('244', '14', '203.208.60.207,203.208.60.207', '2017-10-20 06:37:11.074156', '12', null);
INSERT INTO `tools_view` VALUES ('245', '9', '112.96.128.123,112.96.128.123', '2017-10-20 10:02:15.429746', '12', null);
INSERT INTO `tools_view` VALUES ('246', '8', '27.32.7.161,27.32.7.161', '2017-10-20 10:39:49.991979', '12', null);
INSERT INTO `tools_view` VALUES ('247', '10', '203.208.60.203,203.208.60.203', '2017-10-20 11:14:23.828580', '12', null);
INSERT INTO `tools_view` VALUES ('248', '13', '203.208.60.204,203.208.60.204', '2017-10-20 12:30:10.840860', '12', null);
INSERT INTO `tools_view` VALUES ('249', '11', '203.208.60.205,203.208.60.205', '2017-10-20 13:45:57.816593', '12', null);
INSERT INTO `tools_view` VALUES ('250', '6', '183.63.97.223,183.63.97.223', '2017-10-20 14:53:49.530286', '12', '21');
INSERT INTO `tools_view` VALUES ('251', '16', '203.208.60.204,203.208.60.204', '2017-10-20 16:17:31.826973', '12', null);
INSERT INTO `tools_view` VALUES ('252', '5', '183.63.97.223,183.63.97.223', '2017-10-21 16:20:42.766604', '12', '1');
INSERT INTO `tools_view` VALUES ('253', '1', '203.208.60.206,203.208.60.206', '2017-10-21 21:41:13.840500', '12', null);
INSERT INTO `tools_view` VALUES ('254', '1', '203.208.60.206,203.208.60.206', '2017-10-21 21:41:14.293864', '12', null);
INSERT INTO `tools_view` VALUES ('255', '14', '203.208.60.203,203.208.60.203', '2017-10-21 22:16:22.797214', '12', null);
INSERT INTO `tools_view` VALUES ('256', '14', '203.208.60.207,203.208.60.207', '2017-10-21 22:31:32.774121', '12', null);
INSERT INTO `tools_view` VALUES ('257', '7', '203.208.60.206,203.208.60.206', '2017-10-21 22:36:32.578228', '12', null);
INSERT INTO `tools_view` VALUES ('258', '14', '203.208.60.203,203.208.60.203', '2017-10-22 00:07:52.123075', '12', null);
INSERT INTO `tools_view` VALUES ('259', '13', '203.208.60.205,203.208.60.205', '2017-10-22 01:34:44.027589', '12', null);
INSERT INTO `tools_view` VALUES ('260', '15', '203.208.60.204,203.208.60.204', '2017-10-22 02:05:36.891613', '12', null);
INSERT INTO `tools_view` VALUES ('261', '15', '203.208.60.207,203.208.60.207', '2017-10-22 03:01:23.463882', '12', null);
INSERT INTO `tools_view` VALUES ('262', '13', '203.208.60.203,203.208.60.203', '2017-10-22 03:52:08.532747', '12', null);
INSERT INTO `tools_view` VALUES ('263', '7', '203.208.60.206,203.208.60.206', '2017-10-22 03:57:04.445853', '12', null);
INSERT INTO `tools_view` VALUES ('264', '1', '203.208.60.207,203.208.60.207', '2017-10-22 04:17:26.512566', '12', null);
INSERT INTO `tools_view` VALUES ('265', '1', '203.208.60.207,203.208.60.207', '2017-10-22 04:17:26.966860', '12', null);
INSERT INTO `tools_view` VALUES ('266', '3', '203.208.60.204,203.208.60.204', '2017-10-22 06:27:06.620823', '12', null);
INSERT INTO `tools_view` VALUES ('267', '14', '203.208.60.203,203.208.60.203', '2017-10-22 07:55:11.614799', '12', null);
INSERT INTO `tools_view` VALUES ('268', '3', '203.208.60.207,203.208.60.207', '2017-10-22 08:00:22.924941', '12', null);
INSERT INTO `tools_view` VALUES ('269', '14', '203.208.60.207,203.208.60.207', '2017-10-22 10:43:02.763931', '12', null);
INSERT INTO `tools_view` VALUES ('270', '13', '203.208.60.203,203.208.60.203', '2017-10-22 10:58:16.311360', '12', null);
INSERT INTO `tools_view` VALUES ('271', '15', '203.208.60.205,203.208.60.205', '2017-10-22 11:44:21.822908', '12', null);
INSERT INTO `tools_view` VALUES ('272', '7', '203.208.60.206,203.208.60.206', '2017-10-22 11:49:23.547136', '12', null);
INSERT INTO `tools_view` VALUES ('273', '13', '203.208.60.203,203.208.60.203', '2017-10-22 12:09:47.603413', '12', null);
INSERT INTO `tools_view` VALUES ('274', '7', '203.208.60.207,203.208.60.207', '2017-10-22 13:02:54.478320', '12', null);
INSERT INTO `tools_view` VALUES ('275', '2', '203.208.60.214,203.208.60.214', '2017-10-22 14:51:58.473199', '12', null);
INSERT INTO `tools_view` VALUES ('276', '2', '203.208.60.207,203.208.60.207', '2017-10-22 15:50:51.404625', '12', null);
INSERT INTO `tools_view` VALUES ('277', '14', '203.208.60.205,203.208.60.205', '2017-10-22 16:56:33.370714', '12', null);
INSERT INTO `tools_view` VALUES ('278', '13', '203.208.60.206,203.208.60.206', '2017-10-22 17:11:55.061307', '12', null);
INSERT INTO `tools_view` VALUES ('279', '7', '203.208.60.205,203.208.60.205', '2017-10-22 17:21:53.164609', '12', null);
INSERT INTO `tools_view` VALUES ('280', '7', '203.208.60.205,203.208.60.205', '2017-10-22 19:39:25.118940', '12', null);
INSERT INTO `tools_view` VALUES ('281', '8', '203.208.60.205,203.208.60.205', '2017-10-22 19:45:49.411929', '12', null);
INSERT INTO `tools_view` VALUES ('282', '8', '203.208.60.205,203.208.60.205', '2017-10-22 19:46:03.051747', '12', null);
INSERT INTO `tools_view` VALUES ('283', '8', '203.208.60.207,203.208.60.207', '2017-10-22 19:54:55.306684', '12', null);
INSERT INTO `tools_view` VALUES ('284', '8', '203.208.60.205,203.208.60.205', '2017-10-22 21:10:53.785139', '12', null);
INSERT INTO `tools_view` VALUES ('285', '7', '203.208.60.207,203.208.60.207', '2017-10-22 21:56:43.297467', '12', null);
INSERT INTO `tools_view` VALUES ('286', '2', '203.208.60.206,203.208.60.206', '2017-10-23 00:18:42.523311', '12', null);
INSERT INTO `tools_view` VALUES ('287', '2', '203.208.60.207,203.208.60.207', '2017-10-23 01:40:02.999686', '12', null);
INSERT INTO `tools_view` VALUES ('288', '7', '203.208.60.207,203.208.60.207', '2017-10-23 02:41:12.269990', '12', null);
INSERT INTO `tools_view` VALUES ('289', '15', '203.208.60.205,203.208.60.205', '2017-10-23 04:39:54.720398', '12', null);
INSERT INTO `tools_view` VALUES ('290', '3', '203.208.60.205,203.208.60.205', '2017-10-23 04:44:53.260461', '12', null);
INSERT INTO `tools_view` VALUES ('291', '8', '203.208.60.210,203.208.60.210', '2017-10-23 05:07:24.356137', '12', null);
INSERT INTO `tools_view` VALUES ('292', '7', '123.125.71.57,123.125.71.57', '2017-10-23 05:22:58.938332', '12', null);
INSERT INTO `tools_view` VALUES ('293', '13', '203.208.60.232,203.208.60.232', '2017-10-23 05:28:27.443548', '12', null);
INSERT INTO `tools_view` VALUES ('294', '8', '203.208.60.204,203.208.60.204', '2017-10-23 06:20:53.583416', '12', null);
INSERT INTO `tools_view` VALUES ('295', '14', '203.208.60.225,203.208.60.225', '2017-10-23 06:54:44.344033', '12', null);
INSERT INTO `tools_view` VALUES ('296', '3', '203.208.60.245,203.208.60.245', '2017-10-23 07:01:33.440284', '12', null);
INSERT INTO `tools_view` VALUES ('297', '8', '203.208.60.205,203.208.60.205', '2017-10-23 07:46:48.778465', '12', null);
INSERT INTO `tools_view` VALUES ('298', '8', '203.208.60.205,203.208.60.205', '2017-10-23 08:08:03.334778', '12', null);
INSERT INTO `tools_view` VALUES ('299', '7', '203.208.60.204,203.208.60.204', '2017-10-23 08:18:14.537844', '12', null);
INSERT INTO `tools_view` VALUES ('300', '13', '203.208.60.207,203.208.60.207', '2017-10-23 08:38:53.815296', '12', null);
INSERT INTO `tools_view` VALUES ('301', '2', '203.208.60.204,203.208.60.204', '2017-10-23 10:05:02.884916', '12', null);
INSERT INTO `tools_view` VALUES ('302', '2', '203.208.60.205,203.208.60.205', '2017-10-23 11:32:24.124094', '12', null);
INSERT INTO `tools_view` VALUES ('303', '7', '220.181.108.171,220.181.108.171', '2017-10-23 12:06:55.629699', '12', null);
INSERT INTO `tools_view` VALUES ('304', '8', '203.208.60.201,203.208.60.201', '2017-10-23 14:17:35.553022', '12', null);
INSERT INTO `tools_view` VALUES ('305', '15', '203.208.60.217,203.208.60.217', '2017-10-23 14:57:49.395331', '12', null);
INSERT INTO `tools_view` VALUES ('306', '3', '203.208.60.251,203.208.60.251', '2017-10-23 15:04:25.223753', '12', null);
INSERT INTO `tools_view` VALUES ('307', '2', '203.208.60.205,203.208.60.205', '2017-10-23 18:44:03.445622', '12', null);
INSERT INTO `tools_view` VALUES ('308', '2', '203.208.60.203,203.208.60.203', '2017-10-23 20:10:59.178914', '12', null);
INSERT INTO `tools_view` VALUES ('309', '8', '203.208.60.207,203.208.60.207', '2017-10-23 21:06:40.393316', '12', null);
INSERT INTO `tools_view` VALUES ('310', '8', '203.208.60.205,203.208.60.205', '2017-10-24 00:20:05.914315', '12', null);
INSERT INTO `tools_view` VALUES ('311', '3', '203.208.60.207,203.208.60.207', '2017-10-24 00:45:06.704217', '12', null);
INSERT INTO `tools_view` VALUES ('312', '3', '203.208.60.206,203.208.60.206', '2017-10-24 01:40:20.612767', '12', null);
INSERT INTO `tools_view` VALUES ('313', '15', '203.208.60.251,203.208.60.251', '2017-10-24 03:02:09.173807', '12', null);
INSERT INTO `tools_view` VALUES ('314', '14', '203.208.60.237,203.208.60.237', '2017-10-24 03:07:09.198425', '12', null);
INSERT INTO `tools_view` VALUES ('315', '8', '220.181.108.113,220.181.108.113', '2017-10-24 04:05:31.330755', '12', null);
INSERT INTO `tools_view` VALUES ('316', '2', '203.208.60.204,203.208.60.204', '2017-10-24 04:38:10.780901', '12', null);
INSERT INTO `tools_view` VALUES ('317', '14', '203.208.60.205,203.208.60.205', '2017-10-24 05:39:01.572564', '12', null);
INSERT INTO `tools_view` VALUES ('318', '14', '203.208.60.205,203.208.60.205', '2017-10-24 05:39:02.514342', '12', null);
INSERT INTO `tools_view` VALUES ('319', '15', '203.208.60.205,203.208.60.205', '2017-10-24 05:44:00.431765', '12', null);
INSERT INTO `tools_view` VALUES ('320', '2', '203.208.60.205,203.208.60.205', '2017-10-24 06:34:48.939520', '12', null);
INSERT INTO `tools_view` VALUES ('321', '8', '203.208.60.205,203.208.60.205', '2017-10-24 08:01:34.406769', '12', null);
INSERT INTO `tools_view` VALUES ('322', '15', '203.208.60.206,203.208.60.206', '2017-10-24 08:16:52.994370', '12', null);
INSERT INTO `tools_view` VALUES ('323', '8', '129.78.56.200,129.78.56.200', '2017-10-24 13:21:20.914409', '12', null);
INSERT INTO `tools_view` VALUES ('324', '8', '203.208.60.212,203.208.60.212', '2017-10-24 13:45:36.108144', '12', null);
INSERT INTO `tools_view` VALUES ('325', '8', '203.208.60.197,203.208.60.197', '2017-10-24 13:48:42.322077', '12', null);
INSERT INTO `tools_view` VALUES ('326', '2', '203.208.60.225,203.208.60.225', '2017-10-24 14:16:08.682637', '12', null);
INSERT INTO `tools_view` VALUES ('327', '2', '203.208.60.204,203.208.60.204', '2017-10-24 16:07:59.247775', '12', null);
INSERT INTO `tools_view` VALUES ('328', '9', '127.0.0.1', '2017-10-25 10:18:54.867180', '12', null);
INSERT INTO `tools_view` VALUES ('329', '8', '127.0.0.1', '2017-10-25 10:19:01.430185', '12', null);
INSERT INTO `tools_view` VALUES ('330', '1', '127.0.0.1', '2017-10-25 10:42:37.147302', '12', null);
INSERT INTO `tools_view` VALUES ('331', '16', '127.0.0.1', '2017-10-25 23:35:11.178241', '12', '1');

-- ----------------------------
-- Table structure for tools_viewnum
-- ----------------------------
DROP TABLE IF EXISTS `tools_viewnum`;
CREATE TABLE `tools_viewnum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `view_num` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tools_viewnum_content_type_id_72a1507a_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  CONSTRAINT `tools_viewnum_content_type_id_72a1507a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tools_viewnum
-- ----------------------------
INSERT INTO `tools_viewnum` VALUES ('1', '2', '44', '12');
INSERT INTO `tools_viewnum` VALUES ('2', '1', '47', '12');
INSERT INTO `tools_viewnum` VALUES ('3', '3', '26', '12');
INSERT INTO `tools_viewnum` VALUES ('4', '4', '13', '12');
INSERT INTO `tools_viewnum` VALUES ('5', '5', '13', '12');
INSERT INTO `tools_viewnum` VALUES ('6', '6', '15', '12');
INSERT INTO `tools_viewnum` VALUES ('7', '9', '12', '12');
INSERT INTO `tools_viewnum` VALUES ('8', '12', '9', '12');
INSERT INTO `tools_viewnum` VALUES ('9', '17', '8', '12');
INSERT INTO `tools_viewnum` VALUES ('10', '11', '9', '12');
INSERT INTO `tools_viewnum` VALUES ('11', '10', '9', '12');
INSERT INTO `tools_viewnum` VALUES ('12', '8', '28', '12');
INSERT INTO `tools_viewnum` VALUES ('13', '18', '8', '12');
INSERT INTO `tools_viewnum` VALUES ('14', '7', '24', '12');
INSERT INTO `tools_viewnum` VALUES ('15', '16', '9', '12');
INSERT INTO `tools_viewnum` VALUES ('16', '13', '21', '12');
INSERT INTO `tools_viewnum` VALUES ('17', '15', '18', '12');
INSERT INTO `tools_viewnum` VALUES ('18', '14', '18', '12');

-- ----------------------------
-- Table structure for user_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `user_emailverifyrecord`;
CREATE TABLE `user_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sendtype` varchar(10) NOT NULL,
  `sendtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_emailverifyrecord
-- ----------------------------
INSERT INTO `user_emailverifyrecord` VALUES ('47', '9ArkqPzR', '1044113859@163.com', 'resetemail', '2017-10-18 12:36:54.136543');
INSERT INTO `user_emailverifyrecord` VALUES ('48', 'BfpPdevp', '1044113859@163.com', 'resetemail', '2017-10-18 14:05:22.628308');
INSERT INTO `user_emailverifyrecord` VALUES ('49', 'ZdgAoQKI', 'chenzhixiang1992@163.com', 'resetemail', '2017-10-18 14:06:31.111670');
INSERT INTO `user_emailverifyrecord` VALUES ('50', 'oBncuGJOcXI6XzYx', 'michaelimalt@mail.ru', 'register', '2017-10-18 14:42:54.236034');
INSERT INTO `user_emailverifyrecord` VALUES ('51', 'vvicXF5vG6is37gv', '1946709553@qq.com', 'forget', '2017-10-18 16:05:11.675688');
INSERT INTO `user_emailverifyrecord` VALUES ('52', 'gJULQmq3rDRyGa88', '1946709553@qq.com', 'forget', '2017-10-19 09:51:31.303302');
INSERT INTO `user_emailverifyrecord` VALUES ('53', 'c6qrzzfDSrhrHAsG', '1946709553@qq.com', 'forget', '2017-10-20 12:30:42.716331');

-- ----------------------------
-- Table structure for user_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile`;
CREATE TABLE `user_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `avatar` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_userprofile
-- ----------------------------
INSERT INTO `user_userprofile` VALUES ('1', 'pbkdf2_sha256$30000$D28BUKBThoo2$wSPV+L/Qh8GWDp5SBwVvLJDCMSTe6UGAunqzP83i8Mo=', '2017-10-26 17:48:54.060753', '1', 'chenzhixiang1992', '', '', 'chenzhixiang1992@163.com', '1', '1', '2017-09-24 02:34:17.940994', 'chenzhixiang1992', 'male', '1992-10-06', '加快了', '15521127326', 'image/avatar/013-itachi-1024x768.jpg');
INSERT INTO `user_userprofile` VALUES ('14', 'pbkdf2_sha256$30000$JTZd3NSXf4fc$Nw8d8X3eu+7Pxe4NhkWBq9+zewNAAAGlrNuvqmhBQUs=', null, '0', 'Michaeledusa', '', '', 'michaelimalt@mail.ru', '0', '1', '2017-10-18 14:42:00.000000', 'Michaeledusa', 'male', null, '火星的地球驻点', '', 'image/avatar/you_s9ZhLgy.gif');
INSERT INTO `user_userprofile` VALUES ('16', '!bkH4eY3Lynpj3DJYokFQgFxUUMWd1crnWNP5nqQy', '2017-10-20 00:18:56.560882', '0', 'chenzhixiang1992@gmail.com', '', '', 'chenzhixiang1992@gmail.com', '0', '1', '2017-10-19 15:43:37.733281', '', 'male', null, '火星的地球驻点', null, 'image/avatar/you.png');
INSERT INTO `user_userprofile` VALUES ('19', 'pbkdf2_sha256$30000$qw3E3S6ykqoK$C+3I/5LHv7Lo1gJhrOmkTqNhSv+BFu+SfA8QPnq6Zb4=', '2017-10-19 23:34:02.059105', '0', '1946709553@qq.com', '', '', '1946709553@qq.com', '0', '1', '2017-10-19 21:58:00.000000', '1946709553@qq.com', 'male', null, '火星的地球驻点', '', 'image/avatar/猪猪_g4ibtJU.gif');
INSERT INTO `user_userprofile` VALUES ('21', 'pbkdf2_sha256$30000$Gyi67HuTQKQD$D/ojaNcSvl3sHCfWThFwJkWim+7lyxmR5mzpHaBlqcc=', '2017-10-20 14:54:18.322304', '0', '夕象', '黑夜里黑色的光', '', 'limeigui1992@163.com', '0', '1', '2017-10-20 00:18:37.665349', '夕象', 'male', null, '火星的地球驻点', null, 'image/avatar/you.png');

-- ----------------------------
-- Table structure for user_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_groups`;
CREATE TABLE `user_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_userprofile_groups_userprofile_id_52847a61_uniq` (`userprofile_id`,`group_id`) USING BTREE,
  KEY `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `user_userprofile__userprofile_id_49724c40_fk_user_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_user_permissions`;
CREATE TABLE `user_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_userprofile_user_permissions_userprofile_id_2e86ceca_uniq` (`userprofile_id`,`permission_id`) USING BTREE,
  KEY `user_userprofile_us_permission_id_7f559b23_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `user_userprofile__userprofile_id_68dc814c_fk_user_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `user_userprofile_us_permission_id_7f559b23_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_bookmark_user_id_42d307fc_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_log_user_id_bb16a176_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2017-09-24 02:36:26.391654', 'b\'\'', '1', '技术博客', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2017-09-24 02:36:36.634768', 'b\'\'', '2', '....我的网站建设', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2017-09-24 02:36:44.470165', 'b\'\'', '3', '....Python', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2017-09-24 02:36:57.723667', 'b\'\'', '4', '....C/C++', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2017-09-24 02:37:05.244101', 'b\'\'', '5', '....HTML', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2017-09-24 02:37:15.102078', 'b\'\'', '6', '....深度学习', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2017-09-24 02:37:31.919476', 'b\'\'', '7', '生活笔记', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2017-09-24 02:37:43.785649', 'b\'\'', '8', '....个人随笔', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2017-09-24 02:37:52.518543', 'b\'\'', '9', '....个人随笔', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2017-09-24 02:38:02.583220', 'b\'\'', '10', '个人日记', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2017-09-24 02:38:16.235072', 'b\'\'', '8', '....个人随笔', 'change', '修改 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2017-09-24 02:38:33.845781', 'b\'\'', '9', '....个人日记', 'change', '修改 name', '14', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2017-09-24 02:38:52.074520', 'b\'\'', '11', '....技术随笔', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2017-09-24 02:39:19.965063', 'b\'\'', '10', '....个人日记', 'change', '修改 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2017-09-24 02:40:24.182078', 'b\'\'', null, '', 'delete', '批量删除 1 个 博客分类', null, '1');
INSERT INTO `xadmin_log` VALUES ('16', '2017-09-24 02:42:12.554857', 'b\'\'', '1', '陈志祥', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2017-09-24 02:43:14.701173', 'b\'\'', '1', '1 - 搭建django网站开发环境', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2017-09-24 02:43:45.100742', 'b\'\'', '2', '2 - django网站需求分析', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2017-09-24 02:46:30.595938', 'b\'\'', '1', '个人简介', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2017-09-24 02:46:46.604771', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2017-09-24 16:38:24.939106', 'b\'\'', '3', '源哥最帅', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2017-09-24 17:02:21.898167', 'b\'\'', '3', '3 - 网站的数据模型', 'change', '修改 title', '12', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2017-09-24 23:28:07.122939', 'b\'\'', '3', '3 - 网站的数据模型', 'change', '修改 category，excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2017-10-01 21:34:20.942671', 'b\'\'', '4', '4 - 用户登录注册', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2017-10-01 21:34:50.643981', 'b\'\'', '4', '4 - 用户登录注册', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2017-10-01 21:35:13.878012', 'b\'\'', '4', '4 - 用户登录注册', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2017-10-01 21:36:49.060809', 'b\'\'', '4', '4 - django后台Xadmin', 'change', '修改 title', '12', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2017-10-01 21:37:18.053964', 'b\'\'', '5', '5 - 用户登录注册', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2017-10-03 09:50:20.057716', 'b\'\'', '1', '留言板', 'create', '已添加。', '31', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2017-10-10 22:48:45.255279', 'b\'\'', null, '', 'delete', '批量删除 6 个 用户信息', null, '1');
INSERT INTO `xadmin_log` VALUES ('31', '2017-10-13 12:06:39.781334', 'b\'\'', '6', '....数据库', 'change', '修改 name', '14', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2017-10-13 12:06:55.775640', 'b\'\'', '7', '....深度学习', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2017-10-13 12:07:11.241383', 'b\'\'', '11', '....其他', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2017-10-13 12:07:47.591403', 'b\'\'', '8', '生活笔记', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2017-10-13 12:08:07.707997', 'b\'\'', '9', '....技术随笔', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2017-10-13 12:08:39.030599', 'b\'\'', '12', '....个人随笔', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2017-10-13 12:08:53.434788', 'b\'\'', '13', '....个人日记', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2017-10-13 12:10:53.786791', 'b\'\'', '9', '....深度学习', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2017-10-13 12:11:44.680428', 'b\'\'', '8', '....其他', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2017-10-13 12:12:27.420103', 'b\'\'', '9', '生活笔记', 'change', '修改 name，parent 和 path', '14', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2017-10-13 12:13:31.779228', 'b\'\'', '11', '....技术随笔', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2017-10-13 12:13:46.611458', 'b\'\'', '12', '....个人随笔', 'change', '修改 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2017-10-13 12:13:53.686246', 'b\'\'', '13', '....个人日记', 'change', '修改 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2017-10-13 12:17:04.015471', 'b\'\'', '6', 'Ubuntu上的docker安装', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2017-10-13 12:34:01.492944', 'b\'\'', '6', 'Ubuntu上的docker安装', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2017-10-13 12:35:05.515481', 'b\'\'', '6', 'Ubuntu上的docker安装', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2017-10-13 13:00:54.606631', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 title 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2017-10-13 13:02:50.947654', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2017-10-13 13:04:51.324084', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2017-10-13 13:06:04.113077', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2017-10-13 13:06:37.717930', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2017-10-13 13:07:06.514387', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2017-10-13 13:08:20.319151', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2017-10-13 13:09:05.255031', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2017-10-13 13:09:31.836910', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2017-10-13 13:15:36.023438', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2017-10-13 13:16:16.991122', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2017-10-13 13:16:59.290781', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2017-10-13 13:18:23.449050', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2017-10-13 13:18:56.395027', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2017-10-13 13:21:34.510031', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2017-10-13 13:22:08.055671', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2017-10-13 13:22:31.012843', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2017-10-13 13:26:37.312153', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2017-10-13 13:28:28.907814', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2017-10-13 13:29:02.235950', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2017-10-13 13:30:35.775261', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2017-10-13 13:31:13.106482', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2017-10-13 13:33:03.117233', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2017-10-13 13:33:35.929460', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2017-10-13 13:35:09.349523', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2017-10-13 13:35:56.488283', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2017-10-13 13:38:49.566374', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2017-10-13 13:39:37.835526', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2017-10-13 13:40:24.302225', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2017-10-13 13:40:53.631570', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2017-10-13 13:43:38.054301', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2017-10-13 13:45:20.759665', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2017-10-13 13:45:39.949126', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2017-10-13 13:46:03.443904', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2017-10-13 13:46:17.155538', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('82', '2017-10-13 21:28:30.201063', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('83', '2017-10-13 21:29:08.171699', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2017-10-13 21:30:19.927000', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('85', '2017-10-13 21:42:58.304481', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('86', '2017-10-14 00:41:26.671912', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('87', '2017-10-14 00:42:31.881046', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('88', '2017-10-14 00:43:01.634313', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('89', '2017-10-14 00:43:41.873052', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('90', '2017-10-14 00:48:53.908226', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('91', '2017-10-14 00:51:50.970704', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('92', '2017-10-14 00:55:02.253364', 'b\'\'', '6', 'Ubuntu上的docker和sentry安装', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('93', '2017-10-14 00:56:06.008777', 'b\'\'', '2', '2 - django网站需求分析', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('94', '2017-10-14 01:01:32.958088', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('95', '2017-10-14 01:02:20.654898', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('96', '2017-10-14 01:15:16.699500', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('97', '2017-10-15 14:14:03.768430', 'b\'\'', '1', '个人简介', 'change', '修改 profile', '20', '1');
INSERT INTO `xadmin_log` VALUES ('98', '2017-10-16 14:31:34.033016', 'b\'\'', '7', '6 - Django 博客首页视图', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('99', '2017-10-16 14:32:25.811810', 'b\'\'', '8', '7 - 点赞功能实现', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('100', '2017-10-16 14:32:59.175281', 'b\'\'', '9', '8 - 博客的收藏功能', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('101', '2017-10-16 14:33:14.448097', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 title', '12', '1');
INSERT INTO `xadmin_log` VALUES ('102', '2017-10-16 14:34:19.300564', 'b\'\'', '10', '9 - 博客分类显示', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('103', '2017-10-16 14:35:13.699590', 'b\'\'', '11', '10 - 博客分页', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('104', '2017-10-16 14:38:54.108271', 'b\'\'', '12', '11 - 网站评论功能实现', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('105', '2017-10-16 14:41:58.946642', 'b\'\'', '13', '12 - 用户中心(一)修改个人资料', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('106', '2017-10-16 14:42:45.333405', 'b\'\'', '14', '13 - 用户中心(二)修改邮箱和密码', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('107', '2017-10-16 14:43:43.896020', 'b\'\'', '15', '13 - 用户中心(三)添加用户收藏文章', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('108', '2017-10-16 14:43:52.900364', 'b\'\'', '15', '14 - 用户中心(三)添加用户收藏文章', 'change', '修改 title', '12', '1');
INSERT INTO `xadmin_log` VALUES ('109', '2017-10-16 14:44:50.986030', 'b\'\'', '16', '14 - 忘记密码？之后通过邮件修改密码', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('110', '2017-10-16 14:46:15.900525', 'b\'\'', '16', '15 - 忘记密码？之后通过邮件修改密码', 'change', '修改 title', '12', '1');
INSERT INTO `xadmin_log` VALUES ('111', '2017-10-16 14:48:02.460982', 'b\'\'', '17', '16 - 博客浏览计数功能', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('112', '2017-10-16 14:50:55.567778', 'b\'\'', '18', '17 - 博客上一篇和下一篇', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('113', '2017-10-16 14:59:07.916790', 'b\'\'', '13', '专题', 'change', '修改 name，parent 和 path', '14', '1');
INSERT INTO `xadmin_log` VALUES ('114', '2017-10-16 14:59:41.968693', 'b\'\'', '13', '专题', 'change', '没有字段被修改。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('115', '2017-10-16 15:17:22.125515', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('116', '2017-10-16 15:17:41.729824', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('117', '2017-10-16 15:18:47.696237', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 excerpt', '12', '1');
INSERT INTO `xadmin_log` VALUES ('118', '2017-10-16 15:19:18.421075', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('119', '2017-10-16 15:20:14.951476', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('120', '2017-10-16 15:24:44.939700', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('121', '2017-10-16 15:25:17.857363', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('122', '2017-10-16 15:29:48.345280', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('123', '2017-10-16 15:41:20.579776', 'b\'\'', '8', '7 - 博客点赞功能实现', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('124', '2017-10-16 15:45:50.019516', 'b\'\'', '9', '8 - 博客的收藏功能', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('125', '2017-10-16 15:46:07.186510', 'b\'\'', '9', '8 - 博客的收藏功能', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('126', '2017-10-16 17:31:12.298768', 'b\'\'', '13', '....个人随笔', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('127', '2017-10-16 17:31:54.736677', 'b\'\'', '13', '专题', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('128', '2017-10-17 22:09:43.722825', 'b\'\'', '5', '5 - 用户登录注册', 'change', '修改 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('129', '2017-10-17 22:09:56.316480', 'b\'\'', '5', '5 - 用户登录注册', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('130', '2017-10-17 22:20:38.589985', 'b\'\'', '5', '5 - 用户登录注册', 'change', '修改 excerpt 和 content', '12', '1');
INSERT INTO `xadmin_log` VALUES ('131', '2017-10-17 22:50:54.772039', 'b\'\'', '5', '5 - 用户登录注册', 'change', '修改 excerpt', '12', '1');
INSERT INTO `xadmin_log` VALUES ('132', '2017-10-18 00:03:39.691099', 'b\'\'', '13', '....个人日记', 'change', '修改 name 和 parent', '14', '1');
INSERT INTO `xadmin_log` VALUES ('133', '2017-10-18 11:32:02.131769', 'b\'\'', null, '', 'delete', '批量删除 5 个 用户信息', null, '1');
INSERT INTO `xadmin_log` VALUES ('134', '2017-10-18 12:37:30.060565', 'b\'\'', null, '', 'delete', '批量删除 46 个 邮箱验证码', null, '1');
INSERT INTO `xadmin_log` VALUES ('135', '2017-10-18 15:28:10.883351', 'b\'\'', '14', 'Michaeledusa', 'change', '修改 is_active 和 avatar', '11', '1');
INSERT INTO `xadmin_log` VALUES ('136', '2017-10-19 01:08:12.954001', 'b\'\'', '13', '夕象', 'change', '修改 is_active 和 avatar', '11', '1');
INSERT INTO `xadmin_log` VALUES ('137', '2017-10-19 21:56:59.149377', 'b\'\'', null, '', 'delete', '批量删除 4 个 用户信息', null, '1');
INSERT INTO `xadmin_log` VALUES ('138', '2017-10-19 23:33:22.169402', 'b\'\'', null, '', 'delete', '批量删除 1 个 用户信息', null, '1');
INSERT INTO `xadmin_log` VALUES ('139', '2017-10-19 23:33:40.965248', 'b\'\'', '19', '管理员', 'change', '修改 last_login，email 和 avatar', '11', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '3,2', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `xadmin_userwidget_user_id_c159233a_fk_user_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
INSERT INTO `xadmin_userwidget` VALUES ('2', 'home', 'list', '{\"model\": \"tools.view\", \"title\": \"用户浏览详情\"}', '1');
INSERT INTO `xadmin_userwidget` VALUES ('3', 'home', 'list', '{\"model\": \"tools.viewnum\", \"title\": \"用户浏览\"}', '1');
INSERT INTO `xadmin_userwidget` VALUES ('4', '个人博客', 'list', '{\"model\": \"post.article\", \"title\": \"博客\"}', '1');
