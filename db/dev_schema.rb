# encoding: UTF-8
# This file is dumped from the dev instance of the DB and trimmed down.
# It is outdated relative to its production counterpart.
#
# Instead of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

# @NOTE: this is just an artifact from SULDEV2, not really useful for anything
# @NOTE: missing default for lane_id

ActiveRecord::Schema.define(version: 0) do

  create_table "workflow", id: false, force: :cascade do |t|
    t.integer   "id",                      precision: 38,           null: false
    t.string    "druid",      limit: 256,                           null: false
    t.string    "datastream", limit: 256,                           null: false
    t.string    "process",    limit: 256,                           null: false
    t.string    "status",     limit: 256
    t.string    "error_msg",  limit: 4000
    t.text      "error_txt"
    t.timestamp "datetime",   limit: 6
    t.integer   "attempts",                precision: 38
    t.string    "lifecycle",  limit: 256
    t.decimal   "elapsed",                 precision: 9,  scale: 3
    t.string    "repository", limit: 256
    t.string    "note",       limit: 4000
    t.integer   "priority",                precision: 38
    t.string    "lane_id",    limit: 256,                           null: false
  end

  add_synonym "workflow", "dor_admin.workflow", force: true
  add_synonym "workflow_archive", "dor_admin.workflow_archive", force: true
  add_synonym "workflow_seq", "dor_admin.workflow_seq", force: true

end
