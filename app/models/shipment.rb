class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_items

  validates :destination_country, presence: true
  validates :origin_country, presence: true
  validates :tracking_number, presence: true, uniqueness: true
  validates :slug, presence: true
end
