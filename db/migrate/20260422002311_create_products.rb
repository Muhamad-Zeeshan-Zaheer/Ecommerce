class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock_quantity, default: 0
      t.string :sku

      t.timestamps
    end

    add_index :products, :sku, unique: true
  end
end
