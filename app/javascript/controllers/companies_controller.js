import { Controller } from "stimulus";

export default class extends Controller {
  addCompanyUser(e) {
    debugger
    e.preventDefault();
    const tbody = document.querySelector("#company-users-table > tbody");
    // insert new row
    let newRow = document.createElement("tr");


  }
}
