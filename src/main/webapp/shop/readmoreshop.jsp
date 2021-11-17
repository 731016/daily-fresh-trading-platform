<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>天天生鲜－商品列表</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!--头部开始-->
<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px" target="_blank">软帝项目</a></div>
    <div class="fr">
      <c:choose>
        <c:when test="${sessionScope.login != null}">
          <div class="login_info fl" style="display: block">
            欢迎您：<em>${login}</em>
            <a href="${pageContext.request.contextPath}/user/exit" class="zhuxiao">注销</a>
          </div>
        </c:when>
        <c:otherwise>
          <div class="login_btn fl" style="display:block">
            <a href="${pageContext.request.contextPath}/user/toLogin">登录</a>
            <span>|</span>
            <a href="${pageContext.request.contextPath}/user/toRegister">注册</a>
          </div>
        </c:otherwise>
      </c:choose>

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
<!--头部结束-->

<div class="search_bar clearfix">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="../images/logo.png"></a>
  <div class="search_con fl">
    <form method="get" action="" target="_blank">
      <input type="text" class="input_text fl" name="q" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
  <div class="guest_cart fr">
    <a href="${pageContext.request.contextPath}/user/shop.jsp" class="cart_name fl">我的购物车</a>
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
      <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
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
  <span>新鲜水果</span>
</div>

<div class="main_wrap clearfix">
  <div class="l_wrap fl clearfix">
    <div class="new_goods">
      <h3>新品推荐</h3>
      <ul>
        <li>
          <a href="shop_message.jsp"><img src="../images/所有商品/57ab290aN34f76b37.jpg"></a>
          <h4><a href="shop_message.jsp"> 越南进口红心火龙果 3个装 大果 单果约450~500g </a></h4>
          <div class="prize">￥33.90</div>
        </li>

        <li>
          <a href="shop_message.jsp"><img src="../images/所有商品/5b4871e6N072f0d74.jpg"></a>
          <h4><a href="shop_message.jsp">寻天果蔬 泰国山竹水果 京东生鲜 5A级 热带水果 2.5k</a></h4>
          <div class="prize">￥98.00</div>
        </li>


      </ul>
    </div>
  </div>

  <div class="r_wrap fr clearfix">
    <div class="sort_bar">

      <a href="#" class="active">默认</a>
      <a href="#">价格</a>
      <a href="#">人气</a>

    </div>

    <ul class="goods_type_list clearfix">
      <li>
        <a href="shop_message.html"><img src="../images/所有商品/57ab290aN34f76b37.jpg"></a>
        <h4><a href="http://ttsx.newzn.cn/goods/detail/45"> 越南进口红心火龙果 3个装 大果 单果约450~500g </a></h4>
        <div class="operate">
          <span class="prize">￥33.90</span>
          <span class="unit">33.90/1.94kg</span>
          <a href="javascript:;" class="add_goods" title="加入购物车"></a>
          <span name="spanid" style="display: none">45</span>
        </div>
      </li>

      <li>
        <a href="shop_message.html"><img src="../images/所有商品/5b4871e6N072f0d74.jpg"></a>
        <h4><a href="shop_message.html">寻天果蔬 泰国山竹水果 京东生鲜 5A级 热带水果 2.5k</a></h4>
        <div class="operate">
          <span class="prize">￥98.00</span>
          <span class="unit">98.00/1.0kg</span>
          <a href="javascript:;" class="add_goods" title="加入购物车"></a>
          <span name="spanid" style="display: none">44</span>
        </div>
      </li>

      <li>
        <a href="shop_message.html"><img src="../images/所有商品/5b18c158N35a55d7a.jpg"></a>
        <h4><a href="shop_message.html">中科农业 水果礼盒 水果提货券 礼券 238型 水果提货卡券</a></h4>
        <div class="operate">
          <span class="prize">￥238.00</span>
          <span class="unit">238.00/5.0kg</span>
          <a href="javascript:;" class="add_goods" title="加入购物车"></a>
          <span name="spanid" style="display: none">37</span>
        </div>
      </li>

      <li>
        <a href="shop_message.html"><img src="../images/所有商品/5b514c51N8170488f.jpg"></a>
        <h4><a href="shop_message.html">维叶新鲜水果香蕉约17-23条天宝水果生鲜青蕉 香蕉17-2</a></h4>
        <div class="operate">
          <span class="prize">￥29.90</span>
          <span class="unit">29.90/750g</span>
          <a href="javascript:;" class="add_goods" title="加入购物车"></a>
          <span name="spanid" style="display: none">33</span>
        </div>
      </li>

      <li>
        <a href="shop_message.html"><img src="../images/所有商品/59251bebNea0fc46f.jpg"></a>
        <h4><a href="http://ttsx.newzn.cn/goods/detail/3">Zespri佳沛 新西兰绿奇异果 12个</a></h4>
        <div class="operate">
          <span class="prize">￥39.70</span>
          <span class="unit">39.70/500g</span>
          <a href="javascript:;" class="add_goods" title="加入购物车"></a>
          <span name="spanid" style="display: none">3</span>
        </div>
      </li>

      <li>
        <a href="shop_message.html"><img src="../images/所有商品/58ec98efN3db99134.jpg"></a>
        <h4><a href="http://ttsx.newzn.cn/goods/detail/2">华圣 高原红富士苹果 6个装 1.2kg</a></h4>
        <div class="operate">
          <span class="prize">￥19.90</span>
          <span class="unit">19.90/500g</span>
          <a href="javascript:;" class="add_goods" title="加入购物车"></a>
          <span name="spanid" style="display: none">2</span>
        </div>
      </li>

      <li>
        <a href="shop_message.html"><img src="../images/所有商品/58e62d46Ndcc0a865.jpg"></a>
        <h4><a href="shop_message.html">千里山 海南金煌芒果 1.75kg装</a></h4>
        <div class="operate">
          <span class="prize">￥38.90</span>
          <span class="unit">38.90/500g</span>
          <a href="javascript:;" class="add_goods" title="加入购物车"></a>
          <span id="spanid" style="display: none">1</span>
        </div>
      </li>


    </ul>
    <div class="pagenation">
      <a class="active">1</a>
    </div>
  </div>
</div>

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
  <p>CopyRight © 2019 武汉软帝信息科技有限责任公司</p>
</div>
<!--底部 结束-->

<script>
    $(".add_goods").click(function () {

        $.get("/cart/updatecart/add/1/"+$(this).next().html()+"/1",function (data) {
            if (data.data != 0){
                $("#show_count").html(data.data);
            }
        });

    });
</script>
</body>
</html>
