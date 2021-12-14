<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
    <script src="JS/rating.js"></script>
    <title>rentall</title>

    <script>

        $(function() {
            $('.stars').stars();
        });

    </script>
</head>
<body>

<%@ include file="header.jsp" %>

<section class="page-title">
    <div class="page-background">
        <div class="page-header">
            <div class="container">
                <h2>Your Account</h2>
                <ul>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/Messages">Messages</a></li>
                    <li><a class="nav-link" href="addProduct.jsp">Add Product</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>

<div class="display-section ">
    <section class="your-listings mt-3" >
        <div class="container">
            <div class="title-box">
                <h2>Your Listings</h2>
            </div>
            <div class="row mt-3">
                <c:choose>
                    <c:when test="${not empty requestScope.yourProductList}">
                        <c:forEach var="product" items="${requestScope.yourProductList}">
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 col-6 item mb-3">
                                <a class="product-card" href="${pageContext.request.contextPath}/ProductDetails?action=yourProduct&product_id=${product.prod_id}">
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <div class="card-image-wrapper">
                                                <img class="card-img-top " src="https://rentallproductimage.s3.amazonaws.com/${product.prod_firstImage}"
                                                     alt="product image"/>
                                            </div>
                                            <h5 class="card-title mt-3 mb-2">${product.prod_title}</h5>
<%--                                            <h6 class="card-subtitle text-muted">Category: ${product.prod_category}</h6>--%>
                                            <h6 class="card-subtitle text-muted">Status: ${product.prod_status}</h6>
                                            <c:if test="${product.prod_rating > 0.0}">
                                                <div class="mt-2"><span class="stars" data-rating="${product.prod_rating}" data-num-stars="5" ></span></div>
                                            </c:if>
                                            <div class = "mt-2">
                                                <div  style="display:inline-block; vertical-align:middle;">
                                                    <span class = "float-start product-price" >
                                                         $${product.prod_price}.00
                                                    </span>
                                                </div>
                                                <div style="display:inline-block; vertical-align:middle; float: right">
                                                    <button class="btn btn-primary float-end" onclick="location.href = '${pageContext.request.contextPath}/ProductDetails?action=yourProduct&product_id=${product.prod_id}'">View</button>
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
                            <h4>You don't have any listings yet.</h4>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>

<%--  section for rented products  --%>
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
                                <a class="product-card" href="${pageContext.request.contextPath}/ProductDetails?action=rentedProductsByYou&product_id=${product.prod_id}">
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
                            <h4>You have not rented any products yet</h4>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>

</div>





<!-- login Modal -->
<div class="modal" id="rentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rentModalTitle">Product Rented</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Your request for renting product is successful. The product has been added to your renting list. You will receive a confirmation email shortly. </span>
                <span class="d-block mt-2">Thank you for using RentALL</span>
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
        <c:if test="${(not empty sessionScope.rentProduct) and (sessionScope.rentProduct == true)}">
        $('#rentModal').modal('show');
        <c:remove var="rentProduct" scope="session" />
        </c:if>

    });
</script>
</body>
</html>