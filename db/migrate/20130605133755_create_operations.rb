class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.integer :mass
      
      t.references :parcel, index: true
      t.references :operation_type, index: true
      t.references :post_office, index: true

      t.timestamps
    end
  end
end
