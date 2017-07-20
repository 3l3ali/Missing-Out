class Location < ApplicationRecord
  has_one :post

  validates :address, presence: :true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
