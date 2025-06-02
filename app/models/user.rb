class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :bids

  validates :password, length: { minimum: 10 }, format: { with: /(?=.*\d)(?=.*[\$|_\*\?\'#!]).+/ }
  validates :password_confirmation, length: { minimum: 10 },  format: { with: /(?=.*\d)(?=.*[\$|_\*\?\'#!]).+/ }
end
