class User < ApplicationRecord
  belongs_to :profile
  has_many :phones 
  has_many :adresses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :address, presence :true
end
