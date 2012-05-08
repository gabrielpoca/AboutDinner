# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120508202936) do

  create_table "dinner_likes", :force => true do |t|
    t.integer  "dinner_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dinner_likes", ["dinner_id"], :name => "index_dinner_likes_on_dinner_id"
  add_index "dinner_likes", ["user_id"], :name => "index_dinner_likes_on_user_id"

  create_table "dinners", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dinners", ["event_id"], :name => "index_dinners_on_event_id"

  create_table "events", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "places", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "time",       :null => false
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "places", ["event_id"], :name => "index_places_on_event_id"

  create_table "users", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "password",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
