class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
    	t.references :orders
    	t.references :products

    	t.timestamps null: false
    end
  end
end
