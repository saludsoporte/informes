import $ from 'jquery'
$(document).on('turbolinks:load', function() {
    $('#unidad').prop('hidden', true);
    $('#tipo').prop('hidden', true);
    $('.herramientas_informe').on('change', function() {
        var herramienta = $("#informe_general_herramientum_id").val();
        if (herramienta == 2 || herramienta == 5) {
            $('.partidas').val(-1).trigger("change");
            $('#unidad').prop('hidden', false);
            $('#tipo').prop('hidden', true);
        } else {
            $('#unidad').prop('hidden', true);
            $('#tipo').prop('hidden', false);
        }
    });
    $('.herramientas_informe').on('change', function() {
        var herramienta = $("#informe_general_herramientum_id").val();
        if (herramienta == 2) {
            $('.partidas').val(-1).trigger("change");
        }
    });



    $('.unidades').select2({
        placeholder: "Seleccione una unidad",
        allowClear: true,
        clear: true,
        remove: true
    });
    $('#select_arr').select2({
        placeholder: "Seleccione una usuario",
        allowClear: true,
        clear: true,
        remove: true
    });
    //$('.herramientas').val(1).trigger("change");

})

function cargar_usuarios(herramienta) {

    $.ajax({
        type: "get",
        dataType: "html",
        cache: true,
        url: "cargar_usuarios_h",
        data: { herramienta_id: herramienta },
        error: function(XMLHttpRequest, errorTextStatus, error) {
            console.log("Failed: " + errorTextStatus + " ;" + error);
        },
        success: function(data) {
            $("#parcial").html(data);
        }
    });
}