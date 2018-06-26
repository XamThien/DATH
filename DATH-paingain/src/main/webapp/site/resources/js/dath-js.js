/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    var path = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
    $(".add-to-cart").click(function () {
        var dId = $(this).attr("itemid");
        $.ajax({
            url: "cart-action",
            type: "GET",
            data: {pId: dId, action: "add"},
            success: function (data) {
                if (data !== "success") {
                    alert("error");
                } else {
                    $("#notify-content").html("product is added to your cart <a href='" + path + "/mycart'>view cart </a>");
                    $('#notify').modal('show');
                }
            }
        });
    });
    $(".cart_quantity_delete").click(function () {
        var dId = $(this).attr("itemid");
        $.ajax({
            url: "cart-action",
            type: "GET",
            data: {pId: dId, action: "delete"},
            success: function (data) {
                if (data !== "success") {
                    alert(data);
                } else {
                    location.reload();
                }
            }
        });
    });
    $(".cart_quantity_up").click(function () {
        var quantity_input = $(this).parent().children(".cart_quantity_input");
        var value = parseInt(quantity_input.val()) + 1;
        quantity_input.val(value);
    });
    $(".cart_quantity_down").click(function () {
        var quantity_input = $(this).parent().children(".cart_quantity_input");
        var value = parseInt(quantity_input.val()) - 1;
        if (value <= 0) {
            quantity_input.val(0);
        } else {
            quantity_input.val(value);
        }
    });
    $(".update").click(function () {
        var param = [];
        $(".cart_quantity_input").each(function () {
            param.push({"id": $(this).attr("itemid"), "value": $(this).val()});
        });
        $.ajax({
            url: "cart-action",
            type: "POST",
            dataType: "text",
            data: {products: JSON.stringify(param)}
        }).done(function (data) {
            if (data !== "success") {
                alert(data);
            } else {
                location.reload();
            }
        });
    });
    $(".user-update").click(function () {
        var datas = {};
        $(".user-info input[type=text],input[type=email],input[name=sex]:checked,textarea[name=address]").each(function () {
            var prop = $(this).attr("name");
            datas[prop] = $(this).val();
        });
        $.ajax({
            url: "user-update",
            type: "POST",
            data: datas
        }).done(function (data) {
            if (data === "success") {
                location.reload();
            } else {
                alert(data);
            }
        });
    });
    $(".check-out").click(function () {
        $.ajax({
            url: "checkout-action",
            type: "POST"
        }).done(function (data) {
            if (data === "success") {
                $("#notify-content").html("Dat hang thanh cong view <a href='" + path + "/purchase-orders'>Purchase orders</a>");
                    $('#notify').modal('show');
            } else {
                alert(data);
            }
        });
    });
    $(".order_delete").click(function () {
        var oid = $(this).attr("itemid");
        $.ajax({
            url: "order-remove",
            type: "GET",
            data: {id: oid}
        }).done(function (data) {
            if (data === "success") {
                location.reload();
            } else {
                alert(data);
            }
        });
    });
    $(".input-search").keypress(function(e){
        var code = e.keyCode || e.which;
        if(code===13){
        var q=$(this).val();
            location.replace(path+"/search?q="+q);
        }
    });
});