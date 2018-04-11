=begin
  CREATED: Brandon Brown 04/07/2018
    - Model for business requests
=end
class BusinessRequest < ApplicationRecord

  # Table Associations
  belongs_to :band

  # Attribute Validation
  validates :location, presence: true, length: {maximum: 250 }
  validates :date, presence: true, format: /[0-9][0-9][0-9][0-9]-((0[1-9])|([1][0-2]))-((0[1-9])|(([1-2][0-9])|([3][0-1])))/
  validates :time, presence: true
  validates :pay, presence: true, length: {maximum: 20}
  validates :band_decision, default: false

end
