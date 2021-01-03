# frozen_string_literal: true

class Catalogue < ApplicationRecord
  scope :active, -> { where(active: true).order(name: :asc) }
end
