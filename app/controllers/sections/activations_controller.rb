# frozen_string_literal: true

module Sections
  # This class reactivates disabled sections
  class ActivationsController < ::BaseController
    def create
      if section.update status: :active
        redirect_to catalogue_sections_path(catalogue_id: catalogue.id),
                    notice: t('.success')
      else
        redirect_to catalogue_sections_path(catalogue_id: catalogue.id),
                    notice: t('.failure')
      end
    end

    private

    def catalogue
      @catalogue ||= section.catalogue
    end

    def section
      @section ||= Section.find params[:section_id]
    end
  end
end
