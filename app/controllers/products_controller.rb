# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = if params[:sort]
                  product_sort
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

  def product_sort
    if params[:sort] == 'rate asc'
      Product.all.sort_by(&:rate)
    elsif params[:sort] == 'rate desc'
      Product.all.sort_by(&:rate).reverse
    else
      Product.all.order(params[:sort])
    end
  end
end
