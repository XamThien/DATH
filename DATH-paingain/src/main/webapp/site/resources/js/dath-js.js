/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $(".add-to-cart").click(function () {
        var dId = $(this).attr("itemid");
        $.ajax({
            url:"cart-action",
            type:"GET",
            data:{pId:dId,action:"add"},
            success:function(data){
                if(data !="success"){
                    alert("error");
                }else{
                    $("#notify-content").text("product is added to your cart");
                    $('#notify').modal('show'); 
                }
            }
        })
    });
    $(".cart_quantity_delete").click(function () {
        var dId = $(this).attr("itemid");
        $.ajax({
            url:"cart-action",
            type:"GET",
            data:{pId:dId,action:"delete"},
            success:function(data){
                if(data !="success"){
                    alert("error");
                }else{
                    location.reload();
                }
            }
        })
    });
})


