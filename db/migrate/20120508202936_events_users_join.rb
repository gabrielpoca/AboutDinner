class EventsUsersJoin < ActiveRecord::Migration
  def up
    create_table :events_users, :id => false do |t|
      t.integer :event_id
      t.integer :user_id
    end
  end

  def down
  end
end
