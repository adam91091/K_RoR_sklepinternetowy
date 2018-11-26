class OrderItem < ApplicationRecord
  monetize :price_cents
  belongs_to :product
end
