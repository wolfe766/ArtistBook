class AddAttachmentPhotoToBusinesses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :businesses do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :businesses, :photo
  end
end
