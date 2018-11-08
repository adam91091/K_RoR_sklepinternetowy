# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @view_model = HomeView.new
    
    men_cat_id = Category.find_by(name: 'Men')
    women_cat_id = Category.find_by(name: 'Women')

    @men = url_for(action: 'show', controller: 'categories', id: men_cat_id)
    @women = url_for(action: 'show', controller: 'categories', id: women_cat_id)

  end
end
