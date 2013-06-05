class AddHappenedAtToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :happened_at, :datetime
    add_index :operations, :happened_at
  end
end
