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

ActiveRecord::Schema.define(:version => 20120922080617) do

  create_table "deploys", :force => true do |t|
    t.string   "branch"
    t.string   "environment"
    t.string   "sha"
    t.string   "commit_message"
    t.integer  "feature_team_id"
    t.integer  "member_id"
    t.integer  "repository_id"
    t.integer  "server_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "deploys", ["feature_team_id"], :name => "index_deploys_on_feature_team_id"
  add_index "deploys", ["member_id"], :name => "index_deploys_on_member_id"
  add_index "deploys", ["repository_id"], :name => "index_deploys_on_repository_id"
  add_index "deploys", ["server_id"], :name => "index_deploys_on_server_id"

  create_table "feature_teams", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "branch"
    t.integer  "quarterback_id"
    t.integer  "server_id"
    t.integer  "room_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "feature_teams", ["room_id"], :name => "index_feature_teams_on_room_id"

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "hipchat_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "feature_team_id"
    t.integer  "member_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "memberships", ["feature_team_id"], :name => "index_memberships_on_feature_team_id"
  add_index "memberships", ["member_id"], :name => "index_memberships_on_member_id"

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "room_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rooms", ["room_id"], :name => "index_rooms_on_room_id"

  create_table "servers", :force => true do |t|
    t.string   "subdomain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
