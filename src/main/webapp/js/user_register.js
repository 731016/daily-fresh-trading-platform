$(function () {
    // 用户名正则，4到16位（字母，数字，下划线，减号）
    let user_name_rgx = /^[a-zA-Z0-9_-]{4,16}$/;
    //密码强度正则，密码至少包含 数字和英文，长度6-20
    let pwd_rgx = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
    //Email正则
    var email_rgx = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

    verification();

    function verification() {
        let flag = true;
        $('#user_name').blur(function () {
            let account_boolean = user_name_rgx.test($(this).val());
            console.log(account_boolean);
            if (!account_boolean) {
                flag = false;
                console.log('验证失败')
                $('#user_info').css('display', 'block');
            } else {
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    data: {"account": $('#user_name').val()},
                    url: '/user/register_accountExist',
                    success: function (data) {
                        if (data.msg == "用户名已存在"){
                            flag = false;
                            $('#user_info').text(data.msg);
                            $('#user_info').css('display', 'block');
                        }else{
                            flag = true;
                            $('#user_info').text(data.msg);
                            $('#user_info').css('display', 'block').css('color','green');
                        }
                    },
                    error: function (err) {
                        $('body').html(err.responseText);
                    }
                });
            }
        });

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

        $('#email').blur(function () {
            let email_boolean = email_rgx.test($(this).val());
            if (!email_boolean) {
                flag = false;
                console.log('验证失败')
                $('#email_info').css('display', 'block');
            } else {
                flag = true;
                console.log('邮箱验证成功')
                $('#email_info').css('display', 'none');
            }
        });
        return flag;
    }

    $('#commit').click(function () {
        let allow = $('#allow').prop('checked');
        console.log(allow)
        if (allow && verification()) {
            $('#reg_form').submit();
        } else {
            return false;
        }
    });
});