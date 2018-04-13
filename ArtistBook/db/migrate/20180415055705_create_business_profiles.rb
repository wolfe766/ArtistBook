class CreateBusinessProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :business_profiles do |t|

      t.timestamps
    end
  end
end
