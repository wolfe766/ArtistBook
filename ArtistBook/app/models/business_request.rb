=begin
  CREATED: Brandon Brown 04/07/2018
    - Model for business requests
=end
class BusinessRequest < ApplicationRecord

  # Table Associations
  belongs_to :band

  # Attribute Validation
  validates :location, presence: true, length: {maximum: 250 }
  validates :pay, presence: true, format: /(\d+)(\.|,)?\d{0,2}?\z/
  validates :band_decision, default: false

end
