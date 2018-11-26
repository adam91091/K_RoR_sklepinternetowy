require 'rails_helper'

RSpec.describe ConcreteProduct, type: :model do
	let!(:product1) { FactoryBot.create :product, name: 'Product1'}
	
	context 'complete product' do
		let!(:concrete) { FactoryBot.create :concrete_product, product: product1, 
				price: 100.00, size: "M", color: "black", amount: 5 }
	
		it { should belong_to(:product) }

		context 'validations' do
			it { should validate_presence_of(:product) }
			it { should validate_presence_of(:price) }
			it { should validate_presence_of(:size) }
			it { should validate_presence_of(:color) }
			it { should validate_presence_of(:amount) }
		end
	end

end