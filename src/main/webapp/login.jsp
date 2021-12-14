<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 10/30/21
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content = "IE=edge">
    <%--    bootstrap css --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/style.css">
    <%--   google OAuth files--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-scope" content="profile email">
    <%--    PUT YOUR GOOGLE OAUTH CLIENT ID--%>
    <meta name="google-signin-client_id" content="PUT_YOUR_CLIENT_ID.apps.googleusercontent.com"/>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script type="application/javascript" src="JS/signin.js"></script>
    <script type="text/javascript" src="JS/loginValidation.js" ></script>


    <title>login</title>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="body-background">
    <div class="container login-form-div mt-3 mb-5" >
        <form action="${pageContext.request.contextPath}/DBLogin" method="post" name="login" onsubmit="return loginValidate()">
            <div class="card p-3 text-center py-4"  ><!-- style="width: 35rem;" -->
                <div class="mb-2">
                    <h4>Login</h4>
                </div>
                <div class="mb-1">
                    <h6 id="errorMessage" class="text-danger"></h6>
                </div>

                <div class="form-outline  mb-3">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Enter email Id" name="email_id" id="email_id">
                    </div>
                    <small class="text-danger float-start" id="emailError"></small>
                </div>
                <div class="form-outline  mb-3">
                    <div class="input-group">
                        <input type ="password" class="form-control" placeholder="Enter password" name="password" id="password" style="border-right: none ">
                        <span class="input-group-text" style="background: none; border-left: none" ><i style="cursor:pointer; background: none" class="bi bi-eye-slash" id="togglePassword" onclick="togglePassword()"></i></span>
                    </div>
                    <small class="text-danger float-start" id="passwordError"></small>
                    <small class="float-end"><a href="forgotPassword.jsp" class="text-decoration-none">Forgot Password</a></small>
                </div>


                <div class="mt-2 d-grid px-3"> <button class="btn btn-primary btn-block btn-signup text-uppercase" type="submit">
                    <span>Submit</span> </button>
                </div>
                <div class="mt-4"> <span style="display:inline-block; vertical-align:middle;">Sign up using: </span> <div class="g-signin2" data-prompt="select_account" data-onsuccess="onSignIn" style="display:inline-block; vertical-align:middle;"></div> </div>
                <div class="mt-4"> <span>Create an account?</span> <a href="signup.jsp" class="text-decoration-none">Sign-Up</a> </div>

            </div>
        </form>
    </div>
</div>

<!-- login Modal -->
<div class="modal" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="DeleteModalTitle">Invalid Credentials</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Please enter valid login credentials</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>


<!-- reset error Modal -->
<div class="modal" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resetModalTitle">Password Reset</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Your Password has been reset. Please login using your new Password.</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="chatbot.jsp" %>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<script>
    $(window).on('load', function() {
        <c:if test="${(not empty sessionScope.loginError) and (sessionScope.loginError == true)}">
            $('#LoginModal').modal('show');
            <c:remove var="loginError" scope="session" />
        </c:if>

        <c:if test="${(not empty sessionScope.passwordReset) and (sessionScope.passwordReset == true)}">
            $('#resetModal').modal('show');
            <c:remove var="passwordReset" scope="session" />
        </c:if>

    });
</script>

</body>
</html>
