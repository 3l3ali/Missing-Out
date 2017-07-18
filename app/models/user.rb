class User < ApplicationRecord

  validates :first_name, presence: :true
  validates :first_name, presence: :true

  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
