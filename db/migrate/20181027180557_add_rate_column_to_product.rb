# frozen_string_literal: true

class AddRateColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :rate, :integer
  end
end
