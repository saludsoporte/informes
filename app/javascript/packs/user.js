import $ from 'jquery'
$(document).on('turbolinks:load', function() {
    $('#submit').prop('disabled', true);
    $('.herramientas_to_user').select2({
        placeholder: "Seleccione una herramienta",
        allowClear: true,
        clear: true,
        remove: true
    });
    $(".herramientas_to_user").on('change', function() {
        var val = $(".herramientas_to_user").val();
        if (val == '') {
            $('#submit').prop('disabled', true);
        } else { $('#submit').prop('disabled', false); }
    });

    $("#submit").on('click', function() {
        validarHerramienta();
    })

    /*$('.herramientas_to_user').on('change', function() {
        //var herramienta = $("#herramienta").val();
        //cargar_datos_plantilla(herramienta)
    });
*/
    //$('.herramientas').val(1).trigger("change");

})