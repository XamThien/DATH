/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $(".add-to-cart").click(function () {
        var dId = $(this).attr("itemid");
        $.ajax({
            url: "cart-action",
            type: "GET",
            data: {pId: dId, action: "add"},
            success: function (data) {
                if (data != "success") {
                    alert("error");
                } else {
                    $("#notify-content").text("product is added to your cart");
                    $('#notify').modal('show');
                }
            }
        })
    });
    $(".cart_quantity_delete").click(function () {
        var dId = $(this).attr("itemid");
        $.ajax({
            url: "cart-action",
            type: "GET",
            data: {pId: dId, action: "delete"},
            success: function (data) {
                if (data != "success") {
                    alert("error");
                } else {
                    location.reload();
                }
            }
        })
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
            quantity_input.val(value)
        }
    });
    $(".update").click(function () {
        var param = [];
        $(".cart_quantity_input").each(function () {
            param.push({"id": $(this).attr("itemid"), "value": $(this).val()});
        })
        $.ajax({
            url: "cart-action",
            type: "POST",
            dataType: "text",
            data: {products: JSON.stringify(param)}
        }).done(function (data) {
            if (data != "success") {
                alert(data);
            } else {
                location.reload();
            }
        })
    });
    $(".user-update").click(function () {
        var datas = {};
        $(".user-info input[type=text]").each(function () {
            var prop = $(this).attr("name");
            datas[prop] = $(this).val();
        })
        $.ajax({
            url: "user-update",
            type: "POST",
            data: datas
        }).done(function (data) {
            console.log(data);
        });
    })
    $(".check-out").click(function () {
        $.ajax({
            url:"checkout-action",
            type:"POST"
        }).done(function(data){
            if(data=="success"){
                location.reload();
            }else{
                alert(data);
            }
        })
        
    })
})


