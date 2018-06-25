<%-- 
    Document   : header.jsp
    Created on : Jun 19, 2018, 4:23:20 PM
    Author     : dangt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <c:set var="path" value="${pageContext.request.contextPath}"/>
        <title>${title}</title>
        <link href="${path}/site/layouts/css/bootstrap.min.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/prettyPhoto.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/price-range.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/animate.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/main.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/responsive.css" rel="stylesheet">      
        <link rel="shortcut icon" href="${path}/site/layouts/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${path}/site/layouts/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${path}/site/layouts/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${path}/site/layouts/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${path}/site/layouts/images/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body>
        <header id="header"><!--header-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="${path}/home"><img src="${path}/site/layouts/images/home/logo.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <c:if test="${authentic!=null}">
                                        <li><a href="${path}/myaccount"><i class="fa fa-user"></i> Account</a></li>
                                        </c:if>

                                    <li><a href="${path}/checkout"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="${path}/mycart"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                        <c:if test="${authentic==null}">
                                        <li><a href="${path}/site-login"><i class="fa fa-lock"></i> Login</a></li>
                                        </c:if>
                                        <c:if test="${authentic!=null}">
                                        <li><a href="${path}/site-logout"><i class="fa fa-lock"></i> logout</a></li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="${path}/home" class="active">Home</a></li>
                                    <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="${path}/checkout">Checkout</a></li> 
                                            <li><a href="${path}/mycart">Cart</a></li> 
                                                <c:if test="${authentic==null}">
                                                <li><a href="${path}/site-login">Login</a></li>
                                                </c:if>
                                                <c:if test="${authentic!=null}">
                                                <li><a href="${path}/site-logout">logout</a></li>
                                                </c:if> 
                                        </ul>
                                    </li> 
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="search_box pull-right">
                                <input type="text" placeholder="Search"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->
