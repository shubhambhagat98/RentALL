<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<data>
    <c:choose>
        <c:when test="${not empty requestScope.messageList}">
            <c:forEach var="message" items="${requestScope.messageList}">
                <c:if test="${message.from_user_id == sessionScope.user_id}">
                    <div class="row justify-content-end mt-3">
                        <div class="col-8 alert-primary chat-message" role="alert">
                            <h5>Me</h5>
                            <p>${message.message}</p>
                                <%--                                        <p style="text-align: right;">${message.chat_time}</p>--%>
                        </div>
                    </div>
                </c:if>

                <c:if test="${message.from_user_id != sessionScope.user_id}">
                    <div class="row justify-content-start mt-3">
                        <div class="col-8 alert-secondary chat-message" role="alert">
                            <h5>${message.from_user_name}</h5>
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
</data>