class Order < ActiveRecord::Base
	has_many :orders_products
	has_many :products, through: :orders_products

	belongs_to :user
end
