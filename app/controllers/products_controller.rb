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

  private

  def product_params
    params.require(:product).permit(:rate)
  end
end
