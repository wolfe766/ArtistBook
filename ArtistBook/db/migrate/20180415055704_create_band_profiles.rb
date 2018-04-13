class CreateBandProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :band_profiles do |t|

      t.timestamps
    end
  end
end
