<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/16
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8"/>
    <title>天天生鲜－注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/user_register.js"></script>
    <script src="${pageContext.request.contextPath}/js/coco-message.js"></script>
    <script>
        $(function () {
            function example(n) {
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
                        cocoMessage.error("注册失败！", 1000);
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

            let msg = $('msg').val();
            if (msg == 2) {
                example(3);
            }
        });
    </script>
</head>
<body>

<input type="hidden" value="${userState.value}" id="msg">
<input type="hidden" name="token" value="${sessionScope.token}">

<div class="register_con">
    <div class="l_con fl">
        <a href="${pageContext.request.contextPath}/index.jsp" class="reg_logo"><img src="../images/logo.png"></a>
        <div class="reg_slogan">足不出户 · 新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
            <a href="/user/toLogin">登录</a>
        </div>
        <div class="reg_form clearfix">
            <form action="${pageContext.request.contextPath}/user/register" method="post" id="reg_form">
                <input type="hidden" name="" value="e">
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="account" id="user_name" placeholder="4到16位（字母，数字，下划线，减号）">
                        <span class="error_tip" id="user_info">4到16位（字母，数字，下划线，减号）</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="password" id="pwd" style="white-space: nowrap;" placeholder="最少6位">
                        <span class="error_tip" id="pwd_info" style="white-space: nowrap">最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" id="cpwd">
                        <span class="error_tip" id="cpwd_info">两次密码不相同</span>
                    </li>
                    <li>
                        <label>邮箱:</label>
                        <input type="text" name="email" id="email">
                        <span class="error_tip" id="email_info">邮箱格式不正确</span>
                    </li>

                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意”天天生鲜用户使用协议“</label>
                        <span class="error_tip" id="allow_info">必须同意此协议！</span>
                    </li>
                    <li class="reg_sub">
                        <input type="button" value="注册" id="commit">
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
