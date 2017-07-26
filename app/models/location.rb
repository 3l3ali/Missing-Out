class Location < ApplicationRecord
  has_one :post

  validates :address, presence: :true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    if search
      where("address LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
