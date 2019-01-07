class Category < ApplicationRecord
  has_many :products
  has_many :child_categories, class_name: 'Category', foreign_key: 'parent'

  def all_products(product_name: nil, **_kwargs)
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

  def all_concrete_products(search_phrase: nil, **_kwargs)
    result = []
    all_products(product_name: search_phrase).each do |product|
      result += product.all_concrete_products
    end
    result
  end

  def filtred_products(search_phrase: nil, **_kwargs)
    products = all_concrete_products(search_phrase: search_phrase, **_kwargs)

    # filter by size
    filtred_by_size = []
    products.each do |product|
      filtred_by_size += [product] if which_sizes(**_kwargs).include? product.size
    end

    # filter by price
    filtred_by_price = []
    price = which_price_filters(**_kwargs)
    from = price[0]
    to = price[1]
    filtred_by_size.each do |product|
      if from && to
        filtred_by_price += [product] if product.price >= _kwargs[:from].to_i && product.price <= _kwargs[:to].to_i
      elsif from
        filtred_by_price += [product] if product.price >= _kwargs[:from].to_i
      elsif to
        filtred_by_price += [product] if product.price <= _kwargs[:to].to_i
      else
        filtred_by_price += [product]
      end
    end

    # sort
    sort(_kwargs[:sort_by], filtred_by_price)
  end

  def which_sizes(**_kwargs)
    sizes = %i[xs s m l xl xxl]
    result = []
    sizes.each do |size|
      result += [_kwargs[size]] if _kwargs[size]
    end
    result = %w[XS S M L XL XXL] if result == []
    result
  end

  def which_price_filters(params)
    from = false
    to = false
    from = true if params[:from] && params[:from] != ''
    to = true if params[:to] && params[:to] != ''
    [from, to]
  end

  def sort(sort_by, products)
    if sort_by == 'rate asc'
      products.sort_by { |elem| elem.product.rate }
    elsif sort_by == 'rate desc'
      products.sort_by { |elem| elem.product.rate }.reverse
    elsif sort_by == 'price asc'
      products.sort_by(&:price)
    elsif sort_by == 'price desc'
      products.sort_by(&:price).reverse
    elsif sort_by == 'name desc'
      products.sort_by { |elem| elem.product.name }.reverse
    else
      products.sort_by { |elem| elem.product.name }
    end
  end
end
