class CreateCatalogues < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogues do |t|
      t.string :name, null: false
      t.boolean :status, default: true, null: false
    end
  end
end
