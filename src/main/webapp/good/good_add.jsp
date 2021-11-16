<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/16
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品添加</title>
    <style>
        li {
            list-style: none;
            padding-left: 29%;
        }

        a {
            text-decoration: none;
        }

        .main {
            margin: 50px auto;
            width: 800px;
        }

        label {
            font-size: 18px;
            font-family: '微软雅黑', 'Consolas';
            color: rebeccapurple;
            font-weight: 700;
        }

        label {
            display: block;
            width: 100px;

        }

        select, input {
            height: 30px;
            width: 300px;
        }

        .main li {
            margin: 10px 0;
        }

        h2 {
            text-align: center;
        }

        #show {
            width: 160px;
            height: 160px;
        }
    </style>
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            $('#picture').change(function () {
                // 显示预览图片
                $('#show').css("visibility", "visible");
                let file = $(this).prop("files")[0];
                let url = URL.createObjectURL(file);
                $('#show').attr('src', url);
                // 显示文图片大小
                $('#size').css("visibility", "visible");
                $('#size').html("<h4>大小：" + file.size / 1024 + "KB</h4>")
            })
        });
    </script>
</head>
<body>
<h2>商品添加</h2>
<form action="/" method="post">
    <div class="main">
        <ul>
            <li>
                <label for="type">商品类型</label>
                <select id="type" name="good_type">
                    <option>新鲜水果</option>
                    <option>海鲜水产</option>
                    <option>猪牛羊肉</option>
                    <option>禽类蛋品</option>
                    <option>新鲜蔬菜</option>
                    <option>速冻食品</option>
                </select>
            </li>

            <li>
                <label for="name">商品名称</label>
                <input type="text" id="name" name="good_name" placeholder="请输入商品名称">
            </li>
            <li>
                <label for="describe">商品描述</label>
                <textarea id="describe" name="describe" resize:none placeholder="请输入商品描述"></textarea>
            </li>
            <li>
                <label for="inventory">库存</label>
                <input type="number" id="inventory" name="inventory">
            </li>
            <li>
                <label for="price">价格</label>
                <input type="number" id="price" name="price">
            </li>
            <li>
                <label for="unit">单位</label>
                <input type="text" id="unit" name="unit">
            </li>
            <li>
                <label for="place">原产地</label>
                <input type="text" id="place" name="origin_price">
            </li>
            <li>
                <label for="picture">商品图片</label>
                <input type="file" id="picture" name="picture">
                <img src="" id="show" style="visibility: hidden">
                <span id="size" style="visibility: hidden"></span>
            </li>
        </ul>
    </div>
</form>
</body>
</html>
