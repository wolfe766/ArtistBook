json.extract! business_request, :id, :band_decision, :location, :pay, :date, :time, :message, :created_at, :updated_at
json.url business_request_url(business_request, format: :json)
