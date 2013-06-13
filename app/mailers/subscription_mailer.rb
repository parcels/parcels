class SubscriptionMailer < ActionMailer::Base
  default from: 'Parcels <parcels@parcels.io>'

  def confirmation(subscription_id)
    @subscription = Subscription.find(subscription_id)
    mail(to: @subscription.user.email,
         subject: 'Подтвердите подписку')
  end

  def notification(subscription_id)
    @subscription = Subscription.find(subscription_id)
    @parcel = @subscription.parcel
    mail(to: @subscription.user.email,
         subject: "Посылка #{@parcel.barcode}: новая информация")
  end
end
