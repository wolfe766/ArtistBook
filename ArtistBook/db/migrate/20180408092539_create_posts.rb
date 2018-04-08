class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.datetime :date
      t.integer :business_id
      t.float :pay
      t.string :location

      t.timestamps
    end
  end
end
