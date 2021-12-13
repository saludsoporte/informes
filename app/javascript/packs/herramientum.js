import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    $('.herramientas').select2({
        placeholder: "Conexion BD",
        allowClear: true,
        clear: true,
        remove: true
    });
    $('.datos').select2({
        placeholder: "Selecciona uno",
        allowClear: true,
        clear: true,
        remove: true
    });

})