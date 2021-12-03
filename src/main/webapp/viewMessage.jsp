<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/30/21
  Time: 4:53 PM
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


<section class="chat-message-section mt-4">
    <div class="container justify-content-center">
        <div class="chat-wrapper bg-dark" >
            <div class="chat-inner-wrapper" id="chat-inner-wrapper">
                <c:choose>
                    <c:when test="${not empty requestScope.messageList}">
                        <c:forEach var="message" items="${requestScope.messageList}">
                            <c:if test="${message.from_user.user_id == sessionScope.user_id}">
                                <div class="row justify-content-end mt-3">
                                    <div class="col-8 alert-primary chat-message" role="alert">
                                        <h5>Me</h5>
                                        <p>${message.message}</p>
<%--                                        <p style="text-align: right;">${message.chat_time}</p>--%>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${message.from_user.user_id != sessionScope.user_id}">
                                <div class="row justify-content-start mt-3">
                                    <div class="col-8 alert-secondary chat-message" role="alert">
                                        <h5>${message.from_user.first_name} ${message.from_user.last_name}</h5>
<%--                                        <h5>${message.from_user.email_id}</h5>--%>
                                        <p>${message.message}</p>
<%--                                        <p style="text-align: right;">${message.chat_time}</p>--%>
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

            <div class="type_msg" style="padding-left: 20px; padding-right: 25px;">
                <form method="post" action="${pageContext.request.contextPath}/AddMessage">
                    <div class="input_msg_write">
                        <input type="hidden" name="to_user" value="${requestScope.to_user.user_id}" />
                        <input type="text" name="message" class="write_msg" placeholder="Type a message" style="padding: 5px; border-radius: 20px; outline: none" />
                        <button class="msg_send_btn" type="submit" style="margin-right: 35px; margin-top: -2px; outline: none;">
                            <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


<%@ include file="chatbot.jsp" %>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="application/javascript">
    $(document).ready(function (){

        // var div = $('#chat-inner-wrapper');
        //
        // div.animate({
        //     scrollTop: div[0].scrollHeight
        // }, 500);

        $('#chat-inner-wrapper').scrollTop($('#chat-inner-wrapper')[0].scrollHeight);


        var interval = setInterval(function (){
            $.ajax({
                type: 'POST',
                data : {to_user_id: '${requestScope.to_user.user_id}'},
                url:'${pageContext.request.contextPath}/ViewMessage',
                success: function (responseXml){
                    // var string1 = JSON.stringify(messageList);
                    // var result = JSON.parse(string1);
                    //
                    //
                    // for(var i=0;i<result.length;i++)
                    // {
                    //     console.log(result[i]);
                    // }

                    $("#chat-inner-wrapper").html($(responseXml).find("data").html());


                }

            });
        }, 1500);

        var div = $('#chat-inner-wrapper');

        // div.animate({
        //     scrollTop: div[0].scrollHeight
        // }, 500);
        $("#chat-inner-wrapper").scrollTop($("#chat-inner-wrapper")[0].scrollHeight);

    });


</script>
</body>
</html>
