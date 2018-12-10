class HomeView
  def new_products_women
    women = Category.where(name: 'Women')
    women_ids = Category.where(parent: women).pluck(:id)
    result = []
    Product.where(category_id: women_ids).last(3).each do |product|
      result += [product.all_concrete_products.last]
    end
    result
  end

  def new_products_men
    men = Category.where(name: 'Men')
    men_ids = Category.where(parent: men).pluck(:id)
    result = []
    Product.where(category_id: men_ids).last(3).each do |product|
      result += [product.all_concrete_products.last]
    end
    result
  end
end
