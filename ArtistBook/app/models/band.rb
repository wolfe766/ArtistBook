class Band < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  #attribute validations
  validates :band_name, presence: true, length: {maximum: 70}
  validates :genre, length: {maximum: 50}
  validates :phone, format: /\d\d\d-\d\d\d-\d\d\d\d/

  #Associations
  has_many :responds
  has_many :posts, through: :responds
  has_many :business_requests

end
