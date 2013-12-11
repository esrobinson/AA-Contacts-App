class CreateGroupsTable < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id, :null => :false
      t.string :name, :null => :false

      t.timestamps
    end

    create_table :group_members do |t|
      t.integer :contact_id, :null => :false
      t.integer :group_id, :null => :false

      t.timestamps
    end

    add_index :group_members, :group_id
    add_index :groups, :user_id
  end
end
