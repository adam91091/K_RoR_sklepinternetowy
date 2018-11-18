class ProductProvider

  def sort(sort_by)
      if sort_by == 'rate asc'
        Product.all.sort_by(&:rate)
      elsif sort_by == 'rate desc'
        Product.all.sort_by(&:rate).reverse
      else
        Product.all.order(sort_by)
      end
  end

end