class AddQtyInStockToProducts < ActiveRecord::Migration
  def change
    add_column :products, :qty_in_stock, :integer
  end
end
