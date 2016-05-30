class AddOrdersProductsUnitPriceQty < ActiveRecord::Migration
  def change
  	add_column :orders_products, :unit_price, :decimal
  	add_column :orders_products, :qty, :integer
  end
end
