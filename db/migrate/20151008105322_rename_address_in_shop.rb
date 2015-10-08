class RenameAddressInShop < ActiveRecord::Migration
  def change
    rename_column :shops, :address, :street_address
  end
end
