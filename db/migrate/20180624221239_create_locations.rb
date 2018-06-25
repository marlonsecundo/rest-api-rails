class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.float :x
      t.float :y
      t.belongs_to :survivor, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
