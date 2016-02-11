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

ActiveRecord::Schema.define(version: 0) do

  create_table "workflows", force: :cascade do |t|
    t.string    "druid",      limit: 256,                                               null: false
    t.string    "datastream", limit: 256,                                               null: false
    t.string    "process",    limit: 256,                                               null: false
    t.string    "status",     limit: 256
    t.string    "error_msg",  limit: 4000
    t.text      "error_txt"
    t.timestamp "datetime",   limit: 6
    t.integer   "attempts",                precision: 38,           default: 0
    t.decimal   "elapsed",                 precision: 9,  scale: 3
    t.string    "lifecycle",  limit: 256
    t.string    "repository", limit: 256
    t.string    "note",       limit: 4000
    t.integer   "priority",                precision: 38,           default: 0
    t.string    "lane_id",    limit: 256,                           default: "default", null: false
  end

  add_index "workflows", ["datetime", "repository"], name: "tr_wf_idx"
  add_index "workflows", ["druid", "process", "datastream", "repository"], name: "dpdr_wf_idx", unique: true
  add_index "workflows", ["process", "status", "datastream", "lane_id", "repository"], name: "psdlr_wf_idx"
  add_index "workflows", ["repository", "process", "status", "datastream", "druid", "priority"], name: "idx$$_095f0001"

  create_table "workflows_archives", force: :cascade do |t|
    t.string    "druid",      limit: 256,                                                    null: false
    t.string    "datastream", limit: 256,                                                    null: false
    t.string    "process",    limit: 256,                                                    null: false
    t.string    "status",     limit: 256
    t.string    "error_msg",  limit: 4000
    t.text      "error_txt"
    t.timestamp "datetime",   limit: 6
    t.integer   "attempts",                precision: 38,           default: 0
    t.string    "lifecycle",  limit: 256
    t.decimal   "elapsed",                 precision: 9,  scale: 3
    t.string    "repository", limit: 256
    t.timestamp "archive_dt", limit: 6,                             default: "SYSTIMESTAMP", null: false
    t.integer   "version",                 precision: 38,           default: 1
    t.string    "note",       limit: 4000
    t.integer   "priority",                precision: 38,           default: 0
    t.string    "lane_id",    limit: 256,                           default: "default",      null: false
  end

  add_index "workflows_archives", ["datastream"], name: "ds_wf_ar_bitmap_idx"
  add_index "workflows_archives", ["druid"], name: "druid_wf_ar_idx"
  add_index "workflows_archives", ["repository"], name: "repo_wf_ar_bitmap_idx"
end
