<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>天天生鲜－我的订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/axios.min.js"></script>
    <script>
        $(function () {
            var currentPageNum = 1;
            selectPage();


            function selectPage() {
                axios.request({
                    baseURI: '/localhost:8080',
                    url: '/user/order',
                    params: {
                        "currentPageNum": currentPageNum
                    },
                    method: 'post',
                    timeout: 5000, // 超时时间
                    responseType: 'json',
                    responseEncoding: 'utf8',
                }).then(function (response) {
                    //响应信息
                    if (response.status == 200) {
                        if (response.data.list != null) {
                            $('#orders').empty();
                            $.each(response.data.list, function (i, g) {
                                let $li = $('<li></li>');
                                let $ul_child1 = $('<ul class="cart_list_th clearfix"></ul>');
                                $ul_child1.append(
                                    '<li class="col01" style="width:18%">' + g.orderDate + '</li>' +
                                    '<li class="col02" style="white-space:nowrap;width:23%">订单号：' + g.orderId + '</li>' +
                                    '<li class="col03">商品单价</li>' +
                                    '<li class="col04">数量</li>' +
                                    '<li class="col05">小计</li>' +
                                    '<li class="col06">操作</li>');
                                let $ul_child2 = $('<ul class="cart_list_td clearfix"></ul>');
                                $ul_child2.append(
                                    '<li class="col01"><input type="checkbox" name="goodsIds" checked="" value="' + g.orderId + '"></li>' +
                                    '<li class="col02"><img src="${pageContext.request.contextPath}/images/allGoods/' + g.goods.picture + '"></li>' +
                                    '<li class="col03">' + g.goods.goodsName + '</li>' +
                                    '<li class="col04">' + g.goods.unit + '</li>' +
                                    '<li class="col05">' + g.goods.price + '</li>' +
                                    '<li class="col06">\n' +
                                    '     <div class="num_add" style="width: 38px">\n' +
                                    '     <input class="num_show fl" value="' + g.goodsNumber + '" readonly/>\n' +
                                    '     </div>\n' +
                                    '</li>' +
                                    '<li class="col07">' + g.totalPrice + '元</li>' +
                                    '<li class="col08">\n' +
                                    '     <a href="/user/delOrder/' + g.orderId + '" name="del">删除</a>\n' +
                                    '</li>');

                                $li.append($ul_child1);
                                $li.append($ul_child2);

                                $('#orders').append($li);
                            });

                            $('.pagenation').empty();

                            $('#orders').append('<div class="pagenation" style="position: relative;bottom: 10px">' +
                                '<a class="active" id="first">首页</a>' +
                                '<a class="active" id="last">末页</a>' +
                                '</div>');
                            console.log(response.data.navigatepageNums);
                            $.each(response.data.navigatepageNums, function (i, num) {
                                let n = 1;
                                if (num == response.data.pageNum) {
                                    $("#first").after('<a class="active" name="pages" style="color: red">' + num + '</a>');
                                } else {
                                    $("#first").after('<a class="active" name="pages">' + num + '</a>');
                                }
                                n++;
                            });
                        } else {
                            $('#history_ul').append($('<li style="color: red">暂无数据！</li>'));
                        }
                        $('#first').click(function () {
                            currentPageNum = 1;
                            selectPage();
                        });
                        $('#last').click(function () {
                            currentPageNum = response.data.pages;
                            selectPage();
                        });
                        $('a[name="pages"]').click(function () {
                            currentPageNum = $(this).text();
                            selectPage();
                        });
                        $('a[name="del"]').mouseover(function () {
                            $(this).css("color", "red");
                        })
                        $('a[name="del"]').mouseleave(function () {
                            $(this).css("color", "black");
                        })
                    }
                }).catch(function (error) {
                    if (error.response) {
                        // 请求已发出，但服务器响应的状态码不在 2xx 范围内
                        // console.log(error.response.data);
                        $('body').html(error.response.data);
                        console.log(error.response.status);
                        console.log(error.response.headers);
                    } else {
                        // Something happened in setting up the request that triggered an Error
                        console.log("Error", error.message);
                    }
                    console.log(error.config);
                    //错误处理
                    example(3, "请求失败！")
                });
            }
        });
    </script>
</head>
<body>

<!--头部  开始-->
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天生鲜!</div>
        <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px"
                                     target="_blank">软帝项目</a></div>
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
                <a href="${pageContext.request.contextPath}/user/toShoppingCart">我的购物车</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/user/order.jsp">我的订单</a>
            </div>
        </div>
    </div>
</div>
<!--头部  结束-->

<!--内容  开始-->
<div class="search_bar clearfix">
    <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img
            src="${pageContext.request.contextPath}/images/logo.png"></a>
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
            <li><a href="${pageContext.request.contextPath}/user/order.jsp" class="active">· 全部订单</a></li>
            <li><a href="${pageContext.request.contextPath}/user/address.jsp">· 收货地址</a></li>

        </ul>
    </div>

    <div class="right_content clearfix">
        <h3 class="common_title2">全部订单</h3>
        <ul id="orders">

        </ul>
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
