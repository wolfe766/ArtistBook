=begin
  CREATED: Brandon Brown 04/07/2018
    - Model for business requests
=end
class BusinessRequest < ApplicationRecord

  # Table Associations
  belongs_to :band
  belongs_to :business

  # Attribute Validation
  validates :location, presence: true, length: {maximum: 250 }
  validates :date, presence: true, format: /\d\d\d\d-((0[1-9])|([1][0-2]))-((0[1-9])|(([1-2]\d)|([3][0-1])))/
  validates :time, presence: true
  validates :pay, presence: true, length: {maximum: 20}
  validates :band_decision, default: false

end
