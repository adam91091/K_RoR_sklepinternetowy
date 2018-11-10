# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :productrates
  has_many :comments
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :category_id

  def rate
    productrates.sum(:rate) / productrates.count
  rescue StandardError
    0
  end
end
