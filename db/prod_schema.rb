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

  create_table "admin", id: false, force: :cascade do |t|
    t.string "user_id", limit: 100, null: false
  end

  create_table "collection_metadata", id: false, force: :cascade do |t|
    t.decimal "metadata_id",                null: false
    t.decimal "collection_id",              null: false
    t.string  "description",   limit: 1000
    t.decimal "order_number",               null: false
  end

  create_table "collection_objects", id: false, force: :cascade do |t|
    t.decimal "collection_id",              null: false
    t.decimal "object_id",                  null: false
    t.string  "description",   limit: 1000
    t.decimal "order_number",               null: false
  end

  create_table "collection_template", primary_key: "collection_template_id", force: :cascade do |t|
    t.decimal   "collection_id",                 null: false
    t.decimal   "template_id",                   null: false
    t.text      "xml_form_mapping"
    t.string    "created_by",                    null: false
    t.timestamp "date_created",     limit: 6,    null: false
    t.string    "last_modified_by",              null: false
    t.timestamp "date_modified",    limit: 6,    null: false
    t.string    "description",      limit: 1000, null: false
    t.text      "notes"
  end

  create_table "collection_types", primary_key: "collection_type_id", force: :cascade do |t|
    t.string "collection_type",              null: false
    t.string "description",     limit: 1000
  end

  create_table "collections", primary_key: "collection_id", force: :cascade do |t|
    t.string    "name",                              null: false
    t.string    "description",          limit: 1000, null: false
    t.string    "owner"
    t.text      "notes"
    t.decimal   "order_number",                      null: false
    t.string    "uuid",                 limit: 100,  null: false
    t.string    "created_by",                        null: false
    t.timestamp "date_created",         limit: 6,    null: false
    t.string    "last_modified_by",                  null: false
    t.timestamp "date_modified",        limit: 6,    null: false
    t.decimal   "parent_collection_id"
    t.string    "scanned_by"
    t.string    "subject"
    t.decimal   "collection_type_id"
  end

  create_table "metadata", primary_key: "metadata_id", force: :cascade do |t|
    t.text      "metadata",                            null: false
    t.string    "description",            limit: 1000
    t.text      "notes"
    t.string    "created_by",                          null: false
    t.timestamp "date_created",           limit: 6,    null: false
    t.string    "last_modified_by",                    null: false
    t.timestamp "date_modified",          limit: 6,    null: false
    t.string    "uuid",                   limit: 100,  null: false
    t.decimal   "collection_template_id"
  end

  create_table "object_metadata", id: false, force: :cascade do |t|
    t.decimal "object_id",                 null: false
    t.decimal "metadata_id",               null: false
    t.string  "description",  limit: 1000
    t.decimal "order_number",              null: false
  end

  create_table "object_types", primary_key: "object_type_id", force: :cascade do |t|
    t.decimal "collection_type_id",              null: false
    t.string  "object_type",                     null: false
    t.string  "description",        limit: 1000
  end

  create_table "objects", primary_key: "object_id", force: :cascade do |t|
    t.string    "uuid",             limit: 100,  null: false
    t.string    "barcode",          limit: 50
    t.string    "ckey",             limit: 50
    t.string    "name"
    t.string    "description",      limit: 1000
    t.text      "notes"
    t.string    "created_by",                    null: false
    t.timestamp "date_created",     limit: 6,    null: false
    t.string    "last_modified_by",              null: false
    t.timestamp "date_modified",    limit: 6,    null: false
    t.decimal   "parent_object_id"
    t.decimal   "object_type_id"
  end

