class RenameEventUser < ActiveRecord::Migration
  def up
    rename_table :events_users, :event_users
  end

  def down
    rename_table :event_users, :events_users
  end
end
