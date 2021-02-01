# frozen_string_literal: true

class ProductsController < BaseController # :nodoc:
  def create
    product = Product.new product_params

    if product.save
      product.transaction do
        ::ProductSections.new(product.id, section_ids).create!
      end
      redirect_to products_path, notice: t(".success")
    else
      redirect_to new_product_path, alert: t(".failure"),
                                    locals: { product: product }
    end
  end

  def index
    render :index, locals: { products: products }
  end

  def show; end

  def new
    render :new, locals: { product: Product.new }
  end

  def edit
    render :edit, locals: { product: product }
  end

  def update
    if product.update product_params
      redirect_to products_path, notice: t('.success')
    else
      redirect_to products_path, alert: t('.failure')
    end
  end

  def destroy
    if product.update status: :inactive
      redirect_to products_path, notice: t('.success')
    else
      redirect_to products_path, alert: t('.failure')
    end
  end

  private

  def active_products
    @active_products ||= Product.active.ordered
  end

  def inactive_products
    @inactive_products ||= Product.inactive.ordered
  end

  def product
    @product ||= Product.find params[:id]
  end

  def product_params
    params.require(:product)
          .permit(:name, :description, :number_units, :price,
                  :image, :image_cache)
  end

  def products
    status.eql?('active') && active_products || inactive_products
  end

  def section_ids
    params[:section_ids]
  end

  def status
    params[:status] || 'active'
  end

  def tabs
    %w[active inactive].map do |tab|
      { active: status.eql?(tab), status: tab }
    end
  end
end
