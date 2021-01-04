class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.references :catalogues, index: true, foreign_key: true
    end
  end
end
