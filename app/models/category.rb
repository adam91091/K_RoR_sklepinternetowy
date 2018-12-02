class Category < ApplicationRecord
	has_many :products
	has_many :child_categories, :class_name => "Category", :foreign_key => 'parent'

	def all_products
		result = []
		child_categories.each do |child|
			result = result + child.all_products
		end
		return result + products
	end

	def all_concrete_products
		result = []
		all_products.each do |product|
			result = product.all_concrete_products
		end
		return result
	end
end
