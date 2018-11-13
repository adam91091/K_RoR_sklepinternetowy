class ConcreteProduct < ApplicationRecord
	belongs_to :product
	validates_presence_of :product
	validates_presence_of :price
	validates_presence_of :size
	validates_presence_of :color
	validates_presence_of :amount
end
