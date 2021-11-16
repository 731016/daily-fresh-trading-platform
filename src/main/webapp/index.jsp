<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>天天生鲜－首页</title>
  <link rel="stylesheet" type="text/css" href="css/reset.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="js/slide.js"></script>
</head>
<body>
<!--头部  开始-->
<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px" target="_blank">软帝项目</a></div>
    <div class="fr">
      <div class="login_info fl">Tom
        欢迎您：<em>""</em>
        <a href="login.jsp" class="zhuxiao">注销</a>
      </div>
      <div class="login_btn fl">
        <a href="login.jsp">登录</a>
        <span>|</span>
        <a href="register.jsp">注册</a>
      </div>

      <div class="user_link fl">
        <span>|</span>
        <a href="customer.jsp">用户中心</a>
        <span>|</span>
        <a href="shop.jsp">我的购物车</a>
        <span>|</span>
        <a href="order.jsp">我的订单</a>
      </div>
    </div>
  </div>
</div>
<!--头部 结束-->

<!--导航和轮播部分 开始-->
<div class="search_bar clearfix">
  <a href="#" class="logo fl"><img src="images/logo.png"></a>
  <div class="search_con fl">
    <form method="get" action="" target="_blank">
      <input type="text" class="input_text fl" name="" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
  <div class="guest_cart fr">
    <a href="shop.jsp" class="cart_name fl">我的购物车</a>
    <div class="goods_count fl" id="show_count">3</div>
  </div>
</div>

<div class="navbar_con">
  <div class="navbar">
    <h1 class="fl">全部商品分类</h1>
    <ul class="navlist fl">
      <li><a href="#">首页</a></li>
      <li class="interval">|</li>
      <li><a href="#">手机生鲜</a></li>
      <li class="interval">|</li>
      <li><a href="#">抽奖</a></li>
    </ul>
  </div>
</div>

<div class="center_con clearfix">
  <ul class="subnav fl">
    <li><a href="#model01" class="fruit">新鲜水果</a></li>
    <li><a href="#model02" class="seafood">海鲜水产</a></li>
    <li><a href="#model03" class="meet">猪牛羊肉</a></li>
    <li><a href="#model04" class="egg">禽类蛋品</a></li>
    <li><a href="#model05" class="vegetables">新鲜蔬菜</a></li>
    <li><a href="#model06" class="ice">速冻食品</a></li>
  </ul>
  <div class="slide fl">
    <ul class="slide_pics">
      <li><img src="images/所有商品/slide.jpg" alt="幻灯片"></li>
      <li><img src="images/所有商品/slide02.jpg" alt="幻灯片"></li>
      <li><img src="images/所有商品/slide03.jpg" alt="幻灯片"></li>
      <li><img src="images/所有商品/slide04.jpg" alt="幻灯片"></li>
    </ul>
    <div class="prev"></div>
    <div class="next"></div>
    <ul class="points"></ul>
  </div>

  <div class="adv fl">
    <a href="#"><img src="images/所有商品/adv01.jpg"></a>
    <a href="#"><img src="images/所有商品/adv02.jpg"></a>
  </div>
</div>
<!--导航和轮播部分 结束-->

<!--全部商品 开始-->
<div class="list_model">
  <div class="list_title clearfix">
    <h3 class="fl" id="model01">新鲜水果</h3>
    <div class="subtitle fl">
      <span>|</span>
      <a href="shop_message.jsp"> 越南进口红心火龙果 3个装 大果 单果约450~500g </a>

      <a href="shop_message.jsp">千里山 海南金煌芒果 1.75kg装</a>

      <a href="shop_message.jsp">寻天果蔬 泰国山竹水果 京东生鲜 5A级 热带水果 2.5k</a>

      <a href="shop_message.jsp">华圣 高原红富士苹果 6个装 1.2kg</a>
    </div>
    <a href="readmoreshop.jsp" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
  </div>

  <div class="goods_con clearfix">
    <div class="goods_banner fl"><img src="images/所有商品/banner01.jpg"></div>
    <ul class="goods_list fl">
      <li>
        <h4><a href="shop_message.jsp"> 越南进口红心火龙果 3个装 大果 单果约450~500g </a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/57ab290aN34f76b37.jpg"></a>
        <div class="prize">¥ 33.90</div>
      </li>

      <li>
        <h4><a href="shop_message.jsp">寻天果蔬 泰国山竹水果 京东生鲜 5A级 热带水果 2.5k</a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/5b4871e6N072f0d74.jpg"></a>
        <div class="prize">¥ 98.00</div>
      </li>

      <li>
        <h4><a href="shop_message.jsp">中科农业 水果礼盒 水果提货券 礼券 238型 水果提货卡券</a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/5b18c158N35a55d7a.jpg"></a>
        <div class="prize">¥ 238.00</div>
      </li>

      <li>
        <h4><a href="shop_message.jsp">维叶新鲜水果香蕉约17-23条天宝水果生鲜青蕉 香蕉17-2</a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/5b514c51N8170488f.jpg"></a>
        <div class="prize">¥ 29.90</div>
      </li>
    </ul>
  </div>
</div>

