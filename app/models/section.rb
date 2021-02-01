# frozen_string_literal: true

class Section < ApplicationRecord # :nodoc:
  belongs_to :catalogue

  scope :ordered, -> { order(name: :asc) }
  scope :active, -> { where(status: :active) }
  scope :inactive, -> { where(status: :inactive) }

  def active?
    status.eql? 'active'
  end

end
