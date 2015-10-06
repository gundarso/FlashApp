class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :product_name
      t.string :product_description
      t.string :product_quantity
      t.string :price
      t.string :terms
      t.datetime :starting
      t.datetime :ending
      t.references :category, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
