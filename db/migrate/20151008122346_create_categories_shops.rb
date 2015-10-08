class CreateCategoriesShops < ActiveRecord::Migration
  def change
    create_table :categories_shops do |t|
      t.references :category, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true
    end
  end
end
