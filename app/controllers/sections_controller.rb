# frozen_string_literal: true

class SectionsController < BaseController # :nodoc:
  def index
    render :index, locals: { sections: sections, tabs: tabs }
  end

  def show
    render json: section
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

  def section_params
    params.require(:section).permit(:name)
  end

  def section
    @section ||= Section.find params[:id]
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
