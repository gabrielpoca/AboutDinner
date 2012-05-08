class CreateDinnerLikes < ActiveRecord::Migration
  def change
    create_table :dinner_likes do |t|
      t.references :dinner
      t.references :user

      t.timestamps
    end
    add_index :dinner_likes, :dinner_id
    add_index :dinner_likes, :user_id
  end
end
