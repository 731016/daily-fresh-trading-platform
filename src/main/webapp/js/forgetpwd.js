$(function () {
    // 用户名正则，4到16位（字母，数字，下划线，减号）
    let user_name_rgx = /^[a-zA-Z0-9_-]{4,16}$/;
    //密码强度正则，密码至少包含 数字和英文，长度6-20
    let pwd_rgx = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;

    let user = true;
    let pwd = true;
    let cpwd = true;

    $('#user_name').blur(function () {
        let account_boolean = user_name_rgx.test($(this).val());
        console.log(account_boolean);
        if (!account_boolean) {
            console.log('验证失败')
            $('#user_info').css('display', 'block');
            user = false;
        } else {
            console.log('用户名格式正确')
            $('#user_info').css('display', 'none');
            user = true;
        }
    });

    $('#pwd').blur(function () {
        let pwd_boolean = pwd_rgx.test($(this).val());
        if (!pwd_boolean) {
            console.log('验证失败')
            $('#pwd_info').css('display', 'block');
            pwd = false;
        } else {
            console.log('密码验证成功')
            $('#pwd_info').css('display', 'none');
            pwd = true;
        }
    });

    $('#cpwd').blur(function () {
        let some_boolean = ($('#pwd').val() == $(this).val());
        if (!some_boolean) {
            console.log('验证失败')
            $('#cpwd_info').css('display', 'block');
            cpwd = false;
        } else {
            console.log('二次密码验证成功')
            $('#cpwd_info').css('display', 'none');
            cpwd = true;
        }
    });

    $('#commit').click(function () {
        console.log('触发提交');
        if (user && pwd && cpwd) {
            console.log('表单验证完整');
            $('#reg_form').submit();
        } else {
            return false;
        }
    });
});