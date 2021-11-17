<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>天天生鲜－忘记密码</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>


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
      <li><a href="" class="active">· 修改密码</a></li>
    </ul>
  </div>

  <div class="right_content clearfix">
    <div class="info_con clearfix">
      <div class="n_sub_con">
        <div class="n_r_con">
          <div class="n_reg_form clearfix">
            <form id="reg_form">
              <input type="hidden" name="" value="">
              <ul>
                <li>
                  <label>用户名:</label>
                  <input type="text" name="user_name" id="user_name">
                  <span class="n_error_tip">提示信息</span>
                </li>
                <li class="n_yanzheng">
                  <label>验证码:</label>
                  <img src="../images/error.png" alt="captcha" class="captcha">
                  <input id="id_captcha_0" name="captcha_0" type="hidden" value="">
                  <input autocapitalize="off" autocomplete="off" autocorrect="off" spellcheck="false" id="id_captcha_1" name="captcha_1" type="text">

                  <span class="n_error_tip" style="height:0;line-height:10px">提示信息</span>
                  <a class="n_but_con">
                    <span class="n_but1">获取邮箱</span>
                    <span class="n_but2">验证码</span>
                  </a>
                </li>
                <li>
                  <label>邮箱验证:</label>
                  <input type="text" name="email" id="email">
                  <span class="n_error_tip">提示信息</span>
                </li>
                <li>
                  <label>密码:</label>
                  <input type="password" name="pwd" id="pwd">
                  <span class="n_error_tip">提示信息</span>
                </li>
                <li>
                  <label>确认密码:</label>
                  <input type="password" name="cpwd" id="cpwd">
                  <span class="n_error_tip">提示信息</span>
                </li>
                <li class="n_reg_sub">
                  <input type="submit" value="提 交">
                </li>
              </ul>
              <p style="font-size: 16px;margin-bottom:20px">注意事项：如邮箱无法使用、请使用新邮箱发送账号密码至123456@163.com、审核通过后会及时邮件回复并更新您的邮箱信息</p>
            </form>
          </div>
        </div>
      </div>
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

</body>
</html>
