<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | E-Shopper</title>
        <c:set value="${pageContext.request.contextPath}" var="path"/>
        <link href="${path}/site/layouts/css/bootstrap.min.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/prettyPhoto.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/price-range.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/animate.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/main.css" rel="stylesheet">
        <link href="${path}/site/layouts/css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${path}/site/layouts/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${path}/site/layouts/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${path}/site/layouts/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${path}/site/layouts/images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>
        <div class="container text-center">
            <div class="logo-404">
                <a href="${path}/home"><img src="${path}/site/layouts/images/home/logo.png" alt="" /></a>
            </div>
            <div class="content-404">
                <img src="${path}/site/layouts/images/404/404.png" class="img-responsive" style="max-width: 34%;" alt="" />
                <h1><b>OPPS!</b> We Couldn?t Find this Page</h1>
                <p>Uh... So it looks like you brock something. The page you are looking for has up and Vanished.</p>
                <h2><a href="${path}/home">Bring me back Home</a></h2>
            </div>
        </div>


        <script src="${path}/site/layouts/js/jquery.js"></script>
        <script src="${path}/site/layouts/js/price-range.js"></script>
        <script src="${path}/site/layouts/js/jquery.scrollUp.min.js"></script>
        <script src="${path}/site/layouts/js/bootstrap.min.js"></script>
        <script src="${path}/site/layouts/js/jquery.prettyPhoto.js"></script>
        <script src="${path}/site/layouts/js/main.js"></script>
    </body>
</html>