class AddAttachmentPictureToShops < ActiveRecord::Migration
  def self.up
    change_table :shops do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :shops, :picture
  end
end
