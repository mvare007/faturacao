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

// External imports
import "bootstrap";
import "../../../vendor/tabler/assets/css/tabler.css";
import "../../../vendor/tabler/assets/css/tabler-vendors.css";
import "../../../vendor/tabler/assets/js/tabler.js";
import $ from "jquery";
global.$ = jQuery;

// Internal imports, e.g:
import "controllers"

document.addEventListener('turbolinks:load', () => {
});

