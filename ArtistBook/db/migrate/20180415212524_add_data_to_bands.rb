class AddDataToBands < ActiveRecord::Migration[5.1]
  def change
    add_column :bands, :bio, :string
    add_column :bands, :spotify_link, :string
  end
end
