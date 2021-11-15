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
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="986571061196-flj7n9ugit4okm866o9utn6eakp3ng32.apps.googleusercontent.com"/>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
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





    <div class="input-group mb-3">
        <div class="input-group-text p-0">
            <select class="form-select  shadow-none bg-light border-0">
                <option>Categories</option>
                <option>One</option>
                <option>Two</option>
                <option>Three</option>
                <option>Four</option>
            </select>
        </div>
        <input type="text" class="form-control" placeholder="Search Here">
        <button class="input-group-text shadow-none px-4 btn-warning">
            <i class="bi bi-search"></i>
        </button>
    </div>





    <br>


    <br>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</body>
</html>