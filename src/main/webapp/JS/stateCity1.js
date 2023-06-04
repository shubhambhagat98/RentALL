
function ajaxCall() {
    this.send = function(data, url, method, success, type) {
        type = type||'json';
        var successRes = function(data) {
            success(data);
        }

        var errorRes = function(e) {
            console.log(e);
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

function locationInfo1() {
    var rootUrl = "https://geodata.phplift.net/api/index.php";
    var call = new ajaxCall();


    this.getCities = function(id,selectedCity) {
        jQuery(".cities1 option:gt(0)").remove();

        var url = rootUrl+'?type=getCities&countryId='+ '&stateId=' + id;
        var method = "post";
        var data = {};
        jQuery('.cities1').find("option:eq(0)").html("Please wait..");
        call.send(data, url, method, function(data) {
            jQuery('.cities1').find("option:eq(0)").html("Select City");

                var listlen = Object.keys(data['result']).length;
                //console.log('number is cities is ' + listlen);
                if(listlen > 0)
                {
                    jQuery.each(data['result'], function(key, val) {

                        var option = jQuery('<option />');
                        option.attr('value', val.name).text(val.name);

                        // Set the selected property for the matching city
                        if (selectedCity === val.name) {
                            option.attr('selected', 'selected');
                        }
                        jQuery('.cities1').append(option);
                    });
                }
                else
                {
                    var usestate = jQuery('#stateId1 option:selected').val();
                    var option = jQuery('<option />');
                    option.attr('value', usestate).text(usestate);
                    option.attr('selected', 'selected');
                    jQuery('.cities1').append(option);
                }

                jQuery(".cities1").prop("disabled",false);

        });
    };

    this.getStates = function(id, selectedState) {
        jQuery(".states1 option:gt(0)").remove();
        jQuery(".cities1 option:gt(0)").remove();


        var url = rootUrl+'?type=getStates&countryId=' + id;
        var method = "post";
        var data = {};
        jQuery('.states1').find("option:eq(0)").html("Please wait..");
        call.send(data, url, method, function(data) {
            jQuery('.states1').find("option:eq(0)").html("Select State");

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
                    // Set the selected property for the matching state
                    if (selectedState === val.name) {
                        option.attr('selected', 'selected');

                    }
                    jQuery('.states1').append(option);
                });
                jQuery(".states1").prop("disabled",false);

            // Trigger change event on states dropdown
            jQuery(".states1").trigger("change");

        });
    };
}

jQuery(function() {
    var loc = new locationInfo1();
    var coid = jQuery("#countryIdNum").val();

    var selectedState = jQuery(".states1").data("selected");
    var selectedCity = jQuery(".cities1").data("selected");

    loc.getStates(coid, selectedState);
    jQuery(".states1").on("change", function(ev) {
        var stateId = jQuery("option:selected", this).attr('stateid');
        if(stateId !== '' && stateId !== undefined){
            loc.getCities(stateId, selectedCity);
        }
        else{
            jQuery(".cities1 option:gt(0)").remove();
        }
    });
    // jQuery(".cities1").on("change", function(ev) {
    //     var cityId = jQuery("option:selected", this).val();
    //     if(cityId != ''){
    //         loc.confCity(cityId);
    //     }
    // });
});
