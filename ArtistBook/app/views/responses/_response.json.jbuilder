json.extract! response, :id, :band_id, :post_id, :bus_decision, :created_at, :updated_at
json.url response_url(response, format: :json)
