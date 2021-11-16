<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/8/21
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta name="google-signin-client_id" content="359199286110-30sbl7a4t5qc2do4javmsm8se8g33jms.apps.googleusercontent.com"/>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script type="application/javascript" src="JS/signout.js"></script>
    <title>rentall</title>

</head>
<body>
<%@ include file="header.jsp" %>

<section class="page-title">
    <div class="page-background">
        <div class="page-header">
            <div class="container">
                <h2>Admin Module</h2>
                <ul>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/Admin?adminQuery=productList">Products</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/Admin?adminQuery=analytics">Analytics</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/Admin?adminQuery=complaints">Complaints</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>

<div class="display-section">
    <c:choose>
        <c:when test="${requestScope.adminQuery == 'productList'}">
            <section class="your-listings mt-3" >
                <div class="container">
                    <div class="title-box">
                        <h2>Pending Products</h2>
                    </div>
                    <div class="row mt-3">
                        <c:choose>
                            <c:when test="${not empty requestScope.pendingProductList}">
                                <c:forEach var="product" items="${requestScope.pendingProductList}">
                                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 col-6 item mb-3">
                                        <a class="product-card" href="${pageContext.request.contextPath}/ProductDetails?action=notApprovedProduct&product_id=${product.prod_id}">
                                            <div class="card h-100">
                                                <div class="card-body">
                                                    <div class="card-image-wrapper">
                                                        <img class="card-img-top " src="images/products/${product.prod_firstImage}"
                                                             alt="product image"/>
                                                    </div>
                                                    <h5 class="card-title mt-3 mb-2">${product.prod_title}</h5>
                                                    <h6 class="card-subtitle text-muted">Category: ${product.prod_category}</h6>
<%--                                                    <h6 class="card-subtitle text-muted">Status: ${product.prod_status}</h6>--%>
                                                    <div class = "mt-2">
                                                        <div  style="display:inline-block; vertical-align:middle;">
                                                    <span class = "float-start product-price" >
                                                         $${product.prod_price}.00
                                                    </span>
                                                        </div>
                                                        <div style="display:inline-block; vertical-align:middle; float: right">
                                                            <button class="btn btn-primary float-end" onclick="location.href = '${pageContext.request.contextPath}/ProductDetails?action=notApprovedProduct&product_id=${product.prod_id}'" >View</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <h2>You don't have any pending products to approve.</h2>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </section>
        </c:when>
        <c:when test="${requestScope.adminQuery == 'analytics'}">
            <section class="your-listings mt-3">
                <div class="container">
                    <div class="title-box">
                        <h2>Analytics</h2>
                    </div>
                    <div class="mt-2">
                        <h2>${requestScope.analytics}</h2>
                    </div>
                </div>
            </section>
        </c:when>
        <c:when test="${requestScope.adminQuery == 'complaints'}">
            <section class="your-listings mt-3">
                <div class="container">
                    <div class="title-box">
                        <h2>Complaints</h2>
                    </div>
                    <div class="mt-2">
                        <h2>${requestScope.complaints}</h2>
                    </div>
                </div>
            </section>
        </c:when>
    </c:choose>
</div>


<h3>Welcome  ${sessionScope.email_id}</h3>
<h3>First name  ${sessionScope.first_name}</h3>
<h3>last name  ${sessionScope.last_name}</h3>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
