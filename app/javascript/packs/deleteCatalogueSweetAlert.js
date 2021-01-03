import Swal from "sweetalert2";

class DeleteCatalogueSweetAlert {
  constructor() {
    const deleteButtons = [...document.getElementsByClassName('js--delete-catalogue-button')];
    deleteButtons.forEach(deleteButton => {
      deleteButton.addEventListener('click', (event) => {
        let catalogueId = event.currentTarget.getAttribute('data-id');
        this.showSweetAlert(catalogueId);
      });
    });
  }

  showSweetAlert(catalogueId) {
    Swal.fire({
      icon: 'warning',
      title: 'Are you sure?',
      text: 'The catalogue will be deleted forever',
      showCancelButton: true,
      confirmButtonText: 'Delete catalogue',
      denyButtonText: 'Cancel',
    })
    .then((result) => {
      this.submitDialogueDelete(catalogueId);
    });
  }

  submitDialogueDelete(catalogueId) {
    const form = document.createElement('form');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const csrfParam = document.querySelector('meta[name="csrf-param"]').content;
    const csrfTokenInput = document.createElement('input');
    const methodInput = document.createElement('input');

    csrfTokenInput.setAttribute('type', 'hidden');
    csrfTokenInput.value = csrfToken;
    csrfTokenInput.name = csrfParam;
    methodInput.setAttribute('type', 'hidden');
    methodInput.value = 'DELETE';
    methodInput.name = '_method';

    form.method = 'post';
    form.action = `/catalogues/${catalogueId}`;
    form.appendChild(methodInput);
    form.appendChild(csrfTokenInput);

    document.body.appendChild(form);
    form.style.display = "none";
    form.submit();
  }
}

const deleteCatalogueSweetAlert = () => {
  new DeleteCatalogueSweetAlert();
}

export default deleteCatalogueSweetAlert;
