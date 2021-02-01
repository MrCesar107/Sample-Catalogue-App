# frozen_string_literal: true

class Product < ApplicationRecord # :nodoc:
  mount_uploader :image, ImageUploader
  attr_accessor :image_cache

  has_many :product_sections, dependent: :restrict_with_exception
  has_many :sections, through: :product_sections

  validates :name, :number_units, :price, presence: true

  scope :active, -> { where(status: :active) }
  scope :inactive, -> { where(status: :inactive) }
  scope :ordered, -> { order(name: :asc) }

  def active?
    status.eql? 'active'
  end
end
