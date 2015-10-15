class RenameAgeInCustomers < ActiveRecord::Migration
  def change
    rename_column :customers, :age, :birth_year
  end
end
