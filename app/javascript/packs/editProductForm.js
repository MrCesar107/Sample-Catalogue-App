class ProductForm {
  constructor() {
    this.form = document.querySelector('.js--edit-form form')
    console.log(this.form);
  }
}

const productForm = () => {
  new ProductForm();
}

export default productForm;
