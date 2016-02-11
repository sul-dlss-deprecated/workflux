class CreateDatabase < ActiveRecord::Migration
  def self.up
    ActiveRecord::Schema.define(version: 0) do

      create_table "statuses", force: :cascade do |t|
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

      add_index "statuses", ["datetime", "repository"], name: "tr_wf_idx"
      add_index "statuses", ["druid", "process", "datastream", "repository"], name: "dpdr_wf_idx", unique: true
      add_index "statuses", ["process", "status", "datastream", "lane_id", "repository"], name: "psdlr_wf_idx"
      add_index "statuses", ["repository", "process", "status", "datastream", "druid", "priority"], name: "idx$$_095f0001"

      create_table "archived_statuses", force: :cascade do |t|
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

      add_index "archived_statuses", ["datastream"], name: "ds_wf_ar_bitmap_idx"
      add_index "archived_statuses", ["druid"], name: "druid_wf_ar_idx"
      add_index "archived_statuses", ["repository"], name: "repo_wf_ar_bitmap_idx"
    end

  end

  def self.down
    drop table :archived_statuses
    drop table :statuses
  end
end
