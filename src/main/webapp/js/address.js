$(function () {
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

    let msg = $('#msg').val();
    if (msg == 8) {
        console.log("收货地址添加失败")
        example(3, "收货地址添加失败");
    }
    if (msg == 9){
        console.log("收货地址修改成功")
        example(1, "收货地址修改成功");
    }

    function shippingName() {
        $('#shippingName').blur(function () {
            if ($(this).val() == '') {
                return false;
            } else {
                return true;
            }
        });
    }

    function shippimgAddress() {
        $('#shippingAddress').blur(function () {
            if ($(this).val() == '') {
                return false;
            } else {
                return true;
            }
        });
    }


    $('#commit').click(function () {
        if (shippingName() && shippimgAddress()) {
            $('#userinfo_form').submit();
        } else {
            return false;
        }
    })
});