class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true       
  validates :name,  length: { minimum: 2 }
  validates :name, length: { maximum: 20 }
  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  
  has_one_attached :profile_image  
  has_many :books, dependent: :destroy
  
end
