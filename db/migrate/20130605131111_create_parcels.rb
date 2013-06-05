class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.string :barcode, null: false
      t.datetime :synced_at
      t.boolean :delivered, default: false

      t.timestamps
    end
  end
end
