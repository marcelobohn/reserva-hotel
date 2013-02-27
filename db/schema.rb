# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130227185141) do

  create_table "bookings", :force => true do |t|
    t.integer  "room_id"
    t.datetime "entry"
    t.datetime "exit"
    t.string   "client"
    t.string   "phone"
    t.string   "obs"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.datetime "start_at"
    t.datetime "end_at"
    t.decimal  "value_entry", :precision => 8, :scale => 2
  end

  add_index "bookings", ["room_id"], :name => "index_bookings_on_room_id"

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "floors", :force => true do |t|
    t.string   "name"
    t.integer  "building_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "registries", :force => true do |t|
    t.integer  "room_id"
    t.integer  "booking_id"
    t.datetime "entry"
    t.datetime "exit"
    t.string   "client"
    t.string   "phone"
    t.string   "obs"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "registries", ["booking_id"], :name => "index_registries_on_booking_id"
  add_index "registries", ["room_id"], :name => "index_registries_on_room_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "floor_id"
    t.integer  "type_room_id"
    t.boolean  "air_conditioning"
    t.integer  "beds"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "rooms", ["floor_id"], :name => "index_rooms_on_floor_id"
  add_index "rooms", ["type_room_id"], :name => "index_rooms_on_type_room_id"

  create_table "type_rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
