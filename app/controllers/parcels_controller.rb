class ParcelsController < ApplicationController
  def index
    @parcel = Parcel.new
  end

  def show
    @parcel = Parcel.find_or_create_by(barcode: params[:id])
  end

  def create
    @parcel = Parcel.find_or_create_by(barcode: params[:parcel][:barcode])
    redirect_to @parcel
  end
end
