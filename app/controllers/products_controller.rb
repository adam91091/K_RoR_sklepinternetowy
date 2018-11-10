# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = if params[:sort]
                  Product.all.order(params[:sort])
                else
                  Product.all
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.productrates.create(rate: params[:product][:rate])
    productrate = @product.productrates.sum(:rate) / @product.productrates.count
    if @product.update_attribute(:rate, productrate)
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
