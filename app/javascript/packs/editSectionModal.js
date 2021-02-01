class EditSectionModal {
  constructor(modal) {
    this.modal = modal;
    this.form = document.querySelector(".js--section-form");
    let editButtons = [
      ...document.getElementsByClassName('js--edit-section-button')];
    let submitButton = document.querySelector('.js--submit-button');

    editButtons.forEach(editButton => {
      editButton.addEventListener('click', event => {
        this.sectionId = event.currentTarget.getAttribute('data-id');
        this.catalogueId = event.currentTarget
                                .getAttribute('data-catalogue-id');
        this.setSectionForm(this.sectionId);

        submitButton.addEventListener('click', event => {
          event.preventDefault();
          this.form.action =
            `/catalogues/${this.catalogueId}/sections/${this.sectionId}`;
          this.form.submit();
        });
      });
    });
  }

  async fetchSection(url) {
    let jsonData;

    jsonData = await fetch(url)
                      .then(response => response.json())
                      .then(data => jsonData = data)
                      .catch(err => console.error(err));

    return jsonData;
  }

  async setSectionForm(id) {
    const section = await this.fetchSection(`/sections/${id}`);
    const nameField = this.modal.getElementsByClassName('js--name-field')[0];
    nameField.value = section.name;
  }
}

const editSectionModal = () => {
  const modal = document.getElementById('editSectionModal');
  new EditSectionModal(modal);
};

export default editSectionModal;
