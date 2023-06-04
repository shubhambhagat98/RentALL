function ajaxCall() {
    this.send = function(data, url, method, success, type) {
        type = 'json';
        var successRes = function(data) {
            success(data);
        }
        var errorRes = function(xhr, ajaxOptions, thrownError) {
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
        jQuery.ajax({
            url: url,
            type: method,
            data: data,
            success: successRes,
            error: errorRes,
            dataType: type,
            timeout: 60000
        });
    }
}



function locationInfo() {

    var rootUrl = "https://geodata.phplift.net/api/index.php";
    var call = new ajaxCall();

    this.getCities = function(id) {
        jQuery(".cities option:gt(0)").remove();


        var url = rootUrl+'?type=getCities&countryId='+ '&stateId=' + id;
        var method = "post";
        var data = {};
        jQuery('.cities').find("option:eq(0)").html("Please wait..");
        call.send(data, url, method, function(data) {
            jQuery('.cities').find("option:eq(0)").html("Select City");
            var listlen = Object.keys(data['result']).length;

            if(listlen > 0)
            {

                jQuery.each(data['result'], function(key, val) {

                    var option = jQuery('<option />');
                    option.attr('value', val.name).text(val.name);
                    jQuery('.cities').append(option);
                });
            }
            else
            {
                var usestate = jQuery('#stateId option:selected').val();
                var option = jQuery('<option />');
                option.attr('value', usestate).text(usestate);
                option.attr('selected', 'selected');
                jQuery('.cities').append(option);
            }

            jQuery(".cities").prop("disabled",false);

        });
    };

    this.getStates = function(id) {
        jQuery(".states option:gt(0)").remove();
        jQuery(".cities option:gt(0)").remove();




        var url = rootUrl+'?type=getStates&countryId=' + id;
        var method = "post";
        var data = {};
        jQuery('.states').find("option:eq(0)").html("Please wait..");
        call.send(data, url, method, function(data) {
            jQuery('.states').find("option:eq(0)").html("Select State");

            // console.log(data['result']);

            // Sort the states data based on state name
            data['result'].sort(function(a, b) {
                var stateA = a.name.toUpperCase();
                var stateB = b.name.toUpperCase();
                if (stateA < stateB) {
                    return -1;
                }
                if (stateA > stateB) {
                    return 1;
                }
                return 0;
            });

            jQuery.each(data['result'], function(key, val) {
                var option = jQuery('<option />');
                option.attr('value', val.name).text(val.name);
                option.attr('stateid', val.id);
                jQuery('.states').append(option);
            });
            jQuery(".states").prop("disabled",false);


        });
    };
}


jQuery(function() {
    var loc = new locationInfo();
    var coid = jQuery("#countryIdNum").val();

    // console.log("country id:", coid);

    loc.getStates(coid);
    jQuery(".states").on("change", function(ev) {

        var stateId = jQuery("option:selected", this).attr('stateid');
        var state = jQuery("option:selected", this).val();

        if(stateId !== '' && stateId !== undefined){
            loc.getCities(stateId);
        }
        else{
            jQuery(".cities option:gt(0)").remove();
        }
    });

});