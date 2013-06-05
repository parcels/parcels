class CreatePostOffices < ActiveRecord::Migration
  def change
    create_table :post_offices do |t|
      t.string :postal_code, null: false
      t.string :name
      t.string :country_code

      t.timestamps

      t.index :postal_code
      t.index :country_code
    end
  end
end
