class BusinessProfile < ApplicationRecord

  # Table Associations
  belongs_to :business

  # Attribute validations
  validates :bio, length: {maximum: 1000}
  validates :photo_path, length: {maximum: 100}

end
