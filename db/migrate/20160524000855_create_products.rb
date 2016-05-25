class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :sku
      t.decimal :price
      t.string :color
      t.string :size

      t.timestamps null: false
    end
  end
end
