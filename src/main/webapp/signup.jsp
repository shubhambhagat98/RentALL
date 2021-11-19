<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 10/30/21
  Time: 5:14 PM
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
    <script type="application/javascript" src="JS/signout.js"></script>
    <script type="application/javascript" src="JS/signin.js"></script>
    <script type="text/javascript" src="JS/signupValidation.js"></script>


    <title>Sign-up</title>
</head>
<body>
<%@ include file="header.jsp" %>

    <div class="signup-body-background ">
        <div class="container signup-form-div mt-5 mb-5" >
            <form name="signup" action="${pageContext.request.contextPath}/DBSignup" method="post" onsubmit="return signupValidate()">
                <div class="card p-3 text-center py-4"  ><!-- style="width: 35rem;" -->
                    <div class="mb-2">
                        <h4>Create account</h4>
                    </div>
                    <div class="mb-1">
                        <h6 id="errorMessage" class="text-danger"></h6>
                    </div>

                    <div class="row mb-3 g-2">
                        <div class="col">
                            <div class="form-outline ">
                                <input type="text" class="form-control" placeholder="First Name" name="first_name"/>
                                <small class="text-danger float-start" id="firstNameError"></small>
                            </div>

                        </div>
                        <div class="col">
                            <div class="form-outline">
                                <input type="text" class="form-control" placeholder="Last Name" name="last_name"/>
                                <small class="text-danger float-start" id="lastNameError"></small>
                            </div>

                        </div>
                    </div>
                    <div class="form-outline mb-3"> <input type="text" class="form-control" placeholder="E-mail" name="email_id"> <small class="text-danger float-start" id="emailError"></small></div>
                    <div class="form-outline mb-3 ">
                        <div class="input-group">
                            <input type ="password" class="form-control" placeholder="Password" name="password" id="password" style="border-right: none " style="border-right: none ">
                            <span class="input-group-text" style="background: none; border-left: none"><i style="cursor:pointer;" class="bi bi-eye-slash" id="togglePassword" onclick="togglePassword()"></i></span>
                        </div>
                        <small class="text-danger float-start" id="passwordError"></small>

                    </div>

                    <div class="form-outline mb-3 ">
                        <div class="input-group">
                            <input type ="password" class="form-control" placeholder="Confirm Password" name="con_password" id="con_password" style="border-right: none ">
                            <span class="input-group-text" style="background: none; border-left: none"><i style="cursor:pointer; background: none" class="bi bi-eye-slash" id="toggleConPassword" onclick="toggleConPassword()"></i></span>
                        </div>
                        <small class="text-danger float-start" id="conPasswordError"></small>
                    </div>

                    <div class="form-outline mb-3"> <input  type="text" class="form-control" placeholder="Contact number" name="contact"><small class="text-danger float-start" id="contactError"></small> </div>
                    <div class="mb-3 text-start">
                        <label  class="form-label">Please answer these security questions</label>
                        <input type="text" class="form-control mb-2" id="security1" placeholder="What is your mother's maiden name?" name="security_1">
                        <small class="text-danger float-start" id="security1Error"></small>
                        <input type="text" class="form-control mb-2" id="security2" placeholder="What is your favourite sport?" name="security_2">
                        <small class="text-danger float-start" id="security2Error"></small>
                        <input type="text" class="form-control " id="security3" placeholder="What is your home city?" name="security_3">
                        <small class="text-danger float-start" id="security3Error"></small>
                    </div>

                    <div class="mt-3 d-grid px-3"> <button class="btn btn-primary btn-block btn-signup text-uppercase" type="submit">
                        <span>Submit</span> </button>
                    </div>
                    <div class="mt-4"> <span style="display:inline-block; vertical-align:middle;">Sign up using: </span> <div class="g-signin2" data-prompt="select_account" data-onsuccess="onSignIn" style="display:inline-block; vertical-align:middle;"></div> </div>
                    <div class="mt-4"> <span>Already have an account?</span> <a href="login.jsp" class="text-decoration-none">Sign-in</a> </div>

                </div>
            </form>
        </div>
    </div>






  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <c:if test="${(not empty sessionScope.signupError) and (sessionScope.signupError == true)}">
        <script>
            document.getElementById("errorMessage").innerHTML = "There was some error, please try again...";
        </script>
        <c:remove var="loginError" scope="session" />
    </c:if>
</body>
</html>
