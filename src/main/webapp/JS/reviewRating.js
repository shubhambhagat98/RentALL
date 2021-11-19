$(document).ready(function () {

    if (document.getElementById("rating-input").value === ""){
        console.log("initial value is empty")
    }

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();

    var review_date = mm+"/"+dd+"/"+yyyy;
    var complaint_date = mm+"/"+dd+"/"+yyyy;
    document.getElementById("review_date").value = review_date;
    document.getElementById("complaint_date").value = complaint_date;

    console.log(document.getElementById("review_date").value);
    console.log(document.getElementById("complaint_date").value);


    function setRating(rating) {
        $('#rating-input').val(rating);
        console.log(document.getElementById("rating-input").value);
        // fill all the stars assigning the '.selected' class
        $('.rating-star').removeClass('fa-star-o').addClass('selected');
        // empty all the stars to the right of the mouse
        $('.rating-star#rating-' + rating + ' ~ .rating-star').removeClass('selected').addClass('fa-star-o');
    }

    $('.rating-star')
        .on('mouseover', function(e) {
            var rating = $(e.target).data('rating');
            // fill all the stars
            $('.rating-star').removeClass('fa-star-o').addClass('fa-star');
            // empty all the stars to the right of the mouse
            $('.rating-star#rating-' + rating + ' ~ .rating-star').removeClass('fa-star').addClass('fa-star-o');
        })
        .on('mouseleave', function (e) {
            // empty all the stars except those with class .selected
            $('.rating-star').removeClass('fa-star').addClass('fa-star-o');
        })
        .on('click', function(e) {
            var rating = $(e.target).data('rating');
            setRating(rating);
        })
        .on('keyup', function(e){
            // if spacebar is pressed while selecting a star
            if (e.keyCode === 32) {
                // set rating (same as clicking on the star)
                var rating = $(e.target).data('rating');
                setRating(rating);
            }
        });
});


