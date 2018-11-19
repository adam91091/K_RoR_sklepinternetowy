require 'rails_helper'

RSpec.describe Product do
  describe '#rate' do
    it 'should be average rates returned' do
      product = Product.find_by_name('dress')
      expect(product.rate). to eq(product.productrates.sum(:rate) / product.productrates.count)
    end

    it 'should be StandardError rescued' do
      product_with_no_rate = Product.create(name: 'no_rated_product', category_id: 2).rate
      expect(product_with_no_rate).to eq(0)
    end
  end
end
