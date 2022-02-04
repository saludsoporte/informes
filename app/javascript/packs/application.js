// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "bootstrap";
import "../stylesheets/application"
import "../stylesheets/sidebars"
import "../packs/sidebars.js"
import "../stylesheets/navbar"
import "../stylesheets/headers"
import "../stylesheets/grid"
import "../packs/perfils"
import "../packs/herramientum"
import "../packs/plantillas"
import "../packs/partidas"
import "../packs/informe_generals"
import "../packs/user"
import "../packs/tabla_users"
import 'select2'
import 'select2/dist/css/select2.css'
import 'popper.js'
//import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
//import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
import $ from 'jquery'
$(document).on('turbolinks:load', function() {

    $('#myModal').on('shown.bs.modal', function() {
        $('#myInput').trigger('focus')
    })


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


$(document).on('turbolinks:load', function() {
    $('.unidad').select2({
        placeholder: "unidad",
        allowClear: true,
        clear: true,
        remove: true
    });
    $('.area').select2({
        placeholder: "area",
        allowClear: true,
        clear: true,
        remove: true
    });
    $('.direccion').select2({
        placeholder: "direccion",
        allowClear: true,
        clear: true,
        remove: true
    });
    $('.subdireccion').select2({
        placeholder: "subdireccion",
        allowClear: true,
        clear: true,
        remove: true
    });
    $('.departamento').select2({
        placeholder: "departamento",
        allowClear: true,
        clear: true,
        remove: true
    });

    $('usuarios_id').select2({
        placeholder: "user",
        allowClear: true,
        clear: true,
        remove: true
    })

})