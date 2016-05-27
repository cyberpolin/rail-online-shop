class Product < ActiveRecord::Base

  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, :description, :price, presence: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: true
  #validates :qty_in_stock, presence: true

end
