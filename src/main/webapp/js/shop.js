xiaoji();
zongji();
if ($("input[type='checkbox']:checked").not($("#check_all")).length <= 0) {
    $("#jiesuan").css("background-color", '#fff4e8');
}

//实时更新购物车数据的ajax
function changeCart(goodsId, goodsNumber) {
    $.ajax({
        dataType: "json",
        type: "post",
        url: "/user/changeCart/" + goodsId + "/" + goodsNumber,
        success: function (result) {
            if (result) {
                console.log('修改成功');
            } else {
                console.log('修改失败');
            }
        },
        error: function (e) {
            $('body').html(e.responseText);
        }
    })
}

$(".add").click(function () {
    var num = parseInt($(this).next().val());
    if (num < parseInt($(this).nextAll().filter(".kucun").html())) {
        $(this).next().val(num + 1);
    } else {
        $(this).next().val(function () {
            return parseInt($(this).nextAll().filter(".kucun").html());
        });
    }
    //获取商品ID以及商品数量进行修改
    let goodsNum = $(this).next().val();
    let goodsId = $(this).parent().children(':last-child').html();
    changeCart(goodsId, goodsNum);
    xiaoji();
    zongji();
});

$(".minus").click(function () {
    var num = parseInt($(this).prev().val());
    if (num > 1) {
        $(this).prev().val(num - 1);
    } else {
        $(this).prev().val(1);
    }
    //获取商品ID以及商品数量进行修改
    let goodsNum = $(this).prev().val();
    let goodsId = $(this).parent().children(':last-child').html();
    changeCart(goodsId, goodsNum);
    xiaoji();
    zongji();
});

let goodsNumber=1;
$(".num_show").focus(function () {
    goodsNumber = parseInt($(this).val());
});

$(".num_show").change(function () {
    let num = parseInt($(this).val());
    if (isNaN(num)) {
        num = goodsNumber;
    }
    if (num > parseInt($(this).nextAll().filter(".kucun").html())) {
        $(this).val(function () {
            return parseInt($(this).nextAll().filter(".kucun").html());
        });
    } else if (num < 1) {
        $(this).val(function () {
            return 1;
        });
    } else {
        $(this).val(function () {
            return num;
        });
    }
    //获取商品ID以及商品数量进行修改
    let goodsId = $(this).parent().children(':last-child').html();
    changeCart(goodsId, num);
    xiaoji();
    zongji();
});

$("#check_all").click(function () {
    $("input[type='checkbox']").not($("#check_all")).each(function () {
        $(this).prop("checked", $("#check_all").prop("checked"));

    });
    zongji();
    $("#zongshu").html($("input[type='checkbox']:checked").not($("#check_all")).length);
});

$("input[type='checkbox']").not($("#check_all")).click(function () {
    if ($(this).prop("checked") == false) {
        $("#check_all").prop("checked", false);
    } else if ($("input[type='checkbox']:checked").not($("#check_all")).length == $("input[type='checkbox']").not($("#check_all")).length) {
        $("#check_all").prop("checked", true);
    }
    zongji();
    $("#zongshu").html($("input[type='checkbox']:checked").not($("#check_all")).length);

});


function xiaoji() {
    $(".col07").html(function () {
        num1 = parseFloat($(this).prevAll().filter(".col05").html());
        num2 = parseInt($(this).prevAll().filter(".col06").find(".num_show").val());
        return ((num1 * 100) * (num2 * 100) / 10000).toFixed(2) + "元";
    })
}

function zongji() {
    var zong = 0;
    $("input[type='checkbox']").not($("#check_all")).each(function () {
        if ($(this).prop("checked")) {
            zong += parseFloat($(this).parent().nextAll().filter(".col07").html());
        }
    });
    $("#zong").html(zong.toFixed(2));

    if ($("input[type='checkbox']:checked").not($("#check_all")).length <= 0) {
        $("#jiesuan").css("background-color", '#fff4e8');
    } else {
        $("#jiesuan").css("background-color", '#ff3d3d');
    }
}


// $("#jiesuan").click(function () {
//     if($("input[type='checkbox']:checked").not($("#check_all")).length <= 0){
// 	    return false;
// 	}
// 	else{
//         $(this).attr("href",cart());
// 	}
//
// });
//
// function cart() {
// 	var url="/order/orderinfo?";
// 	$("input[type='checkbox']:checked").not($("#check_all")).each(function (i) {
// 		url += "cart" + i + "=" + $(this).parents(".cart_list_td").attr("id") +"&";
// 	});
// 	return url;
// }