require 'rails_helper'

RSpec.describe ConcreteProduct, type: :model do
  let!(:category1) { FactoryBot.create :category, name: 'Categoy1' }
  let!(:product1) do
    FactoryBot.create :product, name: 'Product1',
                                category: category1
	end
	let!(:concrete) do
		FactoryBot.create :concrete_product, product: product1,
																					price: 100.00, size: 'M', color: 'black', amount: 5
	end

	context 'associations' do
		it { should belong_to(:product) }
	end

	context 'validations' do
		it { should validate_presence_of(:product) }
		it { should validate_presence_of(:price) }
		it { should validate_presence_of(:size) }
		it { should validate_presence_of(:color) }
		it { should validate_presence_of(:amount) }
	end
end
