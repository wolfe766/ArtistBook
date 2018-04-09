json.extract! post, :id, :message, :date, :business_id, :pay, :location, :created_at, :updated_at
json.url post_url(post, format: :json)
