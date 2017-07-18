class Location < ApplicationRecord
  has_one :post

  validates :name, presence: :true
  validates :address, presence: :true
end