# Could not dump table "plan_table" because of following StandardError
#   Unknown type 'LONG' for column 'other'

  create_table "purl_table", id: false, force: :cascade do |t|
    t.string "url",  limit: 200
    t.string "uuid", limit: 100
  end

  create_table "sdr2_error_objects", primary_key: "druid", force: :cascade do |t|
  end

  create_table "sdr_complete_deposit_waiting", id: false, force: :cascade do |t|
    t.string "druid", limit: 256, null: false
  end

  create_table "sdr_ingest_transfer_errors", id: false, force: :cascade do |t|
    t.string "druid", limit: 256, null: false
  end

  create_table "sdr_list", primary_key: "sdr_list_id", force: :cascade do |t|
    t.string    "username",                   null: false
    t.string    "list_name",                  null: false
    t.text      "list_description"
    t.timestamp "date_created",     limit: 6, null: false
    t.timestamp "last_modified",    limit: 6, null: false
    t.string    "is_bookmark_list", limit: 1, null: false
    t.string    "is_public",        limit: 1, null: false
  end

  create_table "sdr_list_entry", primary_key: "sdr_list_entry_id", force: :cascade do |t|
    t.integer "sdr_list_id",             precision: 38, null: false
    t.string  "entry_uuid",  limit: 500,                null: false
    t.text    "notes"
  end

  create_table "sdr_production", primary_key: "sdr_uuid", force: :cascade do |t|
    t.integer   "file_size",                 precision: 38, null: false
    t.string    "file_location",                            null: false
    t.string    "collection_name",                          null: false
    t.timestamp "date_ingested",   limit: 6,                null: false
  end

  create_table "suri_access", primary_key: "suri_access_id", force: :cascade do |t|
    t.integer "suri_id",             precision: 38
    t.string  "type",    limit: 100
    t.string  "value",   limit: 100,                null: false
  end

  create_table "suri_data", primary_key: "suri_id", force: :cascade do |t|
    t.string    "resource_string", limit: 1000, null: false
    t.string    "checksum",        limit: 100
    t.string    "uuid",            limit: 100,  null: false
    t.string    "alias",           limit: 100
    t.string    "created_by",      limit: 100,  null: false
    t.timestamp "created",         limit: 6,    null: false
    t.string    "updated_by",      limit: 100,  null: false
    t.timestamp "updated",         limit: 6,    null: false
    t.string    "domain",          limit: 20,   null: false
  end

  create_table "template_relationships", id: false, force: :cascade do |t|
    t.decimal "parent_template_id",              null: false
    t.decimal "child_template_id",               null: false
    t.string  "description",        limit: 1000
    t.decimal "order_number",                    null: false
  end

  create_table "templates", primary_key: "template_id", force: :cascade do |t|
    t.text      "template",                      null: false
    t.string    "created_by",                    null: false
    t.timestamp "date_created",     limit: 6,    null: false
    t.string    "last_modified_by",              null: false
    t.timestamp "date_modified",    limit: 6,    null: false
    t.string    "name",                          null: false
    t.string    "description",      limit: 1000, null: false
    t.text      "notes"
    t.string    "uuid",             limit: 100,  null: false
    t.string    "is_schema",        limit: 1,    null: false
  end

  create_table "user_permissions", id: false, force: :cascade do |t|
    t.string  "user_id",    limit: 100, null: false
    t.string  "table_name", limit: 100, null: false
    t.string  "crud",       limit: 4,   null: false
    t.decimal "row_id",                 null: false
  end

  create_table "workflow", force: :cascade do |t|
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

  add_index "workflow", ["datetime", "repository"], name: "tr_wf_idx"
  add_index "workflow", ["druid", "process", "datastream", "repository"], name: "dpdr_wf_idx", unique: true
  add_index "workflow", ["process", "status", "datastream", "lane_id", "repository"], name: "psdlr_wf_idx"
  add_index "workflow", ["repository", "process", "status", "datastream", "druid", "priority"], name: "idx$$_095f0001"

  create_table "workflow_archive", force: :cascade do |t|
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

  add_index "workflow_archive", ["datastream"], name: "ds_wf_ar_bitmap_idx"
  add_index "workflow_archive", ["druid"], name: "druid_wf_ar_idx"
  add_index "workflow_archive", ["repository"], name: "repo_wf_ar_bitmap_idx"

  create_table "workflow_cleanup_backup", force: :cascade do |t|
    t.string    "druid",      limit: 256,                                       null: false
    t.string    "datastream", limit: 256,                                       null: false
    t.string    "process",    limit: 256,                                       null: false
    t.string    "status",     limit: 256
    t.string    "error_msg",  limit: 4000
    t.text      "error_txt"
    t.timestamp "datetime",   limit: 6
    t.integer   "attempts",                precision: 38,           default: 0
    t.decimal   "elapsed",                 precision: 9,  scale: 3
    t.string    "lifecycle",  limit: 256
    t.string    "repository", limit: 256
    t.string    "note",       limit: 4000
  end

  create_table "workflow_copy", id: false, force: :cascade do |t|
    t.integer   "id",                      precision: 38,           null: false
    t.string    "druid",      limit: 256,                           null: false
    t.string    "datastream", limit: 256,                           null: false
    t.string    "process",    limit: 256,                           null: false
    t.string    "status",     limit: 256
    t.string    "error_msg",  limit: 4000
    t.text      "error_txt"
    t.timestamp "datetime",   limit: 6
    t.integer   "attempts",                precision: 38
    t.decimal   "elapsed",                 precision: 9,  scale: 3
    t.string    "lifecycle",  limit: 256
    t.string    "repository", limit: 256
  end

  add_foreign_key "collection_metadata", "collections", primary_key: "collection_id", name: "sys_c0017289"
  add_foreign_key "collection_metadata", "metadata", column: "metadata_id", primary_key: "metadata_id", name: "sys_c0017290"
  add_foreign_key "collection_objects", "collections", primary_key: "collection_id", name: "sys_c0017288"
  add_foreign_key "collection_objects", "objects", primary_key: "object_id", name: "sys_c0017287"
  add_foreign_key "collection_template", "collections", primary_key: "collection_id", name: "sys_c0017286"
  add_foreign_key "collection_template", "templates", primary_key: "template_id", name: "sys_c0017293"
  add_foreign_key "collections", "collection_types", primary_key: "collection_type_id", name: "sys_c0017291"
  add_foreign_key "collections", "collections", column: "parent_collection_id", primary_key: "collection_id", name: "sys_c0017292"
  add_foreign_key "metadata", "collection_template", primary_key: "collection_template_id", name: "sys_c0017284"
  add_foreign_key "object_metadata", "metadata", column: "metadata_id", primary_key: "metadata_id", name: "sys_c0017296"
  add_foreign_key "object_metadata", "objects", primary_key: "object_id", name: "sys_c0017295"
  add_foreign_key "object_types", "collection_types", primary_key: "collection_type_id", name: "sys_c0017297"
  add_foreign_key "objects", "object_types", primary_key: "object_type_id", name: "sys_c0017294"
  add_foreign_key "objects", "objects", column: "parent_object_id", primary_key: "object_id", name: "sys_c0017285"
  add_foreign_key "sdr_list_entry", "sdr_list", primary_key: "sdr_list_id", name: "sys_c0017298"
  add_foreign_key "suri_access", "suri_data", column: "suri_id", primary_key: "suri_id", name: "sys_c0017299"
end
