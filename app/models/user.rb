class User < ApplicationRecord
  has_attachment :photo

  validates :first_name, presence: :true
  validates :last_name, presence: :true

  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
