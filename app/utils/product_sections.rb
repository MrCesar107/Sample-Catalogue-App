# frozen_string_literal: true

class ProductSections
  attr_reader :product_id, :section_ids

  def initialize(product_id, section_ids)
    @product_id = product_id
    @section_ids = section_ids
  end

  def create!
    section_ids.each do |section_id|
      ::ProductSection.create product_id: product_id, section_id: section_id
    end
  end
end
