<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8"/>
  <title>天天生鲜－购物车</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/coco-message.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

  <script>
      function example(n, msg) {
          let div = document.createElement("div");
          switch (n) {
              case 0:
                  cocoMessage.info(1000, "请输入验证码！", function () {
                  });
                  break;

              case 1:
                  div.innerText = msg;
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

      function delCart(goodsId) {
          $.ajax({
              dataType: "json",
              type: "post",
              url: "${pageContext.request.contextPath}/user/delShoppingCart/" + goodsId,
              contentType: "application/json; charset=utf-8",
              success: function (result) {
                  if (result.result) {
                      $('#' + result.goodsId).remove();
                      $('.goodsCount').html(result.cartCount);
                      $('#zong').html(result.totalPrice);
                  } else {
                      let msg = $('#msg').val();
                      if (msg == 11) {
                          console.log("购物车删除失败")
                          example(3, "购物车删除失败");
                      }
                  }
              },
              error: function (e) {
                  $("body").html(e.responseText);
              }
          })
      }

      function addOrder() {
          let goodsIds = new Array();
          let check = $('input[name="goodsIds"]:checked');
          $.each(check, function () {
              goodsIds.push($(this).val());
          })
          $.ajax({
              data: {"goodsIds": goodsIds.toString()},
              dataType: "json",
              type: "post",
              url: "${pageContext.request.contextPath}/user/addOrder",
              success: function (result) {
                  if (result) {
                      $.each(goodsIds, function (i, gId) {
                          delCart(gId);
                      });
                      console.log("下单成功");
                      example(1, "下单成功");
                  } else {
                      console.log("下单失败")
                      example(3, "下单失败");
                  }
              },
              error: function (e) {
                  $('body').html(e.responseText);
              }
          })
      }

      function changeCart(goodsId, input) {

      }

      function delButton(goodsId) {
          if (!confirm('确定删除吗？')) {
              return false;
          }
          delCart(goodsId);
      }

  </script>
</head>
<body>
<input type="hidden" value="${requestScope.userState.value}" id="msg">
<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
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

<div class="search_bar clearfix">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img
          src="${pageContext.request.contextPath}/images/logo.png"></a>
  <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
  <div class="search_con fl">
    <form method="post" action="${pageContext.request.contextPath}/shop/toSelectGoods" target="_blank">
      <input type="text" class="input_text fl" name="goodsName" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
</div>

<div class="total_count">全部商品<em class="goodsCount">${count}</em>件</div>
<ul class="cart_list_th clearfix">
  <li class="col01">商品名称</li>
  <li class="col02">商品单位</li>
  <li class="col03">商品单价</li>
  <li class="col04">数量</li>
  <li class="col05">小计</li>
  <li class="col06">操作</li>
</ul>

<%--同步方法el表达式循环生成购物车列表--%>
<c:forEach items="${cartVos}" var="c">
  <ul class="cart_list_td clearfix" id="${c.goodsId}">
    <li class="col01"><input type="checkbox" name="goodsIds" checked value="${c.goodsId}"></li>
    <li class="col02"><img src="${pageContext.request.contextPath}/images/allGoods/${c.goods.picture}"></li>
    <li class="col03">${c.goods.goodsName}<br><em>${c.goods.price}元/${c.goods.unit}</em></li>
    <li class="col04">${c.goods.unit}</li>
    <li class="col05">${c.goods.price}元</li>
    <li class="col06">
      <div class="num_add">
        <a href="javascript:;" class="add fl">+</a>
        <input type="text" class="num_show fl" value="${c.goodsNumber}" oninput="value=value.replace(/[^\d]/g,'')">
        <a href="javascript:;" class="minus fl">-</a>
        <span class="kucun" style="display: none">${c.goods.inventory}</span>
        <span class="goodsid" style="display: none">${c.goodsId}</span>
      </div>
    </li>
    <li class="col07">${c.goods.price * c.goodsNumber}元</li>
    <li class="col08">
      <button type="button" name="del" onclick="return delButton(${c.goodsId})">删除</button>
    </li>
  </ul>
</c:forEach>

<%--初次进入页面时给商品件数以及总价赋值，给结算绑定下单方法--%>
<ul class="settlements">
  <li class="col01"><input type="checkbox" id="check_all" name="" checked=""></li>
  <li class="col02">全选</li>
  <li class="col03">合计(不含运费)：<span>¥</span><em id="zong">${totalPrice
          }</em><br>共计<b class="goodsCount">${count}</b>件商品
  </li>
  <li class="col04"><a id="jiesuan" style="background-color: rgb(255, 61, 61);"
                       onclick="addOrder()">去结算</a></li>
</ul>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/shop.js"></script>
</html>