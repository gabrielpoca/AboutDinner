class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name, :null => false
      t.datetime :time, :null => false
      t.references :event

      t.timestamps
    end
    add_index :places, :event_id
  end
end
