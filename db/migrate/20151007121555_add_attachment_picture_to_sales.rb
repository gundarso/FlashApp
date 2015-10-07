class AddAttachmentPictureToSales < ActiveRecord::Migration
  def self.up
    change_table :sales do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :sales, :picture
  end
end
