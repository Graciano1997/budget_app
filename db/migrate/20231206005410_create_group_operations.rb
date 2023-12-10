class CreateGroupOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_operations do |t|
      t.references :group, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
