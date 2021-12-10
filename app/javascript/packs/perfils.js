import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    $('.perfiles').select2({
        placeholder: "Selecciona uno",
        allowClear: true,
        clear: true,
        remove: true
    });

})