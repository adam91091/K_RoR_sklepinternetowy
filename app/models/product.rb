# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :productrates
  has_many :comments
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :category_id
end
