class PostOffice < ActiveRecord::Base
  has_many :operations

  def self.from_proxy(proxy)
    find_or_create_by(postal_code:  proxy.operation_address.index,
                      name:         proxy.operation_address.description,
                      country_code: proxy.country_oper.id.to_s)
  end

  def country
    Iso3166Ru.find_by(iso: country_code)
  end
end
