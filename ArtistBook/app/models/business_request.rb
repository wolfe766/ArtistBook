=begin
   CREATED: Brandon Brown 04/07/2018
   Model for business requests
=end
class BusinessRequest < ApplicationRecord
  belongs_to :business
  belongs_to :band

  # Attribute Validation
  validates :location, presence: true, length: {maximum: 250 }
  validates :pay, presence: true
  validates :band_decision, default: false
end
