import $ from 'jquery'
$(document).on('turbolinks:load', function() {
    $('#select').on('change', function() {
        var id_user = $("#select").val();
        var h_id = $("#herra_id").val();
        var inf = $("#informe_id").val();
        var fecha = $("#fecha").val();
        var f_ini = $("#fecha_ini").val();
        var f_fin = $("#fecha_fin").val();
        listar_documentos(id_user, h_id, inf, fecha, f_ini, f_fin);

    });

});

function listar_documentos(id_user, h_id, informe, fecha, f_ini, f_fin) {
    $.ajax({
        type: "get",
        dataType: "html",
        cache: true,
        url: "listar_documentos",
        data: { informe_id: informe, user_id: id_user, herramienta_id: h_id, fecha: fecha, f_ini: f_ini, f_fin: f_fin },
        error: function(XMLHttpRequest, errorTextStatus, error) {
            console.log("Failed: " + errorTextStatus + " ;" + error);
        },
        success: function(data) {
            $("#parcial").html(data);
        }
    });
}