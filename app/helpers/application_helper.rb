# frozen_string_literal: true

module ApplicationHelper
  def women_categories
    women = Category.where(main_women_category: true)
    Category.where(parent: women)
  end

  def men_categories
    men = Category.where(main_men_category: true)
    Category.where(parent: men)
  end
end
