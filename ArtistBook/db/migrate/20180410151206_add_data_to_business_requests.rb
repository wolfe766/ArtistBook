class AddDataToBusinessRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :business_requests, :date, :string
    add_column :business_requests, :time, :string
    add_column :business_requests, :message, :string
  end
end
