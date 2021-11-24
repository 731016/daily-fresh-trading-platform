<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>天天生鲜－首页</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>

  <script>
      $(function () {
          //异步获取购物车数量
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

          //异步生成商品类型以及各商品类型模块
          $.ajax({
              dataType: "json",
              type: "post",
              url: "${pageContext.request.contextPath}/shop/goodsTypeRedis",
              success: function (result) {
                  let goodsType = JSON.parse(result.resultListJson);
                  $.each(goodsType, function (i, t) {
                      let $div = $("<div class='list_model' id='" + "goods_list" + i + "'></div>");
                      $div.append("<div class=\"list_title clearfix\">\n" +
                          "      <h3 class='fl' id='model" + i + "'>" + t.typeName + "</h3>\n" +
                          "      <div class=\"subtitle fl\">\n" +
                          "        <span>|</span>\n" +
                          "      </div>\n" +
                          "      <a href=\"${pageContext.request.contextPath}/shop/toAllGoods?typeId=" + t.typeId + "\" class=\"goods_more fr\">查看更多 &gt;</a>\n" +
                          "    </div>");

                      $div.append("<div name=\"goods_list\" class=\"goods_con clearfix\">\n" +
                          "      <div class=\"goods_banner fl\"><img src=\"${pageContext.request.contextPath}/images/allGoods/" + t.typeImg + "\"></div>\n" +
                          "      <ul class=\"goods_list fl\">\n" +
                          "      </ul>\n" +
                          "    </div>");
                      $("#goods_info").append($div);
                      //导航栏设置
                      $("#title_goodsType").append('<li><a href="#model' + i + '" class="' + t.typeClass + '">' + t.typeName + '</a></li>');
                      //调用生成商品模块的方法
                      goodsList(t.typeId, i);
                  })
              },
              error: function (e) {
                  $("body").html(e.responseText);
              }
          })

          //异步生成商品模块
          function goodsList(typeId, index) {
              $.ajax({
                  dataType: "json",
                  type: "post",
                  url: "${pageContext.request.contextPath}/shop/goodsShow/" + typeId,
                  contentType: "application/json; charset=utf-8",
                  success: function (result) {
                      $.each(result.resultListObject, function (i, g) {
                          let $div = $('#goods_list' + index + ' div[class="subtitle fl"]');
                          $div.append('<a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">' + g.goodsName + '</a>');
                          $('#goods_list' + index + ' ul').append('<li>\n' +
                              '          <h4><a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">' + g.goodsName + '</a></h4>\n' +
                              '          <a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '"><img src="${pageContext.request.contextPath}/images/allGoods/' + g.picture + '"></a>\n' +
                              '          <div class="prize">¥ ' + g.price + '</div>\n' +
                              '        </li>');
                      })
                  },
                  error: function (e) {
                      $("body").html(e.responseText);
                  }
              })
          }
      })
  </script>
</head>
<body>
<!--头部  开始-->
<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="fr">
<%--   头部   --%>
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
        <a href="${pageContext.request.contextPath}/user/toCustomer">用户中心</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/toShoppingCart">我的购物车</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/toOrder">我的订单</a>
      </div>
    </div>
  </div>
</div>
<!--头部 结束-->

<!--导航和轮播部分 开始-->
<div class="search_bar clearfix">
  <a href="#" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
  <div class="search_con fl">
    <form method="post" action="${pageContext.request.contextPath}/shop/toSelectGoods" target="_blank">
      <input type="text" class="input_text fl" name="goodsName" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
  <div class="guest_cart fr">
    <a href="${pageContext.request.contextPath}/user/toShoppingCart" class="cart_name fl">我的购物车</a>
    <div class="goods_count fl" id="show_count"></div>
  </div>
</div>

<div class="navbar_con">
  <div class="navbar">
    <h1 class="fl">全部商品分类</h1>
    <ul class="navlist fl">
      <li><a href="#">首页</a></li>
      <li class="interval">|</li>
      <li><a href="#">手机生鲜</a></li>
      <li class="interval">|</li>
      <li><a href="#">抽奖</a></li>
    </ul>
  </div>
</div>

<div class="center_con clearfix">
  <ul class="subnav fl" id="title_goodsType">
  </ul>
  <div class="slide fl">
    <ul class="slide_pics">
      <li><img src="${pageContext.request.contextPath}/images/allGoods/slide.jpg" alt="幻灯片"></li>
      <li><img src="${pageContext.request.contextPath}/images/allGoods/slide02.jpg" alt="幻灯片"></li>
      <li><img src="${pageContext.request.contextPath}/images/allGoods/slide03.jpg" alt="幻灯片"></li>
      <li><img src="${pageContext.request.contextPath}/images/allGoods/slide04.jpg" alt="幻灯片"></li>
    </ul>
    <div class="prev"></div>
    <div class="next"></div>
    <ul class="points"></ul>
  </div>

  <div class="adv fl">
    <a href="#"><img src="${pageContext.request.contextPath}/images/allGoods/adv01.jpg"></a>
    <a href="#"><img src="${pageContext.request.contextPath}/images/allGoods/adv02.jpg"></a>
  </div>
</div>
<!--导航和轮播部分 结束-->

<!--全部商品 开始-->
<div id="goods_info">

</div>
<!--全部商品 结束-->

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
