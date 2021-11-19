function forgotPasswordValidate(){

    // reset error message first
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("security1").innerHTML = "";
    document.getElementById("security2").innerHTML = "";
    document.getElementById("security3").innerHTML = "";

    errorCount = 0;

    // call all functions
    validateEmail(document.forms["forgotPassword"]["email_id"].value)
    validateSecurity1(document.forms["forgotPassword"]["security_1"].value)
    validateSecurity2(document.forms["forgotPassword"]["security_2"].value)
    validateSecurity3(document.forms["forgotPassword"]["security_3"].value)


    if (errorCount > 0) {
        return false;
    }

}



function verifyCode(){
    // reset error message
    document.getElementById("passwordError").innerHTML = "";
    document.getElementById("conPasswordError").innerHTML = "";
    document.getElementById("verificationCodeError").innerHTML = "";

    errorCount = 0;

    // call all functions
    validateCode(document.forms["verificationCode"]["verification_code"].value)
    validatePassword(document.forms["verificationCode"]["password"].value)
    validateConPassword(document.forms["verificationCode"]["password"].value, document.forms["verificationCode"]["con_password"].value)

    if (errorCount > 0) {
        return false;
    }

}




// check email
function validateEmail(field)
{
    var  count1 = 0, count2 = 0;
    for(var i=0;i<field.length;i++)
    {
        if(field.charAt(i)==='@')
            count1++;

        if (field.charAt(i)==='.')
            count2++;
    }

    if (field === ""){
        errorCount ++;
        document.getElementById("emailError").innerHTML = "Email ID cannot be empty";
    }
    else if (/[^a-zA-Z0-9.@_-]/.test(field)){
        errorCount ++;
        document.getElementById("emailError").innerHTML = "Enter valid email ID";
    }
    else if ((field.indexOf(".") === 0) || (field.indexOf("@") === 0) || (field.indexOf("-") === 0) || (field.indexOf("_") === 0) ){
        errorCount ++;
        document.getElementById("emailError").innerHTML = "Enter valid email ID";
    }
    else if (count1!==1 || count2<1){
        errorCount ++;
        document.getElementById("emailError").innerHTML = "Enter valid email ID";
    }


}



//check security question 1
function  validateSecurity1(field){
    if (field === ""){
        document.getElementById("security1Error").innerHTML = "Please answer the question";
        errorCount ++;
    }
}

//check security question 2
function  validateSecurity2(field){
    if (field === ""){
        document.getElementById("security2Error").innerHTML = "Please answer the question";
        errorCount ++;
    }
}

//check security question 3
function  validateSecurity3(field){
    if (field === ""){
        document.getElementById("security3Error").innerHTML = "Please answer the question";
        errorCount ++;
    }
}


// check password
function validatePassword(field)
{

    if (field === ""){
        document.getElementById("passwordError").innerHTML = "Password cannot be empty";
        errorCount ++;
    }
    else if (field.length < 6){
        document.getElementById("passwordError").innerHTML = "Passwords must be at least 6 characters";
        errorCount ++;
    }
    else if (! /[a-z]/.test(field) ||  ! /[A-Z]/.test(field) || ! /[0-9]/.test(field)){
        document.getElementById("passwordError").innerHTML = "Passwords require one each of a-z, A-Z and 0-9";
        errorCount ++;
    } else{
        return false
    }

    return true

}

// check con password
function validateConPassword(field1, field2){
    if ((! validatePassword(field1)  && (field1 !== field2))){
        document.getElementById("conPasswordError").innerHTML = "Password does not match";
        errorCount ++;
    }
}

function  validateCode(field){
    if (field === ""){
        document.getElementById("verificationCodeError").innerHTML = "Verification code cannot be empty";
        errorCount ++;
    }
    else if (/[^0-9]/.test(field)){
        document.getElementById("verificationCodeError").innerHTML = "Only digits allowed in verification code";
        errorCount ++;
    }
    else if (field.length !==6 ){
        document.getElementById("verificationCodeError").innerHTML = "Enter valid verification code";
        errorCount ++;
    }
}


function togglePassword(){
    var x = document.getElementById("password");
    var y = document.getElementById("togglePassword");
    if (x.type === "password") {
        x.type = "text";
        y.classList.toggle('bi-eye');
    } else {
        x.type = "password";
        y.classList.toggle('bi-eye');
    }
}

function toggleConPassword(){
    var x = document.getElementById("con_password");
    var y = document.getElementById("toggleConPassword");
    if (x.type === "password") {
        x.type = "text";
        y.classList.toggle('bi-eye');
    } else {
        x.type = "password";
        y.classList.toggle('bi-eye');
    }
}