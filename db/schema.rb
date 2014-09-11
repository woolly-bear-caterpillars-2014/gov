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

ActiveRecord::Schema.define(version: 20140910193912) do

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
    t.text     "bioguide_id"
    t.text     "oc_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "party"
    t.string   "phone_number"
    t.string   "twitter_account"
    t.string   "facebook_account"
    t.string   "votes_with_party_pct"
    t.string   "website_url"
    t.string   "missed_votes_pct"
    t.string   "youtube_id"
    t.string   "seniority"
    t.string   "district"
    t.string   "next_election"
    t.string   "office_adress"
    t.string   "contact_form"
    t.date     "term_start"
    t.date     "term_end"
    t.date     "birthday"
    t.integer  "state_id"
    t.string   "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gmaps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legislation_congress_people", force: true do |t|
    t.integer  "legislation_id"
    t.integer  "congress_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "legislation_congress_people", ["congress_person_id"], name: "index_legislation_congress_people_on_congress_person_id", using: :btree
  add_index "legislation_congress_people", ["legislation_id"], name: "index_legislation_congress_people_on_legislation_id", using: :btree

  create_table "legislations", force: true do |t|
    t.integer  "number"
    t.string   "bill_id"
    t.string   "pdf_url"
    t.date     "introduced_on"
    t.date     "last_version_on"
    t.text     "official_title"
    t.text     "short_title"
    t.integer  "congress_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "legislations", ["congress_person_id"], name: "index_legislations_on_congress_person_id", using: :btree

  create_table "send_messages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
