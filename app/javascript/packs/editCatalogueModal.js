class EditCatalogueModal {
  constructor(modal) {
    this.modal = modal;
    this.form = document.querySelector('.js--catalogue-form');
    let editButtons = [...document.getElementsByClassName('js--edit-button')];
    let submitButton = document.querySelector('.js--submit-button');
    editButtons.forEach((editButton) => {
      editButton.addEventListener('click', (event) => {
        this.catalogueId = event.currentTarget.getAttribute('data-id');
        this.setCatalogueForm(this.catalogueId);

        submitButton.addEventListener('click', (event) => {
          event.preventDefault();
          this.form.action = `/catalogues/${this.catalogueId}`;
          this.form.submit();
        });
      });
    });
  }

  async fetchCatalogue(url) {
    let jsonData;

    jsonData = await fetch(url)
                      .then((response) => response.json())
                      .then((data) => jsonData = data)
                      .catch((err) => console.log(err));

    return jsonData.catalogue
  }

  async setCatalogueForm(id) {
    const catalogue = await this.fetchCatalogue(`/catalogues/${id}`);
    const nameField = this.modal.getElementsByClassName("js--name-field")[0];
    nameField.value = catalogue.name;
  }
}

const editCatalogueModal = () => {
  let modal = document.getElementById('editCatalogueModal');
  new EditCatalogueModal(modal);
};

export default editCatalogueModal;
