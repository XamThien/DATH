<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="layouts/header.jsp" %>
<div class="container">
    <div class="row">  	
        <div class="col-sm-8">
            <div class="contact-form">
                <h2 class="title text-center">Edit Information</h2>
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form row user-info" name="contact-form">
                    <div class="form-group col-md-6">
                        <input type="text" name="fname" class="form-control" value="${authentic.users.firstName}" required="required" placeholder="First name" >
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" name="lname" class="form-control" value="${authentic.users.lastName}" required="required" placeholder="Last name">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" name="phone" class="form-control" value="${authentic.users.phoneNumber}" required="required" placeholder="Phone number">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" name="cardid" class="form-control" value="${authentic.users.cardId}" placeholder="Card id">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="email" name="email" class="form-control" value="${authentic.users.email}" placeholder="Email">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="radio-inline">
                            <input type="radio" name="sex" value="1" <c:if test="${authentic.users.sex}">checked="checked"</c:if>>Male
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" value="0" <c:if test="${not authentic.users.sex}">checked="checked"</c:if>>Female
                        </label>
                    </div>
                    <div class="form-group col-md-12">
                        <textarea name="address" id="message" required="required" class="form-control" rows="8" placeholder="Address...">${authentic.users.address}</textarea>
                    </div>                        
                    <div class="form-group col-md-12">
                        <input type="button" class="btn btn-primary pull-right user-update" value="Save">
                    </div>
                </form>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="contact-info">
                <h2 class="title text-center">Information</h2>
                <address>
                    <p>${authentic.users.firstName} ${authentic.users.lastName}</p>
                    <p>${authentic.users.address}</p>
                    <p>Sex: 
                        <c:if test="${authentic.users.sex}"> Male</c:if>
                        <c:if test="${not authentic.users.sex}"> Female</c:if>
                     </p>
                    <p>Mobile: ${authentic.users.phoneNumber}</p>
                    <p>CardId: ${authentic.users.cardId}</p>
                    <p>Email: ${authentic.users.email}</p>
                </address>
            </div>
        </div>    			
    </div>
</div>
<%@include file="layouts/footer.jsp" %>