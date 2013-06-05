class ParcelsController < ApplicationController
  def index
    @parcel = Parcel.new
  end

  def show
    @parcel = Parcel.find_or_create_by(barcode: params[:id])
  end

  def create
    redirect_to parcel_path(id: params[:parcel][:barcode])
  end
end
