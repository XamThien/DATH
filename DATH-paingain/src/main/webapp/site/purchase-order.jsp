<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="layouts/header.jsp" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Purchase order</li>
            </ol>
        </div>
        <div class="table-responsive cart_info">
            <table class="table table-bordered">
                <thead>
                    <tr class="cart_menu">
                        <td>Items</td>
                        <td style="width: 70px;">Date</td>
                        <td style="width:150px; ">Status</td>
                        <td class="total" style="width: 290px;">Total</td>
                        <td style="width: 70px;">Cancel</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${authentic.users.pgOrderses}">
                        <c:if test="${order.pgOrderStatus.orderStatusKey !=0}">

                            <tr>
                                <td style="padding: 0px;">
                                    <table class="table table-condensed table-striped">
                                        <c:set var="total"  value="${0}"/>
                                        <c:forEach var="odetail" items="${order.pgOrderDetailses}">
                                            <tr  style="border-bottom: 1px solid #fe980f;">

                                                <td style="width: 40px">
                                                    <c:set var="break" value="${false}"/>
                                                    <c:forEach var="pic" items="${odetail.pgProducts.pgProductPictureses}">
                                                        <c:if test="${pic.pictureType ==1 and check}">
                                                            <a href="${path}/detail?id=${odetail.pgProducts.productId}">
                                                                <img src="${path}${pic.path}" alt="" style="max-width: 60px;"/>
                                                            </a>
                                                            <c:set var="break" value="${true}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>

                                                <td style="max-width: 80px;"><a href="${path}/detail?id=${odetail.pgProducts.productId}">${odetail.pgProducts.productName} </a></td>

                                                <td style="max-width: 70px;">Price:<br/> <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${odetail.unitPrice*odetail.amount}" /> VND</td>
                                                <td style="max-width: 86px;">Sale:<br/> <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${odetail.unitSale*odetail.amount}" /> VND</td>
                                                <td style="max-width: 50px;">Quantity: ${odetail.amount}</td>
                                                <c:set var="total"  value="${total+(odetail.amount*odetail.unitPrice -odetail.amount*odetail.unitSale)}"/>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </td>
                                <td><fmt:formatDate type = "date" value = "${order.orderDate}" /></td>
                                <td>${order.pgOrderStatus.orderStatusName}</td>
                                <td>
                                    <table class="table table-condensed total-result">
                                        <tr>
                                            <td>Cart Sub Total</td>
                                            <td><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${total}" /> VND</td>
                                        </tr>
                                        <tr>
                                            <td>Exo Tax</td>
                                            <td>0 VND</td>
                                        </tr>
                                        <tr class="shipping-cost">
                                            <td>Shipping Cost</td>
                                            <td>Free</td>										
                                        </tr>
                                        <tr>
                                            <td>Total</td>
                                            <td><span><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${total}" /> VND</span></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="cart_delete" style="border: none; line-height: 140px;">
                                    <a class="order_delete" href="javascript:void(0)" itemid="${order.orderId}"><i class="fa fa-times"></i></a>
                                </td>
                            </tr>

                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section> <!--/#cart_items-->

<%@include file="layouts/footer.jsp" %>