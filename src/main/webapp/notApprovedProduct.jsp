<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/13/21
  Time: 9:25 PM
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
    <script src="JS/rating.js"></script>
    <script>

        $(function() {
            $('.stars').stars();
        });

    </script>
    <title>rentall</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section class="page-title">
    <div class="page-background">
        <div class="page-header">
            <div class="container">
                <h2>Product Details</h2>
<%--                <ul>--%>
<%--                    <li><a class="nav-link" href="viewProfile.jsp">View Profile</a></li>--%>
<%--                    <li><a class="nav-link" href="addProduct.jsp">Add Product</a></li>--%>
<%--                </ul>--%>
            </div>
        </div>
    </div>
</section>
<c:set var="count" value="0" scope="page" />
<section class="single-product mt-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12 mb-2">
                <div id="product-slider" class="carousel slide " data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach var="image" items="${requestScope.imageFileList}">
                            <c:choose>
                                <c:when test="${count == 0}">
                                    <div class="carousel-item single-product-image active">
                                        <img class="img-fluid" src="images/products/${image}" alt="">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="carousel-item single-product-image">
                                        <img class="img-fluid" src="images/products/${image}" alt="">
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <c:set var="count" value="${count + 1}" scope="page"/>
                        </c:forEach>
                        <c:if test="${requestScope.imageFileList.size() > 1}">
                            <button class="carousel-control-prev" type="button" data-bs-target="#product-slider" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#product-slider" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </c:if>

                    </div>
                </div>

            </div>
            <div class="col-md-6 col-sm-12">
                <div class="product-info">
                    <div ><span class="product-title">${requestScope.product.prod_title}</span></div>
                    <%--                put if condition to display rating--%>
                    <c:if test="${requestScope.product.prod_rating > 0.0}">
                        <div class="mt-2"><span class="stars" data-rating="${requestScope.product.prod_rating}" data-num-stars="5" ></span></div>
                    </c:if>
                        <div class="mt-2"><span class="stars" data-rating="${requestScope.product.prod_rating}" data-num-stars="5" ></span></div>
                    <div class="mt-2"><span class="price">Price $${requestScope.product.prod_price}.00</span><span class="duration">/${requestScope.product.prod_duration}</span></div>
                    <div class="mt-2"><span class="info"><b>Category:</b> ${requestScope.product.prod_category}</span></div>
                    <div class="mt-2"><span class="info"><b>Status:</b> ${requestScope.product.prod_status}</span></div>
                    <div class="mt-2 mb-2">
                        <span class="d-block info"><b>Seller information:</b></span>
                        <span class="d-block info"><b>Name:</b> ${requestScope.seller.first_name} ${requestScope.seller.last_name}</span>
                        <span class="info"><b>Contact:</b> ${requestScope.seller.email_id}</span>
                    </div>
                    <button type="button" class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#ApproveModal" >Approve</button>
                </div>
            </div>
        </div>
    </div>
</section>

<%--hide product modal--%>
<div class="modal fade" id="ApproveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ApproveModalTitle">Modify Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Are you sure you want to mark this product as "Approved"?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/UpdateProductStatus?action=Approve&product_id=${requestScope.product.prod_id}'">Yes</button>
            </div>
        </div>
    </div>
</div>

<div class="mt-3">
    <section class="product-description mt-2">
        <div class="container">
            <h6>Product Description</h6>
            <p class="mt-2">
                ${requestScope.product.prod_description}
            </p>
        </div>
    </section>
</div>

<section class="product-location mt-4 mb-2">
    <div class="container">
        <h6>Product Location</h6>
        <div class="address d-block">
            <p><b>Address: </b>${requestScope.product.prod_street_address}, ${requestScope.product.prod_city}, ${requestScope.product.prod_state}, ${requestScope.product.prod_pincode}, USA.</p>
        </div>
        <div class="mt-1" id="googleMap">
        </div>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script>
    function myMap() {
        var lat = parseFloat('${requestScope.lat}');
        console.log(lat)
        var lng = parseFloat('${requestScope.lng}');
        console.log(lng)
        var mapProp= {
            center:new google.maps.LatLng(lat,lng),
            zoom:18,
        };
        var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
        var marker = new google.maps.Marker(
            {
                position:{lat: lat, lng:lng },
                map:map,
            }
        );
        marker.setMap(map);
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMBgnNGsl68y8KN5ATgoj_GlvI58NFDE8&callback=myMap"></script>
</body>
</html>
