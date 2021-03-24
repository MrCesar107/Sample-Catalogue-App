class ProductForm {
  constructor() {
    this.form = document.querySelector('.js--edit-form form')
    console.log(this.form.querySelector('.js--section-ids-select'));
  }
}

const productForm = () => {
  new ProductForm();
}

export default productForm;
