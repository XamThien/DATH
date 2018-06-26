<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="layouts/header.jsp" %>
<section>
    <div class="container">
        <div class="row">
            <%@include file="layouts/banner-left.jsp" %>
            <div class="col-sm-9 padding-right">
                <div class="features_items">
                    <c:forEach var="pItem" items="${items}">

                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">

                                        <c:forEach var="pic" items="${pItem.pgProductPictureses}">
                                            <c:if test="${pic.pictureType ==1}">
                                                <img src="${path}${pic.path}" alt="">
                                            </c:if>
                                        </c:forEach>
                                        <c:set var="breakpoint"  value="${0}"/>       
                                        <c:forEach var="sale" items="${pItem.pgProductSaleses}">
                                            <c:choose>
                                                <c:when test="${sale.endDate ge now and sale.salesStatus eq 1}">
                                                    <c:set var="saleprice"  value="${0}"/>
                                                    <c:if test="${sale.isPercent}">
                                                        <c:set var="saleprice" value="${pItem.unitPrice-pItem.unitPrice*sale.saleValue/100}"/>
                                                    </c:if>
                                                    <c:if test="${not sale.isPercent}">
                                                        <c:set var="saleprice" value="${pItem.unitPrice  - sale.saleValue }"/>
                                                    </c:if>
                                                    <c:set var="breakpoint"  value="${1}"/> 
                                                    <h4 style="text-decoration: line-through;"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${pItem.unitPrice}" /> VND</h4>
                                                    <h2><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${saleprice}" /> VND</h2>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${ breakpoint eq 0}">
                                            <h2><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${pItem.unitPrice}" /> VND</h2>
                                        </c:if>
                                        <p>${pItem.productName}</p>
                                        <a href="javascript:void(0)" class="btn btn-default add-to-cart" itemid="${pItem.productId}"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <a href="detail?id=${pItem.productId}">
                                                <c:set var="breakpoint"  value="${0}"/>       
                                                <c:forEach var="sale" items="${pItem.pgProductSaleses}">
                                                    <c:choose>
                                                        <c:when test="${sale.endDate ge now and sale.salesStatus eq 1}">
                                                            <c:set var="saleprice"  value="${0}"/>
                                                            <c:if test="${sale.isPercent}">
                                                                <c:set var="saleprice" value="${pItem.unitPrice-pItem.unitPrice*sale.saleValue/100}"/>
                                                            </c:if>
                                                            <c:if test="${not sale.isPercent}">
                                                                <c:set var="saleprice" value="${pItem.unitPrice  - sale.saleValue }"/>
                                                            </c:if>
                                                            <c:set var="breakpoint"  value="${1}"/> 
                                                            <h4 style="text-decoration: line-through;"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${pItem.unitPrice}" /> VND</h4>
                                                            <h2><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${saleprice}" /> VND</h2>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${ breakpoint eq 0}">
                                                    <h2><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${pItem.unitPrice}" /> VND</h2>
                                                </c:if>
                                                <p>${pItem.productName}</p>
                                            </a>
                                            <a href="javascript:void(0)" class="btn btn-default add-to-cart" itemid="${pItem.productId}"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${pItem.isNew}">
                                            <img src="${path}/site/layouts/images/home/new.png" class="new" alt="">
                                        </c:when>
                                        <c:when test="${pItem.isHot}">
                                            <img src="${path}/site/layouts/images/home/sale.png" class="new" alt="">
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="layouts/footer.jsp" %>