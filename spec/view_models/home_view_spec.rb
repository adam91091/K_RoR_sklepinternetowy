require 'rails_helper'

RSpec.describe HomeView do
  let!(:women_category) { FactoryBot.create :category, name: 'Women', main_women_category: true }
  let!(:jeans_category) { FactoryBot.create :category, name: 'Jeans', parent: women_category.id }

  let!(:men_category) { FactoryBot.create :category, name: 'Men', main_men_category: true }
  let!(:tshirts_category) { FactoryBot.create :category, name: 'T-shirts', parent: men_category.id }

  let!(:home_view) { FactoryBot.build :home_view }

  describe '#new_products_women' do
    context 'there is only one product for women' do
      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: jeans_category }
      let!(:concrete1) { FactoryBot.create :concrete_product, :required_fields, product: product1 }

      it 'should return the only product for women' do
        expect(home_view.new_products_women).to eq([concrete1])
      end
    end

    context 'there are many diffrent products' do
      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: jeans_category }
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: tshirts_category }
      let!(:product3) { FactoryBot.create :product, name: 'Product3', category: tshirts_category }
      let!(:product4) { FactoryBot.create :product, name: 'Product4', category: tshirts_category }
      let!(:product5) { FactoryBot.create :product, name: 'Product5', category: jeans_category }

      let!(:concrete1) { FactoryBot.create :concrete_product,  :required_fields, product: product1 }
      let!(:concrete2) { FactoryBot.create :concrete_product,  :required_fields, product: product1 }
      let!(:concrete3) { FactoryBot.create :concrete_product,  :required_fields, product: product2 }
      let!(:concrete4) { FactoryBot.create :concrete_product,  :required_fields, product: product3 }
      let!(:concrete5) { FactoryBot.create :concrete_product,  :required_fields, product: product2 }
      let!(:concrete6) { FactoryBot.create :concrete_product,  :required_fields, product: product4 }
      let!(:concrete7) { FactoryBot.create :concrete_product,  :required_fields, product: product5 }

      it 'should return two women products' do
        expect(home_view.new_products_women).to eq([concrete1, concrete7])
      end
    end

    context 'there is no product for woman' do
      let!(:product1) { FactoryBot.create :product, name: 'Product2', category: tshirts_category }
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: tshirts_category }
      let!(:product3) { FactoryBot.create :product, name: 'Product3', category: tshirts_category }
      let!(:product4) { FactoryBot.create :product, name: 'Product4', category: tshirts_category }

      it 'should return empty list' do
        expect(home_view.new_products_women).to eq([])
      end
    end
  end

  describe '#new_products_men' do
    context 'there is only one product for men' do
      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: tshirts_category }
      let!(:concrete1) { FactoryBot.create :concrete_product, :required_fields, product: product1 }

      it 'should return the only product for men' do
        expect(home_view.new_products_men).to eq([concrete1])
      end
    end

    context 'there many diffrent products' do
      let!(:product1) { FactoryBot.create :product, name: 'Product1', category: jeans_category }
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: tshirts_category }
      let!(:product3) { FactoryBot.create :product, name: 'Product3', category: tshirts_category }
      let!(:product4) { FactoryBot.create :product, name: 'Product4', category: tshirts_category }

      let!(:concrete1) { FactoryBot.create :concrete_product, :required_fields, product: product1 }
      let!(:concrete2) { FactoryBot.create :concrete_product, :required_fields, product: product2 }
      let!(:concrete3) { FactoryBot.create :concrete_product, :required_fields, product: product2 }
      let!(:concrete4) { FactoryBot.create :concrete_product, :required_fields, product: product3 }
      let!(:concrete5) { FactoryBot.create :concrete_product, :required_fields, product: product4 }

      it 'should return the last three products for men' do
        expect(home_view.new_products_men).to eq([concrete2, concrete4, concrete5])
      end
    end

    context 'there is no product for men' do
      let!(:product1) { FactoryBot.create :product, name: 'Product2', category: jeans_category }
      let!(:product2) { FactoryBot.create :product, name: 'Product2', category: jeans_category }

      let!(:concrete1) { FactoryBot.create :concrete_product,  :required_fields, product: product2 }
      let!(:concrete2) { FactoryBot.create :concrete_product,  :required_fields, product: product1 }

      it 'should return empty list' do
        expect(home_view.new_products_men).to eq([])
      end
    end
  end
end
