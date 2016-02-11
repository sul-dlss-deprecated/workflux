json.array!(@archived_statuses) do |archived_status|
  json.extract! archived_status, :id, :druid, :datastream, :process, :status, :error_msg, :error_txt, :datetime, :attempts, :lifecycle, :elapsed, :repository, :archive_dt, :version, :note, :priority, :lane_id
  json.url archived_status_url(archived_status, format: :json)
end
