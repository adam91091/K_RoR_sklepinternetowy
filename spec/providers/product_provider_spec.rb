require 'rails_helper'
RSpec.describe ProductProvider do
  let(:product1) { FactoryBot.create :product, name: 'T-shirt' }
  let(:product2) { FactoryBot.create :product, name: 'Coat' }
  let(:product3) { FactoryBot.create :product, name: 'Jacket' }
  let(:product_provider1) { ProductProvider.new }
  describe '#sort' do
    context 'when sorting by name' do
      specify do
        expect(product_provider1.sort('name asc')).to eq([product2, product3, product1])
      end

      specify do
        expect(product_provider1.sort('name desc')).to eq([product1, product3, product2])
      end
    end

    context 'when sorting by rate' do
      let!(:product1_rate) { FactoryBot.create :productrate, product: product1, rate: 4 }
      let!(:product2_rate) { FactoryBot.create :productrate, product: product2, rate: 5 }
      let!(:product3_rate) { FactoryBot.create :productrate, product: product3, rate: 2 }

      specify do
        expect(product_provider1.sort('rate asc')).to eq([product3, product1, product2])
      end

      specify do
        expect(product_provider1.sort('rate desc')).to eq([product2, product1, product3])
      end
    end
  end
end
