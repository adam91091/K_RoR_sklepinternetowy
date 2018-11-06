# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# Clothing categories hierarchy
women = Category.create(name: 'Women', parent: nil)
men = Category.create(name: 'Men', parent: nil)

blouses_and_shirts = Category.create(name: 'Blouses & Shirts', parent: women.id)
coats_and_jackets = Category.create(name: 'Coats & Jackets', parent: women.id)
dresses = Category.create(name: 'Dresses', parent: women.id)
jeans = Category.create(name: 'Jeans', parent: women.id)
jumpers = Category.create(name: 'Jumpers', parent: women.id)
skirts = Category.create(name: 'Skirts', parent: women.id)
t_shirts = Category.create(name: 'T-shirts', parent: women.id)
trousers = Category.create(name: 'Trousers', parent: women.id)

shirts = Category.create(name: 'Shirts', parent: men.id)
coats_and_jackets = Category.create(name: 'Coats & Jackets', parent: men.id)
jeans = Category.create(name: 'Jeans', parent: men.id)
jumpers = Category.create(name: 'Jumpers', parent: men.id)
t_shirts = Category.create(name: 'T-shirts', parent: men.id)
trousers = Category.create(name: 'Trousers', parent: men.id)
# Example product
product = Product.create(name: 'Example product', price: 99, category_id: jeans.id)
Comment.create(content: 'ok.', product_id: product.id) 
