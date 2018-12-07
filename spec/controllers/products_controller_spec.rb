require 'rails_helper'

RSpec.describe ProductsController do
  let(:category) { FactoryBot.create :category }
  let(:product) { FactoryBot.create :product, name: 'product', category: category }

  describe 'GET #show' do
    subject { get :show, params: { id: product.id } }

    it do
      expect(subject.status).to eq(200)
    end
  end

  describe 'GET #update' do
    subject { get :update, params: { id: product.id, product: { rate: '1' } } }

    it do
      subject.should redirect_to(assigns(:product))
    end
  end
end
