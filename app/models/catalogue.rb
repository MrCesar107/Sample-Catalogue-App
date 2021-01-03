# frozen_string_literal: true

class Catalogue < ApplicationRecord
  scope :active, -> { where(active: true).order(name: :asc) }
  scope :inactive, -> { where(active: false).order(name: :desc) }
end
