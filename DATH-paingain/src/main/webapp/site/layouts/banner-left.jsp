<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-3">
    <div class="left-sidebar">
        <h2>Category</h2>
        <div class="panel-group category-products" id="accordian"><!--category-productsr-->
            <c:forEach items="${categories}" var="cate">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="${path}/shop?id=${cate.categoryId}">${cate.categoryName}</a></h4>
                </div>
            </div>
            </c:forEach>
        </div><!--/category-products-->
    </div>
</div>
