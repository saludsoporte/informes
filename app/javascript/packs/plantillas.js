import $ from 'jquery'
$(document).on('turbolinks:load', function() {
    $('.herramientas').on('change', function() {
        var herramienta = $("#herramienta").val();
        cargar_datos_plantilla(herramienta)
    });

    $('.herramientas').val(1).trigger("change");

})

function cargar_datos_plantilla(herramienta) {

    $.ajax({
        type: "get",
        dataType: "html",
        cache: true,
        url: "plantillas/cargar_plantilla",
        data: { herramienta_id: herramienta },
        error: function(XMLHttpRequest, errorTextStatus, error) {
            console.log("Failed: " + errorTextStatus + " ;" + error);
        },
        success: function(data) {

            $("#parcial").html(data);
        }
    });
}