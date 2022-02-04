import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    $('.select_user').select2({
        placeholder: "Seleccione una herramienta",
        allowClear: true,
        clear: true,
        remove: true
    });

})