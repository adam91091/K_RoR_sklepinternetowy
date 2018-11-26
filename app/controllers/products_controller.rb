# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = if params[:sort]
                  ProductProvider.new.sort(params[:sort])
                else
                  Product.all
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.productrates.create(rate: params[:product][:rate])
      redirect_to(@product)
    else
      render 'index'
    end
  end

  def add_to_cart
    product = Product.find(params[:id])
    outcome = AddToCart.run(guest: current_guest, product: product)

    flash[:notice] = if outcome.valid?
                       'Dodano do koszyka'
                     else
                       outcome.errors.full_messages
                     end

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:rate)
  end
end
