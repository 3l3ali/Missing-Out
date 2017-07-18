class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  belongs_to :location
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true

end
