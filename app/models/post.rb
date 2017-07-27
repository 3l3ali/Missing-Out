class Post < ApplicationRecord
  has_attachments :photos, maximum: 5

  belongs_to :user
  belongs_to :location, dependent: :destroy
  has_many :reviews, dependent: :destroy


  validates :photos, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 100}
  validates :category, presence: true

  enum category: {
    activities: 0,
    foods: 1,
    entertainment: 2
  }

  def self.search(search)
    if search
      joins(:location).where("locations.address LIKE ?", "%#{search}%")
    else
      all
    end
  end

  def self.categories_for_select
    {
      "all": "all",
      "activities": "activities",
      "foods": "foods",
      "entertainment": "entertainment"
    }
  end
end
