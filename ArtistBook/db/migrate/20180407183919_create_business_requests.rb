class CreateBusinessRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :business_requests do |t|
      t.boolean :band_decision
      t.string :location
      t.float :pay

      t.timestamps
    end
  end
end
