<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8"/>

  <title>天天生鲜－商品详情</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

  <style>
    .tab_content dl dd ul {
      margin: 0px;
      padding: 20px 0px 0px;
      list-style: none;
      overflow: hidden;
      color: #666666;
      font-family: tahoma, arial, & #39, Microsoft YaHei & #39, & #39, Hiragino Sans GB & #39, u5b8bu4f53, sans-serif;
    }

    .tab_content dl dd ul li {
      margin: 0px 0px 5px;
      padding: 0px 0px 0px 42px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      width: 200px;
      float: left;
    }
  </style>
</head>
<body>

<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px" target="_blank">软帝项目</a>
    </div>
    <div class="fr">

      <div class="login_info fl" style="display: block">
        欢迎您：<em>joyous</em>
        <a href="${pageContext.request.contextPath}/user/exit" class="zhuxiao">注销</a>
      </div>
      <div class="login_btn fl" style="display:none">
        <a href="${pageContext.request.contextPath}/user/toLogin">登录</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/toRegister">注册</a>
      </div>


      <div class="user_link fl">
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/customer.jsp">用户中心</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/shop.jsp">我的购物车</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/order.jsp">我的订单</a>
      </div>
    </div>
  </div>
</div>

<div class="search_bar clearfix">
  <a href="shop_message.jsp" class="logo fl"><img src="../images/logo.png"></a>
  <div class="search_con fl">
    <form method="get" action="" target="_blank">
      <input type="text" class="input_text fl" name="q" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
  <div class="guest_cart fr">
    <a href="shop.html" class="cart_name fl">我的购物车</a>
    <div class="goods_count fl" id="show_count">3</div>
  </div>
</div>

<div class="navbar_con">
  <div class="navbar clearfix">
    <div class="subnav_con fl">
      <h1>全部商品分类</h1>
      <span></span>
      <ul class="subnav">
        <li><a href="#" class="fruit">新鲜水果</a></li>
        <li><a href="#" class="seafood">海鲜水产</a></li>
        <li><a href="#" class="meet">猪牛羊肉</a></li>
        <li><a href="#" class="egg">禽类蛋品</a></li>
        <li><a href="#" class="vegetables">新鲜蔬菜</a></li>
        <li><a href="#" class="ice">速冻食品</a></li>
      </ul>
    </div>
    <ul class="navlist fl">
      <li><a href="../index.jsp">首页</a></li>
      <li class="interval">|</li>
      <li><a href="#">手机生鲜</a></li>
      <li class="interval">|</li>
      <li><a href="#">抽奖</a></li>
    </ul>
  </div>
</div>

<div class="breadcrumb">
  <a href="../index.jsp">全部分类</a>
  <span>&gt;</span>
  <a href="#">新鲜水果</a>
  <span>&gt;</span>
  <span>商品详情</span>
</div>

<div class="goods_detail_con clearfix">
  <div class="goods_detail_pic fl"><img src="../images/所有商品/57ab290aN34f76b37.jpg"></div>

  <div class="goods_detail_list fr">
    <h3> 越南进口红心火龙果 3个装 大果 单果约450~500g </h3>
    <p>越南直采 精选大果】果肉更足，享受饱满的甜蜜诱惑！红果富含花青素，天然抗氧化营养库！泰国金枕榴莲火爆促销中，点我直达，萨瓦迪卡。</p>
    <div class="prize_bar">
      <span class="show_pirze">¥<em id="danjia">33.90</em></span>
      <span class="show_unit">单  位：1.94kg</span>
    </div>
    <div class="goods_num clearfix">
      <div class="num_name fl">数 量：</div>
      <div class="num_add fl">
        <input type="text" class="num_show fl" id="shuliang" value="1">
        <a href="javascript:;" class="add fr" id="jiahao">+</a>
        <a href="javascript:;" class="minus fr" id="jianhao">-</a>
      </div>
    </div>
    <div class="total">总价：<em id="zongjia">33.90</em>元</div>
    <div class="operate_btn">
      <a href="javascript:;" class="buy_btn" id="buy_btn">立即购买</a>
      <a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
    </div>
  </div>
</div>

<div class="main_wrap clearfix">
  <div class="l_wrap fl clearfix">
    <div class="new_goods">
      <h3>新品推荐</h3>
      <ul>
        <li>
          <a href=""><img src="../images/所有商品/57ab290aN34f76b37.jpg"></a>
          <h4><a href="shop_message.html"> 越南进口红心火龙果 3个装 大果 单果约450~500g </a></h4>
          <div class="prize">￥33.90</div>
        </li>

        <li>
          <a href=""><img src="../images/所有商品/5b4871e6N072f0d74.jpg"></a>
          <h4><a href="shop_message.html">寻天果蔬 泰国山竹水果 京东生鲜 5A级 热带水果 2.5k</a></h4>
          <div class="prize">￥98.00</div>
        </li>
      </ul>
    </div>
  </div>

  <div class="r_wrap fr clearfix">
    <ul class="detail_tab clearfix">
      <li class="active">商品介绍</li>
      <li>评论</li>
    </ul>

    <div class="tab_content">
      <dl>
        <dt>商品详情：</dt>
        <dd>
          <ul id="parameter-brand" class="p-parameter-list">
            <li title="京东生鲜">品牌：&nbsp;<span style="color: #5e69ad;">京东生鲜</span></li>
          </ul>
          <ul class="parameter2 p-parameter-list">
            <li>商品名称：京东生鲜越南进口 红心火龙果3个装 单果约500g</li>
            <li title="3048509">商品编号：3048509</li>
            <li title="1.94kg">商品毛重：1.94kg</li>
            <li title="越南">商品产地：越南</li>
            <li title="1kg-2kg">重量：1kg-2kg</li>
            <li title="进口">国产/进口：进口</li>
            <li title="红心火龙果">分类：红心火龙果</li>
            <li title="简装">包装：简装</li>
            <li title="越南">原产地：越南</li>
          </ul>
        </dd>
      </dl>
    </div>

  </div>
</div>

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
  <p>CopyRight © 2019 武汉软帝信息科技有限责任公司</p>
</div>

<div class="add_jump"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/shop_message.js"></script>
</body>
</html>
