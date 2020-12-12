class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_items

  validates :destination_country, presence: true
  validates :origin_country, presence: true
  validates :tracking_number, presence: true, uniqueness: true
  validates :slug, presence: true

  def group_items(count_list=Hash.new(0))
    shipment_items.each { |item| count_list[item.description] +=1 }
    count_list.map { |item,count| {description: item,count: count} }.sort_by { |item| -item[:count] }
  end
end
