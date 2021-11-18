$(function () {
    // 用户名正则，4到16位（字母，数字，下划线，减号）
    let user_name_rgx = /^[a-zA-Z0-9_-]{4,16}$/;
    //密码强度正则，密码至少包含 数字和英文，长度6-20
    let pwd_rgx = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;


    let flag = true;

    user();
    pwd();
    cpwd();

    function user() {
        $('#user_name').blur(function () {
            let account_boolean = user_name_rgx.test($(this).val());
            console.log(account_boolean);
            if (!account_boolean) {
                flag = false;
                console.log('验证失败')
                $('#user_info').css('display', 'block');
            } else {
                console.log('用户名格式正确')
                $('#user_info').css('display', 'none');
            }
        });
    }

    function pwd() {
        $('#pwd').blur(function () {
            let pwd_boolean = pwd_rgx.test($(this).val());
            if (!pwd_boolean) {
                flag = false;
                console.log('验证失败')
                $('#pwd_info').css('display', 'block');
            } else {
                flag = true;
                console.log('密码验证成功')
                $('#pwd_info').css('display', 'none');
            }
        });

    }

    function cpwd() {
        $('#cpwd').blur(function () {
            let some_boolean = ($('#pwd').val() == $(this).val());
            if (!some_boolean) {
                flag = false;
                console.log('验证失败')
                $('#cpwd_info').css('display', 'block');
            } else {
                flag = true;
                console.log('二次密码验证成功')
                $('#cpwd_info').css('display', 'none');
            }
        });
    }

    $('#commit').click(function () {
        if (user() && pwd() && cpwd()) {
            $('#reg_form').submit();
        } else {
            return false;
        }
    });
});