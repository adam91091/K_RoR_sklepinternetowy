class Category < ApplicationRecord
  has_many :products
  has_many :child_categories, class_name: 'Category', foreign_key: 'parent'

	def all_products(product_name: nil, **kwargs)
    result = []
    child_categories.each do |child|
      result += child.all_products(product_name: product_name)
		end
		if product_name
			result + products.where('name ILIKE ?', "%#{product_name}%")
		else
			result + products
		end
  end

	def all_concrete_products(search_phrase: nil, **kwargs)
    result = []
    all_products(product_name: search_phrase).each do |product|
      result += product.all_concrete_products
    end
    result
  end
end
