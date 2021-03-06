class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, :null => :false
      t.integer :contact_id, :null => :false
      t.string :comment, :null => :false

      t.timestamps
    end

    add_index :comments, :user_id
  end

end

