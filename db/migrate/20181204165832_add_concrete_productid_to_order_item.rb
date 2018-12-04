class AddConcreteProductidToOrderItem < ActiveRecord::Migration[5.2]
  def change
    OrderItem.destroy_all
    remove_column :order_items, :product_id
    add_column :order_items, :concrete_product_id, :integer
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