<div class="list_model">
  <div class="list_title clearfix">
    <h3 class="fl" id="model02">海鲜水产</h3>
    <div class="subtitle fl">
      <span>|</span>
      <a href="shop_message.jsp">大洋世家 原装进口冷冻阿根廷红虾 L1</a>

      <a href="shop_message.jsp">Ωmega 原装进口熟冻新西兰全壳青口贝</a>

      <a href="shop_message.jsp">三都港 冷冻无公害黄花鱼 700g 2条</a>

      <a href="shop_message.jsp">阳澄联合 阳澄湖大闸蟹礼券1988型公4.0两 母3.0两 </a>
    </div>
    <a href="readmoreshop.jsp" class="goods_more fr">查看更多 &gt;</a>
  </div>

  <div class="goods_con clearfix">
    <div class="goods_banner fl"><img src="images/所有商品/banner02.jpg"></div>
    <ul class="goods_list fl">
      <li>
        <h4><a href="shop_message.jsp">阳澄联合 阳澄湖大闸蟹礼券1988型公4.0两 母3.0两 </a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/5b2c5716N1a1c07b1.jpg"></a>
        <div class="prize">¥ 199.00</div>
      </li>

      <li>
        <h4><a href="shop_message.jsp">Ocean Gala 冷冻阿拉斯加黄金鲽鱼 1kg 2-3条</a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/5addb366Nb137c891.jpg"></a>
        <div class="prize">¥ 35.90</div>
      </li>

      <li>
        <h4><a href="shop_message.jsp">大洋世家 原装进口冷冻阿根廷红虾 L1</a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/577f85a7N39f40c35.jpg"></a>
        <div class="prize">¥ 138.00</div>
      </li>

      <li>
        <h4><a href="shop_message.jsp">Ωmega 原装进口熟冻新西兰全壳青口贝</a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/57c4e212N9e09772f.jpg"></a>
        <div class="prize">¥ 49.90</div>
      </li>
    </ul>
  </div>
</div>

<div class="list_model">
  <div class="list_title clearfix">
    <h3 class="fl" id="model03">猪牛羊肉</h3>
    <div class="subtitle fl">
      <span>|</span>
      <a href="shop_message.jsp">精气神 猪肉馅(70%瘦肉) 400g/</a>

      <a href="shop_message.jsp">恒都 羔羊排 1.2kg/袋 烧烤食材</a>

      <a href="shop_message.jsp">恒都 菲力西冷牛排套餐 1.5kg/袋</a>

      <a href="shop_message.jsp">领券199减100【周黑鸭_锁鲜】卤鸭脖320g鸭锁骨240</a>


    </div>
    <a href="readmoreshop.jsp" class="goods_more fr">查看更多 &gt;</a>
  </div>

  <div class="goods_con clearfix">
    <div class="goods_banner fl"><img src="images/所有商品/banner03.jpg"></div>
    <ul class="goods_list fl">
      <li>
        <h4><a href="shop_message.jsp">领券199减100【周黑鸭_锁鲜】卤鸭脖320g鸭锁骨240</a></h4>
        <a href="shop_message.jsp"><img src="images/所有商品/5ac2ee43N56cf06b0.jpg"></a>
        <div class="prize">¥ 118.90</div>
      </li>

      <li>
        <h4><a href="shop_message.jsp">如意三宝 10片/1540g 澳洲进口原切牛排套餐 菲力4片</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/59ba49beNfa4afb17.jpg"></a>
        <div class="prize">¥ 265.00</div>
      </li>

      <li>
        <h4><a href="shop_message.html">恒都 羔羊排 1.2kg/袋 烧烤食材</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/57e3aea6N5d8f4459.jpg"></a>
        <div class="prize">¥ 59.90</div>
      </li>

      <li>
        <h4><a href="shop_message.html">精气神 猪肉馅(70%瘦肉) 400g/</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/57cd6554N11b56a5e.jpg"></a>
        <div class="prize">¥ 9.90</div>
      </li>
    </ul>
  </div>
</div>

<div class="list_model">
  <div class="list_title clearfix">
    <h3 class="fl" id="model04">禽类蛋品</h3>
    <div class="subtitle fl">
      <span>|</span>
      <a href="shop_message.html">正大食品CP 单冻鸡翅中 1000g/袋</a>

      <a href="shop_message.html">高邮神邮牌咸鸭蛋（熟65g*20只）真空</a>

      <a href="shop_message.html">德青源 爱的鲜鸡蛋 32枚</a>

      <a href="shop_message.html">边大哥 散养鲜鹅蛋 12枚</a>
    </div>
    <a href="readmoreShop.html" class="goods_more fr">查看更多 &gt;</a>
  </div>

  <div class="goods_con clearfix">
    <div class="goods_banner fl"><img src="images/所有商品/banner04.jpg"></div>
    <ul class="goods_list fl">
      <li>
        <h4><a href="shop_message.html">边大哥 散养鲜鹅蛋 12枚</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/5927942eN14545b4d.jpg"></a>
        <div class="prize">¥ 109.00</div>
      </li>

      <li>
        <h4><a href="shop_message.html">春朝 新鲜鸽子蛋 10枚</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/590c63b4N63036e65.jpg"></a>
        <div class="prize">¥ 57.00</div>
      </li>

      <li>
        <h4><a href="shop_message.html">高邮神邮牌咸鸭蛋（熟65g*20只）真空</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/57481b77Nbed0cff5.jpg"></a>
        <div class="prize">¥ 39.99</div>
      </li>

      <li>
        <h4><a href="shop_message.html">德青源 爱的鲜鸡蛋 32枚</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/57b5151aN00a63bf1.jpg"></a>
        <div class="prize">¥ 36.50</div>
      </li>
    </ul>
  </div>
