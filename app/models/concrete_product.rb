class ConcreteProduct < ApplicationRecord
	belongs_to :product
	has_many_attached :images
  validates_presence_of :product
  validates_presence_of :price
  validates_presence_of :size
  validates_presence_of :color
  validates_presence_of :amount
end
