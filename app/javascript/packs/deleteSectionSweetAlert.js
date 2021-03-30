import Swal from 'sweetalert2';

class DeleteSectionSweetAlert {
  constructor() {
    const deleteButtons = [...document.getElementsByClassName('js--delete-section-button')];
    deleteButtons.forEach(deleteButton => {
      deleteButton.addEventListener('click', event => {
        let sectionId = event.currentTarget.getAttribute('data-id');
        const catalogueId = event.currentTarget
                                 .getAttribute('data-catalogue-id')
        this.showSweetAlert(catalogueId, sectionId);
      });
    });
  }

  showSweetAlert(catalogueId, sectionId) {
    Swal.fire({
      icon: 'warning',
      title: 'Are you sure?',
      text: 'The catalogue will be deleted forever',
      showCancelButton: true,
      confirmButtonText: 'Delete catalogue',
      denyButtonText: 'Cancel',
    })
    .then((result) => {
      if(result.isConfirmed)
        this.submitDialogueDelete(catalogueId, sectionId);
    });
  }

  submitDialogueDelete(catalogueId,sectionId) {
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
    form.action = `/catalogues/${catalogueId}/sections/${sectionId}`;
    form.appendChild(methodInput);
    form.appendChild(csrfTokenInput);

    document.body.appendChild(form);
    form.style.display = "none";
    form.submit();
  }
}

const deleteSectionSweetAlert = () => {
  new DeleteSectionSweetAlert();
};

export default deleteSectionSweetAlert;
