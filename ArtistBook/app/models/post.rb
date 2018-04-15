=begin
	MODIFIED: David Levine 4/14/2018
		-Added validations to the post attributes.


=end
class Post < ApplicationRecord

	#associations
	belongs_to :business
	has_many :responses
	has_many :bands, through: :responses

	#validations
	validates :date, presence: true, format: /\d\d\d\d-((0[1-9])|([1][0-2]))-((0[1-9])|(([1-2]\d)|([3][0-1])))/
	validates :message, presence: true, length: {maximum: 250}
	validates :pay, presence: true
end
