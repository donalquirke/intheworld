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

ActiveRecord::Schema.define(:version => 20130620022346) do

  create_table "intentions", :force => true do |t|
    t.text     "details"
    t.text     "the_why"
    t.text     "note1"
    t.text     "note2"
    t.text     "note3"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "private"
    t.string   "header"
    t.integer  "user_id"
  end

  create_table "registerations", :force => true do |t|
    t.string   "email"
    t.boolean  "setup"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "password_digest"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "email"
    t.boolean  "receive_intentions"
  end

end
