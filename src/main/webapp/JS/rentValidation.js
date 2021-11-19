function rentValidate(){
    var startDate = $("#from").val();
    var endDate = $("#to").val();

    errorCount = 0;

    if(startDate===""){
        document.getElementById("startDateError").innerHTML = "Please select a Start Date";
        errorCount++;
    }

    if(endDate===""){
        document.getElementById("endDateError").innerHTML = "Please select a End Date";
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



