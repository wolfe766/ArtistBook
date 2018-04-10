class DropBusinessRequests < ActiveRecord::Migration[5.1]
  def change
  	drop_table :business_requests
  end
end
