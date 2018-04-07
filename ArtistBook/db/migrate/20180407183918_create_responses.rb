class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :band, foreign_key: true
      t.references :post, foreign_key: true
      t.string :bus_decision

      t.timestamps
    end
  end
end
