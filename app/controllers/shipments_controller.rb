class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def show
    @shipment = Shipment.find(params[:id])
  end

  private

  def company_params
    @company = Company.find(params[:company_id])
  end

end
