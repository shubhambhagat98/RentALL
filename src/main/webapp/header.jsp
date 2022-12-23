<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 10/31/21
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <nav class="navbar navbar-custom">
        <div class="container">
            <a class="navbar-brand " href="index.jsp">
                <img src="https://t3.ftcdn.net/jpg/03/68/95/08/360_F_368950850_aMW6C9P5SV7udFGHWgz97fvgNVsnOvpp.jpg"  alt="" width="30" height="24" class="d-inline-block align-text-top">
                RENTALL
            </a>
            <div class="navbar-links">
                <ul class="nav justify-content-end">
                    <li class="nav-item ">
                        <a class="nav-link " href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="${pageContext.request.contextPath}/ProductListing?action=allProducts" >Products</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="index.jsp#services">Services</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="index.jsp#about-us">About Us</a>
                    </li>
                    <c:choose>
                        <c:when test="${ (not empty sessionScope.user_id) and (sessionScope.type == 'DBLogin')}">
                            <li class="nav-item ">
                                <a class="nav-link " href="${pageContext.request.contextPath}/MyAccount">Account</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link " href="${pageContext.request.contextPath}/DBLogout">Logout</a>
                            </li>
                        </c:when>

                        <c:when test="${ (not empty sessionScope.user_id) and (sessionScope.type == 'admin')}">
                            <li class="nav-item ">
                                <a class="nav-link " href="${pageContext.request.contextPath}/Admin?adminQuery=productList">Admin</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link " href="${pageContext.request.contextPath}/DBLogout">Logout</a>
                            </li>
                        </c:when>



                        <c:when test="${ (not empty sessionScope.user_id) and (sessionScope.type == 'GoogleLogin')}">
                            <li class="nav-item ">
                                <a class="nav-link " href="${pageContext.request.contextPath}/MyAccount">Account</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link " href="${pageContext.request.contextPath}/DBLogout">Logout</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item ">
                                <a class="nav-link " href="login.jsp">Login</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="navbar-toggle-button">
                <div class="nav justify-content-end">
                    <span class="nav-item">
                        <i class="fa fa-bars nav-link" data-bs-toggle="offcanvas" data-bs-target="#toggle-side-menu"></i>
                    </span>
                </div>

            </div>



        </div>
    </nav>

    <%--side menu--%>
    <div class="offcanvas offcanvas-end " tabindex="-1" id="toggle-side-menu">
        <div class="offcanvas-header clearfix" >
            <i class="fa fa-times side-menu-close" data-bs-dismiss="offcanvas" style="display:inline-block; vertical-align:middle;"></i>
            <h4 class="offcanvas-title float-start mt-1" style="display:inline-block; vertical-align:middle;">Side Menu</h4>

        </div>
        <div class="offcanvas-body">

            <div class="sidebar">
                <a class = "nav-link" href="index.jsp">Home</a>
                <a class="nav-link " href="${pageContext.request.contextPath}/ProductListing?action=allProducts" >Products</a>
                <a class="nav-link " href="index.jsp#services">Services</a>
                <a class="nav-link " href="index.jsp#about-us">About Us</a>
                <c:choose>
                    <c:when test="${ (not empty sessionScope.user_id) and (sessionScope.type == 'DBLogin')}">
                        <a class="nav-link " href="${pageContext.request.contextPath}/MyAccount">Account</a>
                        <a class="nav-link " href="${pageContext.request.contextPath}/DBLogout">Logout</a>
                    </c:when>

                    <c:when test="${ (not empty sessionScope.user_id) and (sessionScope.type == 'admin')}">
                        <a class="nav-link " href="${pageContext.request.contextPath}/Admin?adminQuery=productList">Admin</a>
                        <a class="nav-link " href="${pageContext.request.contextPath}/DBLogout">Logout</a>
                    </c:when>



                    <c:when test="${ (not empty sessionScope.user_id) and (sessionScope.type == 'GoogleLogin')}">
                        <a class="nav-link " href="${pageContext.request.contextPath}/MyAccount">Account</a>
                        <a class="nav-link " href="${pageContext.request.contextPath}/DBLogout">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link " href="login.jsp">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>


</body>
</html>
