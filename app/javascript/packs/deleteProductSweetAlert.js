import Swal from 'sweetalert2';

class DeleteProductSweetAlert {
  constructor() {
    const deleteButtons = [...document.getElementsByClassName('js--delete-product-button')];
    deleteButtons.forEach(deleteButton => {
      deleteButton.addEventListener('click', event => {
        let productId = event.currentTarget.getAttribute('data-id');
        this.showSweetAlert(productId);
      })
    });
  }

  showSweetAlert(productId) {
    Swal.fire({
      icon: 'warning',
      title: 'Are you sure?',
      text: 'The product will be deleted forever',
      showCancelButton: true,
      confirmButtonText: 'Delete product',
      denyButtonText: 'Cancel',
    })
    .then((result) => {
      if(result.isConfirmed)
        this.submitDialogueDelete(productId);
    });
  }

  submitDialogueDelete(productId) {
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
    form.action = `/products/${productId}/`;
    form.appendChild(methodInput);
    form.appendChild(csrfTokenInput);

    document.body.appendChild(form);
    form.style.display = "none";
    form.submit();
  }
}

const deleteProductSweetAlert = () => {
  new DeleteProductSweetAlert();
}

export default deleteProductSweetAlert;
