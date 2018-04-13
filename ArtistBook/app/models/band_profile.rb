# Created By: Alec Maier & Brandon Brown 4/13/2018
# Description: Model for band profile

class BandProfile < ApplicationRecord

  # Table Associations
  belongs_to :band

  # Attribute Validations 
  validates :bio, length: {maximum: 1000}
  validates :photo_path, length: {maximum: 100}
  validates :spotify_link, length: {maximum: 100}

end
