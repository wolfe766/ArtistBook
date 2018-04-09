json.extract! business, :id, :business_name, :phone, :address, :email, :created_at, :updated_at
json.url business_url(business, format: :json)
