$(function () {
    // 用户名正则，4到16位（字母，数字，下划线，减号）
    let user_name_rgx = /^[a-zA-Z0-9_-]{4,16}$/;
    //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
    let pwd_rgx = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
    //Email正则
    var email_rgx = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    verification();
    function verification(){
        let flag = true;
        $('#user_name').blur(function () {
            let account_boolean = user_name_rgx.test($(this).val());
            if (!account_boolean) {
                flag = false;
                $('#user_info').css('display', 'block');
            }
        });

        $('#pwd').blur(function () {
            let pwd_boolean = pwd_rgx.test($(this).val());
            if (!pwd_boolean) {
                flag = false;
                $('#pwd_info').css('display', 'block');
            }
        });

        $('#cpwd').blur(function() {
            let some_boolean = ($('#pwd').val() == $(this).val());
            if (!some_boolean) {
                flag = false;
                $('#cpwd_info').css('display', 'block');
            }
        });

        $('#email').blur(function() {
            let email_boolean = email_rgx.test($(this).val());
            if (!email_boolean) {
                flag = false;
                $('#email_info').css('display', 'block');
            }
        });
        return flag;
    }

    $('#commit').click(function () {
        let allow = $('#allow').prop('checked');
        if (!allow && !verification()) {
            return false;
        }
    });
});