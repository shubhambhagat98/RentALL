<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/12/21
  Time: 9:33 PM
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
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script type="application/javascript" src="JS/signout.js"></script>
    <script type="application/javascript" src="JS/rating.js"></script>
    <script type="application/javascript" src="JS/reviewRating.js"></script>
    <script type="application/javascript" src="JS/reviewValidation.js"></script>




    <script>
        $(function() {
            console.log("inside ")
            $('.stars').stars();
        });

    </script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <%--    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>rentall</title>
</head>
<body>

<%@ include file="header.jsp" %>
<section class="page-title">
    <div class="page-background">
        <div class="page-header">
            <div class="container">
                <h2>Product Details</h2>
                <ul>
                    <li><button type="button" class="btn btn-primary nav-link" data-bs-toggle="modal" data-bs-target="#AddReviewModal" style="border:none">Add Review</button></li>
                    <li><button type="button" class="btn btn-primary nav-link" data-bs-toggle="modal" data-bs-target="#AddComplaintModal" style="border:none">Submit Complaint</button></li>
                </ul>
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
                                            <%-- PUT YOUR BUCKET NAME --%>
                                        <img class="img-fluid" src="https://PUT_YOUR_AWS_BUCKET_NAME.s3.amazonaws.com/${image}" alt="">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="carousel-item single-product-image">
                                            <%-- PUT YOUR BUCKET NAME --%>
                                        <img class="img-fluid" src="https://PUT_YOUR_AWS_BUCKET_NAME.s3.amazonaws.com/${image}" alt="">
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

                    <div class="mt-2"><span class="stars" data-rating="${requestScope.product.prod_rating}" data-num-stars="5" ></span></div>



                    <div class="mt-2"><span class="price">Price $${requestScope.product.prod_price}.00</span><span class="duration">/${requestScope.product.prod_duration}</span></div>
                    <div class="mt-2"><span class="info"><b>Category:</b> ${requestScope.product.prod_category}</span></div>
                    <div class="mt-2"><span class="info"><b>Status:</b> ${requestScope.product.prod_status}</span></div>
                    <div class="mt-2 mb-2">
                        <span class="d-block info"><b>Seller information:</b></span>
                        <span class="d-block info"><b>Name:</b> ${requestScope.seller.first_name} ${requestScope.seller.last_name}</span>
                        <span class="info"><b>Contact:</b> ${requestScope.seller.email_id}</span>
                    </div>
                    <button type="button" class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#FinishRentingModal">Finish Renting</button>
                    <button type="button" class="btn btn-primary mt-2" onclick="window.location.href = '${pageContext.request.contextPath}/ViewMessage?action=getMessageById&to_user_id=${requestScope.seller.user_id}'">Chat</button>

                </div>
            </div>
        </div>
    </div>
</section>

<div class="mt-3">

    <section class="renter-details mt-2">
        <div class="container">
            <h6>Renter Information</h6>
            <p>
                <span class="d-block"><b>Name: </b>${requestScope.renter.first_name} ${requestScope.renter.last_name}</span>
                <span class="d-block"><b>Contact: </b>${requestScope.renter.email_id}</span>
                <span><b>Start Date: </b>${requestScope.rentedProduct.start_date}</span><span class="ms-2 "><b>End Date: </b>${requestScope.rentedProduct.end_date}</span>
                <span class="d-block"><b>Total Renting Cost: </b>$${requestScope.rentedProduct.total_cost}</span>
            </p>
        </div>
    </section>



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



<!-- finish renting Modal -->
<div class="modal fade" id="FinishRentingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="RentingModalTitle">Finish Renting</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Are you sure you want to finish your renting?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/UpdateProductStatus?action=FinishRenting&product_id=${requestScope.product.prod_id}'">Yes</button>
            </div>
        </div>
    </div>
</div>

<%--add review modal--%>
<div class="modal fade" id="AddReviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/AddReview" name="reviewForm" method="post" onsubmit="return reviewValidate()">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddReviewTitle">Add Review</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%-- prod id hidden input --%>
                    <input type="hidden" value="${requestScope.product.prod_id}" name="product_id">
                    <input type="hidden" name="review_date" id="review_date">
                    <input type="hidden" name="prev_action" value="availableProduct">
                    <div class="form-outline mb-4">
                        <input type="text" class="form-control" placeholder="Review Title" id="review_title" name="review_title">
                        <small class="text-danger float-start" id="reviewTitleError"></small>
                    </div>

                    <div class="form-outline mb-3">
                        <input type="hidden" name="rating" id="rating-input" min="1" max="5" />
                        <span >Select rating: </span>

                        <div class="rating ms-1" role="optgroup" id="ratingStarGroup">
                            <!-- in Rails just use 1.upto(5) -->
                            <i class="fa fa-star-o fa-2x rating-star" id="rating-1" data-rating="1" tabindex="0" aria-label="Rate as one out of 5 stars" role="radio"></i>
                            <i class="fa fa-star-o fa-2x rating-star" id="rating-2" data-rating="2" tabindex="0" aria-label="Rate as two out of 5 stars" role="radio"></i>
                            <i class="fa fa-star-o fa-2x rating-star" id="rating-3" data-rating="3" tabindex="0" aria-label="Rate as three out of 5 stars" role="radio"></i>
                            <i class="fa fa-star-o fa-2x rating-star" id="rating-4" data-rating="4" tabindex="0" aria-label="Rate as four out of 5 stars" role="radio"></i>
                            <i class="fa fa-star-o fa-2x rating-star" id="rating-5" data-rating="5" tabindex="0" aria-label="Rate as five out of 5 stars" role="radio"></i>
                        </div>
                        <small class="text-danger float-start" id="reviewRatingError"></small>

                    </div>



                    <div class="form-outline mb-3">
                        <textarea class="form-control"  rows="3" placeholder="Review Description" id="review_description" name="review_description"></textarea>
                        <small class="text-danger float-start" id="reviewDescriptionError"></small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" >Submit</button>
                </div>
            </form>

        </div>
    </div>
</div>



<%--add complaint modal--%>
<div class="modal fade" id="AddComplaintModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/AddComplaint" name="complaintForm" method="post" onsubmit="return complaintValidate()">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddComplaintTitle">Submit Complaint</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%-- prod id hidden input --%>
                    <input type="hidden" value="${requestScope.product.prod_id}" name="product_id">
                    <%-- seller id hidden input--%>
                    <input type="hidden" value="${requestScope.seller.user_id}" name="seller_id">
                    <%--     Complaint Date--%>
                    <input type="hidden" name="complaint_date" id="complaint_date">
                    <input type="hidden" name="prev_action" value="rentedProductsByYou">

                    <div class="form-outline mb-3">
                        <textarea class="form-control"  rows="5" placeholder="Complaint Description" id="complaint_description" name="complaint_description"></textarea>
                        <small class="text-danger float-start" id="complaintDescriptionError"></small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" >Submit</button>
                </div>
            </form>

        </div>
    </div>
</div>


<%@ include file="chatbot.jsp" %>





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
<%--PUT YOUR API KEY FOR GOOGLE MAPS--%>
<script src="https://maps.googleapis.com/maps/api/js?key=PUT_YOUR_API_KEY&callback=myMap"></script>

<script>
    $(document).ready(function () {
        console.log("rating= "+parseFloat('${requestScope.product.prod_rating}'))
        console.log('${requestScope.product.prod_duration}')
    });

</script>

</body>
</html>
