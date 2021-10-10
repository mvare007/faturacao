import { Controller } from "stimulus";
import $ from "jquery";

require("select2/dist/css/select2");
require("select2-bootstrap-theme/dist/select2-bootstrap");

import Select2 from "select2";

export default class extends Controller {
  connect() {
    $(".select2").select2({
      placeholder: "Select an option",
      allowClear: true
    });
  }
}

/* Example
==============================================================
<div class="form-group" data-controller='select2'>
  <%= f.select :user_id, User.all.map { |user| user.name }, {include_blank: false, required: true, include_hidden: false}, class: 'form-control content-search' %>
</div>
==============================================================
*/
