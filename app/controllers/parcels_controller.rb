class ParcelsController < ApplicationController
  decorates_assigned :parcel

  def index
    @new_parcel = Parcel.new
  end

  def show
    @parcel = Parcel.find_or_initialize_by(barcode: params[:id].upcase)
    @parcel.autosync if @parcel.valid?
  end

  def create
    redirect_to parcel_path(id: params[:parcel][:barcode].upcase)
  end
end
