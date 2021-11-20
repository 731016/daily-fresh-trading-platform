$(function () {
    var error_name = true;
    var error_pwd = true;
    var error_captcha = true;

    var show_num = [];
    draw(show_num);

    function draw(show_num) { //显示区域内容信息
        var canvas_width = $('#canvas').width();
        var canvas_height = $('#canvas').height();
        var canvas = document.getElementById("canvas"); //获取到canvas的对象，演员
        var context = canvas.getContext("2d"); //获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode =
            "a,b,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length; //获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength); //获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180; //产生0~30之间的随机弧度
            var txt = aCode[j]; //得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20; //文字在canvas上的x坐标
            var y = 20 + Math.random() * 8; //文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() { //得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }

    function example(n) {
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
                cocoMessage.error("登陆失败！", 1000);
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



    $("#canvas").on('click', function () {
        draw(show_num);
    });

    $('#username').blur(function () {
        console.log('进入密码失去焦点事件')
        username();
    });

    $('#password').blur(function () {
        userpwd();
    });

    $("#id_captcha_1").blur(function () {
        captcha();
    });

    function username() {
        let len = $('#username').val().length;
        if (len == 0) {
            error_name = true;
            $('#username').next().html("请输入用户名");
            $('#username').next().show();
        } else if (len < 5 || len > 20) {
            error_name = true;
            $('#username').next().html("用户名错误");
            $('#username').next().show();
        } else {
            console.log('用户名正确')
            error_name = false;
            $('#username').next().hide();
        }
    }

    function userpwd() {
        let len = $('#password').val().length;
        if (len == 0) {
            error_pwd = true;
            $('#password').next().html("请输入密码");
            $('#password').next().show();
        } else if (len < 6) {
            error_pwd = true;
            $('#password').next().html("密码错误");
            $('#password').next().show();
        } else {
            console.log('密码正确')
            error_pwd = false;
            $('#password').next().hide();
        }
    }

    function captcha() {
        let val = $("#id_captcha_1").val().toLowerCase();
        let num = show_num.join("");
        let len = $('#id_captcha_1').val().length;
        if (len == 0 || val == '') {
            error_captcha = true;
            $(".yanzheng_error").html("请输入验证码");
            $(".yanzheng_error").show();
        } else if (len != 4) {
            error_captcha = true;
            $(".yanzheng_error").html("验证码错误");
            $(".yanzheng_error").show();
            draw(show_num);
        } else if (val == num) {
            console.log('验证码正确')
            error_captcha = false;
            $(".yanzheng_error").hide();
        }
    }

    $('#commit').click(function () {
        username();
        userpwd();
        captcha();
        if (error_name || error_pwd || error_captcha) {
            console.log(' 验证失败-不提交')
            example(3,"验证失败！")
            draw(show_num);
            return false;
        } else {
            console.log('提交')
            $("#from_login").submit();
        }
    });


    let msg = $('#msg').val();
    if (msg == 3) {
        console.log("登陆失败")
        example(3);
    }
});

