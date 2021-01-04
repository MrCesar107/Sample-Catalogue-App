# frozen_string_literal: true

class Catalogue < ApplicationRecord # :nodoc:
  has_many :sections, dependent: :restrict_with_exception

  scope :active, -> { where(status: true).order(name: :asc) }
  scope :inactive, -> { where(status: false).order(name: :desc) }

  def active?
    status
  end
end
