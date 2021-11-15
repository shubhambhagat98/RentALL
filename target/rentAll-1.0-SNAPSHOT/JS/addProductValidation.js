function addProductValidate(){
    // reset the error message first
    document.getElementById("prodTitleError").innerHTML = "";
    document.getElementById("prodDescriptionError").innerHTML = "";
    document.getElementById("categoryError").innerHTML = "";
    document.getElementById("priceError").innerHTML = "";
    document.getElementById("streetAddressError").innerHTML = "";
    document.getElementById("stateError").innerHTML = "";
    document.getElementById("cityError").innerHTML = "";
    document.getElementById("pincodeError").innerHTML = "";
    document.getElementById("fileError").innerHTML = "";

    errorCount = 0;

    // call all functions
    validateProdTitle(document.forms["addProduct"]["prod_title"].value)
    validateProdDescription(document.forms["addProduct"]["prod_description"].value)
    validateCategory(document.forms["addProduct"]["prod_category"].value)
    validatePrice(document.forms["addProduct"]["prod_price"].value)
    validateStreetAddress(document.forms["addProduct"]["street_address"].value)
    validateStateCity(document.forms["addProduct"]["state"].value, document.forms["addProduct"]["city"].value)
    validatePincode(document.forms["addProduct"]["pincode"].value)
    validateFile(document.forms["addProduct"]["imageFileList"])


    console.log(errorCount)
    if (errorCount > 0) {
        return false;
    }else {
        return true;
    }
}

//check product title
function validateProdTitle(field){
    if (field === "") {
        document.getElementById("prodTitleError").innerHTML = "Product title cannot be empty";
        errorCount ++;
    }
    console.log(field);
}

// check product description
function validateProdDescription(field){
    if (field === "") {
        document.getElementById("prodDescriptionError").innerHTML = "Product Description cannot be empty";
        errorCount ++;
    }
    console.log(field);
}

// check product category
function validateCategory(field){
    if (field === "none") {
        document.getElementById("categoryError").innerHTML = "Please select a category";
        errorCount ++;
    }
    console.log(field);

}

// check price
function validatePrice(field){
    if (field === "") {
        document.getElementById("priceError").innerHTML = "Price cannot be empty";
        errorCount ++;
    }
    else if (/[^0-9]/.test(field)){
        document.getElementById("priceError").innerHTML = "Price should be in digits";
        errorCount ++;
    }
    else if (field <= 0){
        document.getElementById("priceError").innerHTML = "Enter a valid price";
        errorCount ++;
    } else if (field.indexOf("0") === 0){
        document.getElementById("priceError").innerHTML = "Price cannot start with 0";
        errorCount ++;
    }
    console.log(field);
}

// check street address
function validateStreetAddress(field){
    if (field === "") {
        document.getElementById("streetAddressError").innerHTML = "Street address cannot be empty";
        errorCount ++;
    }
    else if (/[^a-zA-Z0-9., -]/.test(field)){
        document.getElementById("priceError").innerHTML = "Enter valid street address";
        errorCount ++;
    }
    console.log(field);
}

// check state and city
function validateStateCity(field1, field2){
    if (field1 === ""){
        document.getElementById("stateError").innerHTML = "Please select a state";
        errorCount ++;
    }else if (field2 === ""){
        document.getElementById("cityError").innerHTML = "Please select a city";
        errorCount ++;
    }
    console.log(field1);
    console.log(field2);
}

// check pincode
function validatePincode(field){
    if (field === "") {
        document.getElementById("pincodeError").innerHTML = "Pincode cannot be empty";
        errorCount ++;
    }
    else if (/[^0-9]/.test(field)){
        document.getElementById("pincodeError").innerHTML = "Pincode should be in digits";
        errorCount ++;
    }
    else if (field <= 0 && field.length < 5 ){
        document.getElementById("pincodeError").innerHTML = "Enter a valid pincode";
        errorCount ++;
    } else if (field.indexOf("0") === 0){
        document.getElementById("priceError").innerHTML = "Pincode cannot start with 0";
        errorCount ++;
    }
    console.log(field);
}

// check image file
function validateFile(fileList) {
    if (fileList.files.length === 0){
        document.getElementById("fileError").innerHTML = "Please select a product image";
        errorCount ++;
    }
    console.log(fileList);
}
