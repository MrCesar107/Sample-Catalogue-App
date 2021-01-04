# frozen_string_literal: true

class Catalogues
  class SectionsController < BaseController # :nodoc:
    def index
      render :index, locals: { sections: sections }
    end

    private

    def catalogue
      @catalogue ||= Catalogue.find_by params[:catalogue_id]
    end

    def sections
      @sections ||= catalogue.sections
    end
  end
end
