<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/17/21
  Time: 7:20 PM
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
    <meta name="google-signin-client_id" content="359199286110-ji2g5fkkf1ktpjhoadqejfprcks90vlr.apps.googleusercontent.com"/>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script type="application/javascript" src="JS/signin.js"></script>
    <script type="text/javascript" src="JS/forgotPasswordValidation.js" ></script>

    <title>Forgot Password</title>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="body-background">
    <div class="container login-form-div mt-3 mb-5" >
        <form action="${pageContext.request.contextPath}/forgotPassword" method="post" name="forgotPassword" onsubmit="return forgotPasswordValidate()">
            <div class="card p-3 text-center py-4"  ><!-- style="width: 35rem;" -->
                <div class="mb-2">
                    <h4>Forgot Password</h4>
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

                <div class="mb-3 text-start">
                    <label  class="form-label">Please answer these security questions</label>
                    <input type="text" class="form-control mb-2" id="security1" placeholder="What is your mother's maiden name?" name="security_1">
                    <small class="text-danger float-start" id="security1Error"></small>
                    <input type="text" class="form-control mb-2" id="security2" placeholder="What is your favourite sport?" name="security_2">
                    <small class="text-danger float-start" id="security2Error"></small>
                    <input type="text" class="form-control " id="security3" placeholder="What is your home city?" name="security_3">
                    <small class="text-danger float-start" id="security3Error"></small>
                </div>

                <div class="mt-2 d-grid px-3"> <button class="btn btn-primary btn-block btn-signup text-uppercase" type="submit">
                    <span>Submit</span> </button>
                </div>

            </div>
        </form>
    </div>
</div>


<!-- forgot password Modal -->
<div class="modal" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fPModalTitle">Invalid Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Please enter valid details</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- send email Modal -->
<div class="modal" id="sendEmailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="sMModalTitle">Alert</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>There was some error. Verify your email address and try again.</span>
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
        <c:if test="${(not empty sessionScope.forgotPasswordError) and (sessionScope.forgotPasswordError == true)}">
            console.log('${sessionScope.forgotPasswordError}');
            $('#forgotPasswordModal').modal('show');
            <c:remove var="forgotPasswordError" scope="session" />
        </c:if>
        <c:if test="${(not empty sessionScope.sendEmailError) and (sessionScope.sendEmailError == true)}">
            console.log('${sessionScope.sendEmailError}');
            $('#sendEmailModal').modal('show');
            <c:remove var="sendEmailError" scope="session" />
        </c:if>

    });
</script>

</body>
</html>
