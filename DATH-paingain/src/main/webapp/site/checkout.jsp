<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="layouts/header.jsp" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="${path}/home">Home</a></li>
                <li class="active">Check out</li>
            </ol>
        </div><!--/breadcrums-->
        <c:if test="${authentic == null}">
            <div class="register-req">
                <p>Please use Register or Login</p>
            </div><!--/register-req-->
        </c:if>
        <div class="shopper-informations">
            <div class="row">

                <div class="col-sm-3">

                    <div class="shopper-info">
                        <p>Shopper Information</p>
                        <c:if test="${authentic == null}">
                            <a class="btn btn-primary" href="site-login?href=site/checkout.jsp">Register or Login</a>
                        </c:if>
                        <c:if test="${authentic != null}">
                            <a class="btn btn-primary check-out" href="javascript:void(0)">Check out</a>
                        </c:if>
                    </div>

                </div>

                <div class="col-sm-9 clearfix">
                    <c:if test="${authentic != null}">
                        <div class="bill-to">
                            <p>Bill information</p>
                            <div class="form-one">
                                <form class="user-info">
                                    <input type="text" placeholder="First Name *" name="fname" value="${authentic.users.firstName}">
                                    <input type="text" placeholder="Last Name *" name="lname" value="${authentic.users.lastName}">
                                    <input type="text" placeholder="Email" value="${authentic.users.email}" name="email">
                                </form>
                            </div>
                            <div class="form-two">
                                <form class="user-info">
                                    <input type="text" placeholder="Address " value="${authentic.users.address}" name="address">
                                    <input type="text" placeholder="Phone *" value="${authentic.users.phoneNumber}" name="phone">
                                </form>
                                <a class="btn btn-primary user-update" href="javascript:void(0)">Update information</a>
                            </div>
                        </div>
                    </c:if>
                </div>					
            </div>
        </div>
        <div class="review-payment">
            <h2>Review & Payment</h2>
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
                                        <a href=""><img src="${path}${pic.path}" alt="" style="max-width: 20%;"></a>
                                        </c:if>
                                    </c:forEach>
                            </td>
                            <td class="cart_description">
                                <h4><a href="">${item.pgProducts.productName}</a></h4>
                            </td>
                            <td class="cart_price">
                                <c:set var="breakpoint"  value="${0}"/>       
                                <c:forEach var="sale" items="${item.pgProducts.pgProductSaleses}">
                                    <c:choose>
                                        <c:when test="${sale.endDate ge now and sale.salesStatus eq 1}">
                                            <c:set var="saleprice"  value="${0}"/>
                                            <c:if test="${sale.isPercent}">
                                                <c:set var="saleprice" value="${item.pgProducts.unitPrice-item.pgProducts.unitPrice*sale.saleValue/100}"/>
                                            </c:if>
                                            <c:if test="${not sale.isPercent}">
                                                <c:set var="saleprice" value="${item.pgProducts.unitPrice  - sale.saleValue }"/>
                                            </c:if>
                                            <c:set var="breakpoint"  value="${1}"/> 
                                            <h4 style="text-decoration: line-through;"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${item.pgProducts.unitPrice}" /> VND</h4>
                                            <h3 style="color:#fe980f"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${saleprice}" /> VND</h3>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${ breakpoint eq 0}">
                                    <h3 style="color:#fe980f"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${item.pgProducts.unitPrice}" /> VND</h3>
                                </c:if>
                            </td>
                            <td class="cart_quantity">
                                <div class="cart_quantity_button">
                                    <a class="cart_quantity_up" href="javascript:void(0)"> + </a>
                                    <input class="cart_quantity_input" type="text" name="quantity" value="${item.amount}" itemid="${item.pgProducts.productId}" autocomplete="off" size="2" min="0">
                                    <a class="cart_quantity_down" href="javascript:void(0)"> - </a>
                                </div>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${item.amount*saleprice}" /> VND</p>
                            </td>
                            <c:set var="total"  value="${total+item.amount*saleprice}"/>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="javascript:void(0)" itemid="${item.pgProducts.productId}"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4"><a class="btn btn-primary update" href="javascript:void(0)">Update cart</a></td>
                        <td colspan="2">
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
                    </tr>

                </tbody>
            </table>
        </div>
    </div>
</section> <!--/#cart_items-->
<%@include file="layouts/footer.jsp" %>