$(function () {
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
            if($(this).val()==''){
                return false;
            }else{
                return  true;
            }
        });
    }


    $('#commit').click(function () {
        if (shippingName() && shippimgAddress()){
            $('#userinfo_form').submit();
        }else{
            return false;
        }
    })
});