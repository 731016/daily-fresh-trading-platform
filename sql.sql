-- 创建用户表user
drop table if exists user;
CREATE TABLE user(
	account VARCHAR(50) primary key, # 账号
	pwd VARCHAR(50), #密码
	username VARCHAR(50) not null, #用户名,非空唯一
	email VARCHAR(50), #用户邮箱
	phone VARCHAR(50), #用户手机号
	shipping_id int, #收货地址编号
	state int #帐号状态
)default charset=utf8;

-- 创建收货地址表 shipping_address
drop table if exists shipping_address;
create table shipping_address(
	shipping_id int auto_increment primary key, #收货地址编号
	account varchar(50), #账号
	shipping_name varchar(50), #收件人
	shipping_address varchar(50), #收货地址
	zip int, #邮编
	phone varchar(50) #手机号
)default charset=utf8;

-- 创建浏览记录表
drop table if exists history;
create table history(
	history_id int auto_increment primary key, #浏览记录编号
	account varchar(50), #账号
	goods_id int, #商品编号
	history_date datetime  #浏览记录时间
)default charset=utf8;

-- 创建订单表

drop table if EXISTS goods_order;
create table goods_order(
	order_id varchar(255), #订单编号
	account varchar(50), #账号
	goods_id int, #商品编号
	goods_number int, #购物车商品数量
	order_date datetime, #订单日期
	total_price double #总价格
)default charset=utf8;

-- 创建商品表goods
drop table if EXISTS goods;
create table goods(
  goods_id int auto_increment primary key, #商品编号
	goods_name varchar(255), #商品名称
	goods_describe varchar(255), #商品描述
	inventory int(8), #库存
	price double, #价格
	type_id int(8), #商品类型
	sales int(8), #商品销量
	picture varchar(255), #商品图片
	origin_place varchar(255), #原产地
	unit varchar(50) #单位
)default charset=utf8;

-- 创建购物车表shopping_cart
drop table if EXISTS shopping_cart;
create table shopping_cart(
cart_id int auto_increment primary key, #购物车编号
account varchar(50), #账号
goods_id int, #商品编号
goods_number int #购物车商品数量
)default charset=utf8;

-- 创建商品类型表goods_type
drop table if EXISTS goods_type;
create table goods_type(
type_id int auto_increment primary key, #商品类型编号
type_name varchar(50), #商品类型名称
type_img varchar(50), #商品类型图片
type_class varchar(50) #商品类型样式
)default charset=utf8;


insert into goods values(default,"越南进口红心火龙果 ","3个装 大果 单果约450~500g",500,30.9,1,1000,"shuiguo1.jpg","越南","0.5kg");

insert into goods values(default,"维叶新鲜水果香蕉  ","约17-23条天宝水果生鲜青蕉",500,15.7,1,1000,"shuiguo2.jpg","武汉","2kg");

insert into goods values(default,"新西兰绿奇异果  ","12个",500,22.5,1,1000,"shuiguo3.jpg","新西兰 ","2kg");

insert into goods values(default,"海南金煌芒果  ","1.75kg装",500,25.6,1,1000,"shuiguo5.jpg","海南","1.75kg");

insert into goods values(default,"高原红富士苹果 "," 6个装 1.2kg",500,18.7,1,1000,"shuiguo7.jpg","华盛","1.2kg");

insert into goods values(default,"泰国山竹水果 ","6个装 大果 单果约45~50g",500,37.5,1,1000,"shuiguo8.jpg","泰山","0.3kg");


insert into goods values(default,"阳澄湖大闸蟹","1988型公4.0两 母3.0两 ",500,109.5,2,1000,"shuichan1.jpg","阳澄湖","3kg");

insert into goods values(default,"冷冻阿拉斯加黄金鲽鱼  "," 1kg 2-3条",500,99.9,2,1000,"shuichan2.jpg","阿拉斯加","2kg");

