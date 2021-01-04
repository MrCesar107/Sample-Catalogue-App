# frozen_string_literal: true

class SectionsController < BaseController # :nodoc:
  def index
    render :index, locals: { sections: sections }
  end

  private

  def sections
    @sections ||= Section.all
  end
end
