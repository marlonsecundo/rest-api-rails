class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.integer :flags

      t.timestamps
    end

    change_column :survivors, :name, :type, :default => nil
    change_column :survivors, :age, :type, :default => nil
    change_column :survivors, :gender, :type, :default => nil
    change_column :survivors, :flags, :type, :default => nil

  end
end
