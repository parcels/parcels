class OperationType < ActiveRecord::Base
  has_many :operations

  scope :delivery, -> { where(russianpost_attr: "Вручение адресату").first }

  def self.from_proxy(proxy)
    find_or_create_by(russianpost_type: proxy.oper_type.name,
                      russianpost_attr: proxy.oper_attr.name)
  end

  def to_s
    description || russianpost_attr || russianpost_type
  end
end
