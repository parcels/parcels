class CreateOperationTypes < ActiveRecord::Migration
  def change
    create_table :operation_types do |t|
      t.string :russianpost_type
      t.string :russianpost_attr

      t.string :description

      t.index :russianpost_type
      t.index :russianpost_attr

      t.timestamps
    end
  end
end
