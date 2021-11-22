$(function () {

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

    /*$.ajax({
        url: '/user/history',
        data: {
            flag: '成功'
        },
        method: 'post',
        success: function (data) {
            if (data.resultListObject != null) {
                $.each(data.resultListObject, function (i, g) {
                    let $li = $('li');
                    $li.append('<a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">' +
                        '<img src="images/allGoods/' + g.picture + '"></a>' +
                        '<h4><a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">大兴大棚草莓</a></h4>' +
                        '<div class="operate">' +
                        '<span class="prize">' + g.price + '</span>' +
                        '<span class="unit">' + g.price + '/' + g.unit + '</span>' +
                        '<a href="#" class="add_goods" title="加入购物车"></a>' +
                        '</div>');
                    $('#history_ul').append($li);
                });
            }else{
                $('#history_ul').append($('<li>暂无数据！</li>'));
            }
        },
        error: function (response) {
            $('body').html(response.responseText);
        }
    })*/
    axios.request({
        baseURI: '/localhost:8080',
        url: '/user/history?flag=成功',
        method: 'post',
        timeout: 5000, // 超时时间
        responseType: 'json',
        responseEncoding: 'utf8',
    }).then(function (response) {
        //响应信息
        if (response.status == 200) {
            if (response.data.resultListObject != null) {
                // $('#history_ul').empty();
                // $('#history_ul').children().html("");
                console.log(response.data);
                $('#history_ul').empty();
                $.each(response.data.resultListObject, function (i, g) {
                    let $li = $('<li></li>');
                    $li.append('<a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">' +
                        '<img src="images/allGoods/' + g.picture + '"></a>' +
                        '<h4><a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">' + g.goodsName + '</a></h4>' +
                        '<div class="operate">' +
                        '<span class="prize">' + g.price + '</span>' +
                        '<span class="unit">' + g.price + '/' + g.unit + '</span>' +
                        '<a href="#" class="add_goods" title="加入购物车"></a>' +
                        '</div>');
                    $('#history_ul').append($li);
                });
            } else {
                $('#history_ul').append($('<li>暂无数据！</li>'));
            }
        }
    }).catch(function (error) {
        if (error.response) {
            // 请求已发出，但服务器响应的状态码不在 2xx 范围内
            console.log(error.response.data);
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
});