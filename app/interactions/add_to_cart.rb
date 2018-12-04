require 'active_interaction'
class AddToCart < ActiveInteraction::Base
  object :guest
  object :concrete_product

  def execute
    guest.cart.order_items.create concrete_product: concrete_product
  end
end
