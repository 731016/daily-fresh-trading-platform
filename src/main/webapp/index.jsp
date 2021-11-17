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
                          "      <div class=\"goods_banner fl\"><img src=\"images/allGoods/" + t.typeImg + "\"></div>\n" +
                          "      <ul class=\"goods_list fl\">\n" +
                          "      </ul>\n" +
                          "    </div>");
                      $("#goods_info").append($div);
                      //导航栏设置
                      $("#title_goodsType").append('<li><a href="#model' + i + '" class="' + t.typeClass + '">' + t.typeName + '</a></li>');

                      goodsList(t.typeId, i);

                  })

              },
              error: function (e) {
                  $("body").html(e.responseText);
              }
          })

          function goodsList(typeId, index) {
              $.ajax({
                  dataType: "json",
                  type: "post",
                  url: "${pageContext.request.contextPath}/shop/goodsShow/" + typeId,
                  contentType: "application/json; charset=utf-8",
                  success: function (result) {
                      $.each(result.resultListObject, function (i, g) {
                          let $div = $('#goods_list' + index + ' div[class="subtitle fl"]');
                          $div.append('<a href="${pageContext.request.contextPath}/shop/shop_message.jsp">' + g.goodsName + '</a>');
                          $('#goods_list' + index + ' ul').append('<li>\n' +
                              '          <h4><a href="${pageContext.request.contextPath}/shop/shop_message.jsp">' + g.goodsName + '</a></h4>\n' +
                              '          <a href="${pageContext.request.contextPath}/shop/shop_message.jsp"><img src="images/allGoods/' + g.picture + '"></a>\n' +
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
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px" target="_blank">软帝项目</a>
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
        <a href="${pageContext.request.contextPath}/user/shop.jsp">我的购物车</a>
        <span>|</span>
        <a href="${pageContext.request.contextPath}/user/order.jsp">我的订单</a>
      </div>
    </div>
  </div>
</div>
<!--头部 结束-->

<!--导航和轮播部分 开始-->
<div class="search_bar clearfix">
  <a href="#" class="logo fl"><img src="images/logo.png"></a>
  <div class="search_con fl">
    <form method="get" action="" target="_blank">
      <input type="text" class="input_text fl" name="" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
  <div class="guest_cart fr">
    <a href="user/shop.jsp" class="cart_name fl">我的购物车</a>
    <div class="goods_count fl" id="show_count">3</div>
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
      <li><img src="images/allGoods/slide.jpg" alt="幻灯片"></li>
      <li><img src="images/allGoods/slide02.jpg" alt="幻灯片"></li>
      <li><img src="images/allGoods/slide03.jpg" alt="幻灯片"></li>
      <li><img src="images/allGoods/slide04.jpg" alt="幻灯片"></li>
    </ul>
    <div class="prev"></div>
    <div class="next"></div>
    <ul class="points"></ul>
  </div>

  <div class="adv fl">
    <a href="#"><img src="images/allGoods/adv01.jpg"></a>
    <a href="#"><img src="images/allGoods/adv02.jpg"></a>
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
    <a href="">关于软帝</a>
    <span>|</span>
    <a href="">热门培训</a>
    <span>|</span>
    <a href="">联系我们</a>
    <span>|</span>
    <a href="">在线报名</a>
  </div>
  <p>CopyRight &copy; 2019 武汉软帝信息科技有限责任公司</p>
</div>
<!--底部 结束-->
</body>
</html>
