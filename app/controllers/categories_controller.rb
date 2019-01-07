# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    # @query_params = request.query_parameters
    @child_categories = find_child_categories(params[:id])
    @category = Category.find(params[:id])
  end

  private

  def find_child_categories(cat_id)
    Category.where(parent: cat_id)
  end
end
