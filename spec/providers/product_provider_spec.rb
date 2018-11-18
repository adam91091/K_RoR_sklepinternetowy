require 'rails_helper'


RSpec.describe ProductProvider do

  describe '#sort' do

  product_provider = ProductProvider.new
  products = Product.all
  
  it 'should be sorted by rate asc' do
     product_provider.sort('rate asc').should == products.sort_by(&:rate)
  end

  it 'should be sorted by rate desc' do
    product_provider.sort('rate desc').should == products.sort_by(&:rate).reverse
  end

  it 'should be sorted by name asc' do
    product_provider.sort('name asc').should == products.order('name asc')
  end

  it 'should be sorted by name desc' do
    product_provider.sort('name desc').should == products.order('name desc')
  end

end
end