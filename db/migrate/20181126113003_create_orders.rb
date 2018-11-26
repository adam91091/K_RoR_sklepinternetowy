class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :status
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.text 'comment'
    end
  end
end
