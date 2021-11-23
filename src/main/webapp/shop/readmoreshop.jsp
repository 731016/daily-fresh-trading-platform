<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>天天生鲜－商品列表</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/coco-message.js"></script>
  <script >
      let pageNum = 1;

      function selectPage() {
          $.ajax({
              dataType: "json",
              type: "post",
              url: "${pageContext.request.contextPath}/shop/allGoods/${typeId}/" + pageNum,
              success: function (result) {
                  $("#ul_allGoods li").remove();
                  //遍历显示
                  $.each(result.resultPageInfoObject.list, function (i, g) {
                      $("#ul_allGoods").append('<li>\n' +
                          '        <a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '"><img src="${pageContext.request.contextPath}/images/allGoods/' + g.picture + '"></a>\n' +
                          '        <h4><a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '"> ' + g.goodsName + ' </a></h4>\n' +
                          '        <div class="operate">\n' +
                          '          <span class="prize">￥' + g.price + '</span>\n' +
                          '          <span class="unit">' + g.price + '/' + g.unit + 'kg</span>\n' +
                          '          <a href="javascript:;" class="add_goods" onclick="addShoppingCart(' + g.goodsId + ')" title="加入购物车"></a>\n' +
                          '        </div>\n' +
                          '      </li>')
                  })
                  //生成页码，当前页面页码为红色
                  $("#pageNum button").remove();
                  $("#pageNum").append('<button class="active" id="firstPage">首页</button>');
                  $("#pageNum").append('<button class="active" id="previousPage">上一页</button>');
                  $.each(result.resultPageInfoObject.navigatepageNums, function (i, num) {
                      let n = 1;
                      if (num == result.resultPageInfoObject.pageNum) {
                          $("#pageNum").append('<button class="active" style="color: red">' + num + '</button>');
                      } else {
                          $("#pageNum").append('<button class="active">' + num + '</button>');
                      }
                      n++;
                  });
                  $("#pageNum").append('<button class="active" id="nextPage">下一页</button>');
                  $("#pageNum").append('<button class="active" id="lastPage">尾页</button>');

                  //绑定按钮点击事件
                  $("#firstPage").click(function () {
                      pageNum = 1;
                      selectPage();
                  })
                  $("#previousPage").click(function () {
                      pageNum--;
                      selectPage();
                  })
                  $("#nextPage").click(function () {
                      pageNum++;
                      selectPage();
                  })
                  $("#lastPage").click(function () {
                      pageNum = result.resultPageInfoObject.pages;
                      selectPage(pageNum);
                  })

                  //设置隐藏点击按钮
                  if (result.resultPageInfoObject.hasPreviousPage) {
                      $("#previousPage").removeAttr("disabled");
                  } else {
                      $("#previousPage").attr("disabled", "true");
                  }
                  if (result.resultPageInfoObject.hasNextPage) {
                      $("#nextPage").removeAttr("disabled");
                  } else {
                      $("#nextPage").attr("disabled", "true");
                  }
              },
              error: function (e) {
                  $("body").html(e.responseText);
              }
          })
      }

      //添加购物车的方法
      function addShoppingCart(goodsId) {
          $.ajax({
              dataType: "json",
              type: "post",
              url: "${pageContext.request.contextPath}/user/addShoppingCart/"+ goodsId,
              success: function (cartCount) {
                  if (cartCount!='-1') {
                      $("#show_count").html(cartCount);
                  }else {
                      location.href="${pageContext.request.contextPath}/user/login.jsp";
                  }
              },
              error: function (e) {
                  $("body").html(e.responseText);
              }
          })
      }

      //显示购物车数量
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
          selectPage();
      })
  </script>
</head>
<body>
<!--头部开始-->
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
<!--头部结束-->

<div class="search_bar clearfix">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
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
  <div class="navbar clearfix">
    <div class="subnav_con fl">
      <h1>全部商品分类</h1>
      <span></span>
      <ul class="subnav">
        <c:forEach items="${goodsType}" var="t">
          <li><a href="${pageContext.request.contextPath}/shop/toAllGoods?typeId=${t.typeId}"
                 class="${t.typeClass}">${t.typeName}</a></li>
        </c:forEach>
      </ul>
    </div>
    <ul class="navlist fl">
      <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
      <li class="interval">|</li>
      <li><a href="#">手机生鲜</a></li>
      <li class="interval">|</li>
      <li><a href="#">抽奖</a></li>
    </ul>
  </div>
</div>

<div class="breadcrumb">
  <a href="../index.jsp">全部分类</a>
  <span>&gt;</span>
  <c:forEach items="${goodsType}" var="t">
    <c:if test="${t.typeId==typeId}">
      <span>${t.typeName}</span>
    </c:if>
  </c:forEach>
</div>

<div class="main_wrap clearfix">
  <div class="l_wrap fl clearfix">
    <div class="new_goods">
      <h3>热销推荐</h3>
      <ul>
        <c:forEach items="${hotGoods}" var="g">
          <li>
            <a href="${pageContext.request.contextPath}/shop/goodsDetailed/${g.typeId}/${g.goodsId}"><img
                    src="${pageContext.request.contextPath}/images/allGoods/${g.picture}"></a>
            <h4><a href="${pageContext.request.contextPath}/shop/goodsDetailed/${g.typeId}/${g.goodsId}"> ${g.goodsName} </a></h4>
            <div class="prize">￥${g.price}</div>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>

  <div class="r_wrap fr clearfix">
    <div class="sort_bar">

      <a href="#" class="active">默认</a>
      <a href="#">价格</a>
      <a href="#">人气</a>

    </div>

    <ul class="goods_type_list clearfix" id="ul_allGoods">
    </ul>

    <div class="pagenation" id="pageNum">

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
