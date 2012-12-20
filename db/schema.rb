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

ActiveRecord::Schema.define(:version => 20121219132304) do

  create_table "auditoria", :force => true do |t|
    t.string   "name"
    t.integer  "theatre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "auditoria", ["theatre_id"], :name => "index_auditoria_on_theatre_id"

  create_table "bookings", :force => true do |t|
    t.integer  "show_id"
    t.integer  "seat_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bookings", ["show_id", "seat_id", "user_id"], :name => "index_bookings_on_show_id_and_seat_id_and_user_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "movies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seats", :force => true do |t|
    t.integer  "seat_no"
    t.string   "category"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "auditorium_id"
  end

  add_index "seats", ["auditorium_id"], :name => "index_seats_on_auditorium_id"

  create_table "shows", :force => true do |t|
    t.date     "on_date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "silver",        :default => 120
    t.integer  "gold",          :default => 150
    t.integer  "platinum",      :default => 200
    t.integer  "auditorium_id"
    t.integer  "movie_id"
  end

  add_index "shows", ["auditorium_id"], :name => "index_shows_on_auditorium_id"
  add_index "shows", ["movie_id"], :name => "index_shows_on_movie_id"

  create_table "theatres", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "theatres", ["city_id"], :name => "index_theatres_on_city_id"

  create_table "transactions", :force => true do |t|
    t.integer  "debited_from"
    t.integer  "credited_to"
    t.decimal  "amount"
    t.text     "purpose"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email_id"
    t.string   "password_digest"
    t.decimal  "account_balance", :default => 1000.0
    t.boolean  "is_admin",        :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
