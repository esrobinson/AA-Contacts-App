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

ActiveRecord::Schema.define(:version => 20131211002835) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contact_shares", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "contact_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "favorite"
  end

  add_index "contact_shares", ["user_id"], :name => "index_contact_share_on_user_id"

  create_table "contacts", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "favorite"
  end

  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "group_members", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_members", ["group_id"], :name => "index_group_members_on_group_id"

  create_table "groups", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
