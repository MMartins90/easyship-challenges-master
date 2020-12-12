require "rails_helper"

RSpec.describe Shipment, type: :model do
  # write your tests here
  let(:shipment) {
      Shipment.new(
        company: Company.new(name: "New Co"),
        destination_country: "US",
        origin_country: "UK",
        tracking_number: "EA 999 999 999 US",
        slug: "slug",
        shipment_items: [
          ShipmentItem.new(description: "iPad", weight: 3),
          ShipmentItem.new(description: "iPad", weight: 3),
          ShipmentItem.new(description: "iPad", weight: 3),
          ShipmentItem.new(description: "iPhone", weight: 2),
          ShipmentItem.new(description: "iPhone", weight: 2),
          ShipmentItem.new(description: "Apple Watch", weight: 1)
        ]
      )
    }

  it 'should return grouped shipment items in order of count' do
    expect(shipment.group_items).to eq [
      {description: "iPad", count: 3},
      {description: "iPhone", count: 2},
      {description: "Apple Watch", count: 1}
  ]
  end
end
