# frozen_string_literal: true

class Section < ApplicationRecord # :nodoc:
  belongs_to :catalogue

  scope :ordered, -> { order(name: :asc) }
end
