class Post < ApplicationRecord
	belongs_to :business
	has_many :responses
	has_many :bands, through: :responses
end
