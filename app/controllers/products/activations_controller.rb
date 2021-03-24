# frozen_string_literal: true

module Products
  # This class generates the reactivation for 'deleted' products
  class ActivationsController < ::BaseController
    def create
      if product.update status: :active
        redirect_to(products_path, notice: t('.success'))
      else
        redirect_to(products_path, alert: t('.failure'))
      end
    end

    private

    def product
      @product ||= Product.find params[:product_id]
    end
  end
end
