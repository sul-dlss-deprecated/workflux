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

ActiveRecord::Schema.define(version: 1) do

  create_table "archived_statuses", force: :cascade do |t|
    t.string   "druid",      limit: 256,                                              null: false
    t.string   "datastream", limit: 256,                                              null: false
    t.string   "process",    limit: 256,                                              null: false
    t.string   "status",     limit: 256
    t.string   "error_msg",  limit: 4000
    t.text     "error_txt"
    t.datetime "datetime",   limit: 6
    t.integer  "attempts",                                        default: 0
    t.string   "lifecycle",  limit: 256
    t.decimal  "elapsed",                 precision: 9, scale: 3
    t.string   "repository", limit: 256
    t.datetime "archive_dt", limit: 6,                                                null: false
    t.integer  "version",                                         default: 1
    t.string   "note",       limit: 4000
    t.integer  "priority",                                        default: 0
    t.string   "lane_id",    limit: 256,                          default: "default", null: false
  end

  add_index "archived_statuses", ["datastream"], name: "ds_wf_ar_bitmap_idx"
  add_index "archived_statuses", ["druid"], name: "druid_wf_ar_idx"
  add_index "archived_statuses", ["repository"], name: "repo_wf_ar_bitmap_idx"

  create_table "statuses", force: :cascade do |t|
    t.string   "druid",      limit: 256,                                              null: false
    t.string   "datastream", limit: 256,                                              null: false
    t.string   "process",    limit: 256,                                              null: false
    t.string   "status",     limit: 256
    t.string   "error_msg",  limit: 4000
    t.text     "error_txt"
    t.datetime "datetime",   limit: 6
    t.integer  "attempts",                                        default: 0
    t.decimal  "elapsed",                 precision: 9, scale: 3
    t.string   "lifecycle",  limit: 256
    t.string   "repository", limit: 256
    t.string   "note",       limit: 4000
    t.integer  "priority",                                        default: 0
    t.string   "lane_id",    limit: 256,                          default: "default", null: false
  end

  add_index "statuses", ["datetime", "repository"], name: "tr_wf_idx"
  add_index "statuses", ["druid", "process", "datastream", "repository"], name: "dpdr_wf_idx", unique: true
  add_index "statuses", ["process", "status", "datastream", "lane_id", "repository"], name: "psdlr_wf_idx"
  add_index "statuses", ["repository", "process", "status", "datastream", "druid", "priority"], name: "idx$$_095f0001"

end
