# frozen_string_literal: true

class CategoriesController < ApplicationController
	def show
		@category = Product.find(params[:id])
	end
end
  