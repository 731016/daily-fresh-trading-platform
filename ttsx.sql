-- 创建用户表user
drop table if exists user;
CREATE TABLE user(
	account VARCHAR(255), # 账号
	password VARCHAR(255), #密码
	username VARCHAR(255) not null, #用户名,非空唯一
	email VARCHAR(255), #用户邮箱
	phone VARCHAR(255), #用户手机号
	shipping_id int(8), #收货地址编号
	state int(8) #帐号状态
)default charset=utf8;

-- 创建收货地址表 shipping_address
drop table if exists shipping_address;
create table shipping_address(
	shipping_id int(8), #收货地址编号
	shipping_name varchar(255), #收件人
	shipping_address varchar(255), #收货地址
	zip int(32), #邮编
	phone varchar(255) #手机号
)default charset=utf8;

-- 创建浏览记录表
drop table if exists history;
create table history(
	history_id int(8), #浏览记录编号
	account varchar(255), #账号
	good_id int(8) #商品编号
)default charset=utf8;

-- 创建订单表

drop table if EXISTS `order`;
create table `order`(
	`order` varchar(255), #订单编号
	account varchar(255), #账号
	good_id int(8), #商品编号
	good_number int(8), #购物车商品数量
	order_date datetime, #订单日期
	total_price double #总价格
)default charset=utf8;

-- 创建商品表goods
drop table if EXISTS goods;
create table goods(
	good_name varchar(255), #商品名称
	`DESCRIBE` varchar(255), #商品描述
	inventory int(8), #库存
	price double, #价格
	good_type int(8), #商品类型
	sales int(8), #商品销量
	picture varchar(255), #商品图片
	origin_place varchar(255), #原产地
	unit double(16,2) #单位
)default charset=utf8;

-- 创建购物车表sopping_cart
drop table if EXISTS sopping_cart;
create table sopping_cart(
cart_id int(16), #账号
good_id varchar(255), #商品编号（字符串，隔开）
good_number int(16) #购物车商品数量
)default charset=utf8;

-- 创建商品类型表goods_type
drop table if EXISTS goods_type;
create table goods_type(
type_id int(16), #商品类型编号
type_name varchar(255) #商品类型名称
)default charset=utf8;



