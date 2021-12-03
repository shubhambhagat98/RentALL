function resetFilter(){

    console.log("inside filter reset")

    //reset state dropdown
    $("#stateId option:selected").removeAttr("selected");
    $("#stateId option:eq(0)").prop("selected", true); //set option of index 0 to selected

    //reset city dropdown
    $("#cityId option:selected").removeAttr("selected");
    $("#cityId option:eq(0)").prop("selected", true); //set option of index 0 to selected



    // reset rating checkbox
    // $('input[name=rating_button]').removeAttr("checked");

    var ele = document.getElementsByName("rating_button");
    if (ele.length > 0){
        for(var i=0;i<ele.length;i++)
            ele[i].checked = false;
    }
    // document.querySelector('input[name="rating_button"]:checked').checked = false;



    // reset slider
    var $slider = $("#mySlider");
    $slider.slider("values", 0, 0);
    $slider.slider("values", 1, 1000);

    // Reset the sliders to their original min/max values
    // $('#mySlider').each(function(){
    //
    //     var options = $(this).slider( 'option' );
    //
    //     $(this).slider( 'values', [ options.min, options.max ] );
    //
    // });

    $('#lowerlimit').val($('#mySlider').slider("values", 0));
    $('#upperlimit').val($('#mySlider').slider("values", 1));


    // reset sort by dropdown
    $("#sortBy option:selected").removeAttr("selected");
    $("#sortBy option:eq(0)").prop("selected", true); //set option of index 0 to selected

    return false;
}



function resetFilter1(){

    console.log("inside filter reset")

    //reset state dropdown
    $("#stateId1 option:selected").removeAttr("selected");
    $("#stateId1 option:eq(0)").prop("selected", true); //set option of index 0 to selected

    //reset city dropdown
    $("#cityId1 option:selected").removeAttr("selected");
    $("#cityId1 option:eq(0)").prop("selected", true); //set option of index 0 to selected



    // reset rating checkbox
    // $('input[name=rating_button]').removeAttr("checked");

    var ele = document.getElementsByName("rating_button");
    if (ele.length > 0){
        for(var i=0;i<ele.length;i++)
            ele[i].checked = false;
    }
    // document.querySelector('input[name="rating_button"]:checked').checked = false;



    // reset slider
    var $slider = $("#mySlider1");
    $slider.slider("values", 0, 0);
    $slider.slider("values", 1, 1000);

    // Reset the sliders to their original min/max values
    // $('#mySlider').each(function(){
    //
    //     var options = $(this).slider( 'option' );
    //
    //     $(this).slider( 'values', [ options.min, options.max ] );
    //
    // });

    $('#lowerlimit1').val($('#mySlider1').slider("values", 0));
    $('#upperlimit1').val($('#mySlider1').slider("values", 1));


    // reset sort by dropdown
    $("#sortBy1 option:selected").removeAttr("selected");
    $("#sortBy1 option:eq(0)").prop("selected", true); //set option of index 0 to selected

    return false;
}