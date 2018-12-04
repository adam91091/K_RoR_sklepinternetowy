class OrderItem < ApplicationRecord
  monetize :price_cents
  belongs_to :concrete_product
  delegate :product, to: :concrete_product
end
