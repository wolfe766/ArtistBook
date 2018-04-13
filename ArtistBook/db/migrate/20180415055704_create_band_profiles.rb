class CreateBandProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :band_profiles do |t|
      t.string :bio
      t.string :photo_path
      t.string :spotify_link

      t.timestamps
    end
  end
end
