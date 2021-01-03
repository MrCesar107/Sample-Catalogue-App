# frozen_string_literal: true

class Catalogue < ApplicationRecord # :nodoc:
  scope :active, -> { where(status: true).order(name: :asc) }
  scope :inactive, -> { where(status: false).order(name: :desc) }

  def active?
    status
  end
end
