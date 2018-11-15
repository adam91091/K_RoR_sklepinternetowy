# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @view_model = HomeView.new

    if men_category = Category.find_by(main_men_category: true)
      @men = url_for(action: 'show', controller: 'categories', id: men_category)
    end
    if women_category = Category.find_by(main_women_category: true)
      @women = url_for(action: 'show', controller: 'categories', id: women_category)
    end
  end
end
