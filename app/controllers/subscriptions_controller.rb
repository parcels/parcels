class SubscriptionsController < ApplicationController
  def create
    parcel = Parcel.find_by(barcode: params[:barcode])
    parcel.subscribe(params[:subscription][:user][:email])
    redirect_to parcel
  end

  def confirm
    subscription = Subscription.find_by(token: params[:token])
    subscription.confirm
    redirect_to subscription.parcel
  end

  def destroy
    subscription = Subscription.find_by(token: params[:token])
    parcel = subscription.parcel
    subscription.destroy
    redirect_to parcel
  end
end
