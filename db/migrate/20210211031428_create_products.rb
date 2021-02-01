class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :status, default: :active, null: false
      t.integer :number_units, null: false
      t.decimal :price, precision: 2, null: false
      t.string :image

      t.timestamps
    end
  end
end
