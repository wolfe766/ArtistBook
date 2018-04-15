class BandProfile < ApplicationRecord

  # Table Associations
  belongs_to :band

  # Attribute validations
  validates :bio, length: {maximum: 1000}
  validates :photo_path, length: {maximum: 100}
  validates :spotify_link, length: {maximum: 100}

end
