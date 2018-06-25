<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="layouts/header.jsp" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
        </div>
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                    <tr class="cart_menu">
                        <td class="image">Item</td>
                        <td class="description"></td>
                        <td class="price">Price</td>
                        <td class="quantity">Quantity</td>
                        <td class="total">Total</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="total"  value="${0}"/>
                    <c:forEach items="${cart.pgOrderDetailses}" var="item">
                        <tr>
                            <td class="cart_product">
                                <c:forEach var="pic" items="${item.pgProducts.pgProductPictureses}">
                                    <c:if test="${pic.pictureType ==1}">
                                        <a href="${path}/detail?id=${item.pgProducts.productId}"><img src="${path}${pic.path}" alt="" style="max-width: 20%;"></a>
                                        </c:if>
                                    </c:forEach>
                            </td>
                            <td class="cart_description">
                                <h4><a href="${path}/detail?id=${item.pgProducts.productId}">${item.pgProducts.productName}</a></h4>
                            </td>
                            <td class="cart_price">
                                <p>${item.unitPrice} VND</p>
                            </td>
                            <td class="cart_quantity">
                                <div class="cart_quantity_button">
                                    <a class="cart_quantity_up" href="javascript:void(0)"> + </a>
                                    <input class="cart_quantity_input" type="text" name="quantity" value="${item.amount}" autocomplete="off" size="2" min="0" itemid="${item.pgProducts.productId}">
                                    <a class="cart_quantity_down" href="javascript:void(0)"> - </a>
                                </div>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price">${item.amount*item.unitPrice} VND</p>
                            </td>
                            <c:set var="total"  value="${total+item.amount*item.unitPrice}"/>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="javascript:void(0)" itemid="${item.pgProducts.productId}"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section> <!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="heading">
            <h3>What would you like to do next?</h3>
        </div>
        <div class="row">
            <div class="col-sm-6">

            </div>
            <div class="col-sm-6">
                <div class="total_area">
                    <ul>
                        <li>Cart Sub Total <span>${total} VND</span></li>
                        <li>Eco Tax <span>0 VND</span></li>
                        <li>Shipping Cost <span>Free</span></li>
                        <li>Total <span>${total} VND</span></li>
                    </ul>
                    <a class="btn btn-default update" href="javascript:void(0)" >Update cart</a>
                    <a class="btn btn-default check_out" href="checkout">Check Out</a>
                </div>
            </div>
        </div>
    </div>
</section><!--/#do_action-->
<%@include file="layouts/footer.jsp" %>