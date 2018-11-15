class AddMainCategoryToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :main_men_category, :bool
    add_column :categories, :main_women_category, :bool
  end
end
