class RenameLatituteInShops < ActiveRecord::Migration
  def change
    rename_column :shops, :latitute, :latitude
  end
end
