class CreateProcuctsSections < ActiveRecord::Migration[6.0]
  def change
    create_join_table :product, :sections do |t|
      t.index :product_id
      t.index :section_id
    end
  end
end
