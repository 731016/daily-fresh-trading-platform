$(function () {
    // 用户名正则，4到16位（字母，数字，下划线，减号）
    let user_name_rgx = /^[a-zA-Z0-9_-]{4,16}$/;
    //密码强度正则，密码至少包含 数字和英文，长度6-20
    let pwd_rgx = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
    //Email正则
    var email_rgx = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

    function user_name_blur() {
        let user_name = true;
        let account_boolean = user_name_rgx.test($('#user_name').val());
        console.log(account_boolean);
        if (!account_boolean) {
            user_name = false;
            console.log('验证失败')
            $('#user_info').css('display', 'block');
        } else {
            $.ajax({
                type: 'post',
                dataType: 'json',
                data: {"account": $('#user_name').val()},
                url: '/user/register_accountExist',
                success: function (data) {
                    if (data.msg == "用户名已存在") {
                        user_name = false;
                        $('#user_info').text(data.msg);
                        $('#user_info').css('display', 'block');
                    } else {
                        user_name = true;
                        $('#user_info').text(data.msg);
                        $('#user_info').css('display', 'block').css('color', 'green');
                    }
                },
                error: function (err) {
                    $('body').html(err.responseText);
                }
            });
        }
        return user_name;
    }

    function pwd_blur() {
        let pwd = true;
        let pwd_boolean = pwd_rgx.test($('#pwd').val());
        if (!pwd_boolean) {
            pwd = false;
            console.log('验证失败')
            $('#pwd_info').css('display', 'block');
        } else {
            pwd = true;
            console.log('密码验证成功')
            $('#pwd_info').css('display', 'none');
        }
        return pwd;
    }

    function cpwd_blur() {
        let cpwd = true;
        let some_boolean = ($('#pwd').val() == $('#cpwd').val());
        if (!some_boolean) {
            cpwd = false;
            console.log('验证失败')
            $('#cpwd_info').css('display', 'block');
        } else {
            cpwd = true;
            console.log('二次密码验证成功')
            $('#cpwd_info').css('display', 'none');
        }
        return cpwd;
    }

    function email_blur() {
        let email = true;
        let email_boolean = email_rgx.test($('#email').val());
        if (!email_boolean) {
            email = false;
            console.log('验证失败')
            $('#email_info').css('display', 'block');
        } else {
            email = true;
            console.log('邮箱验证成功')
            $('#email_info').css('display', 'none');
        }
        return email;
    }

    function verification() {
        if (user_name_blur() && pwd_blur() && cpwd_blur() && email_blur()) {
            console.log("验证成功")
            return true;
        }
        return false;
    }

    $('#user_name').blur(function () {
        user_name_blur();
    });

    $('#pwd').blur(function () {
        pwd_blur();
    });

    $('#cpwd').blur(function () {
        cpwd_blur();
    });

    $('#email').blur(function () {
        email_blur();
    });

    $('#commit').click(function () {
        let allow = $('#allow').prop('checked');
        console.log(allow)
        if (allow && verification()) {
            $('#reg_form').submit();
            console.log("点击提交，验证成功")
        } else {
            return false;
        }
    });
})
;