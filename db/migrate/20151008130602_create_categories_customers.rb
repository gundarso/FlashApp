class CreateCategoriesCustomers < ActiveRecord::Migration
  def change
    create_table :categories_customers do |t|
      t.references :category, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
    end
  end
end
