class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :water
      t.integer :food
      t.integer :medication
      t.integer :ammunition
      t.belongs_to :survivor, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
