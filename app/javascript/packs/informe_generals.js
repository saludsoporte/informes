import $ from 'jquery'
$(document).on('turbolinks:load', function() {
    $('.herramientas_informe').on('change', function() {
        var herramienta = $("#informe_general_herramientum_id").val();
        cargar_usuarios(herramienta)
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