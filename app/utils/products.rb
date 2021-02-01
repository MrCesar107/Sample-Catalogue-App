# frozen_string_literal: true

module Products
  def self.sections_for_select
    Section.active.map do |section|
      [section.name, section.id]
    end
  end
end
