# frozen_string_literal: true

class Catalogues
  # This controller restores a catalogue from a soft delete.
  class RestoreCatalogueController < BaseController
    def update
      catalogue = Catalogue.find params[:catalogue_id]

      if catalogue.update active: true
        redirect_to catalogues_path, notice: t('.success')
      else
        redirect_to catalogue_path, alert: t('.failure')
      end
    end
  end
end
