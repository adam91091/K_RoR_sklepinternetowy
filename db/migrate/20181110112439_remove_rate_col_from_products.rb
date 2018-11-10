class RemoveRateColFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :rate, :integer
  end
end
