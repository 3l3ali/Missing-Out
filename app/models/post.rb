class Post < ApplicationRecord
  has_attachments :photos, maximum: 2

  belongs_to :user
  belongs_to :location
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true

end
