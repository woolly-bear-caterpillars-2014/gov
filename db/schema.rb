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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140906190236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_congress_people", force: true do |t|
    t.integer  "article_id"
    t.integer  "congress_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.text     "title"
    t.text     "first_paragraph"
    t.date     "publication_date"
    t.text     "url"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "congress_people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "title"
    t.string   "party"
    t.string   "phone_number"
    t.string   "twitter_id"
    t.string   "youtube_id"
    t.string   "district"
    t.string   "website_url"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gmaps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legislations", force: true do |t|
    t.text     "title"
    t.date     "proposal_date"
    t.text     "abstract"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
