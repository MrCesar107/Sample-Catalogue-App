# frozen_string_literal: true

class Catalogues
  # This controller restores a catalogue from a soft delete.
  class RestoreCatalogueController < BaseController
    def update
      if catalogue.update status: true
        redirect_to catalogues_path, notice: t('.success')
      else
        redirect_to catalogue_path, alert: t('.failure')
      end
    end

    private

    def catalogue
      @catalogue = Catalogue.find params[:catalogue_id]
    end
  end
end
