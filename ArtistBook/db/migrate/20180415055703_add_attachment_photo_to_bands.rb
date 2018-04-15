class AddAttachmentPhotoToBands < ActiveRecord::Migration[5.1]
  def self.up
    change_table :bands do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :bands, :photo
  end
end
