class User < ApplicationRecord
  has_attachment :photo

  validates :first_name, presence: :true
  validates :last_name, presence: :true

  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :user_followers, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :user_followers, source: :follower

  has_many :user_followings, class_name: "Follow", foreign_key: "follower_id"
  has_many :followings, through: :user_followings, source: :followed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
