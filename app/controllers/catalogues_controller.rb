# frozen_string_literal: true

class CataloguesController < BaseController # :nodoc:
  def create
    catalogue = Catalogue.new catalogue_params

    if catalogue.save
      redirect_to catalogues_path, notice: t('.success')
    else
      render :index, notice: t('.failure')
    end
  end

  def show
    render json: { catalogue: catalogue }
  end

  def update
    catalogue = Catalogue.find(params[:id])

    if catalogue.update catalogue_params
      redirect_to catalogues_path, notice: t('.success')
    else
      render :index, alert: t('.failure')
    end
  end

  def index
    render :index, locals: { catalogues: catalogues, tabs: tabs }
  end

  def destroy
    catalogue = Catalogue.find params[:id]

    if catalogue.update(active: false)
      redirect_to catalogues_path, notice: t('.success')
    else
      render :index, alert: t('.failure')
    end
  end

  private

  def status
    params[:status] || "active"
  end

  def catalogues
    ::Catalogues.new(status).catalogues
  end

  def catalogue
    @catalogue ||= Catalogue.find_by id: params[:id]
  end

  def catalogue_params
    params.require(:catalogue).permit(:name)
  end

  def tabs
    %w[active inactive].map do |tab|
      { active: status.eql?(tab), status: tab }
    end
  end
end
