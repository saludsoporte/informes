import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    //$(".perfiles").val(null).trigger("change");
    $('.perfiles').select2({
        placeholder: "Selecciona uno",
        allowClear: true
    });

})