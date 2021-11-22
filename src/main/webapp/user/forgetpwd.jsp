<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>天天生鲜－忘记密码</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/coco-message.js"></script>
  <script src="${pageContext.request.contextPath}/js/forgetpwd.js"></script>
  <script>
    $(function () {
      function example(n, msg) {
        let div = document.createElement("div");
        switch (n) {
          case 0:
            cocoMessage.info(1000, "请输入验证码！", function () {

            });
            break;

          case 1:
            div.innerText = "验证码校验成功！";
            cocoMessage.success(div);
            break;

          case 2:
            cocoMessage.warning("每秒并发请求200次！,请求上限20w次！", 0);
            break;

          case 3:
            // cocoMessage.error("验证码错误！请重新输入！", 1000);
            cocoMessage.error(msg, 1000);
            break;

          case 4:
            var closeMsg = cocoMessage.loading(true);
            setTimeout(function () {
              closeMsg();
            }, 1000);
            break;

          case 5:
            cocoMessage.destroyAll();
            break;

          default:
            break;
        }
      }

      let msg = $('#msg').val();
      if (msg == 5) {
        console.log("密码修改失败")
        example(3,"密码修改失败");
      }
      if (msg ==6){
        console.log("要修改的密码与原密码相同")
        example(3,"要修改的密码与原密码相同");
      }
      if (msg == 7){
        console.log("要修改的密码与原密码相同")
        example(3,"用户名不存在");
      }
    });
  </script>
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
        <a href="${pageContext.request.contextPath}/user/user_shop.jsp">我的购物车</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/order.jsp">我的订单</a>
      </div>
    </div>
  </div>
</div>

<div class="search_bar clearfix">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
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
            <form id="reg_form" method="post" action="/user/forgetpwd">
              <input type="hidden" name="token" value="${sessionScope.token}">
              <input type="hidden" value="${userState.value}" id="msg">
              <ul>
                <li>
                  <label>用户名:</label>
                  <input type="text" name="account" id="user_name">
                  <span class="n_error_tip" id="user_info">4到16位（字母，数字，下划线，减号）</span>
                </li>
                <li>
                  <label>密码:</label>
                  <input type="password" name="pwd" id="pwd">
                  <span class="n_error_tip" id="pwd_info">密码至少包含 数字和英文，长度6-20</span>
                </li>
                <li>
                  <label>确认密码:</label>
                  <input type="password" id="cpwd">
                  <span class="n_error_tip" id="cpwd_info">两次密码不一致</span>
                </li>
                <li class="n_reg_sub">
                  <input type="button" value="提 交" id="commit">
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
