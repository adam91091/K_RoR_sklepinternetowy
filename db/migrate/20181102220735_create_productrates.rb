class CreateProductrates < ActiveRecord::Migration[5.2]
  def change
    create_table :productrates do |t|
      t.integer :rate
      t.integer :product_id

      t.timestamps
    end
  end
end
