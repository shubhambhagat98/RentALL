function loginValidate() {
    // var x = document.form.getElementById("name").value;
    // var y = document.form.getElementById("password").value;
    var x = document.forms["login"]["email_id"].value;
    var y = document.forms["login"]["password"].value;


    // reset the error messages first
    document.getElementById("errorMessage").innerHTML = "";
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("passwordError").innerHTML = "";


    if (x==="" && y ===""){
        document.getElementById("emailError").innerHTML = "Email ID cannot be empty";
        document.getElementById("passwordError").innerHTML = "Password cannot be empty";
        return false;
    }

    if (x === "") {
        // alert("E-mail ID must be filled out");
        document.getElementById("emailError").innerHTML = "Email ID cannot be empty";
        return false;
    }

    if (y === "") {
        // alert("Password must be filled out");
        document.getElementById("passwordError").innerHTML = "Password cannot be empty";
        return false;
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