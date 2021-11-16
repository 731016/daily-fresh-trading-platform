<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/16
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8"/>
  <title>天天生鲜－我的订单</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<!--头部  开始-->
<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px" target="_blank">软帝项目</a></div>
    <div class="fr">
      <div class="login_info fl" style="display: block">
        欢迎您：<em>Tom</em>
        <a href="${pageContext.request.contextPath}/user/login.jsp" class="zhuxiao">注销</a>
      </div>
      <div class="login_btn fl" style="display:none">
        <a href="${pageContext.request.contextPath}/user/login.jsp">登录</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/register.jsp">注册</a>
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
<!--头部  结束-->

<!--内容  开始-->
<div class="search_bar clearfix">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="../images/logo.png"></a>
  <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
  <div class="search_con fr">
    <form method="get" action="http://ttsx.newzn.cn/search/" target="_blank">
      <input type="text" class="input_text fl" name="q" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
</div>
<div class="main_con clearfix">
  <div class="left_menu_con clearfix">
    <h3>用户中心</h3>
    <ul>

      <li><a href="${pageContext.request.contextPath}/user/customer.jsp">· 个人信息</a></li>
      <li><a href="${pageContext.request.contextPath}/user/order.jsp" class="active">· 全部订单</a></li>
      <li><a href="${pageContext.request.contextPath}/user/address.jsp">· 收货地址</a></li>

    </ul>
  </div>

  <div class="right_content clearfix">
    <h3 class="common_title2">全部订单</h3>

    <div class="pagenation">
      <a class="active">1</a>
    </div>
  </div>
</div>
<!--内容  结束-->

<!--底部  开始-->
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
<!--内容  结束-->
</body>
</html>
