class AddConfirmableToShops < ActiveRecord::Migration
  def change
    add_column :shops, :confirmation_token, :string
    add_column :shops, :confirmed_at, :datetime
    add_column :shops, :confirmation_sent_at, :datetime
    add_column :shops, :unconfirmed_email, :string
  end
end
