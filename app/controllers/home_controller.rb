# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @view_model = HomeView.new
    @men = url_for(action: 'show', controller: 'categories', id: Category.find_by(main_men_category: true)) if Category.find_by(main_men_category: true)
    @women = url_for(action: 'show', controller: 'categories', id: Category.find_by(main_women_category: true)) if Category.find_by(main_women_category: true)
  end
end
