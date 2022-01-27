$(document).on('turbolinks:load', function() {
    $("#fecha_doc").show();
    $("#fecha_ini").hide();
    $("#fecha_fin").hide();

    $("#rango").on('change', function() {
        //alert($("#rango").prop('checked'));
        if ($("#rango").prop('checked')) {
            $("#fecha_doc").hide();
            $("#fecha_ini").show();
            $("#fecha_fin").show();
            $("#fecha").val("");
        } else {
            $("#fecha_doc").show();
            $("#fecha_ini").hide();
            $("#fecha_fin").hide();
            $("#f_ini").val("");
            $("#f_fin").val("");
        }
    });
})