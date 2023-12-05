class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.references :author, polymorphic: true, null: false
      t.string :name
      t.decimal :amout

      t.timestamps
    end
  end
end
