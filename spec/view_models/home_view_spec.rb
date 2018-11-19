require 'rails_helper'

RSpec.describe HomeView do

  home_view = HomeView.new
  women = Category.where(name: 'Women')
  women_ids = Category.where(parent: women).pluck(:id)
  men = Category.where(name: 'Men')
  men_ids = Category.where(parent: men).pluck(:id)

  describe '#new_products_women' do
    
    it 'should return the last three women products' do
      home_view.new_products_women().should == Product.where(category_id: women_ids).last(3)
    end
    it 'should return the only two women products' do
      products = Product.where(category_id: women_ids).first(2)
      products += Product.where(category_id: men_ids).all
      home_view.new_products_women().should == Product.where(category_id: women_ids).first(2)
    end
    it 'should return empty list' do
      products = Product.where(category_id: men_ids).all
      home_view.new_products_women().should == []
    end 

  end

  describe '#new_products_men' do
    
    it 'should return the last three men products' do
      home_view.new_products_men().should == Product.where(category_id: men_ids).last(3)
    end
    it 'should return the only two men products' do
      products = Product.where(category_id: men_ids).first(2)
      products += Product.where(category_id: women_ids).all
      home_view.new_products_men().should == Product.where(category_id: men_ids).first(2)
    end
    it 'should return empty list' do
      products = Product.where(category_id: women_ids).all
      home_view.new_products_men().should == []
    end 

  end

end