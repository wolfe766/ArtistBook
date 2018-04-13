# Created By: Alec Maier & Brandon Brown 4/14/2018
# Description: Model for business profile

class BusinessProfile < ApplicationRecord

  # Table Associations
  belongs_to :business

  # Attribute Validations
  validates :bio, length: {maximum: 1000}
  validates :photo_path, length: {maximum: 100}

end
