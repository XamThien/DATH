<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.PgProductPictures"%>
<%@page import="model.PgProducts"%>
<%@page import="java.util.List"%>
<%@include file="layouts/header.jsp" %>
<section id="slider"><!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-6">
                                <h1><span>E</span>-SHOPPER</h1>
                                <h2>Free E-Commerce Template</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="${path}/site/layouts/images/home/girl1.jpg" class="girl img-responsive" alt="" />
                                <img src="${path}/site/layouts/images/home/pricing.png"  class="pricing" alt="" />
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>E</span>-SHOPPER</h1>
                                <h2>100% Responsive Design</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="${path}/site/layouts/images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                <img src="${path}/site/layouts/images/home/pricing.png"  class="pricing" alt="" />
                            </div>
                        </div>

                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>E</span>-SHOPPER</h1>
                                <h2>Free Ecommerce Template</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src="${path}/site/layouts/images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                <img src="${path}/site/layouts/images/home/pricing.png" class="pricing" alt="" />
                            </div>
                        </div>

                    </div>

                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>

            </div>
        </div>
    </div>
</section><!--/slider-->
<section>
    <div class="container">
        <div class="row">
            <%@include file="layouts/banner-left.jsp" %>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">${cCategory}</h2>
                    <c:forEach var="pItem" items="${pList}">

                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">

                                        <c:forEach var="pic" items="${pItem.pgProductPictureses}">
                                            <c:if test="${pic.pictureType ==1}">
                                                <img src="${path}${pic.path}" alt="">
                                            </c:if>
                                        </c:forEach>
                                        <h2>${pItem.unitPrice} VND</h2>
                                        <p>${pItem.productName}</p>
                                        <a href="javascript:void(0)" class="btn btn-default add-to-cart" itemid="${pItem.productId}"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>${pItem.unitPrice} VND</h2>
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
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="layouts/footer.jsp" %>