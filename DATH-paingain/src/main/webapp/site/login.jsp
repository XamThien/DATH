<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="layouts/header.jsp" %>
<section id="form"><!--form-->
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <div class="login-form"><!--login form-->
                    <h2>Login to your account</h2>
                    <span>${msg}</span>
                    <form action="${pageContext.request.contextPath}/auth" method="post">
                        <input type="text" placeholder="Username or email" name="username"/>
                        <input type="password" placeholder="Password" name="lgpassword"/>
                        <input type="hidden" name="href" value="${href}">
                        <span>
                            <input type="checkbox" class="checkbox"> 
                            Keep me signed in
                        </span>
                        <button type="submit" class="btn btn-default">Login</button>
                    </form>
                </div><!--/login form-->
            </div>
            <div class="col-sm-1">
                <h2 class="or">OR</h2>
            </div>
            <div class="col-sm-4">
                <div class="signup-form"><!--sign up form-->
                    <h2>New User Signup!</h2>
                    <span>${spMsg}</span>
                    <form action="${pageContext.request.contextPath}/signup" method="post" class="contact-form">
                        <input type="hidden" name="href" value="${href}">
                        <div class="form-group col-md-6" style="padding: 0px">
                            <input type="text" placeholder="First name" name="fname" class="form-control"/>
                        </div>
                        <div class="form-group col-md-6" style="padding-right: 0px">
                            <input type="text" placeholder="Last name" name="lname" class="form-control"/>
                        </div>
                        <input type="text" placeholder="Username" name="username"/>
                        <input type="email" placeholder="Email Address" name="email"/>
                        <input type="text" placeholder="Phone number" name="phone"/>
                        <input type="text" placeholder="Address" name="address"/>
                        <input type="password" placeholder="Password" name="password"/>
                        <input type="password" placeholder="Confirm password" name="passconfirm"/>
                        <button type="submit" class="btn btn-default">Signup</button>
                    </form>
                </div><!--/sign up form-->
            </div>
        </div>
    </div>
</section><!--/form-->
<%@include file="layouts/footer.jsp" %>