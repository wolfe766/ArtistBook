# CREATED: Alec Maier 4/7/2018
# Description: Model for a business in the database

class Business < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable #lockable added

  has_attached_file :photo, styles:{ large: "600x600>", medium: "300x300>", thumbnail: "120x120#"}
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # Business attribute validations
  validates :business_name, presence: true, length: {maximum: 50}
  validates :address, presence: true, length: {maximum: 100}
  validates :phone, format: /\d\d\d-\d\d\d-\d\d\d\d/
  validates :photo, presence: true
  # Business associations
  has_many :business_requests
  has_many :bands, through: :business_requests

  has_many :posts
  has_many :searches
end
