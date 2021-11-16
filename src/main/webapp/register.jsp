<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/16
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta charset="utf-8" />
  <title>天天生鲜－注册</title>
  <link rel="stylesheet" type="text/css" href="css/reset.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div class="register_con">
  <div class="l_con fl">
    <a href="index.jsp" class="reg_logo"><img src="images/logo.png"></a>
    <div class="reg_slogan">足不出户  ·  新鲜每一天</div>
    <div class="reg_banner"></div>
  </div>

  <div class="r_con fr">
    <div class="reg_title clearfix">
      <h1>用户注册</h1>
      <a href="login.jsp">登录</a>
    </div>
    <div class="reg_form clearfix">
      <form action="register.jsp" method="post" id="reg_form">
        <input type="hidden" name="" value="e">
        <ul>
          <li>
            <label>用户名:</label>
            <input type="text" name="user_name" id="user_name">
            <span class="error_tip">提示信息</span>
          </li>
          <li>
            <label>密码:</label>
            <input type="password" name="pwd" id="pwd">
            <span class="error_tip">提示信息</span>
          </li>
          <li>
            <label>确认密码:</label>
            <input type="password" name="cpwd" id="cpwd">
            <span class="error_tip">提示信息</span>
          </li>
          <li>
            <label>邮箱:</label>
            <input type="text" name="email" id="email">
            <span class="error_tip">提示信息</span>
          </li>

          <li class="agreement">
            <input type="checkbox" name="allow" id="allow" checked="checked">
            <label>同意”天天生鲜用户使用协议“</label>
            <span class="error_tip2">提示信息</span>
          </li>
          <li class="reg_sub">
            <input type="submit" value="注 册">
          </li>
        </ul>
      </form>
    </div>
  </div>
</div>

<!--底部开始-->
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
<!--底部结束-->
</body>
</html>
