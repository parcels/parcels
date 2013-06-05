class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.references :parcel, index: true

      t.boolean :confirmed, default: false
      t.string :confirmation_token
      t.index :confirmation_token

      t.datetime :notified_at

      t.timestamps
    end
  end
end
