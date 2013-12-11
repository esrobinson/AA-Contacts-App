class ChangeContactShareName < ActiveRecord::Migration
  def up
    rename_table :contact_share, :contact_shares
  end

  def down
    rename_table :contact_shares, :contact_share
  end
end
