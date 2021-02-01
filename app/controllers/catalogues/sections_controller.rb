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
      render 'sections/index', locals: {
        sections: sections,
        catalogue: catalogue,
        tabs: tabs
      }
    end

    def update
      if section.update section_params
        redirect_to catalogue_sections_path, notice: t('.success')
      else
        redirect_to catalogue_sections_path, notice: t('.failure')
      end
    end

    def destroy
      if section.update status: :inactive
        redirect_to catalogue_sections_path, notice: t('.success')
      else
        redirect_to catalogue_sections_path, notice: t('.failure')
      end
    end

    private

    def active_sections
      @active_sections ||= !catalogue.nil? && catalogue.sections.active ||
                           Section.active
    end

    def catalogue
      @catalogue ||= Catalogue.find_by id: params[:catalogue_id]
    end

    def inactive_sections
      @inactive_sections ||= !catalogue.nil? && catalogue.sections.inactive ||
                             Section.inactive
    end

    def sections
      status.eql?('active') && active_sections || inactive_sections
    end

    def section
      @section ||= Section.find params[:id]
    end

    def section_params
      params.require(:section).permit(:name, :catalogue_id)
    end

    def status
      params[:status] || "active"
    end

    def tabs
      %w[active inactive].map do |tab|
        { active: status.eql?(tab), status: tab }
      end
    end
  end
end
