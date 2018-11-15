class CreateConcreteProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :concrete_products do |t|
      t.references :product, foreign_key: true
      t.decimal :price
      t.string :color
			t.string :size
			t.integer :amount

      t.timestamps
    end
  end
end
