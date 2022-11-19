<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
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
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script type="application/javascript" src="JS/signout.js"></script>



    <title>rentall</title>
</head>
<body>

    <%@ include file="header.jsp" %>

    <%--  carousel banner  --%>
    <div id="carouselExampleCaptions"  class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active banner">
                <div class="item-blur">
                    <div class="carousel-caption  ">
                        <span class="banner-title">RentALL</span>
                        <span class="banner-subtitle">Rent anything, anywhere</span>
                        <div class = "slider-btn mt-5">
                            <button class="btn btn-primary rounded-pill" onclick="location.href = '${pageContext.request.contextPath}/ProductListing?action=allProducts'"><span>Explore Products</span></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item banner">
                <div class="item-blur">
                    <div class="carousel-caption  ">
                        <span class="banner-title">RentALL</span>
                        <span class="banner-subtitle">Rent anything, anywhere</span>
                        <div class = "slider-btn mt-5">
                            <button class="btn btn-primary rounded-pill" onclick="location.href = '${pageContext.request.contextPath}/ProductListing?action=allProducts'"><span>Explore Products</span></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item banner">
                <div class="item-blur">
                    <div class="carousel-caption  ">
                        <span class="banner-title">RentALL</span>
                        <span class="banner-subtitle">Rent anything, anywhere</span>
                        <div class = "slider-btn mt-5">
                            <button class="btn btn-primary rounded-pill" onclick="location.href = '${pageContext.request.contextPath}/ProductListing?action=allProducts'"><span>Explore Products</span></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item banner">
                <div class="item-blur">
                    <div class="carousel-caption  ">
                        <span class="banner-title">RentALL</span>
                        <span class="banner-subtitle">Rent anything, anywhere</span>
                        <div class = "slider-btn mt-5">
                            <button class="btn btn-primary rounded-pill" onclick="location.href = '${pageContext.request.contextPath}/ProductListing?action=allProducts'"><span>Explore Products</span></button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <section id="services">
        <div class="container">
            <div class="row mt-4 g-0">
                <div class="col-md-5 col-4 "><hr ></div>
                <div class="col-md-2 col-4 text-center" style="vertical-align: center"> <h2><span>Services</span></h2></div>
                <div class="col-md-5 col-4"><hr></div>
            </div>

            <div class="row">
                <div class="col-md-4 col-6 mt-4 ">
                    <div class="card h-100 service-card text-center">
                        <div class="service-image-wrapper mb-2">
                            <img class="service-img" src="images/assets/categories-icon.png" alt="categories">
                        </div>
                        <h5 class="card-title mt-3 mb-2">Choose from different categories</h5>
                        <p class="card-text">Select products and services from variety of categories.</p>
                    </div>
                </div>
                <div class="col-md-4 col-6 mt-4">
                    <div class="card h-100 service-card text-center">
                        <div class="service-image-wrapper mb-2">
                            <img class="service-img" src="images/assets/genuine-icon.png" alt="categories">
                        </div>
                        <h5 class="card-title mt-3 mb-2">Genuine products and services</h5>
                        <p class="card-text">Browse products and services which are verified by the admin to be genuine.</p>
                    </div>
                </div>
                <div class="col-md-4 col-6 mt-4">
                    <div class="card h-100 service-card text-center">
                        <div class="service-image-wrapper mb-2">
                            <img class="service-img" src="images/assets/buyer-seller-icon.png" alt="categories">
                        </div>
                        <h5 class="card-title mt-3 mb-2">Be a seller as well as a renter</h5>
                        <p class="card-text">Users can both advertise their products and rent other products</p>
                    </div>
                </div>
                <div class="col-md-4 col-6 mt-4 ">
                    <div class="card h-100 service-card text-center">
                        <div class="service-image-wrapper mb-2">
                            <img class="service-img" src="images/assets/chatbot-icon.png" alt="categories">
                        </div>
                        <h5 class="card-title mt-3 mb-2">Integrated Chat bot Assistance</h5>
                        <p class="card-text">Our website provides an integrated chat bot to answer the queries of the user.</p>
                    </div>
                </div>

                <div class="col-md-4 col-6 mt-4">
                    <div class="card h-100 service-card text-center">
                        <div class="service-image-wrapper mb-2">
                            <img class="service-img" src="images/assets/24-7-icon.png" alt="categories">
                        </div>
                        <h5 class="card-title mt-3 mb-2">24/7 Availability of services </h5>
                        <p class="card-text">Our rental services are available 24/7 for users to consume.</p>
                    </div>
                </div>
                <div class="col-md-4 col-6 mt-4">
                    <div class="card h-100 service-card text-center">
                        <div class="service-image-wrapper mb-2">
                            <img class="service-img" src="images/assets/responsive-icon.png" alt="categories">
                        </div>
                        <h5 class="card-title mt-3 mb-2">Responsive website layout</h5>
                        <p class="card-text">Our website is 100% responsive giving you the best user-experience on any device.</p>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <section id="about-us" >
        <div class="container ">
            <div class="row mt-5 g-1">
                <div class="col-md-5 col-4 "><hr ></div>
                <div class="col-md-2 col-4 text-center" style="vertical-align: center"> <h2><span>About Us</span></h2></div>
                <div class="col-md-5 col-4"><hr></div>
            </div>

            <div class="row mt-2">
                <div class="col-lg-5 mt-3">
                    <div class="card about-us-image-wrapper ">
                        <img  src="images/assets/comitment.jpeg" alt="">
                    </div>
                </div>
                <div class="col-lg-7 mt-3">
                    <div class="card about-us-info ">
                        <div class="card-body">
                            <p>
                                Our project addresses different problems people face when they want something on a temporary basis or earn something from a product or a service on a continuous basis.
                                Firstly, people may want to rent different kinds of product or services and may come across questions such as - How to rent? Whom to contact? Is the product/service legit? Can I get all this information from a single source?
                            </p>
                            <p>
                                Additionally, people who want to rent something may come across questions such as How to advertise my products or services for rent? Unlike flyers or newspaper advertisements, is there a way to advertise my products 24/7? How can my advertisement reach a larger audience?
                            </p>
                            <p>
                                Well, our Rental and Service Management System provides answers to all these questions. We provide a web application for users which allows them to advertise the product or services as well as explore different products and services to rent thereby addressing the problems mentioned above.
                            </p>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </section>




    <br>


    <br>

    <%@ include file="chatbot.jsp" %>
    <%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</body>
</html>