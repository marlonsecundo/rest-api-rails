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

    change_column :inventories, :water, :type, :default => nil
    change_column :inventories, :food, :type, :default => nil
    change_column :inventories, :medication, :type, :default => nil
    change_column :inventories, :ammunition :type, :default => nil

    #Ex:- :default =>''
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
