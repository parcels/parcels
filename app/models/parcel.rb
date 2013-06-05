class Parcel < ActiveRecord::Base
  has_many :operations

  def sync
    proxy_ops = RussianPost::Parcel.new(self.barcode).operations

    transaction do

      proxy_ops.each do |po|
        operation = Operation.find_or_create_by(
          parcel: self,
          happened_at: po.oper_date)
        
        operation.operation_type = OperationType.find_or_create_by(
          russianpost_type: po.oper_type.name,
          russianpost_attr: po.oper_attr.name)

        operation.post_office = PostOffice.find_or_create_by(
          postal_code: po.operation_address.index,
          country_code: po.country_oper.id.to_s) { |office| office.name = po.operation_address.description }

        operation.mass = po.mass

        self.delivered = true if po.oper_attr.name == "Вручение адресату"

        operation.save
      end

      self.synced_at = DateTime.now
      save
    end
  end
end
