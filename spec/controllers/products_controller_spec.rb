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

  describe 'POST #add_to_cart' do
    subject { post :add_to_cart, params: { id: product.id } }

    before do
      allow(AddToCart).to receive(:run).and_return(outcome)
    end

    context 'guest can add item to cart' do
      let(:outcome) { instance_double(AddToCart, valid?: true) }
      it do
        subject
        expect(controller.flash[:notice]).to eq('Dodano do koszyka')
      end
      it do
        expect(subject).to redirect_to(products_path)
      end
    end

    context 'guest can not add item to cart' do
      let(:outcome) { instance_double(AddToCart, valid?: false, errors: errors) }
      let(:errors) { Struct.new(:full_messages).new('Item is not available') }
      it do
        subject
        expect(controller.flash[:notice]).to eq('Item is not available')
      end
      it do
        expect(subject).to redirect_to(products_path)
      end
    end
  end

  describe 'GET #update' do
    subject { get :update, params: { id: product.id, product: { rate: '1' } } }

    it do
      subject.should redirect_to(assigns(:product))
    end
  end
end
