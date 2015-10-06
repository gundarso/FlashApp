class AddNamesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :name_fr, :string
    add_column :categories, :name_nl, :string
    add_column :categories, :name_de, :string
  end
end
