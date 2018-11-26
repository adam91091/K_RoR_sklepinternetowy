require 'rails_helper'

RSpec.describe HomeView do

  let!(:women_category) { FactoryBot.create :category, name: 'Women', main_women_category: true}
  let!(:jeans_category) { FactoryBot.create :category, name: 'Jeans', parent: women_category.id}

  let!(:men_category) { FactoryBot.create :category, name: 'Men', main_men_category: true}
  let!(:tshirts_category) { FactoryBot.create :category, name: 'T-shirts', parent: men_category.id}

  let!(:home_view) { FactoryBot.build :home_view}

  describe '#new_products_women' do

    context 'there is only one product for women' do

      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: jeans_category}

      it 'should return the only product for women' do
        expect(home_view.new_products_women).to eq([product1])
      end

    end

    context 'there are many diffrent products' do

      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: jeans_category}
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: tshirts_category}
      let!(:product3) { FactoryBot.create :product, name: 'Product3', category: tshirts_category}
      let!(:product4) { FactoryBot.create :product, name: 'Product4', category: tshirts_category}
      let!(:product5) { FactoryBot.create :product, name: 'Product5', category: jeans_category}
      let!(:product6) { FactoryBot.create :product, name: 'Product6', category: jeans_category}
      let!(:product7) { FactoryBot.create :product, name: 'Product7', category: jeans_category}
      let!(:product8) { FactoryBot.create :product, name: 'Product8', category: jeans_category}

      it 'should return the last three women products' do
        products = [product1];
        expect(home_view.new_products_women).to eq([product6, product7, product8])
      end

    end

    context 'there is no product for woman' do

      let!(:product1) { FactoryBot.create :product, name: 'Product2', category: tshirts_category}
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: tshirts_category}
      let!(:product3) { FactoryBot.create :product, name: 'Product3', category: tshirts_category}
      let!(:product4) { FactoryBot.create :product, name: 'Product4', category: tshirts_category}

      it 'should return empty list' do
        expect(home_view.new_products_women).to eq([])
      end

    end
  end

  describe '#new_products_men' do
  
    context 'there is only one product for men' do

      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: tshirts_category}

      it 'should return the only product for men' do
        expect(home_view.new_products_men).to eq([product1])
      end

    end

    context 'there many diffrent products' do

      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: jeans_category}
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: tshirts_category}
      let!(:product3) { FactoryBot.create :product, name: 'Product3', category: tshirts_category}
      let!(:product4) { FactoryBot.create :product, name: 'Product4', category: tshirts_category}
      let!(:product5) { FactoryBot.create :product, name: 'Product5', category: jeans_category}
      let!(:product6) { FactoryBot.create :product, name: 'Product6', category: jeans_category}
      let!(:product7) { FactoryBot.create :product, name: 'Product7', category: jeans_category}
      let!(:product8) { FactoryBot.create :product, name: 'Product8', category: tshirts_category}

      it 'should return the last three products for men' do
        products = [product1];
        expect(home_view.new_products_men).to eq([product3, product4, product8])
      end

    end

    context 'there is no product for men' do

      let!(:product1) { FactoryBot.create :product, name: 'Product2', category: jeans_category}
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: jeans_category}
      let!(:product3) { FactoryBot.create :product, name: 'Product3', category: jeans_category}
      let!(:product4) { FactoryBot.create :product, name: 'Product4', category: jeans_category}

      it 'should return empty list' do
        expect(home_view.new_products_men).to eq([])
      end

    end
  end
end
