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
    <%--    PUT YOUR GOOGLE OAUTH CLIENT ID--%>
    <meta name="google-signin-client_id" content="PUT_YOUR_CLIENT_ID.apps.googleusercontent.com"/>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script type="application/javascript" src="JS/signout.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                                                        <img class="card-img-top " src="https://rentallproductimage.s3.amazonaws.com/${product.prod_firstImage}"
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


            <section class="your-listings mt-3" >
                <div class="container">
                    <div class="title-box">
                        <h2>Rented Products</h2>
                    </div>
                    <div class="row mt-3">
                        <c:choose>
                            <c:when test="${not empty requestScope.rentedProductList}">
                                <c:forEach var="product" items="${requestScope.rentedProductList}">
                                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 col-6 item mb-3">
                                        <a class="product-card" href="${pageContext.request.contextPath}/ProductDetails?action=rentedProductAdminView&product_id=${product.prod_id}">
                                            <div class="card h-100">
                                                <div class="card-body">
                                                    <div class="card-image-wrapper">
                                                        <img class="card-img-top " src="https://rentallproductimage.s3.amazonaws.com/${product.prod_firstImage}"
                                                             alt="product image"/>
                                                    </div>
                                                    <h5 class="card-title mt-3 mb-2">${product.prod_title}</h5>
                                                        <%--                                            <h6 class="card-subtitle text-muted">Category: ${product.prod_category}</h6>--%>
                                                    <h6 class="card-subtitle text-muted">Status: ${product.prod_status}</h6>
                                                        <%--                                            <c:if test="${product.prod_rating > 0.0}">--%>
                                                    <div class="mt-2"><span class="stars" data-rating="${product.prod_rating}" data-num-stars="5" ></span></div>
                                                        <%--                                            </c:if>--%>
                                                    <div class = "mt-2">
                                                        <div  style="display:inline-block; vertical-align:middle;">
                                                    <span class = "float-start product-price" >
                                                         $${product.prod_price}.00
                                                    </span>
                                                        </div>
                                                        <div style="display:inline-block; vertical-align:middle; float: right">
                                                            <button class="btn btn-primary float-end">View</button>
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
                                    <h4>There are no rented products yet</h4>
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
                        <div class ="chartBox">
                            <canvas id="myChart" ></canvas>
                        </div>
                    </div>
                    <div class="mt-4">
                        <div class ="chartBox">
                            <canvas id="myChart2" ></canvas>
                        </div>
                    </div>
                </div>
            </section>
        </c:when>
        <c:when test="${requestScope.adminQuery == 'complaints'}">
            <section class="complaint-list mt-3">
                <div class="container">
                    <div class="title-box">
                        <h2>Complaints</h2>
                    </div>
                    <div class="complaint mt-2">
                        <c:choose>
                            <c:when test="${not empty requestScope.complaintList}">
                                <c:forEach var = "complaint" items="${requestScope.complaintList}">
                                    <div class = "card mb-3">
                                        <div class = "row no-gutters">
                                            <div class = "col-md-6">
                                                <div class = "complaint-image p-3">
                                                    <img src= "https://rentallproductimage.s3.amazonaws.com/${complaint.product.prod_firstImage}" class="complaint-card-img" alt=""/>
                                                </div>
                                            </div>
                                            <div class = "col-md-6">
                                                <div class = "card-body">
                                                    <h3 class = "card-title">${complaint.product.prod_title}</h3>
                                                    <hr>
                                                    <span class = "card-title d-block complaint-info"><b>Seller name:</b> ${complaint.seller.first_name} ${complaint.seller.last_name}</span>
                                                    <span class = "card-title d-block complaint-info"><b>Seller contact:</b>${complaint.seller.email_id}</span>
                                                    <p class = "card-text complaint-info"><b>Description:</b> ${complaint.description}</p>
                                                    <span class = "card-title complaint-info"><b>Submitted By: </b>${complaint.renter.first_name} ${complaint.renter.last_name}</span>
                                                    <span class="card-title d-block complaint-info "> <b>Date:</b> ${complaint.date} </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <h4>No complaint record found.</h4>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </section>
        </c:when>
    </c:choose>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>


<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var prodCategoryCount =${requestScope.prodCategoryCount.toString()};
    var labels = prodCategoryCount.map(function(categoryMap) {
        return categoryMap.x;
    });
    var data = prodCategoryCount.map(function(categoryMap) {
        return categoryMap.y;
    });
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '# of something',
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false,
                },
                title: {
                    display: true,
                    text: 'product category analytics',
                    padding: {
                        top: 10,
                        bottom: 30
                    }
                },
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                        stepSize:1
                    }
                }
            }
        }
    });
</script>




<script>
    var ctx = document.getElementById('myChart2').getContext('2d');
    var prodLocationCount =${requestScope.prodLocationCount.toString()};
    var labels = prodLocationCount.map(function(categoryMap) {
        return categoryMap.x;
    });
    var data = prodLocationCount.map(function(categoryMap) {
        return categoryMap.y;
    });
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '# of something',
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false,
                },
                title: {
                    display: true,
                    text: 'product location analytics',
                    padding: {
                        top: 10,
                        bottom: 30
                    }
                },
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                        stepSize:1
                    }
                }
            }
        }
    });
</script>


</body>
</html>
