class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.string :status, default: :active, null: false
      t.references :catalogue, index: true, foreign_key: true
    end
  end
end
