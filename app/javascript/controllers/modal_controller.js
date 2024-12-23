import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "field", "submit"]

  connect() {
    this.checkFields();
  }

  checkFields() {
    let anyFieldFilled = false;
    this.submitTarget.disabled = true;

    this.fieldTargets.forEach((field) => {
      if (field.value.trim().length > 0) {
        anyFieldFilled = true;
        this.submitTarget.disabled = false;
      }
    });

    if (anyFieldFilled && !this.modalTarget.classList.contains("show")) {
      this.showModal();
    }
  }

  showModal() {
    if (!this.modalInstance) {
      this.modalInstance = new bootstrap.Modal(this.modalTarget);
    }

    this.modalInstance.show();
  }
}
