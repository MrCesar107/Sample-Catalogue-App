# frozen_string_literal: true

class Catalogues
  class SectionsController < BaseController # :nodoc:
    def create
      section = Section.new section_params

      if section.save!
        redirect_to catalogue_sections_path, notice: t(".success")
      else
        redirect_to catalogue_sections_path, alert: t(".failure")
      end
    end

    def index
      render 'sections/index', locals: { sections: sections, catalogue: catalogue }
    end

    private

    def catalogue
      @catalogue ||= Catalogue.find_by id: params[:catalogue_id]
    end

    def sections
      @sections ||= catalogue.sections
    end

    def section_params
      params.require(:section).permit(:name, :catalogue_id)
    end
  end
end
