<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/16
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <title>天天生鲜－购物车</title>
  <link rel="stylesheet" type="text/css" href="../css/reset.css">
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

</head>
<body>


<div class="header_con">
  <div class="header">
    <div class="welcome fl">欢迎来到天天生鲜!</div>
    <div class="login_btn fl"><a href="http://www.softeem.com/web1/index.php" style="margin-left:30px" target="_blank">软帝项目</a></div>
    <div class="fr">

      <div class="login_info fl" style="display: block">
        欢迎您：<em>Tom</em>
        <a href="login.jsp" class="zhuxiao">注销</a>
      </div>
      <div class="login_btn fl" style="display:none">
        <a href="login.jsp">登录</a>
        <span>|</span>
        <a href="register.jsp">注册</a>
      </div>


      <div class="user_link fl">
        <span>|</span>
        <a href="customer.jsp">用户中心</a>
        <span>|</span>
        <a href="shop.jsp">我的购物车</a>
        <span>|</span>
        <a href="order.jsp">我的订单</a>
      </div>
    </div>
  </div>
</div>

<div class="search_bar clearfix">
  <a href="../index.jsp" class="logo fl"><img src="../images/logo.png"></a>
  <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
  <div class="search_con fr">
    <form method="get" action="" target="_blank">
      <input type="text" class="input_text fl" name="q" placeholder="搜索商品">
      <input type="submit" class="input_btn fr" value="搜索">
    </form>
  </div>
</div>

<div class="total_count">全部商品<em>3</em>件</div>
<ul class="cart_list_th clearfix">
  <li class="col01">商品名称</li>
  <li class="col02">商品单位</li>
  <li class="col03">商品单价</li>
  <li class="col04">数量</li>
  <li class="col05">小计</li>
  <li class="col06">操作</li>
</ul>


<ul class="cart_list_td clearfix" id="232">
  <li class="col01"><input type="checkbox" name="" checked=""></li>
  <li class="col02"><img src="../images/所有商品/5b4871e6N072f0d74.jpg"></li>
  <li class="col03">寻天果蔬 泰国山竹水果 京东生鲜 5A级 热带水果 2.5k<br><em>98.00元/1.0kg</em></li>
  <li class="col04">1.0kg</li>
  <li class="col05">98.00元</li>
  <li class="col06">
    <div class="num_add">
      <a href="javascript:;" class="add fl">+</a>
      <input type="text" class="num_show fl" value="1">
      <a href="javascript:;" class="minus fl">-</a>
      <span class="kucun" style="display: none">978</span>
      <span class="goodsid" style="display: none">44</span>
    </div>
  </li>
  <li class="col07">98.00元</li>
  <li class="col08"><a href="#">删除</a></li>
</ul>

<ul class="cart_list_td clearfix" id="233">
  <li class="col01"><input type="checkbox" name="" checked=""></li>
  <li class="col02"><img src="../images/所有商品/5b18c158N35a55d7a.jpg"></li>
  <li class="col03">中科农业 水果礼盒 水果提货券 礼券 238型 水果提货卡券<br><em>238.00元/5.0kg</em></li>
  <li class="col04">5.0kg</li>
  <li class="col05">238.00元</li>
  <li class="col06">
    <div class="num_add">
      <a href="javascript:;" class="add fl">+</a>
      <input type="text" class="num_show fl" value="1">
      <a href="javascript:;" class="minus fl">-</a>
      <span class="kucun" style="display: none">994</span>
      <span class="goodsid" style="display: none">37</span>
    </div>
  </li>
  <li class="col07">238.00元</li>
  <li class="col08"><a href="#">删除</a></li>

</ul>

<ul class="cart_list_td clearfix" id="234">
  <li class="col01"><input type="checkbox" name="" checked=""></li>
  <li class="col02"><img src="../images/所有商品/5b514c51N8170488f.jpg"></li>
  <li class="col03">维叶新鲜水果香蕉约17-23条天宝水果生鲜青蕉 香蕉17-2<br><em>29.90元/750g</em></li>
  <li class="col04">750g</li>
  <li class="col05">29.90元</li>
  <li class="col06">
    <div class="num_add">
      <a href="javascript:;" class="add fl">+</a>
      <input type="text" class="num_show fl" value="1">
      <a href="javascript:;" class="minus fl">-</a>
      <span class="kucun" style="display: none">1075</span>
      <span class="goodsid" style="display: none">33</span>
    </div>
  </li>
  <li class="col07">29.90元</li>
  <li class="col08"><a href="#">删除</a></li>

</ul>


<ul class="settlements">
  <li class="col01"><input type="checkbox" id="check_all" name="" checked=""></li>
  <li class="col02">全选</li>
  <li class="col03">合计(不含运费)：<span>¥</span><em id="zong">365.90</em><br>共计<b id="zongshu">3</b>件商品</li>
  <li class="col04"><a href="javascript:;" id="jiesuan" style="background-color: rgb(255, 61, 61);">去结算</a></li>
</ul>

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
<script type="text/javascript" src="../js/shop.js"></script>
