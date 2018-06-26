<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="layouts/header.jsp" %>
<section>
    <div class="container">
        <div class="row">
            <%@include file="layouts/banner-left.jsp" %>
            <div class="col-sm-9 padding-right">
                <div class="product-details"><!--product-details-->
                    <div class="col-sm-5">
                        <div class="view-product">
                            <c:forEach var="pic" items="${item.pgProductPictureses}">
                                <c:if test="${pic.pictureType ==1}">
                                    <img src="${path}${pic.path}" alt="" itemid="${pic.pictureSetId}">
                                </c:if>
                            </c:forEach>
                            <h3>ZOOM</h3>
                        </div>
                        <div id="similar-product" class="carousel slide" data-ride="carousel">

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <c:forEach var="pic" items="${item.pgProductPictureses}">
                                        <a href="javascript:void(0)" itemid="${pic.pictureSetId}"><img src="${path}${pic.path}" alt="" style="max-width: 23%"></a>
                                        </c:forEach>
                                </div>
                            </div>

                            <!-- Controls -->
                            <a class="left item-control" href="#similar-product" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right item-control" href="#similar-product" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                    <div class="col-sm-7">
                        <div class="product-information"><!--/product-information-->
                            <img src="${path}/site/layouts/images/product-details/new.jpg" class="newarrival" alt="" />
                            <h2>${item.productName}</h2>
                            <p></p>
                            <span>

                                <c:set var="breakpoint"  value="${0}"/>       
                                <c:forEach var="sale" items="${item.pgProductSaleses}">
                                    <c:choose>
                                        <c:when test="${sale.endDate ge now and sale.salesStatus eq 1}">
                                            <c:set var="saleprice"  value="${0}"/>
                                            <c:if test="${sale.isPercent}">
                                                <c:set var="saleprice" value="${item.unitPrice-item.unitPrice*sale.saleValue/100}"/>
                                            </c:if>
                                            <c:if test="${not sale.isPercent}">
                                                <c:set var="saleprice" value="${item.unitPrice  - sale.saleValue }"/>
                                            </c:if>
                                            <c:set var="breakpoint"  value="${1}"/> 
                                            <h4 style="text-decoration: line-through;"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${item.unitPrice}" /> VND</h4>
                                            <span><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${saleprice}" /> VND</span>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${ breakpoint eq 0}">
                                    <span><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${item.unitPrice}" /> VND</span>
                                </c:if>
                                <button type="button" class="btn btn-fefault cart add-to-cart" itemid="${item.productId}">
                                    <i class="fa fa-shopping-cart"></i>
                                    Add to cart
                                </button>
                            </span>
                            <p><b>Availability:</b> 
                                <c:if test="${item.quantity > 0}">In Stock</c:if>
                                <c:if test="${item.quantity <= 0}">Temporarily out of stock</c:if>
                                </p>
                                <p><b>Condition:</b> 
                                <c:if test="${item.isNew}">New</c:if>
                                <c:if test="${not item.isNew}">Hot</c:if>
                                </p>
                                <p><b>Status:</b> 
                                <c:if test="${item.productStatus eq 0}">Stop business</c:if>
                                <c:if test="${item.productStatus != 0}">Selling</c:if>
                                </p>
                            </div><!--/product-information-->
                        </div>
                    </div><!--/product-details-->
                    <div class="category-tab shop-details-tab"><!--category-tab-->
                        <div class="col-sm-12">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#reviews" data-toggle="tab">Description</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="reviews" >
                                <div class="col-sm-12">
                                    <ul>
                                        <li><a href=""><i class="fa fa-clock-o"></i>${item.createTime}</a></li>
                                </ul>
                                <p>${item.description}</p>
                            </div>
                        </div>
                    </div>
                </div><!--/category-tab-->
                <div class="recommended_items"><!--recommended_items-->
                    <h2 class="title text-center">recommended items</h2>

                    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="item active">	
                                <c:forEach var="rel" items="${relp}">
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <a href="detail?id=${rel.productId}">
                                                        <c:forEach var="pic" items="${rel.pgProductPictureses}">
                                                            <c:if test="${pic.pictureType ==1}">
                                                                <img src="${path}${pic.path}" alt="" itemid="${pic.pictureSetId}">
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:set var="breakpoint"  value="${0}"/>       
                                                        <c:forEach var="sale" items="${rel.pgProductSaleses}">
                                                            <c:choose>
                                                                <c:when test="${sale.endDate ge now and sale.salesStatus eq 1}">
                                                                    <c:set var="saleprice"  value="${0}"/>
                                                                    <c:if test="${sale.isPercent}">
                                                                        <c:set var="saleprice" value="${rel.unitPrice-rel.unitPrice*sale.saleValue/100}"/>
                                                                    </c:if>
                                                                    <c:if test="${not sale.isPercent}">
                                                                        <c:set var="saleprice" value="${rel.unitPrice  - sale.saleValue }"/>
                                                                    </c:if>
                                                                    <c:set var="breakpoint"  value="${1}"/> 
                                                                    <h4 style="text-decoration: line-through;"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${rel.unitPrice}" /> VND</h4>
                                                                    <h2><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${saleprice}" /> VND</h2>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <c:if test="${ breakpoint eq 0}">
                                                            <h2><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${rel.unitPrice}" /> VND</h2>
                                                        </c:if>
                                                        <p>${rel.productName}</p>
                                                    </a>
                                                    <button type="button" class="btn btn-default add-to-cart" itemid="${rel.productId}"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>			
                    </div>
                </div><!--/recommended_items-->

            </div>
        </div>
    </div>
</section>
<%@include file="layouts/footer.jsp" %>