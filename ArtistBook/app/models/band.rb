class Band < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_attached_file :photo, styles:{ large: "600x600>", medium: "300x300>", thumbnail: "120x120#"}
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  #attribute validations
  validates :band_name, presence: true, length: {maximum: 70}
  validates :genre, length: {maximum: 50}
  validates :phone, format: /\d\d\d-\d\d\d-\d\d\d\d/

  #Associations
  has_many :responds
  has_many :posts, through: :responds
  has_many :business_requests

  # Business requests associations
  has_many :business_requests
  has_many :businesses, through: :business_requests

end
