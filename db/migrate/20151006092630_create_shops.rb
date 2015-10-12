class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.datetime :opening
      t.datetime :closing
      t.string :phone
      t.string :email
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
