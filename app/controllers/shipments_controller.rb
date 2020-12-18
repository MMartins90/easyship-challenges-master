class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def show
    @company = Company.find(params[:company_id])
    @shipment = @company.shipments.find(params[:id])
  end
end
