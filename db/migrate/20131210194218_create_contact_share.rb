class CreateContactShare < ActiveRecord::Migration
  def change
    create_table :contact_share do |t|
      t.integer :user_id, :null => false
      t.integer :contact_id, :null => false

      t.timestamps
    end
    add_index :contact_share, :user_id
  end
end
