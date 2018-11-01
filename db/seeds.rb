# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# Clothing categories hierarchy
women = Category.create(name: 'Women', parent: nil) if Rails.env.development?
men = Category.create(name: 'Men', parent: nil) if Rails.env.development?

blouses_and_shirts = Category.create(name: 'Blouses & Shirts', parent: women.id) if Rails.env.development?
coats_and_jackets = Category.create(name: 'Coats & Jackets', parent: women.id) if Rails.env.development?
dresses = Category.create(name: 'Dresses', parent: women.id) if Rails.env.development?
jeans = Category.create(name: 'Jeans', parent: women.id) if Rails.env.development?
jumpers = Category.create(name: 'Jumpers', parent: women.id) if Rails.env.development?
skirts = Category.create(name: 'Skirts', parent: women.id) if Rails.env.development?
t_shirts = Category.create(name: 'T-shirts', parent: women.id) if Rails.env.development?
trousers = Category.create(name: 'Trousers', parent: women.id) if Rails.env.development?

shirts = Category.create(name: 'Shirts', parent: men.id) if Rails.env.development?
coats_and_jackets = Category.create(name: 'Coats & Jackets', parent: men.id) if Rails.env.development?
jeans = Category.create(name: 'Jeans', parent: men.id) if Rails.env.development?
jumpers = Category.create(name: 'Jumpers', parent: men.id) if Rails.env.development?
t_shirts = Category.create(name: 'T-shirts', parent: men.id) if Rails.env.development?
trousers = Category.create(name: 'Trousers', parent: men.id) if Rails.env.development?
# Example product
product = Product.create(name: 'Example product', price: 99, category_id: jeans.id) if Rails.env.development?
Comment.create(content: 'ok.', product_id: product.id) if Rails.env.development?
