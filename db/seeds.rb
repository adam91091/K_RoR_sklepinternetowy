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
women = Category.create(name: 'Women', parent: nil, main_women_category: true)
men = Category.create(name: 'Men', parent: nil, main_men_category: true)

Category.create(name: 'Blouses & Shirts', parent: women.id)
Category.create(name: 'Coats & Jackets', parent: women.id)
Category.create(name: 'Dresses', parent: women.id)
Category.create(name: 'Jeans', parent: women.id)
Category.create(name: 'Jumpers', parent: women.id)
Category.create(name: 'Skirts', parent: women.id)
Category.create(name: 'T-shirts', parent: women.id)
Category.create(name: 'Trousers', parent: women.id)
Category.create(name: 'Shirts', parent: men.id)
Category.create(name: 'Coats & Jackets', parent: men.id)
Category.create(name: 'Jeans', parent: men.id)
Category.create(name: 'Jumpers', parent: men.id)
Category.create(name: 'T-shirts', parent: men.id)
Category.create(name: 'Trousers', parent: men.id)
# # Example product
# product = Product.create(name: 'Example product', category_id: 2)
# Comment.create(content: 'ok.', product_id: product.id)
# Product 1
long_skirt = Product.create(name: 'Long skirt', category_id: 8)
# concrete products for Long skirt
ConcreteProduct.create(product: long_skirt, price: 10.00, size: 'M', color: '#000000', amount: 1)
ConcreteProduct.create(product: long_skirt, price: 10.00, size: 'L', color: '#000000', amount: 1)
ConcreteProduct.create(product: long_skirt, price: 10.00, size: 'S', color: '#000000', amount: 1)
# Product 2
long_dress = Product.create(name: 'Long dress', category_id: 8)
# concrete products for Long skirt
ConcreteProduct.create(product: long_dress, price: 10.00, size: 'M', color: '#000000', amount: 1)
ConcreteProduct.create(product: long_dress, price: 10.00, size: 'L', color: '#000000', amount: 1)
ConcreteProduct.create(product: long_dress, price: 10.00, size: 'S', color: '#000000', amount: 1)
# Product 2
short_dress = Product.create(name: 'Short dress', category_id: 8)
# concrete products for Long skirt
ConcreteProduct.create(product: short_dress, price: 10.00, size: 'M', color: '#000000', amount: 1)
ConcreteProduct.create(product: short_dress, price: 10.00, size: 'L', color: '#000000', amount: 1)
ConcreteProduct.create(product: short_dress, price: 10.00, size: 'S', color: '#000000', amount: 1)
# Product 2
other_dress = Product.create(name: 'Other dress', category_id: 8)
# concrete products for Long skirt
ConcreteProduct.create(product: other_dress, price: 10.00, size: 'M', color: '#000000', amount: 1)
ConcreteProduct.create(product: other_dress, price: 10.00, size: 'L', color: '#000000', amount: 1)
