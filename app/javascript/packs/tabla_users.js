import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    $('.select_user').select2({
        placeholder: "Seleccione una usuario propietario",
        allowClear: true,
        clear: true,
        remove: true
    });

})