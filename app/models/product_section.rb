# frozen_string_literal: true

class ProductSection < ApplicationRecord
  belongs_to :product
  belongs_to :section
end
