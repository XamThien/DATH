<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.PgProductPictures"%>
<%@page import="model.PgProducts"%>
<%@page import="java.util.List"%>
<%@include file="layouts/header.jsp" %>
<section>
    <div class="container">
        <div class="row">
            <%@include file="layouts/banner-left.jsp" %>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">${cCategory}</h2>
                    <c:forEach var="pItem" items="${category.pgProductses}">

                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">

                                        <c:forEach var="pic" items="${pItem.pgProductPictureses}">
                                            <c:if test="${pic.pictureType ==1}">
                                                <img src="${path}${pic.path}" alt="">
                                            </c:if>
                                        </c:forEach>
                                        <h2>${pItem.unitOrder} VND</h2>
                                        <p>${pItem.productName}</p>
                                        <a href="javascript:void(0)" class="btn btn-default add-to-cart" itemid="${pItem.productId}"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>${pItem.unitOrder} VND</h2>
                                            <p>${pItem.productName}</p>
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
                    <ul class="pagination">
                        <li class="active"><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="layouts/footer.jsp" %>