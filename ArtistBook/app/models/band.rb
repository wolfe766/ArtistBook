class Band < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_attached_file :photo, styles:{ large: "600x600>", medium: "375x375#", profile: "300x300#", thumbnail: "120x120#"}, default_url: "/photos/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  #attribute validations
  validates :band_name, presence: true, length: {maximum: 70}
  validates :genre, length: {maximum: 50}
  validates :phone, format: /\d\d\d-\d\d\d-\d\d\d\d/
  validates :bio, length: {maximum: 2500}

  #Associations
  has_many :responds
  has_many :posts, through: :responds
  has_many :business_requests

  # Business requests associations
  has_many :business_requests
  has_many :businesses, through: :business_requests

end
