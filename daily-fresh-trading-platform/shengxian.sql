SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unite` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_sku
-- ----------------------------
INSERT INTO `goods_sku` VALUES ('1', '鲜芒', '水果商品描述', '1.00', '个', 'images/goods/goods003.jpg', '21', '12', '1', '1', '1');
INSERT INTO `goods_sku` VALUES ('2', '加州提子', '水果商品描述', '1.00', '个', 'images/goods/goods003.jpg', '21', '12', '1', '1', '1');
INSERT INTO `goods_sku` VALUES ('3', '亚马逊牛油果', '水果商品描述', '1.00', '个', 'images/goods/goods003.jpg', '21', '12', '1', '1', '1');
INSERT INTO `goods_sku` VALUES ('4', '草莓', '水果商品描述', '30.00', '个', 'images/goods/goods003.jpg', '21', '12', '1', '1', '1');
INSERT INTO `goods_sku` VALUES ('5', '葡萄', '水果商品描述', '5.50', '个', 'images/goods/goods002.jpg', '21', '12', '1', '1', '1');
INSERT INTO `goods_sku` VALUES ('6', '柠檬', '水果商品描述', '3.90', '个', 'images/goods/goods001.jpg', '21', '12', '1', '1', '1');
INSERT INTO `goods_sku` VALUES ('7', '奇异果', '水果商品描述', '25.80', '个', 'images/goods/goods012.jpg', '21', '12', '1', '1', '1');
INSERT INTO `goods_sku` VALUES ('8', '河虾', '海产商品描述', '22.00', '个', 'images/goods/goods018.jpg', '22', '13', '1', '2', '2');
INSERT INTO `goods_sku` VALUES ('9', '扇贝', '海产商品描述', '46.00', '个', 'images/goods/goods019.jpg', '22', '13', '1', '2', '2');
INSERT INTO `goods_sku` VALUES ('10', '青岛野生海捕大青虾', '海产商品描述', '48.00', '个', 'images/goods/goods018.jpg', '22', '13', '1', '2', '2');
INSERT INTO `goods_sku` VALUES ('11', '冷冻秋刀鱼', '海产商品描述', '19.00', '个', 'images/goods/goods020.jpg', '22', '13', '1', '2', '2');
INSERT INTO `goods_sku` VALUES ('12', '基围虾', '海产商品描述', '25.00', '个', 'images/goods/goods021.jpg', '22', '13', '1', '2', '2');
INSERT INTO `goods_sku` VALUES ('13', '维多利亚葡萄', '所有商品描述', '38.00', '个', 'images/goods.jpg', '23', '14', '1', '3', '3');
INSERT INTO `goods_sku` VALUES ('14', '维多利亚葡萄', '所有商品描述', '38.00', '个', 'images/goods.jpg', '24', '15', '1', '4', '4');
INSERT INTO `goods_sku` VALUES ('15', '维多利亚葡萄', '所有商品描述', '38.00', '个', 'images/goods.jpg', '25', '16', '1', '5', '5');
INSERT INTO `goods_sku` VALUES ('16', '维多利亚葡萄', '所有商品描述', '38.00', '个', 'images/goods.jpg', '26', '17', '1', '6', '6');

-- ----------------------------
-- Table structure for goods_spu
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu`;
CREATE TABLE `goods_spu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_spu
-- ----------------------------
INSERT INTO `goods_spu` VALUES ('1', '水果', '高品质低价格');
INSERT INTO `goods_spu` VALUES ('2', '海产', '极致爽滑');
INSERT INTO `goods_spu` VALUES ('3', '猪羊', '想吃就吃');
INSERT INTO `goods_spu` VALUES ('4', '禽蛋', '新鲜美味');
INSERT INTO `goods_spu` VALUES ('5', '蔬菜', '安全放心');
INSERT INTO `goods_spu` VALUES ('6', '速冻', '冰爽美味');

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES ('1', '新鲜水果', 'fruit', 'images/banner01.jpg');
INSERT INTO `goods_type` VALUES ('2', '海鲜水产', 'seafood', 'images/banner02.jpg');
INSERT INTO `goods_type` VALUES ('3', '猪牛羊肉', 'meet', 'images/banner03.jpg');
INSERT INTO `goods_type` VALUES ('4', '禽类蛋品', 'egg', 'images/banner04.jpg');
INSERT INTO `goods_type` VALUES ('5', '新鲜蔬菜', 'vegetables', 'images/banner05.jpg');
INSERT INTO `goods_type` VALUES ('6', '速冻食品', 'ice', 'images/banner06.jpg');

-- ----------------------------
-- Table structure for index_banner
-- ----------------------------
DROP TABLE IF EXISTS `index_banner`;
CREATE TABLE `index_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `od` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_banner
-- ----------------------------
INSERT INTO `index_banner` VALUES ('1', 'images/slide.jpg', '1', '1');
INSERT INTO `index_banner` VALUES ('2', 'images/slide02.jpg', '2', '2');
INSERT INTO `index_banner` VALUES ('3', 'images/slide03.jpg', '3', '3');
INSERT INTO `index_banner` VALUES ('4', 'images/slide04.jpg', '4', '4');

-- ----------------------------
-- Table structure for index_promotion
-- ----------------------------
DROP TABLE IF EXISTS `index_promotion`;
CREATE TABLE `index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `od` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_promotion
-- ----------------------------
INSERT INTO `index_promotion` VALUES ('1', '吃货节', '#', '/images/adv01.jpg', '1');
INSERT INTO `index_promotion` VALUES ('2', '零元party', '#', '/images/adv02.jpg', '2');

-- ----------------------------
-- Table structure for index_type_goods
-- ----------------------------
DROP TABLE IF EXISTS `index_type_goods`;
CREATE TABLE `index_type_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_type` int(11) DEFAULT NULL,
  `od` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_type_goods
-- ----------------------------
INSERT INTO `index_type_goods` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `index_type_goods` VALUES ('2', '1', '2', '8', '2');
INSERT INTO `index_type_goods` VALUES ('3', '1', '3', '13', '3');
INSERT INTO `index_type_goods` VALUES ('4', '1', '4', '14', '4');
INSERT INTO `index_type_goods` VALUES ('5', '1', '5', '15', '5');
INSERT INTO `index_type_goods` VALUES ('6', '1', '6', '16', '6');
INSERT INTO `index_type_goods` VALUES ('7', '1', '7', '5', '1');
INSERT INTO `index_type_goods` VALUES ('8', '1', '8', '6', '1');
INSERT INTO `index_type_goods` VALUES ('9', '1', '9', '7', '1');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) NOT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_name` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'student:yq', '2019-10-09');
INSERT INTO `t_permission` VALUES ('2', 'student:study', '2019-10-09');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `create_time` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'banzhang', '2019-10-09');
INSERT INTO `t_role` VALUES ('2', 'student', '2019-10-09');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_id` (`permission_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1', '1');
INSERT INTO `t_role_permission` VALUES ('2', '2', '1');
INSERT INTO `t_role_permission` VALUES ('3', '2', '2');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('2', '1', '2');
INSERT INTO `t_user_role` VALUES ('3', '2', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xbh123456', 'bDFoDp3s3qwsa9LLhbf2Q++dBK1tnXUl++NRmFeYOVY=', '2956594475@qq.com', '9e8587e7-4060-4d3b-a13d-5c774a6e8509');
