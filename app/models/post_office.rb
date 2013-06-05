class PostOffice < ActiveRecord::Base
  has_many :operations
end
