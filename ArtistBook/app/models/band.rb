class Band < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessible :band_name, :genre, :phone, :address, :photo_name

  #attribute validations
  validates :band_name, presence: true, length: {maximum: 250}
  validates :genre, length: {maximum: 100}
  validates :phone, format: /\d\d\d-\d\d\d-\d\d\d\d/

  #Associations
  has_many :posts, through :responds
  has_many :business_requests

end