</div>

<div class="list_model">
  <div class="list_title clearfix">
    <h3 class="fl" id="model05">新鲜蔬菜</h3>
    <div class="subtitle fl">
      <span>|</span>
      <a href="shop_message.html">BOLTHOUSE 美国原装进口 水果胡</a>

      <a href="shop_message.html">聚怀斋 焦作温县沙土铁棍山药 3kg礼盒</a>

      <a href="shop_message.html">富爸爸 韩国风味泡菜 切件瓶装白菜泡菜</a>

      <a href="shop_message.html">有机汇 有机蔬菜套餐 3口之家 新鲜蔬菜 宅配 月度 6斤*</a>
    </div>
    <a href="readmoreShop.html" class="goods_more fr">查看更多 &gt;</a>
  </div>

  <div class="goods_con clearfix">
    <div class="goods_banner fl"><img src="images/所有商品/banner05.jpg"></div>
    <ul class="goods_list fl">
      <li>
        <h4><a href="shop_message.html">蔡家洼 北京密云茴香菜 饺子馅新鲜蔬菜 500g</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/5a389d24N39ad0079.jpg"></a>
        <div class="prize">¥ 11.20</div>
      </li>

      <li>
        <h4><a href="shop_message.html">有机汇 有机蔬菜套餐 3口之家 新鲜蔬菜 宅配 月度 6斤*</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/594c8c8fN707ca024.jpg"></a>
        <div class="prize">¥ 67.00</div>
      </li>

      <li>
        <h4><a href="shop_message.html">富爸爸 韩国风味泡菜 切件瓶装白菜泡菜</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/57a9a823N2c38934e.jpg"></a>
        <div class="prize">¥ 19.90</div>
      </li>

      <li>
        <h4><a href="shop_message.html">聚怀斋 焦作温县沙土铁棍山药 3kg礼盒</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/57fee44fN7427cd09.jpg"></a>
        <div class="prize">¥ 59.00</div>
      </li>
    </ul>
  </div>
</div>

<div class="list_model">
  <div class="list_title clearfix">
    <h3 class="fl" id="model06">速冻食品</h3>
    <div class="subtitle fl">
      <span>|</span>
      <a href="shop_message.html">一品奶黄包 350g （10只）</a>

      <a href="shop_message.html">湾仔码头 手工水饺 玉米蔬菜猪肉口味 7</a>

      <a href="shop_message.html">上汤小云吞 鲜美虾皇口味 600g</a>

      <a href="shop_message.html">元祖 GANSO 奶油水果鲜奶蛋糕 生日蛋糕同城配送 甜蜜如</a>
    </div>
    <a href="readmoreShop.html" class="goods_more fr">查看更多 &gt;</a>
  </div>

  <div class="goods_con clearfix">
    <div class="goods_banner fl"><img src="images/所有商品/banner06.jpg"></div>
    <ul class="goods_list fl">
      <li>
        <h4><a href="shop_message.html">元祖 GANSO 奶油水果鲜奶蛋糕 生日蛋糕同城配送 甜蜜如</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/59eaf320N10e96d9e.jpg"></a>
        <div class="prize">¥ 158.00</div>
      </li>

      <li>
        <h4><a href="shop_message.html">八喜 冰淇淋 甜筒组合装 巧克力口味 68g*5支 脆皮甜筒</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/57b587b6N97ef9e91.jpg"></a>
        <div class="prize">¥ 29.00</div>
      </li>

      <li>
        <h4><a href="shop_message.html">伊利 畅轻 风味发酵乳 燕麦+黄桃口味酸奶酸牛奶 250g*</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/5af04933N83958117.jpg"></a>
        <div class="prize">¥ 8.50</div>
      </li>

      <li>
        <h4><a href="shop_message.html">一品奶黄包 350g （10只）</a></h4>
        <a href="shop_message.html"><img src="images/所有商品/5523aa83N67e99470.jpg"></a>
        <div class="prize">¥ 11.90</div>
      </li>
    </ul>
  </div>
</div>
<!--全部商品 结束-->

<!--底部 开始-->
<div class="footer login_footer">
  <div class="links">
    <a href="">关于软帝</a>
    <span>|</span>
    <a href="">热门培训</a>
    <span>|</span>
    <a href="">联系我们</a>
    <span>|</span>
    <a href="">在线报名</a>
  </div>
  <p>CopyRight &copy; 2019 武汉软帝信息科技有限责任公司</p>
</div>
<!--底部 结束-->
</body>
</html>
