class ParcelsController < ApplicationController
  def index
    @new_parcel = Parcel.new
  end

  def show
    @parcel = Parcel.find_or_create_by(barcode: params[:id].upcase)
    @new_parcel = Parcel.new(barcode: @parcel.barcode)

    @parcel.autosync if @parcel.valid?
  end

  def create
    redirect_to parcel_path(id: params[:parcel][:barcode])
  end
end
