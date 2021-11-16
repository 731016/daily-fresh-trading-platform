<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/16
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <title>天天生鲜－用户中心</title>
  <link rel="stylesheet" type="text/css" href="css/reset.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<!--头部 开始-->
<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px" target="_blank">软帝项目</a></div>
    <div class="fr">
      <div class="login_info fl" style="display: block">
        欢迎您：<em>Tom</em>
        <a href="login.jsp" class="zhuxiao">注销</a>
      </div>
      <div class="login_btn fl" style="display:none">
        <a href="login.jsp">登录</a>
        <span>|</span>
        <a href="register.jsp">注册</a>
      </div>

      <div class="user_link fl">
        <span>|</span>
        <a href="#">用户中心</a>
        <span>|</span>
        <a href="shop.jsp">我的购物车</a>
        <span>|</span>
        <a href="order.jsp">我的订单</a>
      </div>
    </div>
  </div>
</div>
<!--头部 结束-->
<!--内容 开始-->
<div class="search_bar clearfix">
  <a href="index.jsp" class="logo fl"><img src="images/logo.png"></a>
  <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
  <div class="search_con fr">
    <form method="get" action="" target="_blank">
      <input type="text" class="input_text fl" name="q" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
</div>
<div class="main_con clearfix">
  <div class="left_menu_con clearfix">
    <h3>用户中心</h3>
    <ul>
      <li><a href="#" class="active">· 个人信息</a></li>
      <li><a href="order.jsp">· 全部订单</a></li>
      <li><a href="address.jsp">· 收货地址</a></li>
    </ul>
  </div>

  <div class="right_content clearfix">
    <div class="info_con clearfix">
      <h3 class="common_title2">基本信息</h3>
      <ul class="user_info_list">
        <li><span>用户名：</span>Tom</li>
        <li><span>邮　箱：</span>12345678@qq.com</li>
      </ul>
    </div>

    <h3 class="common_title2">最近浏览</h3>
    <div class="has_view_list">
      <ul class="goods_type_list clearfix">
        <li>
          <a href="shop_message.jsp"><img src="images/所有商品/57ab290aN34f76b37.jpg"></a>
          <h4><a href="shop_message.jsp">大兴大棚草莓</a></h4>
          <div class="operate">
            <span class="prize">￥33.90</span>
            <span class="unit">33.90/1.94kg</span>
            <a href="#" class="add_goods" title="加入购物车"></a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>
<!--内容 结束-->

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
</body>
</html>
