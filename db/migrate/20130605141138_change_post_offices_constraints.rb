class ChangePostOfficesConstraints < ActiveRecord::Migration
  def up
    change_column :post_offices, :postal_code, :string, null: true
    add_index :post_offices, :name
  end

  def down
    change_column :post_offices, :postal_code, :string, null: false
    remove_index :post_offices, :name
  end
end
