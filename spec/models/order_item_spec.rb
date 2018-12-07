require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let!(:category1) { FactoryBot.create :category, name: 'Category1' }
  let!(:product1) do
    FactoryBot.create :product, name: 'Product1',
                                category: category1
  end
  let!(:concrete) do
    FactoryBot.create :concrete_product, product: product1,
                                         price: 100.00, size: 'M', color: 'black', amount: 5
  end
  let!(:order_item) { FactoryBot.create :order_item, concrete_product: concrete }

  context 'associations' do
    it { should belong_to(:concrete_product) }
  end
end
