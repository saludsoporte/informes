import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    $('.BD').select2({
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
    $('.herramientas').select2({
        placeholder: "Seleccione una herramienta",
        allowClear: true,
        clear: true,
        remove: true
    });

})