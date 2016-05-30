class ChangeProductsQtyInStockDefault < ActiveRecord::Migration
  def change
    change_column :products, :qty_in_stock, :integer, default: 0
  end
end
