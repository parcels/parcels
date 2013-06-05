class Operation < ActiveRecord::Base
  belongs_to :parcel
  belongs_to :operation_type
  belongs_to :post_office
end
