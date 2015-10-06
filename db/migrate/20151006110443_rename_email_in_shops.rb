class RenameEmailInShops < ActiveRecord::Migration
  def change
    rename_column :shops, :email, :contact_email
  end
end
