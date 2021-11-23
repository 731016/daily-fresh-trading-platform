<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8"/>

  <title>天天生鲜－商品详情</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/coco-message.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>


  <style>
    .tab_content dl dd ul {
      margin: 0px;
      padding: 20px 0px 0px;
      list-style: none;
      overflow: hidden;
      color: #666666;
      font-family: tahoma, arial, & #39, Microsoft YaHei & #39, & #39, Hiragino Sans GB & #39, u5b8bu4f53, sans-serif;
    }

    .tab_content dl dd ul li {
      margin: 0px 0px 5px;
      padding: 0px 0px 0px 42px;
      white-space: nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
      width: 200px;
      float: left;
    }
  </style>

  <script>
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

      $(function () {
          $.ajax({
              dataType: "json",
              type: "post",
              url: "${pageContext.request.contextPath}/user/cartCountShow",
              contentType: "application/json; charset=utf-8",
              success: function (count) {
                  $('#show_count').html(count);
              },
              error: function (e) {
                  $("body").html(e.responseText);
              }
          })
          let goodsNumber = $("#shuliang").val();
          let msg = $('#msg').val();
          if (msg == 10) {
              console.log("下单失败")
              example(10, "下单失败");
          }
          $("#buy_btn").click(function () {
              location.href = "${pageContext.request.contextPath}/order/addOrder/${goodsId}/" + goodsNumber;
          })
          $("#add_cart").click(function () {
              let goodsNumber = $("#shuliang").val();
              $.ajax({
                  dataType: "json",
                  type: "post",
                  url: "${pageContext.request.contextPath}/user/addShoppingCart/${goodsId}/" + goodsNumber,
                  success: function (cartCount) {
                      if (cartCount != '-1') {
                          $("#show_count").html(cartCount);
                      } else {
                          location.href = "${pageContext.request.contextPath}/user/login.jsp";
                      }
                  },
                  error: function (e) {
                      $("body").html(e.responseText);
                  }
              })
          })
      })
  </script>
</head>
<body>
<input type="hidden" value="${userState.value}" id="msg">
<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px"
                                 target="_blank">软帝项目</a>
    </div>
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

<div class="search_bar clearfix">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img
          src="${pageContext.request.contextPath}/images/logo.png"></a>
  <div class="search_con fl">
    <form method="post" action="${pageContext.request.contextPath}/shop/toSelectGoods" target="_blank">
      <input type="text" class="input_text fl" name="goodsName" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
  <div class="guest_cart fr">
    <a href="shop.html" class="cart_name fl">我的购物车</a>
    <div class="goods_count fl" id="show_count">0</div>
  </div>
</div>

<div class="navbar_con">
  <div class="navbar clearfix">
    <div class="subnav_con fl">
      <h1>全部商品分类</h1>
      <span></span>
      <ul class="subnav">
        <ul class="subnav">
          <c:forEach items="${goodsTypes}" var="t">
            <li><a href="${pageContext.request.contextPath}/shop/toAllGoods?typeId=${t.typeId}"
                   class="${t.typeClass}">${t.typeName}</a></li>
          </c:forEach>
        </ul>
      </ul>
    </div>
    <ul class="navlist fl">
      <li><a href="../index.jsp">首页</a></li>
      <li class="interval">|</li>
      <li><a href="#">手机生鲜</a></li>
      <li class="interval">|</li>
      <li><a href="#">抽奖</a></li>
    </ul>
  </div>
</div>

<div class="breadcrumb">
  <a href="${pageContext.request.contextPath}/index.jsp">全部分类</a>
  <span>&gt;</span>
  <a href="${pageContext.request.contextPath}/shop/toAllGoods?typeId=${typeId}">新鲜水果</a>
  <span>&gt;</span>
  <span>商品详情</span>
</div>

<div class="goods_detail_con clearfix">
  <div class="goods_detail_pic fl"><img src="${pageContext.request.contextPath}/images/allGoods/${goods.picture}">
  </div>

  <div class="goods_detail_list fr">
    <h3> ${goods.goodsName} </h3>
    <p>${goods.goodsDescribe}</p>
    <div class="prize_bar">
      <span class="show_pirze">¥<em id="danjia">${goods.price}</em></span>
      <span class="show_unit">单  位：${goods.unit}kg</span>
    </div>
    <div class="goods_num clearfix">
      <div class="num_name fl">数 量：</div>
      <div class="num_add fl">
        <input type="text" class="num_show fl" id="shuliang" value="1">
        <a href="javascript:;" class="add fr" id="jiahao">+</a>
        <input type="text" value="${goods.sales}" id="sales" style="display: none">
        <a href="javascript:;" class="minus fr" id="jianhao">-</a>
      </div>
    </div>
    <div class="total">总价：<em id="zongjia">${goods.price}</em>元</div>
    <div class="operate_btn">
      <button type="button" class="buy_btn" id="buy_btn">立即购买</button>
      <button class="add_cart" id="add_cart">加入购物车</button>
    </div>
  </div>
</div>

<div class="main_wrap clearfix">
  <div class="l_wrap fl clearfix">
    <div class="new_goods">
      <h3>新品推荐</h3>
      <ul>
        <c:forEach items="${hotGoods}" var="g">
          <li>
            <a href="${pageContext.request.contextPath}/shop/goodsDetailed/${g.typeId}/${g.goodsId}"><img
                    src="${pageContext.request.contextPath}/images/allGoods/${g.picture}"></a>
            <h4>
              <a href="${pageContext.request.contextPath}/shop/goodsDetailed/${g.typeId}/${g.goodsId}"> ${g.goodsName} </a>
            </h4>
            <div class="prize">￥${g.price}</div>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>

  <div class="r_wrap fr clearfix">
    <ul class="detail_tab clearfix">
      <li class="active">商品介绍</li>
      <li>评论</li>
    </ul>

    <div class="tab_content">
      <dl>
        <dt>商品详情：</dt>
        <dd>
          <ul class="parameter2 p-parameter-list">
            <li title="${goods.goodsName}">商品名称：${goods.goodsName}</li>
            <li title="${goods.goodsId}">商品编号：${goods.goodsId}</li>
            <li title="${goods.unit}kg">商品毛重：${goods.unit}kg</li>
            <li title="${goods.originPlace}">商品产地：${goods.originPlace}</li>
            <li title="${goodsType.typeName}">分类：${goodsType.typeName}</li>
          </ul>
        </dd>
      </dl>
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

<div class="add_jump"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/shop_message.js"></script>
</body>
</html>
