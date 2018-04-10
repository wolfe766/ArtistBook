class AddLocationToBusinessRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :business_requests, :location, :string
  end
end
