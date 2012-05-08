class CreateDinners < ActiveRecord::Migration
  def change
    create_table :dinners do |t|
      t.string :name, :null => false
      t.references :event

      t.timestamps
    end
    add_index :dinners, :event_id
  end
end
