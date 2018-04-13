json.extract! business_profile, :id, :bio, :photo_path, :created_at, :updated_at
json.url business_profile_url(business_profile, format: :json)
