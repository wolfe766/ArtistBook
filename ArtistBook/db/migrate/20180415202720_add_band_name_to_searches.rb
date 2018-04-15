class AddBandNameToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :band_name, :string
  end
end
