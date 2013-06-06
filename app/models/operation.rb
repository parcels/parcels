class Operation < ActiveRecord::Base
  belongs_to :parcel
  belongs_to :operation_type
  belongs_to :post_office

  default_scope -> { order 'happened_at DESC' }

  def self.from_proxy(proxy, parcel)
    operation = find_or_create_by(
      parcel: parcel,
      happened_at: proxy.oper_date)
    
    operation.operation_type = OperationType.from_proxy(proxy)
    operation.post_office = PostOffice.from_proxy(proxy)
    operation.mass = proxy.mass
    
    operation.save
  end
end
