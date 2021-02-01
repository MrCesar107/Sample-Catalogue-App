# frozen_string_literal: true

class Section < ApplicationRecord # :nodoc:
  belongs_to :catalogue
  has_many :product_sections, dependent: :restrict_with_exception
  has_many :products, through: :product_sections

  scope :ordered, -> { order(name: :asc) }
  scope :active, -> { where(status: :active) }
  scope :inactive, -> { where(status: :inactive) }

  def active?
    status.eql? 'active'
  end
end
