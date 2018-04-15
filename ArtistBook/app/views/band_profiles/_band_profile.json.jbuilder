json.extract! band_profile, :id, :bio, :photo_path, :spotify_link, :created_at, :updated_at
json.url band_profile_url(band_profile, format: :json)
