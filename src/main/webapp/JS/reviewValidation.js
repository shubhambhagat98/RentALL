function reviewValidate(){
    var review_title = document.forms["reviewForm"]["review_title"].value;
    var review_rating = document.forms["reviewForm"]["rating"].value;
    var review_desc = document.forms["reviewForm"]["review_description"].value;

    //reset error messages
    document.getElementById("reviewTitleError").innerHTML = "";
    document.getElementById("reviewRatingError").innerHTML = "";
    document.getElementById("reviewDescriptionError").innerHTML = "";

    errorCount = 0

    if (review_title === ""){
        document.getElementById("reviewTitleError").innerHTML = "Review title cannot be empty";
        errorCount++;
    }
    if (review_rating === ""){
        document.getElementById("reviewRatingError").innerHTML = "Please select a rating";
        errorCount++;
    }
    if (review_desc === ""){
        document.getElementById("reviewDescriptionError").innerHTML = "Review description cannot be empty";
        errorCount++;
    }

    if (errorCount > 0) {
        return false;
    }

}

function complaintValidate(){
    var complaint = document.forms["complaintForm"]["complaint_description"].value;

    if (complaint === ""){
        document.getElementById("complaintDescriptionError").innerHTML = "Complaint description cannot be empty";
        return false;
    }
}