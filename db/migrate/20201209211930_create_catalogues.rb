class CreateCatalogues < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogues do |t|
      t.string :name, null: false
    end
  end
end
