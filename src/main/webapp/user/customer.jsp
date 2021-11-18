<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8" />
  <title>天天生鲜－用户中心</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<!--头部 开始-->
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
        <a href="#">用户中心</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/shop.jsp">我的购物车</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/order.jsp">我的订单</a>
      </div>
    </div>
  </div>
</div>
<!--头部 结束-->
<!--内容 开始-->
<div class="search_bar clearfix">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="../images/logo.png"></a>
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
      <li><a href="${pageContext.request.contextPath}/user/order.jsp">· 全部订单</a></li>
      <li><a href="${pageContext.request.contextPath}/user/address">· 收货地址</a></li>
    </ul>
  </div>

  <div class="right_content clearfix">
    <div class="info_con clearfix">
      <h3 class="common_title2">基本信息</h3>
      <ul class="user_info_list">
        <li><span>用户名：</span>${user.username}</li>
        <li><span>邮　箱：</span>${user.email}</li>
      </ul>
    </div>

    <h3 class="common_title2">最近浏览</h3>
    <div class="has_view_list">
      <ul class="goods_type_list clearfix">
        <li>
          <a href="../good/shop_message.jsp"><img src="../images/所有商品/57ab290aN34f76b37.jpg"></a>
          <h4><a href="../good/shop_message.jsp">大兴大棚草莓</a></h4>
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
