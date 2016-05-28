class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|

    	t.references :order
    	t.references :product

    	t.timestamps null: false
    end
  end
end
