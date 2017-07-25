class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:facebook]
  has_attachment :photo

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  # validates :location, presence: :true, on: :update

  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :user_followers, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :user_followers, source: :follower

  has_many :user_followings, class_name: "Follow", foreign_key: "follower_id"
  has_many :followings, through: :user_followings, source: :followed

  has_many :favourites, class_name: "Favourite", foreign_key: "user_id"
  has_many :favourite_posts, through: :favourites, source: :post

  # has_and_belongs_to_many :languages
  has_many :languages, dependent: :destroy
  # accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :languages, allow_destroy: true, reject_if: :all_blank

   enum gender: {
    male: 0,
    female: 1,
    other: 2
    }


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def invalid_guide?
    self.age.blank? && self.gender.blank? && self.languages.blank? && self.location.blank? && self.contact.blank?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
