<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>天天生鲜－用户中心</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/coco-message.js"></script>
    <script src="${pageContext.request.contextPath}/js/address.js"></script>
</head>
<body>

<!--头部 开始-->
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天生鲜!</div>
        <div class="fr">

            <c:choose>
                <c:when test="${sessionScope.login != null}">
                    <div class="login_info fl" style="display: block">
                        欢迎您：<em>${sessionScope.login}</em>
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
                <a href="${pageContext.request.contextPath}/user/toShoppingCart">我的购物车</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/user/order.jsp">我的订单</a>
            </div>
        </div>
    </div>
</div>
<!--头部 结束-->

<!--左边目录 开始-->
<div class="search_bar clearfix">
    <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
    <div class="search_con fl">
        <form method="post" action="${pageContext.request.contextPath}/shop/toSelectGoods" target="_blank">
            <input type="text" class="input_text fl" name="goodsName" placeholder="搜索商品">
            <input type="submit" class="input_btn fr" value="搜索">
        </form>
    </div>
</div>
<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="${pageContext.request.contextPath}/user/customer.jsp">· 个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/user/order.jsp">· 全部订单</a></li>
            <li><a href="${pageContext.request.contextPath}/user/toeditaddress" class="active">· 收货地址</a></li>

        </ul>
    </div>
    <!--左边目录 结束-->

    <!--右边内容 开始-->
    <div class="right_content clearfix">
        <h3 class="common_title2">收货地址</h3>
        <div class="site_con">
            <dl>
                <dt>当前地址：</dt>

                <dd>
                    <h4>${sessionScope.address}</h4>
                </dd>

            </dl>
        </div>
        <h3 class="common_title2">编辑地址</h3>
        <div class="site_con">
            <form action="${pageContext.request.contextPath}/user/editaddress" method="post" id="userinfo_form">

                <%--        <input type="hidden" name="token" value="${sessionScope.token}">--%>
                <input type="hidden" value="${requestScope.userState.value}" id="msg">

                <div class="form_group">
                    <label>收件人：</label>
                    <input type="text" name="shippingName" id="shippingName" value="">
                </div>
                <div class="form_group form_group2">
                    <label>详细地址：</label>
                    <textarea class="site_area" name="shippingAddress" id="shippingAddress" style="resize: none"></textarea>
                </div>
                <div class="form_group">
                    <label>邮编：</label>
                    <input type="text" name="zip" id="zip" value="">
                </div>
                <div class="form_group">
                    <label>手机：</label>
                    <input type="phone" name="phone" id="phone" value="">
                </div>
                <span id="msg" style="font-size: 12px;color: #ff0000"></span><br>

                <input type="button" value="提交" class="info_submit" id="commit">
            </form>
        </div>
    </div>
</div>
<!--右边内容 结束-->

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
<script type="text/javascript">
    //收获地址表单提交判空脚本
    //绑定点击事件
    $("#commit").click(function () {
        //获取收件人 详细地址 邮编 手机号
        var shippingName = $("#shippingName").val();
        var shippingAddress = $("#shippingAddress").val();
        var zip = $("#zip").val();
        var phone = $("#phone").val();

        //定义一个判断为空的方法
        function isEmpty(str) {
            if (str == null || str.trim() == "") {
                return true;
            } else {
                return false;
            }
        }

        if (isEmpty(shippingName)) {
            $("#msg").html("收件人不可为空");
            return;
        }
        if (isEmpty(shippingAddress)) {
            $("#msg").html("地址不可为空");
            return;
        }
        if (isEmpty(zip)) {
            $("#msg").html("邮编不可为空");
            return;
        }
        if (isEmpty(phone)) {
            $("#msg").html("电话不可为空");
            return;
        }
//提交表单
        $("#userinfo_form").submit();
    })
</script>
</html>
