class CreateBusinessProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :business_profiles do |t|
      t.string :bio
      t.string :photo_path

      t.timestamps
    end
  end
end
