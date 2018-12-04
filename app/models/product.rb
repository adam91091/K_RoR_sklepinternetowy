# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :productrates
  has_many :comments
  has_many :concrete_products
  belongs_to :category
  validates_presence_of :category
  validates_presence_of :name

  def all_concrete_products
    concrete_products.uniq(&:color)
  end

  def rate
    productrates.sum(:rate) / productrates.count
  rescue StandardError
    0
  end
end
