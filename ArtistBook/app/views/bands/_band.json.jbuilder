json.extract! band, :id, :band_name, :genre, :phone, :address, :email, :bio, :spotify_link, :created_at, :updated_at
json.url band_url(band, format: :json)
