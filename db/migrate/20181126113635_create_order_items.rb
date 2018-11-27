class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer 'order_id'
      t.integer 'product_id'
      t.integer 'price_cents', default: 0, null: false
      t.string 'price_currency', default: 'USD', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end
end
