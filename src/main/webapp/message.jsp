<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/30/21
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>Message</title>
</head>
<body>

<%@ include file="header.jsp" %>

<section class="page-title">
    <div class="page-background">
        <div class="page-header">
            <div class="container">
                <h2>Messages</h2>
                <ul>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/Messages">Messages</a></li>
                    <li><a class="nav-link" href="addProduct.jsp">Add Product</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>


<section class="chat-message-list mt-4">
    <div class="container bg-dark" style=" min-height: 60vh; max-height: 65vh; overflow-y: auto; margin-bottom: 100px;">
        <c:choose>
            <c:when test="${not empty requestScope.messageList}">
                <c:forEach var="message" items="${requestScope.messageList}">
                    <c:if test="${message.from_user.user_id == sessionScope.user_id}">
                        <div class="card mt-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-1  col-2" >
                                        <div class="circle">
                                            <span class="avatar-text">${fn:substring(message.to_user.first_name, 0, 1)}</span>
                                        </div>

                                    </div>
                                    <div class="col-md-11  col-10" style="cursor: pointer;" onclick="window.location.href = '${pageContext.request.contextPath}/ViewMessage?action=getMessageByToken&token=${message.token}&to_user_id=${message.to_user.user_id}'" >
                                        <h5 class="card-title">
                                            ${message.to_user.first_name} ${message.to_user.last_name}
<%--                                                ${message.to_user.user_id}--%>
<%--                                                ${message.to_user.email_id}--%>
                                        </h5>
                                        <h6 class="card-subtitle mb-2 text-muted">${message.message}</h6>
                                        <p class="card-text">${message.chat_time}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${message.from_user.user_id != sessionScope.user_id}">
                        <div class="card mt-3 ">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-1  col-2">
                                        <div class="circle">
                                            <span class="avatar-text">${fn:substring(message.from_user.first_name, 0, 1)}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-11  col-10" style="cursor: pointer;" onclick="window.location.href = '${pageContext.request.contextPath}/ViewMessage?action=getMessageByToken&token=${message.token}&to_user_id=${message.from_user.user_id}'" >
                                        <h5 class="card-title">
                                                ${message.from_user.first_name} ${message.from_user.last_name}
<%--                                                     ${message.to_user.user_id}--%>
<%--                                                    ${message.from_user.email_id}--%>
                                        </h5>
                                        <h6 class="card-subtitle mb-2 text-muted">${message.message}</h6>
                                        <p class="card-text">${message.chat_time}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </c:forEach>

            </c:when>
            <c:otherwise>
                <div >
                    <h4 class="py-5 px-5" style="color: #f4f4f4">You don't have any messages yet.</h4>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
