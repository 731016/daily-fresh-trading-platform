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
    axios.post({
        url: '/user/historys',
        method: 'post',
        timeout: 5000, // 超时时间
        responseType: 'json',
    }).then(function (response) {
        //响应信息
        // response.resultListObject
        $.each(response.resultListObject, function (i, g) {
            let $li = $('li');
            $li.append('<a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">' +
                '<img src="images/allGoods/' + g.picture + '"></a>' +
                '<h4><a href="${pageContext.request.contextPath}/shop/goodsDetailed/' + g.typeId + '/' + g.goodsId + '">大兴大棚草莓</a></h4>' +
                '<div class="operate">' +
                '<span class="prize">' + g.price + '</span>' +
                '<span class="unit">' + g.price + '/' + g.unit + '</span>' +
                '<a href="#" class="add_goods" title="加入购物车"></a>' +
                '</div>');
        });
    }).catch(function (error) {
        //错误处理
        // example(3, error.data)
        console.log(error)
        example(3, "请求失败！")
    });
});