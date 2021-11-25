<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/14/21
  Time: 3:01 AM
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
    <script src="JS/filterReset.js"></script>

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
    <%--    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



    <script>

        $(function() {
            $('.stars').stars();
        });

        $(document).ready(function() {

            var minPrice = parseInt('${requestScope.minPrice}')
            var maxPrice = parseInt('${requestScope.maxPrice}')
            console.log(minPrice+" "+maxPrice)
            $('#mySlider').slider({

                range: true,
                min: 0,
                max: 1000,
                step: 50,
                values: [ minPrice, maxPrice],
                create: attachSlider,
                slide: attachSlider,
                stop: attachSlider
            })

            function attachSlider() {
                console.log(minPrice+" "+maxPrice)
                $('#lowerlimit').val($('#mySlider').slider("values", 0));
                $('#upperlimit').val($('#mySlider').slider("values", 1));
            }

            $('.slider-input').change(function(e) {
                var setIndex = (this.id == "upperlimit") ? 1 : 0;
                $('#mySlider').slider("values", setIndex, $(this).val())
            })


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
                <h2>Explore Products</h2>
<%--                <ul>--%>
<%--                    <li><a class="nav-link" href="viewProfile.jsp">View Profile</a></li>--%>
<%--                    <li><a class="nav-link" href="addProduct.jsp">Add Product</a></li>--%>
<%--                </ul>--%>
            </div>
        </div>
    </div>
</section>

<div class="display-section ">
    <section class="your-listings mt-3" >
        <div class="container">
            <div class="row">
                <div class="product-side-menu mt-3">
                    <div class="card">
                        <div class="card-body">
                            <h4>Filters</h4>
                            <hr>
                            <div class="mt-2">
                                <form action="${pageContext.request.contextPath}/SearchProduct" method="get">

                                    <input type="hidden" name="category" value="${requestScope.category}">
                                    <input type="hidden" name="keyword" value="${requestScope.keyword}">
                                    <input type="hidden" name="action" value="filter">

                                    <div class="form-outline mb-4 row g-2">
                                        <label  class="form-label mb-0" >Product Location</label>
                                        <input type="hidden" name="country" id="countryId" value="US"/>
                                        <div class="col-md-6">
                                            <select class="form-select states order-alpha" name="state" id="stateId" >
                                                <option value="${requestScope.state}">State</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <select name="city" class="form-select cities order-alpha" id="cityId">
                                                <option value="${requestScope.city}">City</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-outline mt-3 mb-4">
                                        <label  class="form-label mb-1" >Rating</label>
                                        <span class="d-block rating-filter">
                                            <input type="radio" name="rating_button" value="4" <c:if test="${requestScope.rating == 4}"> checked </c:if>/>
                                            <i class="fa fa-star "></i><i class="fa fa-star "></i><i class="fa fa-star "></i><i class="fa fa-star "></i> & up
                                        </span>
                                        <span class="d-block rating-filter">
                                            <input type="radio" name="rating_button" value="3" <c:if test="${requestScope.rating == 3}"> checked </c:if>/>
                                            <i class="fa fa-star "></i><i class="fa fa-star "></i><i class="fa fa-star "></i> & up
                                        </span>
                                        <span class="d-block rating-filter">
                                            <input type="radio" name="rating_button" value="2" <c:if test="${requestScope.rating == 2}"> checked </c:if>/>
                                            <i class="fa fa-star "></i><i class="fa fa-star "></i> & up
                                        </span>
                                        <span class="d-block rating-filter">
                                            <input type="radio" name="rating_button" value="1" <c:if test="${requestScope.rating == 1}"> checked </c:if>/>
                                            <i class="fa fa-star "></i>& up
                                        </span>
                                    </div>


                                    <div class="form-outline mt-3 mb-4">
                                        <label  class="form-label mb-1" >Price</label>
                                        <div class="row mt-2 mb-2">
                                            <div class="col">
                                                <div id="mySlider"></div>
                                            </div>

                                        </div>

                                        <div class="inputs row g-2">
                                            <div class="col-md-6">
                                                <label for="lowerlimit">Min</label>
                                                <input id="lowerlimit" type="text" class="form-control slider-input" name="minPrice"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="upperlimit">Max</label>
                                                <input type="text" class="form-control slider-input" id="upperlimit" name="maxPrice"/>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-outline mt-3 mb-4">
                                        <label  class="form-label mb-1" >Sort by</label>
                                        <select class="form-select" aria-label="Default select example" id="sortBy" name="sortBy">
                                            <option id="default" value="default" <c:if test="${requestScope.sortBy == 'default'}"> selected="selected" </c:if> >Default</option>
                                            <option value="lowToHigh" <c:if test="${requestScope.sortBy == 'lowToHigh'}"> selected="selected" </c:if>>Price: low to high </option>
                                            <option value="highToLow" <c:if test="${requestScope.sortBy == 'highToLow'}"> selected="selected" </c:if>>Price: high to low</option>
                                        </select>

                                    </div>

                                    <div class="form-outline mt-3 mb-4">
                                        <div class="row g-2">
                                            <div class="col-md-6 d-grid px-2 ">
                                                <span class="btn btn-secondary filter-button-cancel" onclick="resetFilter()" >Reset</span>
                                            </div>
                                            <div class="col-md-6 d-grid px-2">
                                                <button type="submit" class="btn btn-primary filter-button-apply">Apply</button>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="product-display-section">
                    <div class="row mt-2 g-2">
                        <div class=" col-lg-2 col-3">
                            <select class="form-select" onChange="window.location.href=this.value" id="prod_category" name="prod_category">
                                <option id="no-category" value="none" <c:if test="${requestScope.category == null || requestScope.category != ''}" >selected="selected" </c:if> >Select category</option>
                                <option value="${pageContext.request.contextPath}/ProductListing?action=allProducts" <c:if test="${requestScope.category == 'allProducts'}" >selected="selected" </c:if> >All Categories</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=car" <c:if test="${requestScope.category == 'car'}" >selected="selected" </c:if>  >Car</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=bike" <c:if test="${requestScope.category == 'bike'}" >selected="selected" </c:if> >Bike</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=two wheeler" <c:if test="${requestScope.category == 'two wheeler'}" >selected="selected" </c:if> >Two Wheeler</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=boat" <c:if test="${requestScope.category == 'boat'}" >selected="selected" </c:if> >Boat</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=services" <c:if test="${requestScope.category == 'services'}" >selected="selected" </c:if> >Services</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=apartment" <c:if test="${requestScope.category == 'apartment'}" >selected="selected" </c:if> >Apartment</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=party hall" <c:if test="${requestScope.category == 'party hall'}" >selected="selected" </c:if> >Party Hall</option>
                                <option value="${pageContext.request.contextPath}/SearchProduct?action=category&category=others" <c:if test="${requestScope.category == 'others'}" >selected="selected" </c:if> >Others</option>
                            </select>
                        </div>
                        <div class=" col-lg-10 col-md-8 col-7">
                            <form action="${pageContext.request.contextPath}/SearchProduct" method="get" id="search-form">
                                <input type="hidden" name="category" value="${requestScope.category}">
                                <input type="hidden" name="action" value="keyword">
                                <div class="form-outline">
                                    <div class="input-group " id="search-input-group">
                                        <span  class="input-group-text" id="microphone-button" onclick="micBtnClick()" ><i  style="cursor:pointer; background: none" class="fa fa-microphone-slash" id="microphone-icon"></i></span>
                                        <input class="form-control" id="search-text-box" name="keyword" type="text" placeholder="Search Google..." autocomplete="off" style="border-left: none "  value="${requestScope.keyword}"   >
                                        <button type="submit" class="input-group-text shadow-none px-3 btn-warning"><i class="bi bi-search"></i></button>

                                    </div>
                                </div>

                            </form>
                        </div>

                        <div class="col-md-1 col-2 ">
                            <div class="filter-button-div">
                                <button type="button" class="nav-link filter-button " data-bs-toggle="modal" data-bs-target="#FilterModal"><i class="filter-icon"></i></button>
                            </div>

                        </div>

                    </div>

                    <div class="row mt-3">
                        <c:choose>
                            <c:when test="${not empty requestScope.availableProductList}">
                                <c:forEach var="product" items="${requestScope.availableProductList}">
                                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 col-6 item mb-3">
                                        <a class="product-card" href="${pageContext.request.contextPath}/ProductDetails?action=availableProduct&product_id=${product.prod_id}">
                                            <div class="card h-100">
                                                <div class="card-body">
                                                    <div class="card-image-wrapper">
                                                        <img class="card-img-top " src="images/products/${product.prod_firstImage}"
                                                             alt="product image"/>
                                                    </div>
                                                    <h5 class="card-title mt-3 mb-2">${product.prod_title}</h5>
                                                        <%--                                            <h6 class="card-subtitle text-muted">Category: ${product.prod_category}</h6>--%>
                                                    <h6 class="card-subtitle text-muted">Category: ${product.prod_category}</h6>
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
                                                            <button class="btn btn-primary float-end" onclick="location.href = '${pageContext.request.contextPath}/ProductDetails?action=availableProduct&product_id=${product.prod_id}'">View</button>
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
                                    <h2>No Records to show.</h2>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>








<script type="application/javascript" src="JS/voiceRecognition.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="//geodata.solutions/includes/statecity.js"></script>
<script type="application/javascript">
    jQuery(".states").change(function () {
        console.log($(this).val())
    });

    jQuery(".cities").change(function () {
        console.log($(this).val())
    });
</script>
</body>
</html>
