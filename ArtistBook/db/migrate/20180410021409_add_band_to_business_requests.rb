class AddBandToBusinessRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :business_requests, :band, foreign_key: true
  end
end
