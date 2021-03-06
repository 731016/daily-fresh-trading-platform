<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/16
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>天天生鲜－登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <style>
        canvas {
            position: relative;
            top: 126px;
            left: 156px;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <script src="${pageContext.request.contextPath}/js/coco-message.js"></script>
</head>
<body>

<div class="login_top clearfix">
    <a href="${pageContext.request.contextPath}/index.jsp" class="login_logo"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
</div>

<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">日夜兼程 · 急速送达</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="/user/toRegister">立即注册</a>
            </div>
            <div class="form_input">

                <form action="${pageContext.request.contextPath}/user/login" method="post" id="from_login">
                    <input type="hidden" value="${requestScope.userState.value}" id="msg">
<%--                    <input type="hidden" name="token" value="${sessionScope.token}">--%>

                    <input type="text" name="account" id="username" class="name_input" placeholder="请输入用户" value="${sessionScope.rememberAccount}">
                    <div class="user_error">输入错误</div>
                    <input type="password" name="pwd" id="password" class="pass_input" placeholder="请输入密码" value="">
                    <div class="pwd_error" style="display: none;">输入错误</div>
                    <%--          <img src="../images/error.png" alt="captcha" class="captcha">--%>
                    <canvas id="canvas" width="150px" height="43px"></canvas>
                    <input id="id_captcha_0" name="captcha_0" type="hidden" value="">
                    <input autocapitalize="off" autocomplete="off" autocorrect="off" spellcheck="false"
                           id="id_captcha_1" name="captcha_1" type="text" placeholder="请输入验证码">

                    <div class="yanzheng_error">请输入验证码</div>

                    <div class="more_input clearfix">
                        <input type="checkbox" name="rememberAccount" id="" checked="checked" value="remember">
                        <label>记住用户名</label>
                        <a href="/user/toforgetpwd">忘记密码</a>
                    </div>
                    <input type="button" name="" value="登录" class="input_submit" id="commit">
                </form>
            </div>
        </div>
    </div>
</div>

<!--底部 开始-->
<div class="footer login_footer">
  <div class="links">
    <a href="">涂鏊飞</a>
    <span>|</span>
    <a href="">杜铮</a>
    <span>|</span>
    <a href="">郝雪鹏</a>
    <span>|</span>
    <a href="">覃红海</a>
    <span>|</span>
    <a href="">肖家伟</a>
  </div>
  <p>中软国际J0705班 5人小组</p>
</div>
<!--底部 结束-->
</body>
</html>
