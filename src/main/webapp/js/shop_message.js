/**add_jump  开始*/

var $add_x = $('#add_cart').offset().top;
var $add_y = $('#add_cart').offset().left;

var $to_x = $('#show_count').offset().top;
var $to_y = $('#show_count').offset().left;

$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
$('#add_cart').click(function(){
	$(".add_jump").stop().animate({
		'left': $to_y+7,
		'top': $to_x+7},
		"fast", function() {
			$(".add_jump").fadeOut('fast',function(){
				$('#show_count').html();
			});

	});
})
/**add_jump  结束*/



$('#jiahao').mousedown(function () {
    var num = $('#shuliang').val();
    if($('#shuliang').val() < 994)
    {
      	$('#shuliang').val(function () {
        return num * 1 + 1;
    	});
	}
	var num1 = parseInt($('#shuliang').val());
    var num2 = parseFloat($('#danjia').html());
	$('#zongjia').html(function () {
	    return ((num1*100)*(num2*100)/10000).toFixed(2);
	});
});

$('#jianhao').mousedown(function () {
    var num = $('#shuliang').val();
    if($('#shuliang').val() > 1)
    {
      	$('#shuliang').val(function () {
        return num * 1 - 1;
    	});
	}
	var num1 = parseInt($('#shuliang').val());
    var num2 = parseFloat($('#danjia').html());
	$('#zongjia').html(function () {
	    return ((num1*100)*(num2*100)/10000).toFixed(2);
	});
});

$('#shuliang').change(function(){
    $('#shuliang').val(function () {
		return parseInt($('#shuliang').val());
    });
    jieguo();
    if($('#shuliang').val()<1){
	    $('#shuliang').val(1);
		jieguo();
	}
	else if($('#shuliang').val() > 994){
	    $('#shuliang').val(994);
	    jieguo();
	}
});

function jieguo() {
    var num1 = parseInt($('#shuliang').val());
    var num2 = parseFloat($('#danjia').html());
	$('#zongjia').html(function () {
	    return ((num1*100)*(num2*100)/10000).toFixed(2);
	});
}

$('#add_cart').mousedown(function () {
    
	$.get("/cart/updatecart/add/1/37/"+$('#shuliang').val(),function (data) {
	    if (data.data != 0) {
            $("#show_count").html(data.data)
        }
    });
	
});

$("#buy_btn").click(function () {
    $(this).attr("href",function () {
		return "/order/orderinfo/37/"+$('#shuliang').val();
    });
});