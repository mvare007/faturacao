// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("datatables.net-dt");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../../../vendor/tabler/assets/css/tabler.css";
import "../../../vendor/tabler/assets/css/tabler-vendors.css";
import "../../../vendor/tabler/assets/js/tabler.js";
import $ from "jquery";
global.$ = jQuery;

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
 $("#cu-table").dataTable({
    language: {
      sEmptyTable: "Nenhum registo encontrado",
      sInfo: "A visualizar de _START_ até _END_ de _TOTAL_ registos",
      sInfoEmpty: "A visualizar 0 até 0 de 0 registos",
      sInfoFiltered: "(Filtrados de _MAX_ registros)",
      sInfoPostFix: "",
      sInfoThousands: ".",
      sLengthMenu: "A visualizar _MENU_ resultados por página",
      sLoadingRecords: "A Carregar...",
      sProcessing: "A Processar...",
      sZeroRecords: "Nenhum registo encontrado",
      sSearch: "Pesquisar",
      oPaginate: {
        sNext: "Próximo",
        sPrevious: "Anterior",
        sFirst: "Primeiro",
        sLast: "Último",
      },
      oAria: {
        sSortAscending: ": Ordenar colunas de forma ascendente",
        sSortDescending: ": Ordenar colunas de forma descendente",
      },
      select: {
        rows: {
          _: "Linhas %d seleccionadas",
          0: "Nenhuma linha selecionada",
          1: "1 linha seleccionada ",
        },
      },
    },
  });
});

import "controllers"
