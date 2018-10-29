# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = if params[:sort]
                  Product.all.order(params[:sort])
                elsif params[:reverse_sort]
                  Product.all.order(params[:reverse_sort]).reverse
                else
                  Product.all
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
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
