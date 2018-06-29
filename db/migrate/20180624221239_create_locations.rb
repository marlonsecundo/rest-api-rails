class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.float :x
      t.float :y
      t.belongs_to :survivor, index: { unique: true }, foreign_key: true

      t.timestamps
    end

    change_column :location, :y, :type, :default => nil
    change_column :location, :x, :type, :default => nil
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
