# frozen_string_literal: true

# Sections JSON serializer. This serializer is used by catlogue section's forms
class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name
end
