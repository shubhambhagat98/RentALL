function rentValidate(){
    var startDate = $("#from").val();
    var endDate = $("#to").val();
    var cardNumber = $('#cardNumber').val();
    var CVV = $("#cvv").val();
    var owner = $('#owner').val();
    var expMonth = $('#exp_month').val();
    var expYear = $('#exp_year').val();

    errorCount = 0;

    if(startDate===""){
        document.getElementById("startDateError").innerHTML = "Please select a Start Date";
        errorCount++;
    }

    if(endDate===""){
        document.getElementById("endDateError").innerHTML = "Please select a End Date";
        errorCount++;
    }

    if(owner.length < 5){
        document.getElementById("ownerError").innerHTML = "Please enter a valid name";
        errorCount++;
    }

    if($.payform.validateCardNumber(cardNumber) === false){
        document.getElementById("cardNumberError").innerHTML = "Please enter a card number";
        errorCount++;
    }

    if($.payform.validateCardCVC(CVV) === false){
        document.getElementById("cvvError").innerHTML = "Please enter a CVV number";
        errorCount++;
    }

    if(expMonth === "none"){
        document.getElementById("monthError").innerHTML = "Select a month";
        errorCount++;
    }

    if(expYear === "none"){
        document.getElementById("yearError").innerHTML = "Select a year";
        errorCount++;
    }

    if (errorCount > 0) {
        return false;
    }




}

function getNumberOfDays(start, end) {
    const date1 = new Date(start);
    const date2 = new Date(end);

    // One day in milliseconds
    const oneDay = 1000 * 60 * 60 * 24;

    // Calculating the time difference between two dates
    const diffInTime = date2.getTime() - date1.getTime();

    // Calculating the no. of days between two dates
    const diffInDays = Math.round(diffInTime / oneDay);

    return diffInDays+1;
}

function costByDay(price, no_of_days){
    return price*no_of_days;
}

function costByWeek(price, no_of_days){
    return (price*no_of_days)/7;
}

function costByMonth(price, no_of_days){
    return (price*no_of_days)/30;
}


function calTotalCost(prod_duration, prod_price){
    console.log("inside cal total cost")
    var startDate = $("#from").val();
    var endDate = $("#to").val();

    if(startDate !== "" && endDate !== ""){
        var duration = prod_duration
        var price = prod_price

        console.log("duration: "+duration)
        console.log("price: "+price)

        var no_of_days = getNumberOfDays(startDate, endDate)
        console.log("number of days: "+no_of_days)

        var totalCost = 0;

        if (duration === "Day"){
             totalCost = costByDay(price, no_of_days).toFixed(2);
            document.getElementById("total_price1").innerHTML = "$"+totalCost;
            document.getElementById("total_price2").value = totalCost;
        }else if (duration === "Week"){
             totalCost = costByWeek(price, no_of_days).toFixed(2);
            document.getElementById("total_price1").innerHTML = "$"+totalCost;
            document.getElementById("total_price2").value = totalCost;
        } else if (duration === "Month"){
            totalCost = costByMonth(price, no_of_days).toFixed(2);
            document.getElementById("total_price1").innerHTML = "$"+totalCost;
            document.getElementById("total_price2").value = totalCost;
        }
    }



    console.log("total price of hidden element"+document.getElementById("total_price2").value)


}

$(function (){
    var owner = $('#owner');
    var cardNumber = $('#cardNumber');
    var cardNumberField = $('#card-number-field');
    var CVV = $("#cvv");
    var mastercard = $("#mastercard");
    var confirmButton = $('#confirm-purchase');
    var visa = $("#visa");
    var amex = $("#amex");


    // Use the payform library to format and validate
    // the payment fields.
    cardNumber.payform('formatCardNumber');
    CVV.payform('formatCardCVC');

    cardNumber.keyup(function() {

        amex.removeClass('transparent');
        visa.removeClass('transparent');
        mastercard.removeClass('transparent');

        // if ($.payform.validateCardNumber(cardNumber.val()) === false) {
        //     // cardNumberField.addClass('has-error');
        // } else {
        //     cardNumberField.removeClass('has-error');
        //     // cardNumberField.addClass('has-success');
        // }

        if ($.payform.parseCardType(cardNumber.val()) === 'visa') {
            mastercard.addClass('transparent');
            amex.addClass('transparent');
        } else if ($.payform.parseCardType(cardNumber.val()) === 'amex') {
            mastercard.addClass('transparent');
            visa.addClass('transparent');
        } else if ($.payform.parseCardType(cardNumber.val()) === 'mastercard') {
            amex.addClass('transparent');
            visa.addClass('transparent');
        }
    });
});





