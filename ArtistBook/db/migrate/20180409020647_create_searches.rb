class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :genre
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
