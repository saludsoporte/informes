import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    $('.partidas').select2({
        placeholder: "Seleccione una partida",
        allowClear: true,
        clear: true,
        remove: true
    });

})