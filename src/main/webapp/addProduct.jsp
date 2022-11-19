<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 11/7/21
  Time: 6:21 PM
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
    <script type="application/javascript" src="JS/addProductValidation.js"></script>


    <title>Add Product</title>
</head>
<body>
<%@ include file="header.jsp" %>


<div class="signup-body-background ">
    <div class="container signup-form-div mt-5 mb-5" >
        <form name="addProduct" action="${pageContext.request.contextPath}/AddProduct1" method="post" onsubmit="return addProductValidate()" enctype="multipart/form-data">
            <div class="card p-3 text-center py-4"  ><!-- style="width: 35rem;" -->
                <div class="mb-2">
                    <h4>Add Product</h4>
                </div>
                <div class="mb-1">
                    <h6 id="errorMessage" class="text-danger"></h6>
                </div>


                <div class="form-outline mb-3">
                    <input type="text" class="form-control" placeholder="Product Title" id="prod_title" name="prod_title">
                    <small class="text-danger float-start" id="prodTitleError"></small>
                </div>
                <div class="form-outline mb-3">
                    <textarea class="form-control"  rows="3" placeholder="Product Description" id="prod_description" name="prod_description"></textarea>
                    <small class="text-danger float-start" id="prodDescriptionError"></small>
                </div>


                <div class="row mb-3 g-2">
                    <div class="col-md-4 col-sm-12">
                        <div class="form-outline">
                            <select class="form-select" aria-label="Default select example" id="prod_category" name="prod_category">
                                <option id="no-category" value="none" selected="selected">Select category</option>
                                <option value="car">Car</option>
                                <option value="bike">Bike</option>
                                <option value="two wheeler">Two Wheeler</option>
                                <option value="boat">Boat</option>
                                <option value="services">Services</option>
                                <option value="apartment">Apartment</option>
                                <option value="party hall">Party Hall</option>
                                <option value="others">Other</option>
                            </select>
                            <small class="text-danger float-start" id="categoryError"></small>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="form-outline">
                            <select class="form-select" aria-label="Default select example" id="prod_duration" name="prod_duration">
                                <option id="no-duration" value="none" selected="selected">Select Duration</option>
                                <option value="Day">Per Day</option>
                                <option value="Week">Per Week</option>
                                <option value="Month">Per Month</option>
                            </select>
                            <small class="text-danger float-start" id="durationError"></small>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="form-outline">
                            <div class="input-group ">
                                <span class="input-group-text" style="background: none; ">$</span>
                                <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="prod_price" id="prod_price" placeholder="Price" >
                                <span class="input-group-text" style="background: none;">.00</span>
                            </div>
                            <small class="text-danger float-start" id="priceError"></small>
                        </div>

                    </div>
                </div>



                <div class="mt-2 mb-3 text-start">
                    <label  class="form-label">Product Location</label>
                    <div class="form-outline">
                        <input type="text" class="form-control" id="street_address" placeholder="Street Address" name="street_address">
                        <small class="text-danger float-start" id="streetAddressError"></small>
                    </div>
                </div>
                <div class="form-outline mb-2 row g-2">
                    <input type="hidden" name="country" id="countryId" value="US"/>
                    <div class="col-md-4">
                        <select class="form-select states order-alpha" name="state" id="stateId" >
                            <option value="">Select State</option>
                        </select>
                        <small class="text-danger float-start" id="stateError"></small>
                    </div>
                    <div class="col-md-4">
                        <select name="city" class="form-select cities order-alpha" id="cityId">
                            <option value="">Select City</option>
                        </select>
                        <small class="text-danger float-start" id="cityError"></small>
                    </div>

                    <div class="col-md-4">
                        <input type="text" class="form-control" id="pincode" placeholder="Pincode" name="pincode">
                        <small class="text-danger float-start" id="pincodeError"></small>
                    </div>


                </div>




                <div class="mb-3 mt-2">
                    <span style="display:inline-block; vertical-align:middle;">Select Product Image  </span>
                    <div class="px-3" style="display:inline-block; vertical-align:middle;">
                        <label for="attachment">
                            <a class=" btn btn-primary text-light" role="button" aria-disabled="false">Browse Files</a>

                        </label>
                        <input type="file" accept=".jpg, .jpeg, .png" name="imageFileList"  id="attachment" style="visibility: hidden; position: absolute;" multiple/>
                    </div>
                    <div>
                        <small class="text-danger" id="fileError"></small>
                    </div>
                </div>

                <div id="files-area" >
                    <span id="filesList">
                        <span id="files-names"></span>
                    </span>
                </div>

                <div class="mt-3 d-grid px-3"> <button class="btn btn-primary btn-block btn-signup text-uppercase" type="submit">
                    <span>Submit</span> </button>
                </div>


            </div>
        </form>
    </div>
</div>

<%@ include file="chatbot.jsp" %>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="//geodata.solutions/includes/statecity.js"></script>
<c:if test="${(not empty sessionScope.addProductError) and (sessionScope.addProductError == true)}">
    <script>
        document.getElementById("errorMessage").innerHTML = "There was some error, please try again...";
    </script>
    <c:remove var="addProductError" scope="session" />
</c:if>


<script type="application/javascript">
    jQuery(".states").change(function () {
        console.log($(this).val())
    });

    jQuery(".cities").change(function () {
        console.log($(this).val())
    });
</script>



<script>
    const dt = new DataTransfer();// Permit the manipulators of the input file

    $("#attachment").on('change', function(e){
        for(var i = 0; i < this.files.length; i++){
            let fileBloc = $('<span/>', {class: 'file-block'}),
                fileName = $('<span/>', {class: 'name', text: this.files.item(i).name});
            fileBloc.append('<span class="file-delete"><span>+ </span></span>')
                .append(fileName);
            $("#filesList > #files-names").append(fileBloc);
        }
        // Add fixtures to the DataTransfer object
        for (let file of this.files) {
            dt.items.add(file);
        }
        // Update of the files of the input file after addition
        this.files = dt.files;

       // EventListener for the delete button
        $('span.file-delete').click(function(){
            let name = $(this).next('span.name').text();
            // Suppress display of file name
            $(this).parent().remove();
            for(let i = 0; i < dt.items.length; i++){
                // File and name match
                if(name === dt.items[i].getAsFile().name){
                    // Deleting the file in the DataTransfer object
                    dt.items.remove(i);

                }
            }
            // Updating the files of the input file after deletion
            document.getElementById('attachment').files = dt.files;
        });
    });
</script>
</body>
</html>
