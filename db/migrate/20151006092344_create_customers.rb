class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :family_name
      t.integer :age
      t.string :gender
      t.string :base_location
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
