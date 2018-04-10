class CreateBusinessRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :business_requests do |t|
      t.references :business, foreign_key: true
      t.references :band, foreign_key: true
      t.decimal :pay
      t.boolean :band_decision
      t.string :message

      t.timestamps
    end
  end
end
