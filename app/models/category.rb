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
end