insert into goods values(default,"大洋世家 原装进口冷冻阿根廷红虾   ","12个",500,88.8,2,1000,"shuichan3.jpg","阿根廷 ","3kg");

insert into goods values(default,"Ωmega 原装进口熟冻新西兰全壳青口贝  ","1.75kg装",500,56.0,2,1000,"shuiguo4.jpg","新西兰","1.75kg");


insert into goods values(default,"领券199减100【周黑鸭_锁鲜】卤鸭脖","320g鸭锁骨240 ",500,47,3,1000,"roulei1.jpg","武汉","320kg");

insert into goods values(default,"如意三宝  澳洲进口原切牛排套餐 菲力4片  "," 10片/1540g",500,110,3,1000,"roulei4.jpg","澳洲","1.54kg");

insert into goods values(default,"恒都 羔羊排    ","1.2kg/袋 烧烤食材",500,105,3,1000,"roulei3.jpg","阿根廷 ","1.2kg");

insert into goods values(default,"精气神 猪肉馅  ","(70%瘦肉) 400g",500,38.7,3,1000,"shuiguo2.jpg","新西兰","0.4kg");


insert into goods values(default,"边大哥 散养鲜鹅蛋 ","12枚 ",500,29.8,4,1000,"danlei3.jpg","武汉","1kg");

insert into goods values(default,"神邮牌咸鸭蛋"," （熟65g*20只）真空",500,25.4,4,1000,"danlei1.jpg","高邮","1.25kg");

insert into goods values(default,"德青源 爱的鲜鸡蛋 ","32枚 ",500,24.3,4,1000,"danlei2.jpg","德青源 ","4kg");

insert into goods values(default,"春朝 新鲜鸽子蛋"," 10枚",500,30.5,4,1000,"shuiguo4.jpg","新西兰","5kg");


insert into goods values(default,"蔡家洼 北京密云茴香菜 饺子馅新鲜蔬菜 "," 500g ",500,7.7,5,1000,"shucai1.jpg","武汉","0.5kg");

insert into goods values(default,"有机汇 有机蔬菜套餐 3口之家 新鲜蔬菜 *","宅配 月度 6斤",500,8.8,5,1000,"shucai3.jpg","高邮","3kg");

insert into goods values(default,"富爸爸 韩国风味泡菜 切件瓶装白菜泡菜 ","酸爽可口",500,9.9,5,1000,"shucai4.jpg","德青源 ","2kg");

insert into goods values(default,"聚怀斋 焦作温县沙土铁棍山药 "," 3kg礼盒",500,17.4,5,1000,"shucai2.jpg","新西兰","3kg");

insert into goods values(default,"元祖 GANSO 奶油水果鲜奶蛋糕 生日蛋糕同城配送 甜蜜如"," 500g ",500,209.6,6,1000,"sudong6.jpg","武汉","0.5kg");

insert into goods values(default,"八喜 冰淇淋 甜筒组合装  脆皮甜筒","巧克力口味 68g*5支",500,55.5,6,1000,"sudong5.jpg","高邮","0.35kg");

insert into goods values(default,"伊利 畅轻 风味发酵乳"," 燕麦+黄桃口味酸奶酸牛奶 250g*",500,12.8,6,1000,"sudong2.jpg","德青源 ","0.25kg");

insert into goods values(default,"一品奶黄包","  350g （10只）",500,15.7,6,1000,"sudong1.jpg","新西兰","3.5kg");


-- 商品类型数据
insert into goods_type values(default,'新鲜水果','banner01.jpg','fruit');
insert into goods_type values(default,'海鲜水产','banner02.jpg','seafood');
insert into goods_type values(default,'猪牛羊肉','banner03.jpg','meet');
insert into goods_type values(default,'禽类蛋品','banner04.jpg','egg');
insert into goods_type values(default,'新鲜蔬菜','banner05.jpg','vegetables');
insert into goods_type values(default,'速冻食品','banner06.jpg','ice');