require 'dotenv/load'
require 'aftership'
require 'json'

class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def show
    @company = Company.find(params[:company_id])
    @shipment = @company.shipments.find(params[:id])

    AfterShip.api_key = ENV['AFTERSHIP_KEY']
    @tracker = AfterShip::V4::Tracking.get(@shipment.slug, @shipment.tracking_number)
  end
end
